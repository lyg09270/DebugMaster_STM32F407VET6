cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT USB_FS.Debug+STM32F407VETx)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/USB_FS/STM32F407VETx/Debug")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(LD_SCRIPT "${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx/ac6_linker_script.sct.src")
set(LD_REGIONS "${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx/regions_STM32F407VETx.h")
set(LD_SCRIPT_PP "${CMAKE_CURRENT_BINARY_DIR}/ac6_linker_script.sct")

# Processor Options
set(CPU Cortex-M4)
set(FPU SP_FPU)
set(BYTE_ORDER Little-endian)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C ASM)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".axf" OUTPUT_NAME "USB_FS")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  ${SOLUTION_ROOT}/USB_FS/RTE/_Debug_STM32F407VETx
  ${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Driver/Include
  ${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/CMSIS/Device/ST/STM32F4xx/Include
  ${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Inc
  ${SOLUTION_ROOT}/USB_FS/RTE
  ${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Inc
  ${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/CDC/Inc
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    STM32F407xx
    _RTE_
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_CPU}"
    "SHELL:${ASM_FLAGS}"
    "SHELL:${ASM_BYTE_ORDER}"
    "SHELL:-masm=auto"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-std=gnu11"
    "SHELL:-Wno-macro-redefined"
    "SHELL:-Wno-pragma-pack"
    "SHELL:-Wno-parentheses-equality"
    "SHELL:-Wno-license-management"
  >
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "SHELL:${_PI}\"${SOLUTION_ROOT}/USB_FS/RTE/_Debug_STM32F407VETx/Pre_Include_Global.h\""
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "none" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(ASM "none" "on" "" "" ASM_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_Source_Files
  Group_STM32_USB_Device_Library
  ARM_CMSIS_CORE_6_1_0
  Keil_CMSIS_Driver_USB_Device_Full-speed_2_23
  Keil_Device_STM32Cube_Framework_Classic_1_8_1
  Keil_Device_STM32Cube_HAL_Common_1_8_1
  Keil_Device_STM32Cube_HAL_Cortex_1_8_1
  Keil_Device_STM32Cube_HAL_GPIO_1_8_1
  Keil_Device_STM32Cube_HAL_PCD_1_8_1
  Keil_Device_STM32Cube_HAL_RCC_1_8_1
  Keil_Device_Startup_2_6_3
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:--entry=Reset_Handler"
  "SHELL:--info summarysizes"
  "SHELL:--summary_stderr"
  "SHELL:--diag_suppress=L6314W"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})

# Linker script pre-processing
add_custom_command(TARGET ${CONTEXT} PRE_LINK COMMAND ${CPP} ARGS ${CPP_ARGS_LD_SCRIPT} BYPRODUCTS ${LD_SCRIPT_PP})
