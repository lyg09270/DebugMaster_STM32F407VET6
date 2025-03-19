# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx")
  file(MAKE_DIRECTORY "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx")
endif()
file(MAKE_DIRECTORY
  "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/1"
  "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx"
  "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx/tmp"
  "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx/src/USB_FS.Debug+STM32F407VETx-stamp"
  "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx/src"
  "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx/src/USB_FS.Debug+STM32F407VETx-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx/src/USB_FS.Debug+STM32F407VETx-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/EECS/Project/DebugMaster/F407/USB_FS/tmp/USB_FS.Debug+STM32F407VETx/src/USB_FS.Debug+STM32F407VETx-stamp${cfgdir}") # cfgdir has leading slash
endif()
