MIRA_REQUIRE_PACKAGE(MyFirstDomain)
MIRA_REQUIRE_PACKAGE(Navigation) 
MIRA_REQUIRE_PACKAGE(Pilot)

###############################################################################

MIRA_ADD_DOCUMENTATION(MyFirstDomain
	DIRS
		doc
		include
	DEPENDS
		#RobotDataTypes
)

###############################################################################

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_LIST_DIR}/include)

###############################################################################

MIRA_ADD_LIBRARY(MyFirstUnit
	SHARED
	#PACKAGE $PACKAGE$
	SOURCE
		src/MyFirstUnit.C

	LINK_LIBS
		MIRABase
		MIRAFramework
)

###############################################################################

MIRA_ADD_LIBRARY(floatProducer
	SHARED
	#PACKAGE $PACKAGE$
	SOURCE
		src/floatProducer.C
		src/CMessage.cpp
		src/CMessageServer.cpp
		src/CDump.cpp

	LINK_LIBS
		MIRABase
		MIRAFramework
)
