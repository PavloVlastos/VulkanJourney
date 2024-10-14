@echo off
setlocal enabledelayedexpansion

REM Check if build directory exists and remove it
if exist build (
    echo Removing existing build directory...
    rmdir /s /q build
)

REM Create new build directory
echo Creating new build directory...
mkdir build
cd build

REM Run CMake
echo Running CMake...
cmake -G "Visual Studio 17 2022" -A x64 ..

REM Build the project using CMake
echo Building the project...
cmake --build . --config Release

REM Check if build was successful
if !errorlevel! neq 0 (
    echo Build failed.
    exit /b !errorlevel!
)

REM Move the executable to the build folder
echo Moving executable to build folder...
for /R %%f in (*.exe) do (
    move "%%f" .
    echo Moved: %%f
)

echo Build completed successfully.
echo Executable should now be in the build folder.

REM List contents of build directory
dir /b *.exe

cd ..