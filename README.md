# Lé Mod

Le all encompassing mod for Minecraft 1.21.1 with Forge 52.0.17

## Description

Lé Mod is a comprehensive Minecraft mod that aims to enhance your gameplay experience with quality of life improvements and new features. Created with love and dedication by Bobbyyy9.

## ✅ Current Status

**BUILD STATUS: ✅ WORKING & FULLY OPERATIONAL**
- ✅ Project builds successfully after fixes
- ✅ ForgeGradle 6.0.24 configured correctly  
- ✅ Java 21 toolchain configured
- ✅ All compilation errors resolved
- ✅ JAR file generated: `yourmod-1.0.0.jar`
- ✅ VS Code integration working
- ✅ Minecraft client successfully launches and runs
- ✅ Mod loads properly in Minecraft
- ✅ Fixed corrupted source files and API issues

### Recent Fixes Applied:
- **Fixed ModItems.java**: Resolved corrupted comment syntax that was causing compilation failures
- **Fixed ModCreativeModeTabs.java**: Corrected Component API usage and imports for Minecraft 1.21.1
- **Verified Build**: Confirmed mod JAR builds successfully and can be loaded in Minecraft client

## Features

- ✅ **Fully Functional Build System**: Project builds without errors after fixing corrupted files
- ✅ **Modern Forge Development Structure**: Updated for Minecraft 1.21.1 and Forge compatibility
- ✅ **Proper VS Code Integration**: All tasks and debugging configurations work correctly
- ✅ **Automated Build System**: Gradle tasks for building, testing, and deployment
- ✅ **Working Creative Tab System**: Custom creative tabs load properly in-game
- ✅ **Item Registration System**: Ready for custom items (examples included)
- 🔄 **Block Registration System**: Ready for custom blocks (framework in place)
- 📋 **Future Content**: Expandable foundation for adding new gameplay features

## Development Setup

### Prerequisites

- Java 21 (required for Minecraft 1.21.7)
- Visual Studio Code
- Git

### Getting Started

1. Clone this repository
2. Open the folder in VS Code
3. Install recommended extensions when prompted
4. Run the build task: `Ctrl+Shift+P` → "Tasks: Run Task" → "build"
5. **✅ Verified Working**: The project now builds successfully and runs in Minecraft

**Note**: This project was recently fixed from a corrupted state. All major compilation issues have been resolved and the mod is now fully functional.

### Development Tasks

#### Available VS Code Tasks:
- **Build**: `Ctrl+Shift+P` → "Tasks: Run Task" → "build"
- **Clean**: Clean the build directory
- **Run Client**: Start Minecraft client with the mod loaded
- **Run Server**: Start Minecraft server with the mod loaded
- **Copy Jar to Mods**: Build and copy the mod JAR to the run/mods folder

#### Available Launch Configurations:
- **Debug Minecraft Client**: Debug the mod in Minecraft client
- **Debug Minecraft Server**: Debug the mod in Minecraft server
- **Run Data Generator**: Generate mod data (recipes, loot tables, etc.)

### Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/uipg/lemod/
│   │       ├── LeMod.java              # Main mod class
│   │       └── init/                   # Registration classes
│   │           ├── ModItems.java       # Item registry
│   │           ├── ModBlocks.java      # Block registry
│   │           └── ModCreativeModeTabs.java  # Creative tabs
│   └── resources/
│       ├── META-INF/
│       │   └── mods.toml              # Mod metadata
│       ├── assets/lemod/
│       │   └── lang/
│       │       └── en_us.json         # English translations
│       └── pack.mcmeta                # Resource pack metadata
```

### Building the Mod

```bash
# Build the mod
./gradlew build

# Clean and build
./gradlew clean build

# Build and copy to mods folder for testing
./gradlew copyJarToMods
```

### Running the Mod

#### Option 1: Using Gradle Tasks
```bash
# Run client
./gradlew runClient

# Run server
./gradlew runServer
```

#### Option 2: Using VS Code
1. Press `F5` to start debugging
2. Or use `Ctrl+Shift+P` → "Tasks: Run Task" → "runClient"

#### Option 3: Using JAR file
```bash
# Build and copy JAR, then run
./gradlew copyJarToMods
# Then use the "runJarMod" task or run Minecraft with the mods folder
```

### Adding New Content

#### Adding Items:
1. Open `src/main/java/com/uipg/lemod/init/ModItems.java`
2. Uncomment the example items or add new ones
3. Add translations in `src/main/resources/assets/lemod/lang/en_us.json`
4. Add to creative tab in `ModCreativeModeTabs.java`

#### Adding Blocks:
1. Open `src/main/java/com/uipg/lemod/init/ModBlocks.java`
2. Add your block registration
3. Create corresponding item in `ModItems.java` if needed
4. Add translations and textures

### Gradle Properties

The mod uses properties from `gradle.properties`:
- `mod_version`: Version of your mod
- `mod_group_id`: Your mod's group ID
- `mod_id`: Your mod's ID (must match the @Mod annotation)
- `minecraft_version`: Target Minecraft version
- `forge_version`: Target Forge version

## Troubleshooting

### Common Issues and Solutions

#### Build Errors
If you encounter build errors, try these steps:

1. **Clean and rebuild**:
   ```bash
   ./gradlew clean build
   ```

2. **Check Java version**: Ensure you're using Java 21
   ```bash
   java -version
   ```

3. **Refresh Gradle**: In VS Code, open Command Palette (`Ctrl+Shift+P`) and run "Java: Refresh Projects"

#### Fixed Issues (Historical Reference)
- **Corrupted ModItems.java**: Fixed broken comment syntax that prevented compilation
- **Component API Issues**: Updated imports and API calls for Minecraft 1.21.1 compatibility
- **Build Configuration**: Ensured proper ForgeGradle and toolchain configuration

#### Minecraft Launch Issues
- Ensure the mod JAR is built: `./gradlew build`
- Check that Java 21 is being used
- Verify Forge version compatibility in `gradle.properties`

#### VS Code Integration Issues
- Install recommended Java extensions
- Restart VS Code after initial project load
- Use `Ctrl+Shift+P` → "Java: Refresh Projects" if IntelliSense isn't working

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

Created by **Bobbyyy9** with ❤️

## Support

- Issues: [GitHub Issues](https://github.com/Bobbyyy9/lemod/issues)
- Discussions: [GitHub Discussions](https://github.com/Bobbyyy9/lemod/discussions)
