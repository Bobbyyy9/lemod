package com.uipg.lemod.init;

import com.uipg.lemod.LeMod;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.RegistryObject;

/**
 * Registry class for creative mode tabs
 * 
 * @author Uipg
 */
public class ModCreativeModeTabs {

    /**
     * Deferred register for creative mode tabs
     */
    public static final DeferredRegister<CreativeModeTab> CREATIVE_MODE_TABS =
            DeferredRegister.create(Registries.CREATIVE_MODE_TAB, LeMod.MOD_ID);

    /**
     * Main creative tab for the mod
     */
    public static final RegistryObject<CreativeModeTab> LE_MOD_TAB =
            CREATIVE_MODE_TABS.register("lemod_tab",
                    () -> CreativeModeTab.builder().icon(() -> new ItemStack(Items.DIAMOND)) // Change
                                                                                             // this
                                                                                             // to
                                                                                             // your
                                                                                             // mod's
                                                                                             // icon
                                                                                             // item
                            .title(Component.translatable("creativetab.lemod.lemod_tab"))
                            .displayItems((parameters, output) -> {
                                // Add your mod items here
                                // Example:
                                // output.accept(ModItems.EXAMPLE_ITEM.get());
                            }).build());

    /**
     * Register the creative mode tabs to the mod event bus
     * 
     * @param modEventBus The mod event bus
     */
    public static void register(IEventBus modEventBus) {
        CREATIVE_MODE_TABS.register(modEventBus);
    }
}
