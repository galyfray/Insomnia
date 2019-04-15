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
"dense_obsidian",
"dense_creeper",
"dense_skeleton",
"dense_rabbit",
"dense_guardian",
"dense_spider",
"dense_enderman",
"dense_end",
"dense_ghast",
"dense_blaze",
"dense_lapis_lazuli",
"dense_wither_skeleton",
"dense_experience",
"dense_bronze",
"dense_tin",
"dense_lead",
"dense_silver",
"dense_aluminum",
"dense_electrum",
"dense_signalum",
"dense_invar",
"dense_steel",
"dense_nickel",
"dense_constantan",
"dense_enderium",
"dense_platinum",
"dense_iridium",
"dense_mithril",
"dense_lumium",
"dense_redstone_alloy",
"dense_conductive_iron",
"dense_electrical_steel",
"dense_soularium",
"dense_energetic_alloy",
"dense_pulsating_iron",
"dense_dark_steel",
"dense_vibrant_alloy",
"dense_end_steel",
"dense_blitz",
"dense_basalz",
"dense_saltpeter",
"dense_zinc",
"dense_graphite",
"dense_black_quartz",
"dense_brass",
"dense_sky_stone",
"dense_knightslime",
"dense_certus_quartz",
"dense_blizz",
"dense_manasteel",
"dense_sapphire",
"dense_elementium",
"dense_magnesium",
"dense_thorium",
"dense_ruby",
"dense_cobalt",
"dense_hop_graphite",
"dense_peridot",
"dense_boron",
"dense_fluix",
"dense_lithium",
"dense_draconium",
"dense_titanium",
"dense_terrasteel",
"dense_tungsten",
"dense_uranium",
"dense_chrome",
"dense_manyullyn",
"dense_ender_biotite",
"dense_ardite",
"dense_quicksilver",
"dense_thaumium",
"dense_alumite",
"dense_amber",
"dense_void_metal",
"dense_fluxed_electrum",
"dense_fertilized_essence",
] as string[] ;

var itemNameList =[
"fertilized_t3_crafting_seed",
"fertilized_t4_crafting_seed",
"fertilized_t5_crafting_seed",
] as string[] ;

var nom as string ;

var Tab = mods.contenttweaker.VanillaFactory.createCreativeTab("insomnia",<item:minecraft:nether_star> );
Tab.register();

var block=VanillaFactory.createBlock("tier3_inferium" ,<blockmaterial:Rock>);

for nom in blockNameList{
	block = VanillaFactory.createBlock(nom,<blockmaterial:Rock>);
	block.setCreativeTab(<creativetab:insomnia>);
	block.register();
}
	
block = VanillaFactory.createBlock("dense_glowstone",<blockmaterial:Rock>);
block.setCreativeTab(<creativetab:insomnia>);
block.setLightValue(1);
block.setLightOpacity(255);
block.register();

var Item=VanillaFactory.createItem("init");

for nom in itemNameList{
	Item = VanillaFactory.createItem(nom);
	Item.setCreativeTab(<creativetab:insomnia>);
	Item.glowing = true ;
	Item.register();	
}
