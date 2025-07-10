# PowerShell script to run Minecraft with ONLY the JAR mod
# This script completely removes build output to prevent module conflicts

Write-Host "Copying JAR to mods directory..." -ForegroundColor Green
if (Test-Path "build\libs\yourmod-1.0.0.jar") {
    Copy-Item "build\libs\yourmod-1.0.0.jar" "run\mods\" -Force
    Write-Host "JAR copied successfully!" -ForegroundColor Green
} else {
    Write-Host "ERROR: JAR file not found! Run './gradlew jar' first." -ForegroundColor Red
    exit 1
}

Write-Host "Temporarily removing ALL build output..." -ForegroundColor Yellow
# Completely move the entire build directory to prevent any scanning
if (Test-Path "build") {
    Move-Item "build" "build.temp" -Force
}

Write-Host "Starting Minecraft client (JAR mod only)..." -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the client when you're done testing." -ForegroundColor Yellow

try {
    ./gradlew runClient
} finally {
    Write-Host "Restoring build directory..." -ForegroundColor Yellow
    if (Test-Path "build.temp") {
        Move-Item "build.temp" "build" -Force
    }
    Write-Host "Build directory restored." -ForegroundColor Green
}
