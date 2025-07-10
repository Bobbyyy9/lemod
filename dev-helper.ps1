#!/usr/bin/env powershell
<#
.SYNOPSIS
    Enhanced development script for Lé Mod
.DESCRIPTION
    This script provides enhanced development workflow for Minecraft Forge modding
    Based on best practices from the VS Code Minecraft Forge community
.EXAMPLE
    .\dev-helper.ps1 -Action build
    .\dev-helper.ps1 -Action runClient
    .\dev-helper.ps1 -Action setup
#>

param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("setup", "build", "clean", "runClient", "runServer", "genVSCode", "help")]
    [string]$Action
)

function Write-Header {
    param([string]$Message)
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  $Message" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
}

function Write-Success {
    param([string]$Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ $Message" -ForegroundColor Blue
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

switch ($Action) {
    "setup" {
        Write-Header "Setting up Lé Mod Development Environment"
        
        Write-Info "Checking Java version..."
        try {
            $javaVersion = java -version 2>&1 | Select-String "version" | ForEach-Object { $_.ToString().Split('"')[1] }
            if ($javaVersion -like "21.*") {
                Write-Success "Java 21 detected: $javaVersion"
            }
            else {
                Write-Warning "Java 21 is required for Minecraft 1.21.7. Current version: $javaVersion"
            }
        }
        catch {
            Write-Warning "Java not found in PATH. Please install Java 21."
        }
        
        Write-Info "Setting up Gradle wrapper permissions..."
        if (Test-Path ".\gradlew.bat") {
            Write-Success "Gradle wrapper found"
        }
        else {
            Write-Warning "Gradle wrapper not found"
        }
        
        Write-Info "Generating VS Code configurations..."
        & .\gradlew genVSCodeRuns
        Write-Success "VS Code setup complete"
        
        Write-Info "Building project for the first time..."
        & .\gradlew build
        Write-Success "Initial build complete"
        
        Write-Header "Setup Complete!"
        Write-Info "You can now:"
        Write-Info "  • Open this folder in VS Code"
        Write-Info "  • Press F5 to debug"
        Write-Info "  • Use Ctrl+Shift+P and search 'Tasks: Run Task'"
        Write-Info "  • Run '.\dev-helper.ps1 -Action runClient' to start Minecraft"
    }
    
    "build" {
        Write-Header "Building Lé Mod"
        & .\gradlew build
        Write-Success "Build complete"
    }
    
    "clean" {
        Write-Header "Cleaning Build Artifacts"
        & .\gradlew clean
        Write-Success "Clean complete"
    }
    
    "runClient" {
        Write-Header "Starting Minecraft Client with Lé Mod"
        Write-Info "This may take a few minutes on first run..."
        & .\gradlew runClient
    }
    
    "runServer" {
        Write-Header "Starting Minecraft Server with Lé Mod"
        Write-Info "This may take a few minutes on first run..."
        & .\gradlew runServer
    }
    
    "genVSCode" {
        Write-Header "Generating VS Code Configurations"
        & .\gradlew genVSCodeRuns
        Write-Success "VS Code configurations updated"
    }
    
    "help" {
        Write-Header "Lé Mod Development Helper"
        Write-Host ""
        Write-Host "Available Actions:" -ForegroundColor Yellow
        Write-Host "  setup      - Complete development environment setup" -ForegroundColor Cyan
        Write-Host "  build      - Build the mod" -ForegroundColor Cyan
        Write-Host "  clean      - Clean build artifacts" -ForegroundColor Cyan
        Write-Host "  runClient  - Start Minecraft client with the mod" -ForegroundColor Cyan
        Write-Host "  runServer  - Start Minecraft server with the mod" -ForegroundColor Cyan
        Write-Host "  genVSCode  - Generate VS Code run configurations" -ForegroundColor Cyan
        Write-Host "  help       - Show this help message" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Examples:" -ForegroundColor Yellow
        Write-Host "  .\dev-helper.ps1 -Action setup" -ForegroundColor Green
        Write-Host "  .\dev-helper.ps1 -Action build" -ForegroundColor Green
        Write-Host "  .\dev-helper.ps1 -Action runClient" -ForegroundColor Green
    }
}
