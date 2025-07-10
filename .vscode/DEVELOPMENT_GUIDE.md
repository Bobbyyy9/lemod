# VS Code Minecraft Forge Development Guide

## Quick Setup

1. **Install Java 21** (Required for Minecraft 1.21.7)
   - Download from [Eclipse Temurin](https://adoptium.net/)
   - Ensure JAVA_HOME is set correctly

2. **Install Required Extensions** (VS Code will prompt automatically)
   - Java Extension Pack
   - Gradle for Java
   - Even Better TOML (for `.toml` files)

3. **Open Project**
   - Open this folder in VS Code
   - Wait for Gradle sync to complete
   - Install recommended extensions when prompted

## Development Workflow

### Building and Running

#### Option 1: Using VS Code Tasks (Recommended)
- **Build**: `Ctrl+Shift+P` → "Tasks: Run Task" → "build"
- **Clean**: `Ctrl+Shift+P` → "Tasks: Run Task" → "clean"
- **Run Client**: `Ctrl+Shift+P` → "Tasks: Run Task" → "runClient"
- **Run Server**: `Ctrl+Shift+P` → "Tasks: Run Task" → "runServer"

#### Option 2: Using VS Code Debug Configurations
- **Debug Client**: Press `F5` or go to Run and Debug panel
- **Debug Server**: Select "Debug Minecraft Server" from debug dropdown
- **Data Generation**: Select "Run Data Generator" for creating mod data

#### Option 3: Using Terminal
```powershell
# Build the mod
.\gradlew build

# Run Minecraft client
.\gradlew runClient

# Run Minecraft server
.\gradlew runServer

# Clean build
.\gradlew clean
```

### Code Development

#### IntelliSense and Autocomplete
- VS Code provides full Java IntelliSense
- Minecraft/Forge APIs are automatically available
- Parameter hints and documentation on hover

#### Code Formatting
- Code is automatically formatted on save
- Uses Google Java Style Guide
- Imports are organized automatically

#### Error Detection
- Real-time error highlighting
- Gradle problems shown in Problems panel
- Quick fixes available with `Ctrl+.`

### Project Structure

```
src/main/java/com/uipg/lemod/
├── LeMod.java                    # Main mod class with @Mod annotation
└── init/                         # Registration classes
    ├── ModItems.java            # Register items here
    ├── ModBlocks.java           # Register blocks here
    └── ModCreativeModeTabs.java # Creative tabs registration

src/main/resources/
├── META-INF/
│   └── mods.toml               # Mod metadata and dependencies
├── assets/lemod/
│   ├── lang/
│   │   └── en_us.json         # English translations
│   ├── textures/              # Item/block textures (create as needed)
│   └── models/                # Item/block models (create as needed)
└── pack.mcmeta                # Resource pack info
```

### Adding New Content

#### 1. Adding Items
1. Open `ModItems.java`
2. Uncomment example item or add new registration:
   ```java
   public static final RegistryObject<Item> MY_ITEM = ITEMS.register("my_item",
           () -> new Item(new Item.Properties()));
   ```
3. Add translation in `en_us.json`:
   ```json
   "item.lemod.my_item": "My Item"
   ```
4. Add to creative tab in `ModCreativeModeTabs.java`

#### 2. Adding Blocks
1. Open `ModBlocks.java`
2. Add block registration:
   ```java
   public static final RegistryObject<Block> MY_BLOCK = BLOCKS.register("my_block",
           () -> new Block(BlockBehaviour.Properties.of().strength(2.0f)));
   ```
3. Add corresponding item in `ModItems.java`:
   ```java
   public static final RegistryObject<Item> MY_BLOCK_ITEM = ITEMS.register("my_block",
           () -> new BlockItem(ModBlocks.MY_BLOCK.get(), new Item.Properties()));
   ```

### Debugging Tips

#### Using Breakpoints
1. Set breakpoints by clicking left of line numbers
2. Press `F5` to start debugging
3. Game will pause at breakpoints for inspection

#### Logging
```java
// Use the mod's logger
private static final Logger LOGGER = LoggerFactory.getLogger(MyClass.class);

// Log different levels
LOGGER.info("Information message");
LOGGER.warn("Warning message");
LOGGER.error("Error message");
LOGGER.debug("Debug message"); // Only shows with debug logging enabled
```

#### Hot Reload
- Some changes can be hot-reloaded without restarting
- Use `Ctrl+Shift+F5` to restart debugging session
- For major changes, restart the game

### Common Issues and Solutions

#### Build Fails
1. Check Java version: `java -version` (should be 21)
2. Clean and rebuild: `.\gradlew clean build`
3. Check Problems panel for specific errors

#### Game Won't Start
1. Check mod registration in main class
2. Verify `mods.toml` syntax
3. Check for conflicting mod IDs

#### Missing Textures/Models
1. Create `assets/lemod/textures/item/` or `assets/lemod/textures/block/`
2. Add `.png` files with same name as registry name
3. Create model files in `assets/lemod/models/item/` or `assets/lemod/models/block/`

### Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Build | `Ctrl+Shift+P` → "build" |
| Debug | `F5` |
| Quick Fix | `Ctrl+.` |
| Go to Definition | `F12` |
| Find References | `Shift+F12` |
| Rename Symbol | `F2` |
| Command Palette | `Ctrl+Shift+P` |
| Toggle Terminal | `Ctrl+`` |

### VS Code Features for Modding

#### Git Integration
- Source control panel shows changes
- Commit directly from VS Code
- Visual diff for changes

#### Extensions Marketplace
- Install additional helpful extensions
- Language support for other file types
- Themes and customization

#### Workspace Settings
- Project-specific settings in `.vscode/settings.json`
- Shared team configurations
- Custom tasks and launch configurations

---

Happy Modding! 🎮✨
