project(Hypocycloid)

add_executable(hypocycloid main.cpp)

cmake_minimum_required(VERSION 3.7 FATAL_ERROR)

set_target_properties(hypocycloid PROPERTIES
        CXX_STANDARD 17
        CXX_EXTENSIONS OFF
        )

find_package(Vulkan)
set(VULKAN_LIB_LIST "vulkan")

find_package(PkgConfig REQUIRED)
pkg_search_module(GLFW REQUIRED glfw3)
include_directories(${GLFW_INCLUDE_DIRS})
target_include_directories(hypocycloid PRIVATE Vulkan::Vulkan)
target_link_libraries(hypocycloid ${GLFW_LIBRARIES})
target_link_libraries(hypocycloid ${GLFW_STATIC_LIBRARIES})
target_link_libraries(hypocycloid ${VULKAN_LIB_LIST})

