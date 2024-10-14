cmake_minimum_required(VERSION 3.10)

project(VulkanTutorial)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Vulkan
find_package(Vulkan REQUIRED)

# GLFW
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

# Try to find pre-built GLFW
find_package(glfw3 3.3 QUIET)

if(NOT glfw3_FOUND)
    include(FetchContent)
    FetchContent_Declare(
        glfw
        GIT_REPOSITORY https://github.com/glfw/glfw.git
        GIT_TAG 3.3.8
    )
    FetchContent_MakeAvailable(glfw)
endif()

add_executable(VulkanTutorial main.cpp)

target_link_libraries(VulkanTutorial PRIVATE Vulkan::Vulkan glfw)

if(UNIX AND NOT APPLE)
    target_link_libraries(VulkanTutorial PRIVATE dl pthread X11 Xxf86vm Xrandr Xi)
endif()