# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appExplorationQML_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appExplorationQML_autogen.dir\\ParseCache.txt"
  "appExplorationQML_autogen"
  )
endif()
