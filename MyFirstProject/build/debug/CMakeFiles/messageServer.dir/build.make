# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /localhome/demo/MyFirstProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /localhome/demo/MyFirstProject/build/debug

# Include any dependencies generated for this target.
include CMakeFiles/messageServer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/messageServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/messageServer.dir/flags.make

CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o: CMakeFiles/messageServer.dir/flags.make
CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o: ../../domains/MyFirstDomain/src/CMessageServer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o -c /localhome/demo/MyFirstProject/domains/MyFirstDomain/src/CMessageServer.cpp

CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /localhome/demo/MyFirstProject/domains/MyFirstDomain/src/CMessageServer.cpp > CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.i

CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /localhome/demo/MyFirstProject/domains/MyFirstDomain/src/CMessageServer.cpp -o CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.s

CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.requires:
.PHONY : CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.requires

CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.provides: CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.requires
	$(MAKE) -f CMakeFiles/messageServer.dir/build.make CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.provides.build
.PHONY : CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.provides

CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.provides.build: CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o

# Object files for target messageServer
messageServer_OBJECTS = \
"CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o"

# External object files for target messageServer
messageServer_EXTERNAL_OBJECTS =

libmessageServer.a: CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o
libmessageServer.a: CMakeFiles/messageServer.dir/build.make
libmessageServer.a: CMakeFiles/messageServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libmessageServer.a"
	$(CMAKE_COMMAND) -P CMakeFiles/messageServer.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/messageServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/messageServer.dir/build: libmessageServer.a
.PHONY : CMakeFiles/messageServer.dir/build

CMakeFiles/messageServer.dir/requires: CMakeFiles/messageServer.dir/domains/MyFirstDomain/src/CMessageServer.cpp.o.requires
.PHONY : CMakeFiles/messageServer.dir/requires

CMakeFiles/messageServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/messageServer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/messageServer.dir/clean

CMakeFiles/messageServer.dir/depend:
	cd /localhome/demo/MyFirstProject/build/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /localhome/demo/MyFirstProject /localhome/demo/MyFirstProject /localhome/demo/MyFirstProject/build/debug /localhome/demo/MyFirstProject/build/debug /localhome/demo/MyFirstProject/build/debug/CMakeFiles/messageServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/messageServer.dir/depend
