cmake_minimum_required(VERSION 3.10)

project(VulkanTutorial)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Vulkan REQUIRED)
find_package(glfw3 3.3 REQUIRED)

add_executable(VulkanTutorial main.cpp)

target_link_libraries(VulkanTutorial PRIVATE Vulkan::Vulkan glfw)

if(UNIX AND NOT APPLE)
    target_link_libraries(VulkanTutorial PRIVATE dl pthread X11 Xxf86vm Xrandr Xi)
endif()