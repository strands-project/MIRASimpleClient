#include "CMessageServer.h"

CMessageServer::CMessageServer()
{
	sem_init(&dataSem,0,1);	
	sem_init(&connectSem,0,1);	
	module = LOG_MODULE_SERVER;
	messagesPending = 0;
}

CMessageServer::~CMessageServer()
{
}

void* connectLoop(void *serv)
{
	struct sockaddr_in clientAddr;
	socklen_t addrLen = sizeof(clientAddr);
	CMessageServer* server = (CMessageServer*) serv;
	int newServer = 0;
	while (true)
	{
		newServer = accept(server->serverSocket, (struct sockaddr *)&clientAddr,&addrLen);
		if (newServer > -1){
			dump->Inform(server->module,"Incoming connection from %s.",inet_ntoa(clientAddr.sin_addr));
			dump->Inform(server->module,"Incoming connection accepted on socket level %i.",newServer);
			sem_wait(&server->connectSem);
			server->mySocket = newServer;
			sem_post(&server->connectSem);
			pthread_t* thread=(pthread_t*)malloc(sizeof(pthread_t));
			pthread_create(thread,NULL,&serverLoop,(void*)server);
		}else{
			dump->Error(server->module,"Accept on listening socked failed.");
		}
	}
	return NULL;
}

int CMessageServer::initServer(const char* port)
{
	int used_port = atoi(port);
	struct sockaddr_in mySocketAddr;
	mySocketAddr.sin_family = AF_INET;
	mySocketAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	mySocketAddr.sin_port = htons(used_port);
	serverSocket = socket(AF_INET, SOCK_STREAM, 0);
	if (serverSocket < 0)
	{
		dump->Error(module,"Cannot create socket ");
		return -1;
	}
	if (bind(serverSocket,( struct sockaddr *)&mySocketAddr,sizeof(mySocketAddr)) < 0)
	{
		dump->Error(module,"Cannot bind socket.");
		return -2;
	}
	if (listen(serverSocket,1) < 0)
	{
		dump->Error(module,"cannot make socket listen.");
	}
	pthread_t* thread=(pthread_t*)malloc(sizeof(pthread_t));
	pthread_create(thread,NULL,&connectLoop,(void*)this);
	return 0;
}

void* serverLoop(void* serv)
{
	SClientInfo info;
	CMessage message; 
	CMessageServer* server = (CMessageServer*) serv;
	sem_wait(&server->connectSem);
	info.socket = server->mySocket;
	info.sem = &server->dataSem;
	sem_post(&server->connectSem);
	server->getClientInfo(info.socket,&info.write);
	int dataOk = 0;
	bool connected = true;
	while (connected){
		dataOk = 0;
		message = server->checkForMessage(info.socket);
		dump->Inform(server->module,"Message received %s %i %i from %i.",message.getStrType(),message.value1,message.value2,info.socket);
		sem_wait(info.sem);
		if (info.odometry) server->sendDoubles(info.socket,server->odometry,10);
		if (info.buttons) server->sendBools(info.socket,server->buttons,10);
		if (info.rotation) server->sendInts(info.socket,server->rotation,1);
		sem_post(info.sem);
		if (info.write){
			dump->Debug(server->module,"Sending message to main server.");
			sem_wait(info.sem);
			if (server->messagesPending < 20)server->messageArray[server->messagesPending++] = message;
			sem_post(info.sem);
		}
		if (message.type == MSG_QUIT) connected = false;
	}
	server->closeConnection(info.socket);
	return NULL;
}

CMessage CMessageServer::getMessage()
{
	CMessage result;
	sem_wait(&dataSem);
	messagesPending--;
	if (messagesPending < 0) messagesPending = 0;
	result = messageArray[messagesPending];
	sem_post(&dataSem);
	return result;
}

bool CMessageServer::getClientInfo(int socket,bool data[])
{
	bool result;
	char buffer[1000];
	int receiveResult = recv(socket,data,4*sizeof(bool),MSG_WAITALL);
	if ( receiveResult >0 && connected == 1)
	{
		sprintf(buffer,"Client requires");
		if (data[0]) sprintf(buffer,"%s to drive the robot and obtain ",buffer); else sprintf(buffer,"to read ");
		if (data[1]) sprintf(buffer,"%s odometric, ",buffer);
		if (data[2]) sprintf(buffer,"%s rotation speed, ",buffer);
		if (data[3]) sprintf(buffer,"%s pressed buttons ",buffer);
		sprintf(buffer,"%sdata.",buffer);
		dump->Inform(module,"%s",buffer);
		result = true;
	}
	else
	{
		dump->Inform(module,"Disconnect detected.");
		result = false;
	}
	return result;
}

CMessage CMessageServer::checkForMessage(int socket)
{
	CMessage message;
	int receiveResult = recv(socket,&message.buf,MESSAGE_LENGTH,MSG_WAITALL);
	if ( receiveResult >0)
	{
		dump->Debug(module,"Packet accepted length %i.", receiveResult);
		message.unpack();
	}
	else
	{
		dump->Debug(module,"Disconnect detected.");
		message.type = MSG_QUIT;
	}
	return message;
}

void CMessageServer::update(double posit[],bool butto[],int rotat[]) 
{
	sem_wait(&dataSem);
	memcpy(odometry,posit,10*sizeof(double));	
	memcpy(buttons,butto,10*sizeof(bool));
	memcpy(rotation,rotat,sizeof(int));
	sem_post(&dataSem);
}

int CMessageServer::sendPosition(int socket,double buffer[])
{
	    if (send(socket,buffer,4*sizeof(double),MSG_NOSIGNAL) == 4*sizeof(double)) return 0; else
		 {
			 dump->Error(module,"Network error");
			 return -1;
		 }
		 return 0;
}

int CMessageServer::sendInts(int socket,int buffer[],int len)
{
	if (send(socket,buffer,len*sizeof(int),MSG_NOSIGNAL) == (int)(len*sizeof(int))) return 0; else
	{
		dump->Error(module,"Network error");
		return -1;
	}
	return 0;
}


int CMessageServer::sendDoubles(int socket,double buffer[],int len)
{
	int a =	send(socket,buffer,len*sizeof(double),MSG_NOSIGNAL);
	if (a == (int)(len*sizeof(double)))  return 0; else
	{
		dump->Error(module,"Network error, %i ",a);
		return -1;
	}
	return 0;
}

int CMessageServer::sendBools(int socket,bool buffer[],int len)
{
	    if (send(socket,buffer,len*sizeof(bool),MSG_NOSIGNAL) == (int)(len*sizeof(bool))) return 0; else
		 {
			 dump->Error(module,"Network error");
			 return -1;
		 }
		 return 0;
}

int CMessageServer::closeConnection(int socket)
{
	close(socket);
	connected = false;
	return 0;
}

