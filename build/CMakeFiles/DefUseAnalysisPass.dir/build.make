# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zshiraz/CSC512_part2_submission

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zshiraz/CSC512_part2_submission/build

# Include any dependencies generated for this target.
include CMakeFiles/DefUseAnalysisPass.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/DefUseAnalysisPass.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/DefUseAnalysisPass.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DefUseAnalysisPass.dir/flags.make

CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o: CMakeFiles/DefUseAnalysisPass.dir/flags.make
CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o: ../SeminalInputFeatures/DefUseAnalysisPass.cpp
CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o: CMakeFiles/DefUseAnalysisPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zshiraz/CSC512_part2_submission/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o -MF CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o.d -o CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o -c /home/zshiraz/CSC512_part2_submission/SeminalInputFeatures/DefUseAnalysisPass.cpp

CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zshiraz/CSC512_part2_submission/SeminalInputFeatures/DefUseAnalysisPass.cpp > CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.i

CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zshiraz/CSC512_part2_submission/SeminalInputFeatures/DefUseAnalysisPass.cpp -o CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.s

# Object files for target DefUseAnalysisPass
DefUseAnalysisPass_OBJECTS = \
"CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o"

# External object files for target DefUseAnalysisPass
DefUseAnalysisPass_EXTERNAL_OBJECTS =

libDefUseAnalysisPass.so: CMakeFiles/DefUseAnalysisPass.dir/SeminalInputFeatures/DefUseAnalysisPass.cpp.o
libDefUseAnalysisPass.so: CMakeFiles/DefUseAnalysisPass.dir/build.make
libDefUseAnalysisPass.so: /usr/lib/llvm-17/lib/libLLVM-17.so.1
libDefUseAnalysisPass.so: CMakeFiles/DefUseAnalysisPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zshiraz/CSC512_part2_submission/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module libDefUseAnalysisPass.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DefUseAnalysisPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DefUseAnalysisPass.dir/build: libDefUseAnalysisPass.so
.PHONY : CMakeFiles/DefUseAnalysisPass.dir/build

CMakeFiles/DefUseAnalysisPass.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DefUseAnalysisPass.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DefUseAnalysisPass.dir/clean

CMakeFiles/DefUseAnalysisPass.dir/depend:
	cd /home/zshiraz/CSC512_part2_submission/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zshiraz/CSC512_part2_submission /home/zshiraz/CSC512_part2_submission /home/zshiraz/CSC512_part2_submission/build /home/zshiraz/CSC512_part2_submission/build /home/zshiraz/CSC512_part2_submission/build/CMakeFiles/DefUseAnalysisPass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DefUseAnalysisPass.dir/depend

