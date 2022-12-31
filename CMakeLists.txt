cmake_minimum_required(VERSION 3.8)

project(TEMPORARYNAME)

find_package(glfw3 REQUIRED)
find_package(glm REQUIRED)
find_package(Vulkan REQUIRED)
find_package(tinyobjloader REQUIRED)

find_package(PkgConfig)
pkg_get_variable(STB_INCLUDEDIR stb includedir)
if(NOT STB_INCLUDEDIR)
  unset(STB_INCLUDEDIR)
  find_path(STB_INCLUDEDIR stb_image.h PATH_SUFFIXES stb)
endif()
if(NOT STB_INCLUDEDIR)
  message(FATAL_ERROR "Unable to find the stb_image.h header!")
endif()

if(bindings)
    find_package(Python3 COMPONENTS Interpreter Development)

    include_directories(
        ${Python3_INCLUDE_DIRS}
    )

endif()

set(MAIN src/main.cpp)
set(MAIN_HEADLESS src/main_headless.cpp)

set(HEADER_FILES src/include/TEMPORARYNAME.h src/include/vulkan_interface.hpp)

set(CMAKE_SHARED_LIBRARY_PREFIX "_")
set(CMAKE_STATIC_LIBRARY_PREFIX "_")

if(bindings)
    set(BINDING_FILES
      src/bindings/vkRenderer_python.cpp
    )
endif()

include_directories(src/include ${glfw_INCLUDE_DIRS} ${glm_INCLUDE_DIRS}
                    ${tinyobjloader_INCLUDE_DIRS})

add_executable(TEMPORARYNAME ${MAIN} ${HEADER_FILES})
add_executable(TEMPORARYNAMEHEADLESS ${MAIN_HEADLESS} ${HEADER_FILES})

if(bindings)
    add_library(TEMPORARYNAMELIB SHARED ${SOURCE_FILES} ${HEADER_FILES} ${BINDING_FILES})
else()
    add_library(TEMPORARYNAMELIB SHARED ${SOURCE_FILES} ${HEADER_FILES})
endif()

set_target_properties(TEMPORARYNAMELIB PROPERTIES OUTPUT_NAME "TEMPORARYNAME")
set_target_properties(TEMPORARYNAMELIB PROPERTIES LINKER_LANGUAGE CXX)

target_link_libraries(TEMPORARYNAME glfw ${tinyobjloader_LIBRARIES}
                      ${Vulkan_LIBRARIES})
target_link_libraries(TEMPORARYNAMEHEADLESS glfw ${tinyobjloader_LIBRARIES}
                      ${Vulkan_LIBRARIES})
target_link_libraries(TEMPORARYNAMELIB glfw ${tinyobjloader_LIBRARIES}
                      ${Vulkan_LIBRARIES})

add_custom_command(
  TARGET TEMPORARYNAME
  POST_BUILD
  COMMAND cd ${CMAKE_SOURCE_DIR}/src/scripts && python3 compile_shaders.py)

add_custom_command(
  TARGET TEMPORARYNAME
  POST_BUILD
  COMMAND cd ${CMAKE_SOURCE_DIR} && cp -r ass/models bin/ && cp -r ass/textures
          bin/)

install(TARGETS TEMPORARYNAME DESTINATION bin)
install(TARGETS TEMPORARYNAMELIB DESTINATION lib)
install(FILES ${HEADER_FILES} DESTINATION include/TEMPORARYNAME)
