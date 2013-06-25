/*
 * File name: CMessage.h
 * Date:      2006/10/12 11:56
 * Author:    
 */

#ifndef __CMESSAGE_H__
#define __CMESSAGE_H__

#define MESSAGE_LENGTH 7

typedef enum
{
	MSG_NONE = 0,
	MSG_START,
	MSG_SPEED,
	MSG_SPEED_TURN,
	MSG_SPEED_FORWARD,
	MSG_POS_TURN,
	MSG_POS_FORWARD,
	MSG_EMPTY,
	MSG_RESET,
	MSG_STOP,
	MSG_QUIT,
	MSG_NUMBER 
} TMessageType;

class CMessage
{
	public:
		CMessage();
		~CMessage();
		unsigned char buf[MESSAGE_LENGTH+1];
		void pack();
		void unpack();
		const char* getStrType();
		TMessageType type;
		int value1;
		int value2;
};

#endif

/* end of CMessage.h */
