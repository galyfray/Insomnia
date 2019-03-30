import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemTransformer;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.recipes.ICraftingRecipe;

var stone= <mysticalagriculture:infusion_crystal>.anyDamage().transformDamage()|<mysticalagriculture:master_infusion_crystal>;
var i=1 as int ;
var j as int ;
var b as int ;
var S as IItemStack ;
var B as IItemStack ;
var E as IItemStack ;
var recipe as ICraftingRecipe ;
var block as IIngredient ;
var itemCraft as IItemStack ;
var oreEntry as IOreDictEntry;
var nom as string ;

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

<mysticalagriculture:cow_seeds>.addTooltip("praise super","meuh meuh","bros");


//seed renaming for recipes name

nom = <mysticalagriculture:tier1_inferium_seeds>.displayName ;
<mysticalagriculture:tier1_inferium_seeds>.displayName = nom + " Tier1" ;
<mysticalagriculture:tier2_inferium_seeds>.displayName = nom + " Tier2" ;
<mysticalagriculture:tier3_inferium_seeds>.displayName = nom + " Tier3" ;
<mysticalagriculture:tier4_inferium_seeds>.displayName = nom + " Tier4" ;
<mysticalagriculture:tier5_inferium_seeds>.displayName = nom + " Tier5" ;

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

print("--------------------------inferium essances--------------------------");

//augmentation de tier des essances

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
	recipes.addShapeless("CT_MA_" + i + "T"+ b , MA_Storage(b)*2,[MA_Craft(i)]);
	
	recipes.addShaped("CT_MA_" ~ b ~ "T" ~ i ,MA_Craft(i)*2,[
	[null         ,MA_Storage(b),null         ],
	[MA_Storage(b),stone        ,MA_Storage(b)],
	[null         ,MA_Storage(b),null         ]]);
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

T3Define(<mysticalagriculture:tier3_inferium_seeds>,<mysticalagriculture:storage:2>);

<ore:seedsTier3>.remove(<mysticalagriculture:electrotine_seeds>);
T3Define(<mysticalagriculture:electrotine_seeds>,<projectred-exploration:stone:11>);

for seed in <ore:seedsTier3>.items {
	
	
	for recipe in recipes.getRecipesFor(seed){
		
		itemCraft=recipe.ingredients1D[0].items[0];
		block = recipes.craft([[itemCraft,itemCraft,itemCraft],[itemCraft,itemCraft,itemCraft],[itemCraft,itemCraft,itemCraft]]);
		
		if(isNull(block)){
			
			block=recipes.craft([[itemCraft,itemCraft],[itemCraft,itemCraft]]);
			
			if (isNull(block)){
				
				T3Define(seed,itemCraft);
			
			}
			else{
			
				T3Define(seed,block);
			
			}
		}
		else{
			
			T3Define(seed,block);
		
		}
	}
}

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

T4Define(<mysticalagriculture:tier4_inferium_seeds>,<mysticalagriculture:storage:3>);

for seed in <ore:seedsTier4>.items {
	
	
	for recipe in recipes.getRecipesFor(seed){
		
		itemCraft=recipe.ingredients1D[0].items[0];
		block = recipes.craft([[itemCraft,itemCraft,itemCraft],[itemCraft,itemCraft,itemCraft],[itemCraft,itemCraft,itemCraft]]);
		
		if(isNull(block)){
			
			block=recipes.craft([[itemCraft,itemCraft],[itemCraft,itemCraft]]);
			
			if (isNull(block)){
				
				T4Define(seed,itemCraft);
			
			}
			else{
			
				T4Define(seed,block);
			
			}
		}
		else{
			
			T4Define(seed,block);
		
		}
	}
}

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

for seed in <ore:seedsTier5>.items {
	
	
	for recipe in recipes.getRecipesFor(seed){
		
		itemCraft=recipe.ingredients1D[0].items[0];
		block = recipes.craft([[itemCraft,itemCraft,itemCraft],[itemCraft,itemCraft,itemCraft],[itemCraft,itemCraft,itemCraft]]);
		
		if(isNull(block)){
			
			block=recipes.craft([[itemCraft,itemCraft],[itemCraft,itemCraft]]);
			
			if (isNull(block)){
				
				T5Define(seed,itemCraft);
			
			}
			else{
			
				T5Define(seed,block);
			
			}
		}
		else{
			
			T5Define(seed,block);
		
		}
	}
}

print("--------------------------------Fin--------------------------------");

