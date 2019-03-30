import mods.thermalexpansion.Insolator;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemTransformer;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.recipes.ICraftingRecipe;

var essenceName as string ;
var seed as IItemStack ;
var essence as IItemStack;

print("----------------------------InsolatorTier4----------------------------");

for seed in <ore:seedsTier4>.items{
	
	//getting essence IItemStack from the name of the seed
	essenceName=seed.commandString.replace("seeds","essence");
	essenceName = essenceName.substring( 1 , essenceName.length() - 1 ) ;
	essence = itemUtils.getItem(essenceName,0);
	
	//changing recipes
	mods.thermalexpansion.Insolator.removeRecipe(seed, <thermalfoundation:fertilizer:1>);
	mods.thermalexpansion.Insolator.removeRecipe(seed, <thermalfoundation:fertilizer:2>);
	mods.thermalexpansion.Insolator.addRecipe(essence, seed, <thermalfoundation:fertilizer:1>, 14400 , seed, 100);
	mods.thermalexpansion.Insolator.addRecipe(essence, seed, <thermalfoundation:fertilizer:2>, 19200 , seed, 105);
	
}

print("----------------------------InsolatorTier5----------------------------");

for seed in <ore:seedsTier5>.items{
	
	//getting essence IItemStack from the name of the seed
	essenceName=seed.commandString.replace("seeds","essence");
	essenceName = essenceName.substring( 1 , essenceName.length() - 1 ) ;
	essence = itemUtils.getItem(essenceName,0);
	
	//changing recipes
	mods.thermalexpansion.Insolator.removeRecipe(seed, <thermalfoundation:fertilizer:1>);
	mods.thermalexpansion.Insolator.removeRecipe(seed, <thermalfoundation:fertilizer:2>);
	mods.thermalexpansion.Insolator.addRecipe(essence, seed, <thermalfoundation:fertilizer:1>, 14400 , seed, 100);
	mods.thermalexpansion.Insolator.addRecipe(essence, seed, <thermalfoundation:fertilizer:2>, 19200 , seed, 102);
	
}