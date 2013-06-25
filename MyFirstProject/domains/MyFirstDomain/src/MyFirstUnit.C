/*
 * Copyright (C) 2012 by
 *   MetraLabs GmbH (MLAB), GERMANY
 * and
 *   Neuroinformatics and Cognitive Robotics Labs (NICR) at TU Ilmenau, GERMANY
 * All rights reserved.
 *
 * Contact: info@mira-project.org
 *
 * Commercial Usage:
 *   Licensees holding valid commercial licenses may use this file in
 *   accordance with the commercial license agreement provided with the
 *   software or, alternatively, in accordance with the terms contained in
 *   a written agreement between you and MLAB or NICR.
 *
 * GNU General Public License Usage:
 *   Alternatively, this file may be used under the terms of the GNU
 *   General Public License version 3.0 as published by the Free Software
 *   Foundation and appearing in the file LICENSE.GPL3 included in the
 *   packaging of this file. Please review the following information to
 *   ensure the GNU General Public License version 3.0 requirements will be
 *   met: http://www.gnu.org/copyleft/gpl.html.
 *   Alternatively you may (at your option) use any later version of the GNU
 *   General Public License if such license has been publicly approved by
 *   MLAB and NICR (or its successors, if any).
 *
 * IN NO EVENT SHALL "MLAB" OR "NICR" BE LIABLE TO ANY PARTY FOR DIRECT,
 * INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF
 * THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF "MLAB" OR
 * "NICR" HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * "MLAB" AND "NICR" SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND "MLAB" AND "NICR" HAVE NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS OR MODIFICATIONS.
 */

/**
 * @file MyFirstUnit.C
 *    
 *
 * @author bla
 * @date   2013/06/21
 */

#include <fw/Unit.h>
#include <robot/IDrive.h>
#include <navigation/Task.h>
#include <navigation/tasks/OrientationTask.h>
#include <transform/Pose.h>

using namespace mira;
using namespace robot;
using namespace navigation;

namespace myfirstdomain { 

///////////////////////////////////////////////////////////////////////////////

/**
 * 
 */
class MyFirstUnit : public Unit
{
MIRA_OBJECT(MyFirstUnit)

public:

	MyFirstUnit();

	template<typename Reflector>
	void reflect(Reflector& r)
	{
		Unit::reflect(r);
		r.method("setSpeed", &MyFirstUnit::setSpeed, this, "");
		// TODO: reflect all parameters (members and properties) that specify the persistent state of the unit
		//r.property("Param1", mParam1, "First parameter of this unit with default value", 123.4f);
		//r.member("Param2", mParam2, setter(&UnitName::setParam2,this), "Second parameter with setter");
	}

protected:

	virtual void initialize();

	virtual void process(const Timer& timer);

private:

	void onPoseChanged(ChannelRead<Pose2> pose);
	void setSpeed(float fw,float turn);
private:

	//Channel<Img<>> mChannel;
};

///////////////////////////////////////////////////////////////////////////////

void MyFirstUnit::setSpeed(float fw,float turn)
{
//	auto providers = queryServicesForInterface("INavigation");
//	if(providers.empty())    return;

	// Assume that our Pilot is the first and only available INavigation provider.
//	const std::string service = providers.front();

	//    callService( driveService, "setVelocity", Velocity2(0,0,0) );

//	boost::shared_ptr<Task> task(new Task()); // Create task    
//    task->addSubTask(SubTaskPtr(new PositionTask(Point2f(x, y), TOLERANCE_MIN, TOLERANCE_MAX))); // add final (x,y) position
//	task->addSubTask(SubTaskPtr(new OrientationTask(1.57,0.1))); // add final orientation
//    task->addSubTask(SubTaskPtr(new PreferredDirectionTask(PreferredDirectionTask::FORWARD, 0.5f))); // add preferred driving direction

//	callService("/robot/navigation/Pilot", "setVelocity", task);
//	auto rpcFuture = callService<void>(service, "setTask", task);
}

void MyFirstUnit::onPoseChanged(ChannelRead<Pose2> pose)
{
	printf("AAAA\n");	
}

MyFirstUnit::MyFirstUnit() : Unit(Duration::milliseconds(100))
{
	// TODO: further initialization of members, etc.
	printf("BAAA\n");
	//service<void>( driveService, "setVelocity", Velocity2(0,0,0) );
	usleep(10000);	
	printf("CAAA\n");
}

void MyFirstUnit::initialize()
{
	// TODO: subscribe and publish all required channels
	subscribe<Pose2>("Poser", &MyFirstUnit::onPoseChanged);
	publishService(*this);
	//mChannel = publish<Img<>>("Image");
}

void MyFirstUnit::process(const Timer& timer)
{
	// TODO: this method is called periodically with the specified cycle time, so you can perform your computation here.
}

///////////////////////////////////////////////////////////////////////////////

}

MIRA_CLASS_SERIALIZATION(myfirstdomain::MyFirstUnit, mira::Unit );
