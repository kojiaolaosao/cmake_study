# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/218/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/218/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/qiwentao/project/camke_study/importing-exporting/Importing

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/mynewexe.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mynewexe.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mynewexe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mynewexe.dir/flags.make

main.cc:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating main.cc"
	/home/qiwentao/project/camke_study/importing-exporting/MyExe/cmake-build-debug/myexe

CMakeFiles/mynewexe.dir/main.cc.o: CMakeFiles/mynewexe.dir/flags.make
CMakeFiles/mynewexe.dir/main.cc.o: main.cc
CMakeFiles/mynewexe.dir/main.cc.o: CMakeFiles/mynewexe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mynewexe.dir/main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/mynewexe.dir/main.cc.o -MF CMakeFiles/mynewexe.dir/main.cc.o.d -o CMakeFiles/mynewexe.dir/main.cc.o -c /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/main.cc

CMakeFiles/mynewexe.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mynewexe.dir/main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/main.cc > CMakeFiles/mynewexe.dir/main.cc.i

CMakeFiles/mynewexe.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mynewexe.dir/main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/main.cc -o CMakeFiles/mynewexe.dir/main.cc.s

# Object files for target mynewexe
mynewexe_OBJECTS = \
"CMakeFiles/mynewexe.dir/main.cc.o"

# External object files for target mynewexe
mynewexe_EXTERNAL_OBJECTS =

mynewexe: CMakeFiles/mynewexe.dir/main.cc.o
mynewexe: CMakeFiles/mynewexe.dir/build.make
mynewexe: CMakeFiles/mynewexe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable mynewexe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mynewexe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mynewexe.dir/build: mynewexe
.PHONY : CMakeFiles/mynewexe.dir/build

CMakeFiles/mynewexe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mynewexe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mynewexe.dir/clean

CMakeFiles/mynewexe.dir/depend: main.cc
	cd /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qiwentao/project/camke_study/importing-exporting/Importing /home/qiwentao/project/camke_study/importing-exporting/Importing /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug /home/qiwentao/project/camke_study/importing-exporting/Importing/cmake-build-debug/CMakeFiles/mynewexe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mynewexe.dir/depend
