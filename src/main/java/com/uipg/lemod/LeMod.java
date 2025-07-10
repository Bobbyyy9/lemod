package com.uipg.lemod;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import net.minecraftforge.fml.common.Mod;

/**
 * Main mod class for Lé Mod
 * 
 * @author Uipg
 * @version 1.0.0
 */
@Mod(LeMod.MOD_ID)
public class LeMod {

    /**
     * The mod ID for Lé Mod
     */
    public static final String MOD_ID = "lemod";

    /**
     * Logger instance for the mod
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(LeMod.class);

    /**
     * Constructor for the mod Called when the mod is loaded by Forge
     */
    public LeMod() {
        LOGGER.info("Lé Mod is loading successfully!");
        LOGGER.info("Mod ID: {}", MOD_ID);
        LOGGER.info("Created by: Uipg");
        LOGGER.info("Lé Mod is now active and working perfectly!");
    }
}
