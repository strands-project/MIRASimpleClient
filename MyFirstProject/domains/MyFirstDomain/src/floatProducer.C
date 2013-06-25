/**
 * @file floatProducer.C
 *    
 *
 * @author bla
 * @date   2013/06/21
 */

#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/joystick.h>

#define JOY_DEV "/dev/input/js1"

#include <fw/Unit.h>
#include <transform/Pose.h>
#include <robot/Odometry.h>
#include <robot/IMotorController.h>
#include <linux/joystick.h>
#include "CMessageServer.h" 


using namespace mira;
using namespace robot;

namespace myfirstdomain { 

///////////////////////////////////////////////////////////////////////////////

/**
 * 
 */
class floatProducer : public Unit
{
MIRA_OBJECT(floatProducer)

public:

	floatProducer();

	template<typename Reflector>
	void reflect(Reflector& r)
	{
		Unit::reflect(r);

		// TODO: reflect all parameters (members and properties) that specify the persistent state of the unit
		//r.property("Param1", mParam1, "First parameter of this unit with default value", 123.4f);
		//r.member("Param2", mParam2, setter(&UnitName::setParam2,this), "Second parameter with setter");
	}

protected:

	virtual void initialize();
	virtual void process(const Timer& timer);
	void  onNewData(ChannelRead<Odometry2> data);

private:
	// void onPoseChanged(ChannelRead<Pose2> pose);
	int joy_fd; 
	int *axis; 
	int num_of_axis, num_of_buttons;
	bool buttons[20];
	char name_of_joystick[80];
	struct js_event js;
	float fwSpeed;
	CMessageServer *server;
	CMessage message;
	float x,y,phi;
	double buf[10];
	int targetDistance;
	bool pauseRobot; 
	Velocity2 vel;
private:

	//Channel<Img<>> mChannel;
};

///////////////////////////////////////////////////////////////////////////////

floatProducer::floatProducer() : Unit(Duration::milliseconds(100))
{
	// TODO: further initialization of members, etc.
}

void floatProducer::initialize()
{
	vel.t[0] = 0;
	vel.r = 0;
	x=y=phi=0;
	fwSpeed = 0;
	targetDistance = 0;
	pauseRobot = true;
	/*logging service*/
        dump = new CDump("log",256,1000000);
	dump->DisableAllLogModule();
	dump->EnableLogModule(LOG_MODULE_MAIN);
	memset(buttons,0,sizeof(bool)*20);

	/*message server*/
        server = new CMessageServer();
	server->initServer("50004");

	/*subscribe to odometry*/
	Channel <Odometry2>odoChannel = subscribe<Odometry2>("/robot/Odometry", &floatProducer::onNewData);
	odoChannel.waitForData();

    if((joy_fd = open(JOY_DEV,O_RDONLY))== -1 )
    {
        printf(" couldn't open the joystick \n " );
        
        return ;
    }

    ioctl(joy_fd, JSIOCGAXES , &num_of_axis);
    ioctl(joy_fd, JSIOCGBUTTONS , &num_of_buttons);
    ioctl(joy_fd, JSIOCGNAME(80), &name_of_joystick);
    
    axis = (int *) calloc(num_of_axis , sizeof(int));
    
    dump->Inform(LOG_MODULE_MAIN,"Joystick detected : %s \n \t %d axis \n\t %d buttons \n\n" ,name_of_joystick , num_of_axis , num_of_buttons);

    fcntl( joy_fd, F_SETFL , O_NONBLOCK ); // use non - blocking methods
}

void  floatProducer::onNewData(ChannelRead<Odometry2> data)
{
	Pose2 pos = data->pose;
	Velocity2 vel = data->velocity;
	x = pos.t[0];
	y = pos.t[1];
	phi = pos.r.angle();
	dump->Inform(LOG_MODULE_MAIN,"Odo %f %f %f %f %f",pos.t[0],pos.t[1],pos.r.angle(),vel.t[0],vel.r.angle());
}

void floatProducer::process(const Timer& timer)
{
	 read (joy_fd, &js , sizeof(struct js_event));
	 read (joy_fd, &js , sizeof(struct js_event));
	 read (joy_fd, &js , sizeof(struct js_event));
	 read (joy_fd, &js , sizeof(struct js_event));
	 read (joy_fd, &js , sizeof(struct js_event));

	 while (server->messagesPending > 0){
		 message = server->getMessage();
		 //	     dump->Inform(LOG_MODULE_MAIN,"Action: %i %s %i %i",server->messagesPending,message.getStrType(),message.value1,message.value2);
		 switch (message.type){
			 case MSG_STOP:vel.t[0] =0; vel.r = 0;break;
			 case MSG_SPEED:vel.t[0] = 0.003*message.value2;vel.r = 0.003*message.value1;break;
			 case MSG_POS_FORWARD:vel.t[0] = 0.003*message.value2;vel.r = 0.003*message.value1;break;
			 case MSG_RESET:callService<void>("robot/Robot", "resetOdometry");break;
			 default:break;
		 }	 
		 buf[0] = x;
		 buf[1] = y;
		 buf[2] = 0;
		 buf[3] = phi;
		 buf[4] = 0;
		 buf[5] = 0;
		 buf[9] = 0;
		 int rotate = axis[0];
		 server->update(buf,buttons,&rotate);
	 }




        // see what to do with the event
        switch(js.type & ~ JS_EVENT_INIT)
        {
            case JS_EVENT_AXIS :
                axis [ js.number ] = js.value;
            case JS_EVENT_BUTTON :
                buttons [js.number+1 ] = js.value;
        }

//	for (int i = 0;i<10;i++) printf("%i",buttons[i]);	
	//printf( " FW: %f X: %6d Y: %6d \n",fwSpeed, axis[0] , axis[1]);
	if (buttons[8]){
		fwSpeed += -axis[1]/1000000.0;
		if (buttons[5]==1) fwSpeed = 0;
		vel.t[0] = fwSpeed;
		vel.r = -axis[0]/50000.0;
	}else{
		fwSpeed = .0;
	}
	if (vel.t[0] > MAX_SPEED)	vel.t[0] = MAX_SPEED;
	if (vel.t[0] < -MAX_SPEED)	vel.t[0] = -MAX_SPEED;
	if (fwSpeed > MAX_SPEED)	fwSpeed = MAX_SPEED;
	if (fwSpeed < -MAX_SPEED)	fwSpeed = -MAX_SPEED;
	if (pauseRobot){
		vel.t[0] = 0;
		vel.r = 0;
	}	
//	dump->Inform(LOG_MODULE_MAIN,"Action: %f %f",vel.t[0],vel.r.angle());
	callService<void>("robot/Robot", "setVelocity",vel);
	if (buttons[5]){
		 pauseRobot = true;
		 callService<void>("robot/Robot", "enableMotors",false);
	}
	if (buttons[7]){
		 pauseRobot = false;
		 callService<void>("robot/Robot", "enableMotors",true);
		 callService<void>("robot/Robot", "resetMotorStop");
	}
}

///////////////////////////////////////////////////////////////////////////////

}

MIRA_CLASS_SERIALIZATION(myfirstdomain::floatProducer, mira::Unit );
