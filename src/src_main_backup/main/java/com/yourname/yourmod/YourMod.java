package com.yourname.yourmod;

import net.minecraftforge.fml.common.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// The value here should match an entry in the META-INF/mods.toml file
@Mod(YourMod.MOD_ID)
public class YourMod {
    
    public static final String MOD_ID = "yourmod";
    
    // Logger using SLF4J
    private static final Logger LOGGER = LoggerFactory.getLogger(YourMod.class);

    public YourMod() {
        LOGGER.info("Your Mod is loading successfully!");
        LOGGER.info("Mod ID: {}", MOD_ID);
    }
}
