# components.cmake

# component ARM::CMSIS:CORE@6.1.0
add_library(ARM_CMSIS_CORE_6_1_0 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include
)
target_compile_definitions(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::CMSIS Driver:USB Device:Full-speed@2.23
add_library(Keil_CMSIS_Driver_USB_Device_Full-speed_2_23 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/CMSIS/Driver/OTG_FS_STM32F4xx.c"
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/CMSIS/Driver/USBD_FS_STM32F4xx.c"
)
target_include_directories(Keil_CMSIS_Driver_USB_Device_Full-speed_2_23 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Driver/Include
)
target_compile_definitions(Keil_CMSIS_Driver_USB_Device_Full-speed_2_23 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_USB_Device_Full-speed_2_23 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_USB_Device_Full-speed_2_23 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:STM32Cube Framework:Classic@1.8.1
add_library(Keil_Device_STM32Cube_Framework_Classic_1_8_1 INTERFACE)
target_include_directories(Keil_Device_STM32Cube_Framework_Classic_1_8_1 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx
)
target_compile_definitions(Keil_Device_STM32Cube_Framework_Classic_1_8_1 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(Keil_Device_STM32Cube_Framework_Classic_1_8_1 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:STM32Cube HAL:Common@1.8.1
add_library(Keil_Device_STM32Cube_HAL_Common_1_8_1 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c"
)
target_include_directories(Keil_Device_STM32Cube_HAL_Common_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Inc
)
target_compile_definitions(Keil_Device_STM32Cube_HAL_Common_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_STM32Cube_HAL_Common_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_STM32Cube_HAL_Common_1_8_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:STM32Cube HAL:Cortex@1.8.1
add_library(Keil_Device_STM32Cube_HAL_Cortex_1_8_1 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c"
)
target_include_directories(Keil_Device_STM32Cube_HAL_Cortex_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_STM32Cube_HAL_Cortex_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_STM32Cube_HAL_Cortex_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_STM32Cube_HAL_Cortex_1_8_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:STM32Cube HAL:GPIO@1.8.1
add_library(Keil_Device_STM32Cube_HAL_GPIO_1_8_1 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c"
)
target_include_directories(Keil_Device_STM32Cube_HAL_GPIO_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_STM32Cube_HAL_GPIO_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_STM32Cube_HAL_GPIO_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_STM32Cube_HAL_GPIO_1_8_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:STM32Cube HAL:PCD@1.8.1
add_library(Keil_Device_STM32Cube_HAL_PCD_1_8_1 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd.c"
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd_ex.c"
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c"
)
target_include_directories(Keil_Device_STM32Cube_HAL_PCD_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_STM32Cube_HAL_PCD_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_STM32Cube_HAL_PCD_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_STM32Cube_HAL_PCD_1_8_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:STM32Cube HAL:RCC@1.8.1
add_library(Keil_Device_STM32Cube_HAL_RCC_1_8_1 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c"
  "${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c"
)
target_include_directories(Keil_Device_STM32Cube_HAL_RCC_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_STM32Cube_HAL_RCC_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_STM32Cube_HAL_RCC_1_8_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_STM32Cube_HAL_RCC_1_8_1 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:Startup@2.6.3
add_library(Keil_Device_Startup_2_6_3 OBJECT
  "${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx/startup_stm32f407xx.s"
  "${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx/system_stm32f4xx.c"
)
target_include_directories(Keil_Device_Startup_2_6_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/Drivers/CMSIS/Device/ST/STM32F4xx/Include
)
target_compile_definitions(Keil_Device_Startup_2_6_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_Startup_2_6_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_Startup_2_6_3 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  STM32F407xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/MDK/Device/Source/ARM/STM32F40xxx_41xxx_OPT.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)
set(COMPILE_DEFINITIONS
  STM32F407xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${CMSIS_PACK_ROOT}/Keil/STM32F4xx_DFP/2.17.1/MDK/Device/Source/ARM/STM32F4xx_OTP.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)
set(COMPILE_DEFINITIONS
  STM32F407xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/USB_FS/RTE/Device/STM32F407VETx/startup_stm32f407xx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)
