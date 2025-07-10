@echo off
echo Creating a clean test environment...

REM Clean everything first
echo Cleaning project...
call gradlew clean

REM Build the JAR
echo Building JAR...
call gradlew jar

REM Copy JAR to mods directory
echo Copying JAR to mods...
if not exist "run\mods" mkdir "run\mods"
copy "build\libs\yourmod-1.0.0.jar" "run\mods\"

REM Temporarily rename the source package to avoid conflicts
echo Temporarily hiding source code...
if exist "src\main\java\com\yourname\yourmod" (
    move "src\main\java\com\yourname\yourmod" "src\main\java\com\yourname\yourmod.backup"
)

REM Run the client
echo Starting Minecraft client...
call gradlew runClient

REM Restore the source code
echo Restoring source code...
if exist "src\main\java\com\yourname\yourmod.backup" (
    move "src\main\java\com\yourname\yourmod.backup" "src\main\java\com\yourname\yourmod"
)

echo Done!
pause
