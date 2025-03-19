# groups.cmake

# group Source Files
add_library(Group_Source_Files OBJECT
  "${SOLUTION_ROOT}/USB_FS/main.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/stm32f4xx_it.c"
)
target_include_directories(Group_Source_Files PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/USB_FS/RTE
)
target_compile_definitions(Group_Source_Files PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Source_Files_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Source_Files_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Source_Files PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Source_Files PUBLIC
  Group_Source_Files_ABSTRACTIONS
)

# group STM32_USB_Device_Library
add_library(Group_STM32_USB_Device_Library OBJECT
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Src/usbd_conf.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Src/usbd_core.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Src/usbd_ctlreq.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Src/usbd_desc.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Src/usbd_ioreq.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/CDC/Src/usbd_cdc.c"
  "${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/CDC/Src/usbd_cdc_if.c"
)
target_include_directories(Group_STM32_USB_Device_Library PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/Inc
  ${SOLUTION_ROOT}/USB_FS/RTE/STM32_USB_Device_Library/CDC/Inc
)
target_compile_definitions(Group_STM32_USB_Device_Library PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_STM32_USB_Device_Library_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_STM32_USB_Device_Library_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_STM32_USB_Device_Library PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_STM32_USB_Device_Library PUBLIC
  Group_STM32_USB_Device_Library_ABSTRACTIONS
)
