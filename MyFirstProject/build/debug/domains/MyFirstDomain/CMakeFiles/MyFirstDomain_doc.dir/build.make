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

# Utility rule file for MyFirstDomain_doc.

# Include the progress variables for this target.
include domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/progress.make

domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/MiraStyle.css
domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/attention.png
domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/DeveloperSmall.png
domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/EndUserSmall.png
domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/AppDesignerSmall.png
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating documentation in /localhome/demo/MyFirstProject/domains/MyFirstDomain"
	cd /localhome/demo/MyFirstProject/domains/MyFirstDomain && /usr/bin/doxygen /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain//Doxyfile
	cd /localhome/demo/MyFirstProject/domains/MyFirstDomain && /usr/bin/cmake -DFILE=/localhome/demo/MyFirstProject/doc/domains/MyFirstDomain//doxygen.css -DMIRASTYLE=/opt/MIRA/make/documentation/MiraStyle.css -P /opt/MIRA/make/documentation/PatchDoxygenCSS.cmake

../../doc/domains/MyFirstDomain/MiraStyle.css: /opt/MIRA/make/documentation/MiraStyle.css
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /opt/MIRA/make/documentation/MiraStyle.css -> /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/MiraStyle.css"
	cd /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain && /usr/bin/cmake -E copy /opt/MIRA/make/documentation/MiraStyle.css /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/MiraStyle.css

../../doc/domains/MyFirstDomain/attention.png: /opt/MIRA/make/documentation/img/attention.png
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /opt/MIRA/make/documentation/img/attention.png -> /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/attention.png"
	cd /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain && /usr/bin/cmake -E copy /opt/MIRA/make/documentation/img/attention.png /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/attention.png

../../doc/domains/MyFirstDomain/DeveloperSmall.png: /opt/MIRA/make/documentation/img/DeveloperSmall.png
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /opt/MIRA/make/documentation/img/DeveloperSmall.png -> /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/DeveloperSmall.png"
	cd /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain && /usr/bin/cmake -E copy /opt/MIRA/make/documentation/img/DeveloperSmall.png /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/DeveloperSmall.png

../../doc/domains/MyFirstDomain/EndUserSmall.png: /opt/MIRA/make/documentation/img/EndUserSmall.png
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /opt/MIRA/make/documentation/img/EndUserSmall.png -> /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/EndUserSmall.png"
	cd /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain && /usr/bin/cmake -E copy /opt/MIRA/make/documentation/img/EndUserSmall.png /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/EndUserSmall.png

../../doc/domains/MyFirstDomain/AppDesignerSmall.png: /opt/MIRA/make/documentation/img/AppDesignerSmall.png
	$(CMAKE_COMMAND) -E cmake_progress_report /localhome/demo/MyFirstProject/build/debug/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /opt/MIRA/make/documentation/img/AppDesignerSmall.png -> /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/AppDesignerSmall.png"
	cd /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain && /usr/bin/cmake -E copy /opt/MIRA/make/documentation/img/AppDesignerSmall.png /localhome/demo/MyFirstProject/doc/domains/MyFirstDomain/AppDesignerSmall.png

MyFirstDomain_doc: domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc
MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/MiraStyle.css
MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/attention.png
MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/DeveloperSmall.png
MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/EndUserSmall.png
MyFirstDomain_doc: ../../doc/domains/MyFirstDomain/AppDesignerSmall.png
MyFirstDomain_doc: domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/build.make
.PHONY : MyFirstDomain_doc

# Rule to build all files generated by this target.
domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/build: MyFirstDomain_doc
.PHONY : domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/build

domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/clean:
	cd /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain && $(CMAKE_COMMAND) -P CMakeFiles/MyFirstDomain_doc.dir/cmake_clean.cmake
.PHONY : domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/clean

domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/depend:
	cd /localhome/demo/MyFirstProject/build/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /localhome/demo/MyFirstProject /localhome/demo/MyFirstProject/domains/MyFirstDomain /localhome/demo/MyFirstProject/build/debug /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain /localhome/demo/MyFirstProject/build/debug/domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : domains/MyFirstDomain/CMakeFiles/MyFirstDomain_doc.dir/depend

