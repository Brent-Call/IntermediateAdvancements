local TIER_1_POLLUTION_MULTIPLIER = 0.98
local TIER_2_POLLUTION_MULTIPLIER = 0.96
local TIER_3_POLLUTION_MULTIPLIER = 0.94
local TIER_4_POLLUTION_MULTIPLIER = 0.92

--@param baseItemName	string	The name of the item prototype to inherit the icon from.
local make_t1_icon = function( baseItemName )
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
			icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-capacity.png",
			shift = { -12, 0 },
			floating = true
		}
	}
end

--@param addLubeIcon	boolean	Whether or not to add the icon for lubricant on top.
local make_t2_icon = function( baseItemName, addLubeIcon )
	if type( baseItemName ) ~= "string" then
		error( "baseItemName was of wrong type: string expected, got " .. type( baseItemName ))
	end
	if type( addLubeIcon ) ~= "boolean" then
		error( "addLubeIcon was of wrong type: boolean expected, got " .. type( addLubeIcon ))
	end
	local baseItem = data.raw.item[ baseItemName ]
	if type( baseItem ) ~= "table" then
		error( "Could not find item named \"" .. baseItemName .. "\"" )
	end

	local retVal = {
		{
			icon = baseItem.icon,
		},
		{
			icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-crafting-speed.png",
			shift = { -12, 0 },
			floating = true
		}
	}
	if addLubeIcon then
		table.insert( retVal, 2, {
			icon = data.raw.fluid[ "lubricant" ].icon,
			scale = 0.25,
			shift = { 8, -8 },
			floating = true
		})
	end
	return retVal
end

local make_t3_icon = function( baseItemName, addLubeIcon )
	if type( baseItemName ) ~= "string" then
		error( "baseItemName was of wrong type: string expected, got " .. type( baseItem ))
	end
	if type( addLubeIcon ) ~= "boolean" then
		error( "addLubeIcon was of wrong type: boolean expected, got " .. type( addLubeIcon ))
	end
	local baseItem = data.raw.item[ baseItemName ]
	if type( baseItem ) ~= "table" then
		error( "Could not find item named \"" .. baseItemName .. "\"" )
	end

	local retVal = {
		{
			icon = baseItem.icon,
		},
		{
			icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-recipe-productivity.png",
			shift = { -12, 0 },
			floating = true
		}
	}
	if addLubeIcon then
		table.insert( retVal, 2, {
			icon = data.raw.fluid[ "lubricant" ].icon,
			scale = 0.25,
			shift = { 8, -8 },
			floating = true
		})
	end
	return retVal
end

local make_t4_icon = function( baseItemName )
	if type( baseItemName ) ~= "string" then
		error( "baseItemName was of wrong type: string expected, got " .. type( baseItem ))
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
			icon = data.raw.tool[ "space-science-pack" ].icon,
			scale = 0.25,
			shift = { -8, 8 },
			floating = true
		}
	}
end

data:extend({
--================================================--
--        TIER 1 ADVANCED CRAFTING RECIPES        --
--            Cannot be crafted by hand           --
--              -2% pollution output              --
--================================================--
{
	type = "recipe",
	name = "q__bulk-solid-fuel",
	subgroup = "fluid-recipes",
	order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]-t1",
	--icons will be defined later
	enabled = false,
	category = "chemistry",
	--Costs the resources as if we'd made 10 batches from light oil & 4 batches from heavy oil
	--Produces as much as 20 total batches, though.
	--Has less crafting time, though
	--Time efficiency: 66.667% improvement over base recipe (exact number is 5/3)
	ingredients = {
		{ type = "fluid", name = "light-oil", amount = 100 },
		{ type = "fluid", name = "heavy-oil", amount = 80 }
	},
	energy_required = 12,
	results = {{ type = "item", name = "solid-fuel", amount = 20 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	--crafting_machine_tint will be defined later
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-plastic-bar",
	order = "b[chemistry]-b[plastic-bar]-t1",
	icons = make_t1_icon( "plastic-bar" ),
	enabled = false,
	category = "chemistry",
	--11.25 times the fluid cost, 12 times the item cost, 11.5 times the crafting time, 12.5 times the recipe output
	--Time efficiency: 8.696% improvement over base recipe (exact number is 25/23)
	--Petroleum efficiency: 11.111% improvement over base recipe (exact number is 10/9)
	--Coal efficiency: 4.167% improvement over base recipe (exact number is 25/24)
	ingredients = {
		{ type = "fluid", name = "petroleum-gas", amount = 225 },
		{ type = "item", name = "coal", amount = 12 }
	},
	energy_required = 11.5,
	results = {{ type = "item", name = "plastic-bar", amount = 25 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "plastic-bar" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-sulfur",
	order = "b[chemistry]-c[sulfur]-t1",
	icons = make_t1_icon( "sulfur" ),
	enabled = false,
	category = "chemistry",
	--300 times the resource input, 300 times the crafting time, 330 times the resource output
	--Time efficiency: 10% improvement over base recipe
	--Resource efficiency: 10% improvement over base recipe
	ingredients = {
		{ type = "fluid", name = "water", amount = 9000 },
		{ type = "fluid", name = "petroleum-gas", amount = 9000 }
	},
	energy_required = 300,
	results = {{ type = "item", name = "sulfur", amount = 660 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "sulfur" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-iron-gear-wheel",
	order = "a[basic-intermediates]-a[iron-gear-wheel]-t1",
	icons = make_t1_icon( "iron-gear-wheel" ),
	enabled = false,
	category = "advanced-crafting",
	--6 times the resource cost, 5.5 times slower, 7 times the resource output
	--Time efficiency: 27.273% improvement over base recipe (exact number is 14/11)
	--Resource efficiency: 16.667% improvement over base recipe (exact number is 7/6)
	ingredients = {{ type = "item", name = "iron-plate", amount = 12 }},
	energy_required = 2.75,
	results = {{ type = "item", name = "iron-gear-wheel", amount = 7 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-copper-cable",
	order = "a[basic-intermediates]-c[copper-cable]-t1",
	icons = make_t1_icon( "copper-cable" ),
	enabled = false,
	category = "advanced-crafting",
	--4 times the resource cost, 4 times slower, 5 times the resource output
	--Time efficiency: 25% improvement over base recipe
	--Resource efficiency: 25% improvement over base recipe
	ingredients = {{ type = "item", name = "copper-plate", amount = 4 }},
	energy_required = 2,
	results = {{ type = "item", name = "copper-cable", amount = 10 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-electronic-circuit-from-plastic",
	order = "b[circuits]-a[electronic-circuit]-t1",
	--icons will be defined later
	enabled = false,
	category = "advanced-crafting",
	--Replaces iron plate with plastic bar, multiplies cost by 4
	--14/3 times the copper cost, 6 times slower, 5 times the resource output
	--Time efficiency: -16.667% compared to base recipe (exact number is 5/6)
	--Iron/plastic resource efficiency: 25% improvement over base recipe if iron & plastic are worth the same
	--Copper resource efficiency: 7.143% improvement over base recipe (exact number is 15/14)
	ingredients = {
		{ type = "item", name = "plastic-bar", amount = 4 },
		{ type = "item", name = "copper-cable", amount = 14 }
	},
	energy_required = 3,
	results = {{ type = "item", name = "electronic-circuit", amount = 5 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-battery",
	order = "b[chemistry]-d[battery]-t1",
	icons = make_t1_icon( "battery" ),
	enabled = false,
	category = "chemistry",
	--8 times the resource cost, 7.5 times slower, 10 times the resource output
	--Time efficiency: 33.333% improvement over base recipe (exact number is 4/3)
	--Resource efficiency: 25% improvement over base recipe
	ingredients = {
		{ type = "fluid", name = "sulfuric-acid", amount = 160 },
		{ type = "item", name = "iron-plate", amount = 8 },
		{ type = "item", name = "copper-plate", amount = 8 }
	},
	energy_required = 30,
	results = {{ type = "item", name = "battery", amount = 10 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "battery" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-iron-stick",
	order = "a[basic-intermediates]-b[iron-stick]-t1",
	icons = make_t1_icon( "iron-stick" ),
	enabled = false,
	category = "advanced-crafting",
	--13 times the resource cost, 15 times slower, 16.5 times the resouce output
	--Time efficiency: 10% improvement over base recipe
	--Resource efficiency: 26.923% improvement over base recipe (exact number is 33/26)
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 13 }
	},
	energy_required = 7.5,
	results = {{ type = "item", name = "iron-stick", amount = 33 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-low-density-structure",
	order = "d[rocket-parts]-a[low-density-structure]-t1",
	icons = make_t1_icon( "low-density-structure" ),
	enabled = false,
	category = "advanced-crafting",
	--5.9~6.5 times the resource cost, 6 times the crafting time, 7 times the resource output
	--Time efficiency: 16.667% improvement over base recipe (exact number is 7/6)
	--Steel efficiency: 7.692% improvement over base recipe (exact number is 14/13)
	--Copper efficiency: 18.644% improvement over base recipe (exact number is 70/59)
	--Plastic efficiency: 9.375% improvement over base recipe
	ingredients = {
		{ type = "item", name = "steel-plate", amount = 13 },
		{ type = "item", name = "copper-plate", amount = 118 },
		{ type = "item", name = "plastic-bar", amount = 32 }
	},
	energy_required = 90,
	results = {{ type = "item", name = "low-density-structure", amount = 7 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__bulk-rocket-fuel",
	order = "d[rocket-parts]-b[rocket-fuel]-t1",
	icons = make_t1_icon( "rocket-fuel" ),
	enabled = false,
	category = "crafting-with-fluid",
	--5.5 times the resource cost, 6 times the crafting time, 6 times the resource output
	--Time efficiency: 0% (no improvement) compared to base recipe
	--Resource efficiency: 9.091% improvement over base recipe (exact number is 12/11)
	ingredients = {
		{ type = "item", name = "solid-fuel", amount = 55 },
		{ type = "fluid", name = "light-oil", amount = 55 }
	},
	energy_required = 90,
	results = {{ type = "item", name = "rocket-fuel", amount = 6 }},
	emissions_multiplier = TIER_1_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
--================================================--
--        TIER 2 ADVANCED CRAFTING RECIPES        --
--      Requires a small amount of lubricant      --
--              -4% pollution output              --
--================================================--
{
	type = "recipe",
	name = "q__fast-concrete",
	order = "b[concrete]-a[plain]-t2",
	icons = make_t2_icon( "concrete", false ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource costs, sped up by 1/3, same outputs
	--Time efficiency: 50% improvement over base recipe
	--Resource efficiency: same as base recipe if we consider water to be free
	ingredients = {
		{ type = "item", name = "stone-brick", amount = 5 },
		{ type = "item", name = "iron-ore", amount = 1 },
		{ type = "fluid", name = "water", amount = 150 }
	},
	energy_required = 20 / 3,
	results = {{ type = "item", name = "concrete", amount = 10 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = false, --Because the base concrete recipe doesn't allow productivity
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-battery",
	order = "b[chemistry]-d[battery]-t2",
	icons = make_t2_icon( "battery", true ),
	enabled = false,
	category = "chemistry",
	--Increased sulfuric acid cost, added lube cost, 4 times faster, same resource output
	--Time efficiency: 300% improvement over base recipe
	--Resource efficiency for solids: 0% (no improvement) compared to base recipe
	--Resource efficiency for acid: -20% compared to base recipe
	ingredients = {
		{ type = "fluid", name = "sulfuric-acid", amount = 25 },
		{ type = "fluid", name = "lubricant", amount = 4 },
		{ type = "item", name = "iron-plate", amount = 1 },
		{ type = "item", name = "copper-plate", amount = 1 }
	},
	energy_required = 1,
	results = {{ type = "item", name = "battery", amount = 1 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "battery" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-iron-gear-wheel",
	order = "a[basic-intermediates]-a[iron-gear-wheel]-t2",
	icons = make_t2_icon( "iron-gear-wheel", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--1.5 times the resource cost, 2 times faster, 2 times resource output
	--Time efficiency: 700% improvement over base recipe
	--Resource efficiency: 33.333% improvement over base recipe (exact number is 4/3)
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 3 },
		{ type = "fluid", name = "lubricant", amount = 2 }
	},
	energy_required = 0.25,
	results = {{ type = "item", name = "iron-gear-wheel", amount = 2 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-copper-cable",
	order = "a[basic-intermediates]-c[copper-cable]-t2",
	icons = make_t2_icon( "copper-cable", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource cost, 2 times faster, 1.5 times resource output
	--Time efficiency: 200% improvement over base recipe
	--Resource efficiency: 50% improvement over base recipe
	ingredients = {
		{ type = "item", name = "copper-plate", amount = 1 },
		{ type = "fluid", name = "lubricant", amount = 2 }
	},
	energy_required = 0.25,
	results = {{ type = "item", name = "copper-cable", amount = 3 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
--The following is an outlier; it's a tier 2 recipe that doesn't need lube
{
	type = "recipe",
	name = "q__fast-electronic-circuit",
	order = "b[circuits]-a[electronic-circuit]-t2",
	icons = make_t2_icon( "electronic-circuit", false ),
	enabled = false,
	category = "advanced-crafting",
	--3 times the iron cost, 8/3 times the copper cost, 20% faster, 3 times the resource output
	--Time efficiency: 650% improvement over base recipe
	--Iron resource efficiency: 0% (no improvement) compared to base recipe
	--Copper resource efficiency: 12.5% improvement over base recipe
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 3 },
		{ type = "item", name = "copper-cable", amount = 8 }
	},
	energy_required = 0.4,
	results = {{ type = "item", name = "electronic-circuit", amount = 3 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-advanced-circuit",
	order = "b[circuits]-b[advanced-circuit]-t2",
	icons = make_t2_icon( "advanced-circuit", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource cost, crafting time reduced by 1/6, same resource output
	--Time efficiency: 20% improvement over base recipe
	--Resource efficiency: 0% (no improvement) compared to base recipe
	ingredients = {
		{ type = "item", name = "electronic-circuit", amount = 2 },
		{ type = "item", name = "plastic-bar", amount = 2 },
		{ type = "item", name = "copper-cable", amount = 4 },
		{ type = "fluid", name = "lubricant", amount = 5 }
	},
	energy_required = 5,
	results = {{ type = "item", name = "advanced-circuit", amount = 1 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-processing-unit",
	order = "b[circuits]-c[processing-unit]-t2",
	icons = make_t2_icon( "processing-unit", false ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource output
	--20% reduced crafting time in exchange for double sulfuric acid cost.
	--Time efficiency: 25% improvement over base recipe
	--Resource efficiency:
	--	For circuits: 0% (no improvement) compared to base recipe
	--	For sulfuric acid: -50% compared to base recipe
	--This is really only an upgrade for engineers who consider sulfuric acid to be much cheaper than electronic circuits
	ingredients = {
		{ type = "item", name = "electronic-circuit", amount = 20 },
		{ type = "item", name = "advanced-circuit", amount = 2 },
		{ type = "fluid", name = "sulfuric-acid", amount = 10 }
	},
	energy_required = 8,
	results = {{ type = "item", name = "processing-unit", amount = 1 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-engine-unit",
	order = "c[advanced-intermediates]-a[engine-unit]-t2",
	icons = make_t2_icon( "engine-unit", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource cost, crafting time halved, same resource output
	--Added cost of lubricant
	--Time efficiency: 100% improvement over base recipe
	--Resource efficiency: 0% (no improvement) compared to base recipe if we ignore the lubricant cost
	ingredients = {
		{ type = "item", name = "steel-plate", amount = 1 },
		{ type = "item", name = "iron-gear-wheel", amount = 1 },
		{ type = "item", name = "pipe", amount = 2 },
		{ type = "fluid", name = "lubricant", amount = 10 }
	},
	energy_required = 5,
	results = {{ type = "item", name = "engine-unit", amount = 1 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-electric-engine-unit",
	order = "c[advanced-intermediates]-b[electric-engine-unit]-t2",
	icons = make_t2_icon( "electric-engine-unit", false ), --Don't add lube icon since the base recipe already requires lube
	enabled = false,
	category = "crafting-with-fluid",
	--4/3 times the lubricant cost, other costs unchanged
	--Crafting time reduced by 30%, same resource output
	--Time efficiency: 42.857% improvement over base recipe (exact number is 10/7)
	--Resource efficiency: 0% (no improvement) compared to base recipe if we ignore the lubricant cost
	ingredients = {
		{ type = "item", name = "engine-unit", amount = 1 },
		{ type = "fluid", name = "lubricant", amount = 20 },
		{ type = "item", name = "electronic-circuit", amount = 2 },
	},
	energy_required = 7,
	results = {{ type = "item", name = "electric-engine-unit", amount = 1 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__fast-low-density-structure",
	order = "d[rocket-parts]-a[low-density-structure]-t2",
	icons = make_t2_icon( "low-density-structure", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource cost, reduced crafting time, same resource output
	--Time efficiency: 150% improvement over base recipe
	--Resource efficiency: 0% (no improvement) compared to base recipe
	ingredients = {
		{ type = "item", name = "steel-plate", amount = 2 },
		{ type = "item", name = "copper-plate", amount = 20 },
		{ type = "item", name = "plastic-bar", amount = 5 },
		{ type = "fluid", name = "lubricant", amount = 12 }
	},
	energy_required = 6,
	results = {{ type = "item", name = "low-density-structure", amount = 1 }},
	emissions_multiplier = TIER_2_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
--================================================--
--        TIER 3 ADVANCED CRAFTING RECIPES        --
--           May require some lubricant           --
--              -6% pollution output              --
--================================================--
{
	type = "recipe",
	name = "q__efficient-plastic-bar",
	order = "b[chemistry]-b[plastic-bar]-t3",
	icons = make_t3_icon( "plastic-bar", false ),
	enabled = false,
	category = "chemistry",
	--Same inputs, 1.6 times the crafting time, 1.5 times the resource output
	--Also takes 15 petroleum gas as catalyst
	--Time efficiency: -6.25% compared to base recipe
	--Resource efficiency: 50% improvement over base recipe
	ingredients = {
		{ type = "fluid", name = "petroleum-gas", amount = 35, ignored_by_stats = 15 },
		{ type = "item", name = "coal", amount = 1 }
	},
	energy_required = 1.6,
	results = {
		{ type = "fluid", name = "petroleum-gas", amount = 15, ignored_by_stats = 15, ignored_by_productivity = 15 },
		{ type = "item", name = "plastic-bar", amount = 3 }
	},
	main_product = "plastic-bar",
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "plastic-bar" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-sulfur-with-plastic-byproduct",
	order = "b[chemistry]-c[sulfur]-t3",
	--icons will be defined later
	enabled = false,
	category = "chemistry",
	--3 times the resource cost, 4.5 times the crafting time, 5 times the resource output
	--Also takes 10 each of water & petroleum gas as catalyst
	--Also converts 1 coal into 1 plastic bar
	--Time efficiency: 11.111% improvement over base recipe (exact number is 10/9)
	--Resource efficiency: 66.667% improvement over base recipe (exact number is 5/3)
	--Ehhh, I'm not so sure this is balanced, because the player can use quality
	-- item inputs to get waaay too much quality sulfur.  Hmm...
	ingredients = {
		{ type = "fluid", name = "water", amount = 100, ignored_by_stats = 10 },
		{ type = "fluid", name = "petroleum-gas", amount = 100, ignored_by_stats = 10 },
		{ type = "item", name = "coal", amount = 1 }
	},
	energy_required = 4.5,
	results = {
		--Swap the arrangement of the fluids just for kicks
		{ type = "fluid", name = "petroleum-gas", amount = 10, ignored_by_stats = 10, ignored_by_productivity = 10 },
		{ type = "fluid", name = "water", amount = 10, ignored_by_stats = 10, ignored_by_productivity = 10 },
		{ type = "item", name = "sulfur", amount = 10 },
		{ type = "item", name = "plastic-bar", amount = 1 }
	},
	main_product = "sulfur",
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "sulfur" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-iron-gear-wheel",
	order = "a[basic-intermediates]-a[iron-gear-wheel]-t3",
	icons = make_t3_icon( "iron-gear-wheel", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Halved resource cost, 50% slower, same resource output
	--Time efficiency: -20% compared to base recipe
	--Resource efficiency: 100% improvement over base recipe
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 1 },
		{ type = "fluid", name = "lubricant", amount = 4 }
	},
	energy_required = 0.625,
	results = {{ type = "item", name = "iron-gear-wheel", amount = 1 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-iron-stick",
	order = "a[basic-intermediates]-b[iron-stick]-t3",
	icons = make_t3_icon( "iron-stick", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource cost, 50% slower, 1.5 times resource output
	--Time efficiency: 0% (no improvement) compared to base recipe
	--Resource efficiency: 50% improvement over base recipe
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 1 },
		{ type = "fluid", name = "lubricant", amount = 4 }
	},
	energy_required = 0.75,
	results = {{ type = "item", name = "iron-stick", amount = 3 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-copper-cable",
	order = "a[basic-intermediates]-c[copper-cable]-t3",
	icons = make_t3_icon( "copper-cable", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same resource cost, twice as slow, 2 times resource output
	--Time efficiency: 0% (no improvement) compared to base recipe
	--Resource efficiency: 100% improvement over base recipe
	ingredients = {
		{ type = "item", name = "copper-plate", amount = 1 },
		{ type = "fluid", name = "lubricant", amount = 4 }
	},
	energy_required = 1,
	results = {{ type = "item", name = "copper-cable", amount = 4 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-electronic-circuit-from-plastic",
	order = "b[circuits]-a[electronic-circuit]-t3",
	--icons will be defined later
	enabled = false,
	category = "crafting-with-fluid",
	--Replaces iron plate with plastic bar, multiplies cost by 2
	--7/3 times the copper cost, 2.5 times slower, 3 times the resource output
	--Time efficiency: 20% improvement over base recipe
	--Iron/plastic resource efficiency: 50% improvement over base recipe if iron & plastic are worth the same
	--Copper resource efficiency: 28.571% improvement over base recipe (exact number is 9/7)
	ingredients = {
		{ type = "item", name = "plastic-bar", amount = 2 },
		{ type = "item", name = "copper-cable", amount = 7 },
		{ type = "fluid", name = "lubricant", amount = 4 }
	},
	energy_required = 1.25,
	results = {{ type = "item", name = "electronic-circuit", amount = 3 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-advanced-circuit",
	order = "b[circuits]-b[advanced-circuit]-t3",
	icons = make_t3_icon( "advanced-circuit", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--50% higher resource cost, 50% higher crafting time, double resource output
	--Time efficiency: 33% improvement over base recipe (exact number is 4/3)
	--Resource efficiency: 33% improvement over base recipe (exact number is 4/3)
	ingredients = {
		{ type = "item", name = "electronic-circuit", amount = 3 },
		{ type = "item", name = "plastic-bar", amount = 3 },
		{ type = "item", name = "copper-cable", amount = 6 },
		{ type = "fluid", name = "lubricant", amount = 7 }
	},
	energy_required = 9,
	results = {{ type = "item", name = "advanced-circuit", amount = 2 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-processing-unit",
	order = "b[circuits]-c[processing-unit]-t3",
	icons = make_t3_icon( "processing-unit", false ),
	enabled = false,
	category = "crafting-with-fluid",
	--Same crafting time & resource output
	--Trade a 10% reduction in electronic circuits required for doubled sulfuric acid requirement
	--Time efficiency: 0% (no improvement) compared to base recipe
	--Resource efficiency:
	--	For electronic circuits: 11.111% improvement over base recipe (exact number is 10/9)
	--	For advanced circuits: 0% (no improvement) compared to base recipe
	--	For sulfuric acid: -50% compared to base recipe
	--This is really only an upgrade for engineers who consider sulfuric acid to be much cheaper than electronic circuits
	ingredients = {
		{ type = "item", name = "electronic-circuit", amount = 18 },
		{ type = "item", name = "advanced-circuit", amount = 2 },
		{ type = "fluid", name = "sulfuric-acid", amount = 10 }
	},
	energy_required = 10,
	results = {{ type = "item", name = "processing-unit", amount = 1 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-engine-unit",
	order = "c[advanced-intermediates]-a[engine-unit]-t3",
	icons = make_t3_icon( "engine-unit", true ),
	enabled = false,
	category = "crafting-with-fluid",
	--4~5 times the resource cost, 3 times the crafting time, 5 times the resource output
	--Added cost of lubricant
	--Time efficiency: 66.667% improvement over base recipe (exact number is 5/3)
	--Resource efficiency for steel: 25% improvement over base recipe
	--Resource efficiency for gears: 0% (no improvement) compared to base recipe
	--Resource efficiency for pipes: 11.111% improvement over base recipe (exact number is 10/9)
	ingredients = {
		{ type = "item", name = "steel-plate", amount = 4 },
		{ type = "item", name = "iron-gear-wheel", amount = 5 },
		{ type = "item", name = "pipe", amount = 9 },
		{ type = "fluid", name = "lubricant", amount = 15 }
	},
	energy_required = 30,
	results = {{ type = "item", name = "engine-unit", amount = 5 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-electric-engine-unit",
	order = "c[advanced-intermediates]-b[electric-engine-unit]-t3",
	icons = make_t3_icon( "electric-engine-unit", false ), --Don't add lube icon since the base recipe already requires lube
	enabled = false,
	category = "crafting-with-fluid",
	--3 times the resource cost (2.5 for circuits), 2.2 times the crafting time, 3 times the resource output
	--Time efficiency: 36.364% improvement over base recipe (exact number is 15/11)
	--Resource efficiency for circuits: 20% improvement over base recipe
	--Resource efficiency for everything else: 0% (no improvement) compared to base recipe
	ingredients = {
		{ type = "item", name = "engine-unit", amount = 3 },
		{ type = "fluid", name = "lubricant", amount = 45 },
		{ type = "item", name = "electronic-circuit", amount = 5 },
	},
	energy_required = 22,
	results = {{ type = "item", name = "electric-engine-unit", amount = 3 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__efficient-rocket-fuel",
	order = "d[rocket-parts]-b[rocket-fuel]-t3",
	icons = make_t3_icon( "rocket-fuel", false ),
	enabled = false,
	category = "crafting-with-fluid",
	--Ingredient costs reduced by 10%, crafting time reduced by 2/15, same outputs
	--Time efficiency: 15.485% improvement over base recipe (exact number is 15/13)
	--Resource efficiency: 11.111% improvement over base recipe (exact number is 10/9)
	ingredients = {
		{ type = "item", name = "solid-fuel", amount = 9 },
		{ type = "fluid", name = "light-oil", amount = 9 }
	},
	energy_required = 13,
	results = {{ type = "item", name = "rocket-fuel", amount = 1 }},
	emissions_multiplier = TIER_3_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_decomposition = false
},
--================================================--
--        TIER 4 ADVANCED CRAFTING RECIPES        --
--            Cannot be crafted by hand           --
--    Requires 1 space science pack as catalyst   --
--              -8% pollution output              --
--================================================--
{
	type = "recipe",
	name = "q__superior-concrete",
	order = "b[concrete]-a[plain]-t4",
	icons = make_t4_icon( "concrete" ),
	enabled = false,
	category = "crafting-with-fluid",
	--Increase stone requirement by 60%
	--Swap 1 iron ore for 1 steel plate
	--Reduce water requirement by 20%
	--Reduce crafting time by 10%
	--Triple the resource output
	--Time efficiency: 233.333% improvement over base recipe (exact number is 10/3)
	--Stone efficiency: 87.5% improvement over base recipe
	--Iron efficiency: -40% compared to base recipe (assuming iron ore has a value of 1, steel plate has a value of 5)
	--Water efficiency: 275% improvement over base recipe
	ingredients = {
		{ type = "item", name = "stone-brick", amount = 8 },
		{ type = "item", name = "steel-plate", amount = 1 },
		{ type = "fluid", name = "water", amount = 80 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 9,
	results = {
		{ type = "item", name = "concrete", amount = 30 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "concrete",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = false, --Base recipe doesn't allow productivity, so this one doesn't, either
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-refined-concrete",
	order = "b[concrete]-c[refined]-t4",
	icons = make_t4_icon( "refined-concrete" ),
	enabled = false,
	category = "crafting-with-fluid",
	--Iron stick input reduced by 1/8, water input increased by 30%, crafting time reduced by 20%, recipe output doubled
	--Time efficiency: 150% improvement over base recipe
	--Concrete/steel efficiency: 100% improvement over base recipe
	--Stick efficiency: 128.571% improvement over base recipe (exact number is 16/7)
	--Water efficiency: 53.846% improvement over base recipe (exact number is 20/13)
	ingredients = {
		{ type = "item", name = "concrete", amount = 20 },
		{ type = "item", name = "iron-stick", amount = 7 },
		{ type = "item", name = "steel-plate", amount = 1 },
		{ type = "fluid", name = "water", amount = 130 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 12,
	results = {
		{ type = "item", name = "refined-concrete", amount = 20 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "refined-concrete",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = false, --Base recipe doesn't allow productivity, so this one doesn't, either
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-oil-processing",
	subgroup = "fluid-recipes",
	order = "a[oil-processing]-b[advanced-oil-processing]-t4",
	--icons will be defined later
	enabled = false,
	category = "oil-processing",
	--For the sake of brevity, "Advanced Oil Processing" is called "AOP" below:
	--Massively reduced the scale of the recipe compared to AOP
	--Heavy oil output per unit time: 33.333% improvement over AOP (exact number is 4/3)
	--Light oil output per unit time: 48.148% improvement over AOP (exact number is 40/27)
	--Petroleum output per unit time: 81.818% improvement over AOP (exact number is 20/11)
	--Heavy oil output per crude oil input: 0% (no improvement) compared to AOP
	--Light oil output per crude oil input: 11.111% improvement over AOP (exact number is 10/9)
	--Petroleum output per crude oil input: 36.364% improvement over AOP (exact number is 15/11)
	ingredients = {
		{ type = "fluid", name = "water", amount = 3 },
		{ type = "fluid", name = "crude-oil", amount = 4 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 0.15,
	results = {
		{ type = "fluid", name = "heavy-oil", amount = 1 },
		{ type = "fluid", name = "light-oil", amount = 2 },
		{ type = "fluid", name = "petroleum-gas", amount = 3 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-solid-fuel-from-light-oil",
	subgroup = "fluid-recipes",
	order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]-t4",
	--icons will be defined later
	enabled = false,
	category = "chemistry",
	--Costs half as many resources, 10% reduced crafting time, same outputs
	--Also uses 5 light oil as catalyst
	--Time efficiency: 11.111% improvement over base recipe (exact number is 10/9)
	--Resource efficiency: 100% improvement over base recipe
	ingredients = {
		{ type = "fluid", name = "light-oil", amount = 10, ignored_by_stats = 5 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 0.9,
	results = {
		{ type = "item", name = "solid-fuel", amount = 1 },
		{ type = "fluid", name = "light-oil", amount = 5, ignored_by_stats = 5, ignored_by_productivity = 5 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "solid-fuel",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "solid-fuel-from-light-oil" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-plastic-bar",
	order = "b[chemistry]-b[plastic-bar]-t4",
	icons = make_t4_icon( "plastic-bar" ),
	enabled = false,
	category = "chemistry",
	--Requires 10 petroleum gas as catalyst
	--2 times the resource input, 2.5 times the crafting time, 3.5 times the resource output
	--Time efficiency: 40% improvement over base recipe
	--Resource efficiency: 75% improvement over base recipe
	ingredients = {
		{ type = "fluid", name = "petroleum-gas", amount = 50, ignored_by_stats = 10 },
		{ type = "item", name = "coal", amount = 2 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 2.5,
	results = {
		{ type = "item", name = "plastic-bar", amount = 7 },
		{ type = "fluid", name = "petroleum-gas", amount = 10, ignored_by_stats = 10, ignored_by_productivity = 10 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "plastic-bar",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "plastic-bar" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-battery",
	order = "b[chemistry]-d[battery]-t4",
	icons = make_t4_icon( "battery" ),
	enabled = false,
	category = "chemistry",
	--Added a small lube cost, other costs the same, doubled crafting time, doubled resource output
	--Added catalyst of both sulfuric acid & lube
	--Time efficiency: 0% (no improvement) compared to base recipe
	--Resource efficiency: 100% improvement over base recipe
	--Have fun dealing with 5 inputs & 4 outputs to a single recipe!
	ingredients = {
		{ type = "fluid", name = "sulfuric-acid", amount = 30, ignored_by_stats = 10 },
		{ type = "fluid", name = "lubricant", amount = 6, ignored_by_stats = 5 },
		{ type = "item", name = "iron-plate", amount = 1 },
		{ type = "item", name = "copper-plate", amount = 1 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 8,
	results = {
		{ type = "item", name = "battery", amount = 2 },
		{ type = "fluid", name = "lubricant", amount = 5, ignored_by_stats = 5, ignored_by_productivity = 5 },
		{ type = "fluid", name = "sulfuric-acid", amount = 10, ignored_by_stats = 10, ignored_by_productivity = 10 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "battery",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	crafting_machine_tint = table.deepcopy( data.raw.recipe[ "battery" ].crafting_machine_tint ),
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-iron-stick",
	order = "a[basic-intermediates]-b[iron-stick]-t4",
	icons = make_t4_icon( "iron-stick" ),
	enabled = false,
	category = "advanced-crafting",
	--Same resource cost, crafting time reduced by 1/3, double the output
	--Time efficiency: 200% improvement over base recipe
	--Resource efficiency: 100% improvement over base recipe
	ingredients = {
		{ type = "item", name = "iron-plate", amount = 1 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 1 / 3,
	results = {
		{ type = "item", name = "iron-stick", amount = 4 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "iron-stick",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-advanced-circuit",
	order = "b[circuits]-b[advanced-circuit]-t4",
	icons = make_t4_icon( "advanced-circuit" ),
	enabled = false,
	category = "crafting-with-fluid",
	--Halved circuit & plastic costs, increased cable cost by 25%, 1/6 reduction in crafting time, same output
	--Also adds a sulfuric acid cost
	--Time efficiency: 20% improvement over base recipe
	--Resource efficiency (not copper): 100% improvement over base recipe
	--Resource efficiency (for copper): -20% compared to base recipe
	ingredients = {
		{ type = "item", name = "electronic-circuit", amount = 1 },
		{ type = "item", name = "plastic-bar", amount = 1 },
		{ type = "item", name = "copper-cable", amount = 5 },
		{ type = "fluid", name = "sulfuric-acid", amount = 3 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 5,
	results = {
		{ type = "item", name = "advanced-circuit", amount = 1 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "advanced-circuit",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-processing-unit",
	order = "b[circuits]-c[processing-unit]-t4",
	icons = make_t4_icon( "processing-unit" ),
	enabled = false,
	category = "crafting-with-fluid",
	--Increased resource costs (by different amounts), 60% increased crafting time, doubled output
	--Time efficiency: 40% improvement over base recipe
	--Green circuit efficiency: 25% improvement over base recipe
	--Red circuit efficiency: 33.333% improvement over base recipe (exact number is 4/3)
	--Sulfuric acid efficiency: -33.333% compared to base recipe (exact number is 2/3)
	ingredients = {
		{ type = "item", name = "electronic-circuit", amount = 32 },
		{ type = "item", name = "advanced-circuit", amount = 3 },
		{ type = "fluid", name = "sulfuric-acid", amount = 15 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1 }
	},
	energy_required = 100 / 7,
	results = {
		{ type = "item", name = "processing-unit", amount = 2 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	main_product = "processing-unit",
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
},
{
	type = "recipe",
	name = "q__superior-uranium-processing",
	subgroup = "uranium-processing",
	order = "a[uranium-processing]-a[uranium-processing]-t4",
	icons = {
		{ icon = data.raw.item[ "uranium-ore" ].icon, scale = 0.25, shift = { -11, -8 }, draw_background = true },
		{ icon = data.raw.item[ "uranium-238" ].icon, scale = 0.25, shift = { 0, -8 }, draw_background = true },
		{ icon = data.raw.item[ "uranium-235" ].icon, scale = 0.25, shift = { 11, -8 }, draw_background = true },
		{ icon = data.raw.tool[ "space-science-pack" ].icon, scale = 0.25, shift = { -11, 8 }, draw_background = false },
		{ icon = data.raw.item[ "stone" ].icon, scale = 0.25, shift = { 0, 8 }, draw_background = true },
		{ icon = data.raw.item[ "copper-ore" ].icon, scale = 0.25, shift = { 11, 8 }, draw_background = true }
	},
	enabled = false,
	category = "centrifuging",
	auto_recycle = false,
	unlock_results = false,
	--Slightly increased cost, slightly decreased crafting time, also outputs stone & copper ore.
	--Doesn't output any more U-235 because by this point the player would have the Kovarex Enrichment Process.
	ingredients = {
		{ type = "item", name = "uranium-ore", amount = 11 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	energy_required = 10,
	results = {
		{ type = "item", name = "uranium-235", probability = 0.007, amount = 1 },
		{ type = "item", name = "uranium-238", probability = 0.993, amount = 1 },
		{ type = "item", name = "stone", amount = 2 },
		{ type = "item", name = "copper-ore", probability = 0.2, amount = 1 },
		{ type = "item", name = "space-science-pack", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 }
	},
	emissions_multiplier = TIER_4_POLLUTION_MULTIPLIER,
	allow_productivity = true,
	allow_quality = false, --Or else you could use this recipe to bump up the quality of the catalysts
	allow_decomposition = false
}
})

--ICON FOR BULK SOLID FUEL
local recipe = data.raw.recipe[ "q__bulk-solid-fuel" ]
recipe.icons = make_t1_icon( "solid-fuel" )
table.insert( recipe.icons, 2, {
	icon = data.raw.fluid[ "light-oil" ].icon,
	scale = 0.25,
	shift = { -10, -8 },
	floating = true
})
table.insert( recipe.icons, 3, {
	icon = data.raw.fluid[ "heavy-oil" ].icon,
	scale = 0.25,
	shift = { -4, -8 },
	floating = true
})

--ICON FOR SUPERIOR SOLID FUEL
recipe = data.raw.recipe[ "q__superior-solid-fuel-from-light-oil" ]
recipe.icons = make_t4_icon( "solid-fuel" )
recipe.icons[ 1 ] = {
	icon = data.raw.recipe[ "solid-fuel-from-light-oil" ].icon
}

--ICON FOR SUPERIOR OIL PROCESSING
recipe = data.raw.recipe[ "q__superior-oil-processing" ]
recipe.icons = make_t4_icon( "iron-ore" )
recipe.icons[ 1 ] = {
	icon = data.raw.recipe[ "advanced-oil-processing" ].icon
}

--ICON FOR EFFICIENT SULFUR
recipe = data.raw.recipe[ "q__efficient-sulfur-with-plastic-byproduct" ]
recipe.icons = make_t3_icon( "sulfur", false )
table.insert( recipe.icons, 2, {
	icon = data.raw.item[ "plastic-bar" ].icon,
	scale = 0.25,
	shift = { 8, 8 },
	floating = true
})

--ICON FOR BULK ELECTRONIC CIRCUIT
recipe = data.raw.recipe[ "q__bulk-electronic-circuit-from-plastic" ]
recipe.icons = make_t1_icon( "electronic-circuit" )
table.insert( recipe.icons, 2, {
	icon = data.raw.item[ "plastic-bar" ].icon,
	scale = 0.25,
	shift = { -8, -8 },
	floating = true
})

--ICON FOR EFFICIENT ELECTRONIC CIRCUIT
recipe = data.raw.recipe[ "q__efficient-electronic-circuit-from-plastic" ]
recipe.icons = make_t3_icon( "electronic-circuit", true )
table.insert( recipe.icons, 2, {
	icon = data.raw.item[ "plastic-bar" ].icon,
	scale = 0.25,
	shift = { -8, -8 },
	floating = true
})

--HELPER FUNCTION
--@param color1 - Not a single color, actually a RecipeTints struct with up to 4 fields
local weighted_average_colors = function( color1, weight1, color2, weight2 )
	local retColor = {}

	--Iterate over primary, secondary, tertiary, quaternary
	for key, rgba1 in pairs( color1 ) do
		local rgba2 = color2[ key ]
		retColor[ key ] = {}
		--Iterate over r, g, b, a
		for channel, _ in pairs( rgba1 ) do
			retColor[ key ][ channel ] = ( rgba1[ channel ] * weight1 + rgba2[ channel ] * weight2 ) / ( weight1 + weight2 )
		end
	end

	return retColor
end

--CHEMICAL PLANT TINT FOR BULK SOLID FUEL
--Make it a weighted average of 10 batches from light oil & 4 batches from heavy oil
recipe = data.raw.recipe[ "q__bulk-solid-fuel" ]
recipe.crafting_machine_tint = weighted_average_colors(
	data.raw.recipe[ "solid-fuel-from-light-oil" ].crafting_machine_tint, 10,
	data.raw.recipe[ "solid-fuel-from-heavy-oil" ].crafting_machine_tint, 4
)