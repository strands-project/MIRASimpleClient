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
include CMakeFiles/logger.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/logger.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/logger.dir/flags.make

CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o: CMakeFiles/logger.dir/flags.make
CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o: ../../domains/MyFirstDomain/src/CDump.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o -c /localhome/demo/MyFirstProject/domains/MyFirstDomain/src/CDump.cpp

CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /localhome/demo/MyFirstProject/domains/MyFirstDomain/src/CDump.cpp > CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.i

CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /localhome/demo/MyFirstProject/domains/MyFirstDomain/src/CDump.cpp -o CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.s

CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.requires:
.PHONY : CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.requires

CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.provides: CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.requires
	$(MAKE) -f CMakeFiles/logger.dir/build.make CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.provides.build
.PHONY : CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.provides

CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.provides.build: CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o

# Object files for target logger
logger_OBJECTS = \
"CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o"

# External object files for target logger
logger_EXTERNAL_OBJECTS =

liblogger.a: CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o
liblogger.a: CMakeFiles/logger.dir/build.make
liblogger.a: CMakeFiles/logger.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library liblogger.a"
	$(CMAKE_COMMAND) -P CMakeFiles/logger.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/logger.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/logger.dir/build: liblogger.a
.PHONY : CMakeFiles/logger.dir/build

CMakeFiles/logger.dir/requires: CMakeFiles/logger.dir/domains/MyFirstDomain/src/CDump.cpp.o.requires
.PHONY : CMakeFiles/logger.dir/requires

CMakeFiles/logger.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/logger.dir/cmake_clean.cmake
.PHONY : CMakeFiles/logger.dir/clean

CMakeFiles/logger.dir/depend:
	cd /localhome/demo/MyFirstProject/build/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /localhome/demo/MyFirstProject /localhome/demo/MyFirstProject /localhome/demo/MyFirstProject/build/debug /localhome/demo/MyFirstProject/build/debug /localhome/demo/MyFirstProject/build/debug/CMakeFiles/logger.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/logger.dir/depend
