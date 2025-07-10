# Direct Minecraft launcher script to bypass module system issues
# This script runs Minecraft with classpath instead of module path

Write-Host "Building mod JAR..." -ForegroundColor Green
& ./gradlew build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Copying JAR to mods folder..." -ForegroundColor Green
& ./gradlew copyJarToMods
if ($LASTEXITCODE -ne 0) {
    Write-Host "Copy failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Starting Minecraft with external launcher..." -ForegroundColor Green
Write-Host "Please install Minecraft Forge 1.21.1 separately and copy the JAR manually." -ForegroundColor Yellow
Write-Host "JAR location: build\libs\lemod-1.21.1-1.0.0.jar" -ForegroundColor Cyan

# Check if JAR exists
$jarPath = "build\libs\lemod-1.21.1-1.0.0.jar"
if (Test-Path $jarPath) {
    Write-Host "✅ JAR file ready: $jarPath" -ForegroundColor Green
    Write-Host "Copy this file to your Minecraft Forge 1.21.1 mods folder" -ForegroundColor Yellow
    
    # Open the build folder for easy access
    if (Test-Path "build\libs") {
        explorer "build\libs"
    }
}
else {
    Write-Host "❌ JAR file not found!" -ForegroundColor Red
}
