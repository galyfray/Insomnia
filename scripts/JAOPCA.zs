#modloaded jaopca botania thermalexpansion thermalfoundation cofhcore

import crafttweaker.item.IItemStack;
import crafttweaker.recipes.ICraftingRecipe;
import mods.thermalexpansion.Compactor;

val exception={
"Mana Infused Ingot":"ingotMithril",
"Elementium Coin":"ingotElvenElementium"
} as string[string];

var Item as IItemStack;
var oreIngotName as string;

recipes.addShapeless("cycleElementium1",<botania:storage:2>,[<jaopca:block_blockelvenelementium>]);
recipes.addShapeless("cycleElementium2",<jaopca:block_blockelvenelementium>,[<botania:storage:2>]);

print("-------------------------JAOPCA-----------------------------------");
for Item in itemUtils.getItemsByRegexRegistryName(".*Coin.*")
{
	if ( !(isNull(exception[Item.displayName]))) 
	{ oreIngotName = exception[Item.displayName]; }
	else {
	oreIngotName = Item.displayName.substring( 0 , Item.displayName.length() - 5 );
	oreIngotName = "ingot" + oreIngotName.replace(' ','');
	}
	if (!(isNull(oreDict.get(oreIngotName).firstItem))){
	mods.thermalexpansion.Compactor.removeMintRecipe(oreDict.get(oreIngotName).firstItem);
	}
	else {print(Item.displayName);}
}