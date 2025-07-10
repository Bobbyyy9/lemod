package com.yourname.yourmod;

import net.minecraftforge.fml.common.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Mod("yourmod")
public class YourMod {
    public static final String MODID = "yourmod";
    private static final Logger LOGGER = LoggerFactory.getLogger(YourMod.class);

    public YourMod() {
        LOGGER.info("Lé Mod is loading successfully!");
        LOGGER.info("Mod ID: {}", MODID);
        LOGGER.info("Lé Mod is now active and working perfectly!");
    }
}
