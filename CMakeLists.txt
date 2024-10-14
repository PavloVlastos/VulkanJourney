cmake_minimum_required(VERSION 3.10)
project(VulkanParticles)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Print current Vulkan-related environment variables
message(STATUS "VULKAN_SDK environment variable: $ENV{VULKAN_SDK}")
message(STATUS "VK_SDK_PATH environment variable: $ENV{VK_SDK_PATH}")

# Try to find Vulkan package
find_package(Vulkan)

if(NOT Vulkan_FOUND)
    message(WARNING "Vulkan package not found automatically. Attempting manual setup...")
    
    # Try to set Vulkan paths manually
    if(DEFINED ENV{VULKAN_SDK})
        set(Vulkan_INCLUDE_DIRS "$ENV{VULKAN_SDK}/Include")
        if(CMAKE_SIZEOF_VOID_P EQUAL 8)
            set(Vulkan_LIBRARIES "$ENV{VULKAN_SDK}/Lib/vulkan-1.lib")
        else()
            set(Vulkan_LIBRARIES "$ENV{VULKAN_SDK}/Lib32/vulkan-1.lib")
        endif()
    elseif(DEFINED ENV{VK_SDK_PATH})
        set(Vulkan_INCLUDE_DIRS "$ENV{VK_SDK_PATH}/Include")
        if(CMAKE_SIZEOF_VOID_P EQUAL 8)
            set(Vulkan_LIBRARIES "$ENV{VK_SDK_PATH}/Lib/vulkan-1.lib")
        else()
            set(Vulkan_LIBRARIES "$ENV{VK_SDK_PATH}/Lib32/vulkan-1.lib")
        endif()
    else()
        message(FATAL_ERROR "Vulkan SDK not found. Please make sure it's installed and VULKAN_SDK or VK_SDK_PATH environment variable is set.")
    endif()
endif()

# Print Vulkan paths for debugging
message(STATUS "Vulkan_INCLUDE_DIRS: ${Vulkan_INCLUDE_DIRS}")
message(STATUS "Vulkan_LIBRARIES: ${Vulkan_LIBRARIES}")

# Add your source files
add_executable(VulkanParticles main.cpp)

# Link Vulkan library
target_link_libraries(VulkanParticles PRIVATE ${Vulkan_LIBRARIES})

# Include directories
target_include_directories(VulkanParticles PRIVATE ${Vulkan_INCLUDE_DIRS})