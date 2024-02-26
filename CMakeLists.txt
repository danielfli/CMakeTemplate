cmake_minimum_required(VERSION 3.25)
project(devenv VERSION 0.0.0  DESCRIPTION "CMake Template")

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -Wpedantic -Werror")

add_subdirectory(app)


message(STATUS "CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")
# copy files to target
if(${CROSS_BUILDING})
  install(CODE "
  execute_process(COMMAND ${CMAKE_SOURCE_DIR}/script/copy_to_target.sh ${CMAKE_INSTALL_PREFIX} ${TARGET_IP_ADRESSE}
  RESULT_VARIABLE result)
  if(NOT result EQUAL 0)
    message(FATAL_ERROR \"Install failed with error! \${result}\")
  endif()
  ")
endif()