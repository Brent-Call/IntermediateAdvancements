local make_direct_localised_name = function( itemName )
	if type( itemName ) ~= "string" then
		error( "itemName was of wrong type: string expected, got " .. type( itemName ))
	end
	--The "?" means we try to find the first valid localised string;
	--See https://lua-api.factorio.com/latest/types/LocalisedString.html for info on how it works
	return { "recipe-name.q__direct", { "?", { "item-name." .. itemName }, { "entity-name." .. itemName }}}
end

local make_direct_icon = function( baseItemName )
	if type( baseItemName ) ~= "string" then
		error( "baseItemName was of wrong type: string expected, got " .. type( baseItemName ))
	end
	local baseItem = data.raw.item[ baseItemName ]
	if type( baseItem ) ~= "table" then
		error( "Could not find item named \"" .. baseItemName .. "\"" )
	end
	
	return {
		{
			icon = baseItem.icon,
		},
		{
			icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-movement-speed.png",
			tint = { r = 0.2, g = 1, b = 0.2, a = 1 },
			shift = { -12, 0 },
			floating = true
		}
	}
end

data:extend({
{
	type = "recipe",
	name = "q__direct-fast-transport-belt",
	localised_name = make_direct_localised_name( "fast-transport-belt" ),
	order = "a[transport-belt]-b[fast-transport-belt]-direct",
	icons = make_direct_icon( "fast-transport-belt" ),
	enabled = false,
	category = "crafting",
	--Acts as though we instantly craft 1 yellow belt before crafting the red belt.
	--We would normally require 0.5 iron plates + 0.5 iron gear wheels for the yellow belt
	--Instead, we say 0.5 iron gear wheels is worth 1 iron plate, & we round up to 2 iron plates.
	--Overall, this is less resource efficient, but it's significantly faster.
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 2 },
		{ type = "item", name = "iron-gear-wheel", amount = 5 }
	},
	energy_required = 0.5,
	results = {{ type = "item", name = "fast-transport-belt", amount = 1 }},
	emissions_multiplier = 1.25,
	allow_productivity = false,
	allow_as_intermediate = false
},
{
	type = "recipe",
	name = "q__direct-fast-underground-belt",
	localised_name = make_direct_localised_name( "fast-underground-belt" ),
	order = "b[underground-belt]-b[fast-underground-belt]-direct",
	icons = make_direct_icon( "fast-underground-belt" ),
	enabled = false,
	category = "crafting",
	--We would normally require 2.5 iron plate + 2.5 iron gear wheel for the yellow belts
	--Instead, we say the half iron gear wheel is worth 1 iron plate, & we round up
	--Overall, this is less resource efficient, but it's significantly faster.
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 14 },
		{ type = "item", name = "iron-gear-wheel", amount = 42 }
	},
	energy_required = 2,
	results = {{ type = "item", name = "fast-underground-belt", amount = 2 }},
	emissions_multiplier = 1.25,
	allow_productivity = false,
	allow_as_intermediate = false
},
{
	type = "recipe",
	name = "q__direct-fast-splitter",
	localised_name = make_direct_localised_name( "fast-splitter" ),
	order = "c[splitter]-b[fast-splitter]-direct",
	icons = make_direct_icon( "fast-splitter" ),
	enabled = false,
	category = "crafting",
	--Overall, this has the same resource efficiency, but it's faster
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 7 },
		{ type = "item", name = "iron-gear-wheel", amount = 12 },
		{ type = "item", name = "electronic-circuit", amount = 15 },
	},
	energy_required = 2,
	results = {{ type = "item", name = "fast-splitter", amount = 1 }},
	emissions_multiplier = 1.25,
	allow_productivity = false,
	allow_as_intermediate = false
},
{
	type = "recipe",
	name = "q__direct-long-handed-inserter",
	localised_name = make_direct_localised_name( "long-handed-inserter" ),
	order = "c[long-handed-inserter]-direct",
	icons = make_direct_icon( "long-handed-inserter" ),
	enabled = false,
	category = "crafting",
	--Takes 60% of the crafting time it would require to craft the items sequentially
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 2 },
		{ type = "item", name = "iron-gear-wheel", amount = 1 },
		{ type = "item", name = "electronic-circuit", amount = 1 }
	},
	energy_required = 0.6,
	results = {{ type = "item", name = "long-handed-inserter", amount = 1 }},
	emissions_multiplier = 1.1,
	allow_productivity = false,
	allow_as_intermediate = false
},
{
	type = "recipe",
	name = "q__direct-fast-inserter",
	localised_name = make_direct_localised_name( "fast-inserter" ),
	order = "d[fast-inserter]-direct",
	icons = make_direct_icon( "fast-inserter" ),
	enabled = false,
	category = "crafting",
	--Takes 60% of the crafting time it would require to craft the items sequentially
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 3 },
		{ type = "item", name = "iron-gear-wheel", amount = 1 },
		{ type = "item", name = "electronic-circuit", amount = 3 }
	},
	energy_required = 0.6,
	results = {{ type = "item", name = "fast-inserter", amount = 1 }},
	emissions_multiplier = 1.1,
	allow_productivity = false,
	allow_as_intermediate = false
},
{
	type = "recipe",
	name = "q__direct-bulk-inserter",
	localised_name = make_direct_localised_name( "bulk-inserter" ),
	order = "f[bulk-inserter]-direct",
	icons = make_direct_icon( "bulk-inserter" ),
	enabled = false,
	category = "crafting",
	--Takes approximately 47% of the crafting time it would require to craft the items sequentially
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 3 },
		{ type = "item", name = "iron-gear-wheel", amount = 16 },
		{ type = "item", name = "electronic-circuit", amount = 18 },
		{ type = "item", name = "advanced-circuit", amount = 1 }
	},
	energy_required = 0.7,
	results = {{ type = "item", name = "bulk-inserter", amount = 1 }},
	emissions_multiplier = 1.2,
	allow_productivity = false,
	allow_as_intermediate = false
},
{
	type = "recipe",
	name = "q__direct-refined-concrete",
	localised_name = make_direct_localised_name( "refined-concrete" ),
	order = "b[concrete]-c[refined]-direct",
	icons = make_direct_icon( "refined-concrete" ),
	enabled = false,
	category = "crafting-with-fluid",
	--Crafting refined concrete without requiring 2 batches of normal concrete first
	--It takes less time than if a single machine had crafted them all sequentially
	--It takes the same amount of water & stone bricks as normal, as well
	--But rather than requiring 2 iron ore, we add an additional steel plate, plus 3 iron sticks
	ingredients = {
		{ type = "item", name = "stone-brick", amount = 10 },
		{ type = "item", name = "iron-stick", amount = 11 },
		{ type = "item", name = "steel-plate", amount = 2 },
		{ type = "fluid", name = "water", amount = 300 }
	},
	energy_required = 25,
	results = {{ type = "item", name = "refined-concrete", amount = 10 }},
	emissions_multiplier = 1.5,
	allow_productivity = false --Because the base refined concrete recipe doesn't allow productivity
},
{
	type = "recipe",
	name = "q__direct-solid-fuel",
	subgroup = "fluid-recipes",
	localised_name = make_direct_localised_name( "solid-fuel" ),
	order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]-direct",
	--icons will be defined later
	icons = make_direct_icon( "solid-fuel" ),
	enabled = false,
	category = "oil-processing",
	ingredients = {
		{ type = "fluid", name = "water", amount = 75 },
		{ type = "fluid", name = "crude-oil", amount = 100 }
	},
	energy_required = 18.625,
	results = {{ type = "item", name = "solid-fuel", amount = 12 }},
	emissions_multiplier = 1.65,
	allow_productivity = true
}
})

local recipe = data.raw.recipe[ "q__direct-solid-fuel" ]
recipe.icons = make_direct_icon( "solid-fuel" )
table.insert( recipe.icons, 2, {
	icon = data.raw.fluid[ "crude-oil" ].icon,
	scale = 0.25,
	shift = { -8, -8 },
	floating = true
})