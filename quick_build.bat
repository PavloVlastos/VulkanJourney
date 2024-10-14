@echo off
setlocal enabledelayedexpansion

:: Create and enter build directory
if not exist build mkdir build
cd build

:: Run CMake
cmake ..

:: Build the project
cmake --build . --config Release

:: Check if build was successful
if %ERRORLEVEL% EQU 0 (
    echo Build completed successfully.
    echo Executable should be in build\Release\VulkanParticles.exe
) else (
    echo Build failed with error code %ERRORLEVEL%.
)

:: Return to original directory
cd ..

pause