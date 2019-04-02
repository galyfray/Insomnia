#loader contenttweaker

import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.CreativeTab;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;

var blockNameList =[ 
"dense_tier3_inferium",
"dense_tier4_inferium",
"dense_tier5_inferium",
"dense_diamond",
"dense_emerald",
"dense_gold",
"dense_iron",
"dense_nether_quartz",
"dense_redstone",
"denser_intermedium",
"denser_superium",
] as string[] ;

var nom as string ;

var Tab = mods.contenttweaker.VanillaFactory.createCreativeTab("insomnia",<item:minecraft:nether_star> );
Tab.register();

var StorageT3=VanillaFactory.createBlock("tier3_inferium" ,<blockmaterial:Rock>);

for nom in blockNameList{
	StorageT3 = VanillaFactory.createBlock(nom,<blockmaterial:Rock>);
	StorageT3.setCreativeTab(<creativetab:insomnia>);
	StorageT3.register();
}
	
StorageT3 = VanillaFactory.createBlock("dense_glowstone",<blockmaterial:Rock>);
StorageT3.setCreativeTab(<creativetab:insomnia>);
StorageT3.setLightValue(15);
StorageT3.setLightOpacity(0);
StorageT3.register();