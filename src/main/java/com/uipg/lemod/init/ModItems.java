package com.uipg.lemod.init;

import com.uipg.lemod.LeMod;
import net.minecraft.world.item.Item;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
/**

 * Registry class for mod items
 * 
 * @author Uipg
 */
public class ModItems {

    /**
     * Deferred register for items
     */
    public static final DeferredRegister<Item> ITEMS = DeferredRegister.create(ForgeRegistries.ITEMS, LeMod.MOD_ID);

    // Example items - uncomment and modify as needed
    /*
    public static final RegistryObject<Item> EXAMPLE_ITEM = ITEMS.register("example_item", 
        () -> new Item(new Item.Properties()));
    
    public static final RegistryObject<Item> CUSTOM_TOOL = ITEMS.register("custom_tool",
        () -> new Item(new Item.Properties()));
    */

    /**
     * Register items to the mod event bus
     * 
     * @param modEventBus The mod event bus
     */
    public static void register(IEventBus modEventBus) {
        ITEMS.register(modEventBus);
    }
}
