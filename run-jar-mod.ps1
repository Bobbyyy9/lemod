# PowerShell script to run Minecraft with only the JAR mod (no source mod)

Write-Host "Building the mod..." -ForegroundColor Green
./gradlew build

Write-Host "Backing up build output..." -ForegroundColor Yellow
# Move all build output that could be detected as mod sources
if (Test-Path "build\classes") {
    Move-Item "build\classes" "build\classes.temp" -Force
}
if (Test-Path "build\resources") {
    Move-Item "build\resources" "build\resources.temp" -Force
}
if (Test-Path "build\generated") {
    Move-Item "build\generated" "build\generated.temp" -Force
}

Write-Host "Copying JAR to mods directory..." -ForegroundColor Green
if (Test-Path "build\libs\yourmod-1.0.0.jar") {
    Copy-Item "build\libs\yourmod-1.0.0.jar" "run\mods\" -Force
    Write-Host "JAR copied successfully!" -ForegroundColor Green
} else {
    Write-Host "ERROR: JAR file not found!" -ForegroundColor Red
    exit 1
}

Write-Host "Starting Minecraft client (JAR mod only)..." -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the client when you're done testing." -ForegroundColor Yellow

try {
    ./gradlew runClient
} finally {
    Write-Host "Restoring build output..." -ForegroundColor Yellow
    if (Test-Path "build\classes.temp") {
        Move-Item "build\classes.temp" "build\classes" -Force
    }
    if (Test-Path "build\resources.temp") {
        Move-Item "build\resources.temp" "build\resources" -Force
    }
    if (Test-Path "build\generated.temp") {
        Move-Item "build\generated.temp" "build\generated" -Force
    }
    Write-Host "Build output restored." -ForegroundColor Green
}
