import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemTransformer;
import crafttweaker.item.WeightedItemStack;

var Stone= <mysticalagriculture:infusion_crystal>.anyDamage().transformDamage()|<mysticalagriculture:master_infusion_crystal>;
var i=1 as int;
var b=0 as int;
var j=0 as int;
var S as IItemStack;
var B as IItemStack;
var E as IItemStack;
var Nom as string;

function MA_Craft(i as int) as IItemStack {
	return <mysticalagriculture:crafting>.definition.makeStack(i);
}

function MA_Storage(i as int) as IItemStack {
	return <mysticalagriculture:storage>.definition.makeStack(i);
}

function MA_Chunk(i as int) as IIngredient {
	return <mysticalagriculture:chunk>.definition.makeStack(i);
}

print("---------------------------------Misc---------------------------------");

//watering can

for i in 0 to 5 {
recipes.replaceAllOccurences(MA_Craft(i) ,MA_Storage(i), MA_Craft(i+50));
recipes.replaceAllOccurences(MA_Craft(i+49) ,<mysticalagriculture:growth_accelerator>, MA_Craft(i+50));
recipes.replaceAllOccurences(<mysticalagriculture:fertilized_essence> ,MA_Craft(i+49), MA_Craft(i+50));
}

recipes.replaceAllOccurences(MA_Craft(49),<mysticalagriculture:fertilized_essence> , MA_Craft(50));

//Growth Accelerator

recipes.remove(<mysticalagriculture:growth_accelerator>);

B=<mysticalagriculture:storage:3>;
S=<minecraft:diamond_block>;
E=<mysticalagriculture:fertilized_essence>;

mods.avaritia.ExtremeCrafting.addShaped("Growth_Accelerator",<mysticalagriculture:growth_accelerator>,[
	[null,null,null,null,null,null,null,null,null],
	[null,B,B,B,B,B,B,B,null],
	[null,B,E,E,E,E,E,B,null],
	[null,B,E,E,S,E,E,B,null],
	[null,B,E,S,S,S,E,B,null],
	[null,B,E,E,S,E,E,B,null],
	[null,B,E,E,E,E,E,B,null],
	[null,B,B,B,B,B,B,B,null],
	[null,null,null,null,null,null,null,null,null]]);

//augmentation de tier des essances

print("--------------------------inferium essances--------------------------");

recipes.remove(<mysticalagriculture:crafting>);
recipes.remove(<mysticalagriculture:storage>);

recipes.addShapeless("CT_MA_Uncomp0",<mysticalagriculture:crafting>*9,[<mysticalagriculture:storage>]);

recipes.addShaped("CT_MA_storage_0",<mysticalagriculture:storage>,[
	[<mysticalagriculture:crafting>,<mysticalagriculture:crafting>,<mysticalagriculture:crafting>],
	[<mysticalagriculture:crafting>,<mysticalagriculture:crafting>,<mysticalagriculture:crafting>],
	[<mysticalagriculture:crafting>,<mysticalagriculture:crafting>,<mysticalagriculture:crafting>]]);

for i in 1 to 5 {
	b = i - 1 ;
	recipes.remove(MA_Craft(i));
	recipes.remove(MA_Storage(i));
	
	recipes.addShapeless("CT_MA_Uncomp" + i ,MA_Craft(i)*9,[MA_Storage(i)]);
	recipes.addShapeless("CT_MA_" + i + "T"+ b , MA_Storage(b)*8,[MA_Craft(i)]);
	
	recipes.addShaped("CT_MA_" ~ b ~ "T" ~ i ,MA_Craft(i),[
	[MA_Storage(b),MA_Storage(b),MA_Storage(b)],
	[MA_Storage(b),Stone,MA_Storage(b)],
	[MA_Storage(b),MA_Storage(b),MA_Storage(b)]]);
	recipes.addShaped("CT_MA_storage_" + i ,MA_Storage(i),[
	[MA_Craft(i),MA_Craft(i),MA_Craft(i)],
	[MA_Craft(i),MA_Craft(i),MA_Craft(i)],
	[MA_Craft(i),MA_Craft(i),MA_Craft(i)]]);

}

//crafting seed modif

print("----------------------------crafting seed----------------------------");

recipes.remove(<mysticalagriculture:crafting:16>);

recipes.addShaped("CT_MA_CrftSeedT" + -1,MA_Craft(16),[
	[MA_Storage(5),MA_Storage(5),MA_Storage(5)],
	[MA_Storage(5),<minecraft:wheat_seeds>,MA_Storage(5)],
	[MA_Storage(5),MA_Storage(5),MA_Storage(5)]]);

for i in 17 to 22 {
	j = i - 17 ;
	b = i - 1 ;
	recipes.remove(MA_Craft(i));

	recipes.addShaped("CT_MA_CrftSeedT" + j,MA_Craft(i),[
	[MA_Storage(j),MA_Storage(j),MA_Storage(j)],
	[MA_Storage(j),MA_Craft(b),MA_Storage(j)],
	[MA_Storage(j),MA_Storage(j),MA_Storage(j)]]);
}

print("-------------------------------Tier3-------------------------------");

//Seed Tier 3

function T3Define(Out as IItemStack, In as IIngredient) {

	var S = <mysticalagriculture:crafting:19> ;
	var B = <mysticalagriculture:storage:2> ;	
	var E = <mysticalagriculture:fertilized_essence>;	
	
	recipes.remove(Out);
	
	mods.avaritia.ExtremeCrafting.addShaped(Out.displayName,Out,[
	[null,null,null,null,null,null,null,null,null],
	[null,In,In,B,B,B,In,In,null],
	[null,In,In,B,B,B,In,In,null],
	[null,B ,B ,S,E,S,B ,B ,null],
	[null,B ,B ,E,S,E,B ,B ,null],
	[null,B ,B ,S,E,S,B ,B ,null],
	[null,In,In,B,B,B,In,In,null],
	[null,In,In,B,B,B,In,In,null],
	[null,null,null,null,null,null,null,null,null]]);
	
}


Nom = <mysticalagriculture:aluminum_seeds>.displayName;
<mysticalagriculture:aluminum_seeds>.clearTooltip() ;
<mysticalagriculture:aluminum_seeds>.addTooltip(Nom);
<mysticalagriculture:aluminum_seeds>.addTooltip("Tier: "+format.gold("3"));

T3Define(<mysticalagriculture:tier3_inferium_seeds>,<mysticalagriculture:storage:2>);
T3Define(<mysticalagriculture:iron_seeds>,<minecraft:iron_block>);
T3Define(<mysticalagriculture:nether_quartz_seeds>,<minecraft:quartz_block>);
T3Define(<mysticalagriculture:glowstone_seeds>,<minecraft:glowstone>);
T3Define(<mysticalagriculture:redstone_seeds>,<minecraft:redstone_block>);
T3Define(<mysticalagriculture:obsidian_seeds>,<minecraft:obsidian>);
T3Define(<mysticalagriculture:skeleton_seeds>,MA_Chunk(12));
T3Define(<mysticalagriculture:creeper_seeds>,MA_Chunk(13));
T3Define(<mysticalagriculture:spider_seeds>,MA_Chunk(14));
T3Define(<mysticalagriculture:rabbit_seeds>,MA_Chunk(15));
T3Define(<mysticalagriculture:guardian_seeds>,MA_Chunk(16));
T3Define(<mysticalagriculture:aluminum_seeds>,<ore:blockAluminum>);
T3Define(<mysticalagriculture:saltpeter_seeds>,<ore:dustSaltpeter>);
T3Define(<mysticalagriculture:tin_seeds>,<ore:blockTin>);
T3Define(<mysticalagriculture:bronze_seeds>,<ore:blockBronze>);
T3Define(<mysticalagriculture:silver_seeds>,<ore:blockSilver>);
T3Define(<mysticalagriculture:lead_seeds>,<ore:blockLead>);
T3Define(<mysticalagriculture:blizz_seeds>,MA_Chunk(21));
T3Define(<mysticalagriculture:blitz_seeds>,MA_Chunk(22));
T3Define(<mysticalagriculture:basalz_seeds>,MA_Chunk(23));
T3Define(<mysticalagriculture:knightslime_seeds>,<ore:blockKnightslime>);
T3Define(<mysticalagriculture:ardite_seeds>,<ore:blockArdite>);

//Seed Tier 4

print("-------------------------------Tier4-------------------------------");

function T4Define(Out as IItemStack, In as IIngredient) {
	
	var S = <mysticalagriculture:crafting:20> ;
	var B = <mysticalagriculture:storage:3> ;
	var E = <mysticalagriculture:growth_accelerator> ;
	
	recipes.remove(Out);
	mods.avaritia.ExtremeCrafting.addShaped(Out.displayName,Out,[
	[null,null,null,null,null,null,null,null,null],
	[null,In,In,B,B,B,In,In,null],
	[null,In,In,B,B,B,In,In,null],
	[null,B ,B ,S,E,S,B ,B ,null],
	[null,B ,B ,E,S,E,B ,B ,null],
	[null,B ,B ,S,E,S,B ,B ,null],
	[null,In,In,B,B,B,In,In,null],
	[null,In,In,B,B,B,In,In,null],
	[null,null,null,null,null,null,null,null,null]]);

}

T3Define(<mysticalagriculture:tier4_inferium_seeds>,<mysticalagriculture:storage:3>);
T4Define(<mysticalagriculture:gold_seeds>,<minecraft:gold_block>);
T4Define(<mysticalagriculture:lapis_lazuli_seeds>,<minecraft:lapis_block>);
T4Define(<mysticalagriculture:end_seeds>,MA_Craft(9));
T4Define(<mysticalagriculture:experience_seeds>,MA_Chunk(5));
T4Define(<mysticalagriculture:blaze_seeds>,MA_Chunk(17));
T4Define(<mysticalagriculture:ghast_seeds>,MA_Chunk(18));
T4Define(<mysticalagriculture:enderman_seeds>,MA_Chunk(19));
T4Define(<mysticalagriculture:steel_seeds>,<ore:blockSteel>);
T4Define(<mysticalagriculture:nickel_seeds>,<ore:blockNickel>);
T4Define(<mysticalagriculture:constantan_seeds>,<ore:blockConstantan>);
T4Define(<mysticalagriculture:electrum_seeds>,<ore:blockElectrum>);
T4Define(<mysticalagriculture:invar_seeds>,<ore:blockInvar>);
T4Define(<mysticalagriculture:mithril_seeds>,<ore:blockMithril>);
T4Define(<mysticalagriculture:signalum_seeds>,<ore:blockSignalum>);
T4Define(<mysticalagriculture:lumium_seeds>,<ore:blockLumium>);
T4Define(<mysticalagriculture:cobalt_seeds>,<ore:blockCobalt>);

//Seed Tier5

print("-------------------------------Tier5-------------------------------");

function T5Define(Out as IItemStack, In as IIngredient) {
	
	var S = <mysticalagriculture:crafting:21> ;
	var B = <mysticalagriculture:storage:4> ;
	var E = <mysticalagriculture:watering_can:4> ;
	
	recipes.remove(Out);
	mods.avaritia.ExtremeCrafting.addShaped(Out.displayName,Out,[
	[In,In,In,B,B,B,In,In,In],
	[In,In,In,B,B,B,In,In,In],
	[In,In,In,B,B,B,In,In,In],
	[ B,B ,B ,S,E,S,B ,B , B],
	[ B,B ,B ,E,S,E,B ,B , B],
	[ B,B ,B ,S,E,S,B ,B , B],
	[In,In,In,B,B,B,In,In,In],
	[In,In,In,B,B,B,In,In,In],
	[In,In,In,B,B,B,In,In,In]]);

}

T5Define(<mysticalagriculture:tier5_inferium_seeds>,<mysticalagriculture:storage:4>);
T5Define(<mysticalagriculture:diamond_seeds>,<minecraft:diamond_block>);
T5Define(<mysticalagriculture:emerald_seeds>,<minecraft:emerald_block>);
T5Define(<mysticalagriculture:wither_skeleton_seeds>,MA_Chunk(20));
T5Define(<mysticalagriculture:platinum_seeds>,<ore:blockPlatinum>);
T5Define(<mysticalagriculture:iridium_seeds>,<ore:blockIridium>);
T5Define(<mysticalagriculture:enderium_seeds>,<ore:blockEnderium>);
T5Define(<mysticalagriculture:manyullyn_seeds>,<ore:blockManyullyn>);

print("--------------------------------Fin--------------------------------");