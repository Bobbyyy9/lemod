package com.uipg.lemod.init;

import com.uipg.lemod.LeMod;
import net.minecraft.world.level.block.Block;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;

/**
 * Registry class for mod blocks
 * 
 * @author Uipg
 */
public class ModBlocks {

    /**
     * Deferred register for blocks
     */
    public static final DeferredRegister<Block> BLOCKS = DeferredRegister.create(ForgeRegistries.BLOCKS, LeMod.MOD_ID);

    // Example blocks - uncomment and modify as needed
    /*
    public static final RegistryObject<Block> EXAMPLE_BLOCK = BLOCKS.register("example_block", 
        () -> new Block(BlockBehaviour.Properties.of()
            .mapColor(MapColor.STONE)
            .strength(2.0f, 6.0f)
            .requiresCorrectToolForDrops()));
    */

    /**
     * Register blocks to the mod event bus
     * 
     * @param modEventBus The mod event bus
     */
    public static void register(IEventBus modEventBus) {
        BLOCKS.register(modEventBus);
    }
}
