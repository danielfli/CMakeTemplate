message(STATUS "Using Toolchain for raspberry pi 4")

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_SYSROOT /opt/raspberry/arm64/)
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT}) 
set(CMAKE_LIBRARY_ARCHITECTURE aarch64-linux-gnu)

# Set the compilers for C, C++
set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc-12 )
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++-12 )

# for raspberry pi 4
set(ARCH_FLAGS "-mcpu=cortex-a53+crc+simd")
set(CMAKE_C_FLAGS_INIT ${ARCH_FLAGS})
set(CMAKE_CXX_FLAGS_INIT ${ARCH_FLAGS})
set(CMAKE_Fortran_FLAGS_INIT ${ARCH_FLAGS})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE arm64)