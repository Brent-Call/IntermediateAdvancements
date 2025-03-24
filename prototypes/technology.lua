data:extend({
{
	type = "technology",
	name = "q__advanced-intermediates",
	icons = {
		--There's an issue where in-game (not in the tech tree, but in the button) the tech icons are all mis-sized.
		--Putting empty.png as the very bottom layer seems to make it work.
		--If for some reason empty.png gets removed or changed & that breaks this mod, the fix is easy!
		--empty.png is literally just a completely transparent square with a side length of 64 pixels.
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64, scale = 1, shift = { -32, 16 }},
		{ icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64, scale = 1, shift = { -32, 0 }},
		{ icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64, scale = 1, shift = { -32, -16 }},
		{ icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64, scale = 1, shift = { 32, 16 }},
		{ icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64, scale = 1, shift = { 32, 0 }},
		{ icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64, scale = 1, shift = { 32, -16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-capacity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "automation-2" },
	research_trigger = {
		type = "craft-item",
		item = "assembling-machine-2",
		count = 200
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__bulk-iron-gear-wheel" },
		{ type = "unlock-recipe", recipe = "q__bulk-copper-cable" }
	}
},
{
	type = "technology",
	name = "q__advanced-electronic-component-manufacturing",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.4, shift = { 0, 32 }},
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.4, shift = { 0, 16 }},
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.4, shift = { 0, 0 }},
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.4, shift = { 0, -16 }},
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.4, shift = { 0, -32 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-capacity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-intermediates", "plastics" },
	unit = {
		count = 3000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 }
		},
		time = 5
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__bulk-electronic-circuit-from-plastic" },
	}
},
{
	type = "technology",
	name = "q__advanced-intermediates-2",
	localised_description = { "technology-description.q__advanced-intermediates-2" },
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/plastics.png", icon_size = 256, scale = 0.25, shift = { -32, 32 }},
		{ icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64, scale = 1, shift = { 0, -32 }},
		{ icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64, scale = 1, shift = { 32, 32 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-capacity.png", icon_size = 128, scale = 0.5, shift = { 0, 50 }, floating = true },
		{ icon = "__core__/graphics/icons/technology/constants/constant-speed.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "lubricant", "q__advanced-intermediates" },
	research_trigger = {
		type = "craft-fluid",
		fluid = "lubricant",
		amount = 2000
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__bulk-plastic-bar" },
		{ type = "unlock-recipe", recipe = "q__fast-iron-gear-wheel" },
		{ type = "unlock-recipe", recipe = "q__fast-copper-cable" }
	}
},
{
	type = "technology",
	name = "q__advanced-electronic-component-manufacturing-2",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.5, shift = { 0, 16 }},
		{ icon = "__base__/graphics/technology/advanced-circuit.png", icon_size = 256, scale = 0.5, shift = { 0, -16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-speed.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-intermediates-2", "q__advanced-electronic-component-manufacturing", "battery" },
	unit = {
		count = 3000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 }
		},
		time = 10
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__bulk-battery" }, --(!) Tier 2 tech which unlocks a tier 1 recipe
		{ type = "unlock-recipe", recipe = "q__fast-electronic-circuit" },
		{ type = "unlock-recipe", recipe = "q__fast-advanced-circuit" }
	}
},
{
	type = "technology",
	name = "q__advanced-concrete-processes",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/concrete.png", icon_size = 256, scale = 0.5 },
		{ icon = "__core__/graphics/icons/technology/constants/constant-speed.png", icon_size = 128, scale = 0.5, shift = { 0, 50 }, floating = true },
		{
			icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
			tint = { r = 0.2, g = 1, b = 0.2, a = 1 },
			icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true
		},
	},
	prerequisites = { "q__advanced-intermediates-2", "concrete" },
	unit = {
		count = 10000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 }
		},
		time = 30
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__fast-concrete" }, 
		{ type = "unlock-recipe", recipe = "q__direct-refined-concrete" },
		{ type = "unlock-recipe", recipe = "q__bulk-iron-stick" } --(!) Tier 2 tech which unlocks a tier 1 recipe
	}
},
{
	type = "technology",
	name = "q__advanced-intermediates-3",
	localised_description = { "technology-description.q__advanced-intermediates-3" },
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64, scale = 1, shift = { -32, 32 }},
		{ icon = "__base__/graphics/icons/iron-stick.png", icon_size = 64, scale = 1, shift = { 0, -32 }},
		{ icon = "__base__/graphics/icons/copper-cable.png", icon_size = 64, scale = 1, shift = { 32, 32 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "automation-3", "q__advanced-intermediates-2" },
	research_trigger = {
		type = "craft-item",
		item = "assembling-machine-3",
		count = 200
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__efficient-iron-gear-wheel" },
		{ type = "unlock-recipe", recipe = "q__efficient-iron-stick" },
		{ type = "unlock-recipe", recipe = "q__efficient-copper-cable" }
	}
},
{
	type = "technology",
	name = "q__advanced-electronic-component-manufacturing-3",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/electronics.png", icon_size = 256, scale = 0.5, shift = { 0, 16 }},
		{ icon = "__base__/graphics/technology/processing-unit.png", icon_size = 256, scale = 0.5, shift = { 0, -16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png", icon_size = 128, scale = 0.5, shift = { 0, 50 }, floating = true },
		{ icon = "__core__/graphics/icons/technology/constants/constant-speed.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-intermediates-3", "q__advanced-electronic-component-manufacturing-2", "processing-unit" },
	unit = {
		count = 3000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 }
		},
		time = 15
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__efficient-plastic-bar" },
		{ type = "unlock-recipe", recipe = "q__efficient-electronic-circuit-from-plastic" },
		{ type = "unlock-recipe", recipe = "q__fast-processing-unit" }
	}
},
{
	type = "technology",
	name = "q__advanced-engine-manufacturing-1",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/engine.png", icon_size = 256, scale = 0.375, shift = { -16, -16 }},
		{ icon = "__base__/graphics/technology/electric-engine.png", icon_size = 256, scale = 0.375, shift = { 16, 16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-speed.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "utility-science-pack", "q__advanced-intermediates-2" },
	research_trigger = {
		type = "craft-item",
		item = "utility-science-pack",
		count = 5000
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__fast-engine-unit" },
		{ type = "unlock-recipe", recipe = "q__fast-electric-engine-unit" }
	}
},
{
	type = "technology",
	name = "q__advanced-engine-manufacturing-2",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/engine.png", icon_size = 256, scale = 0.375, shift = { -16, -16 }},
		{ icon = "__base__/graphics/technology/electric-engine.png", icon_size = 256, scale = 0.375, shift = { 16, 16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-engine-manufacturing-1", "q__advanced-intermediates-3" },
	unit = {
		count = 4500,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 }
		},
		time = 15
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__efficient-engine-unit" },
		{ type = "unlock-recipe", recipe = "q__efficient-electric-engine-unit" }
	}
},
{
	type = "technology",
	name = "q__direct-logistics-crafting",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/logistics-2.png", icon_size = 256, scale = 0.5 },
		{
			icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
			tint = { r = 0.2, g = 1, b = 0.2, a = 1 },
			icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true
		}
	},
	prerequisites = { "logistics-3" },
	unit = {
		count = 100,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 }
		},
		time = 15
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__direct-fast-transport-belt" },
		{ type = "unlock-recipe", recipe = "q__direct-fast-underground-belt" },
		{ type = "unlock-recipe", recipe = "q__direct-fast-splitter" },
		{ type = "unlock-recipe", recipe = "q__direct-long-handed-inserter" }
	}
},
{
	type = "technology",
	name = "q__direct-bulk-inserter-crafting",
	localised_description = { "technology-description.q__direct-logistics-crafting" },
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/bulk-inserter.png", icon_size = 256, scale = 0.5 },
		{
			icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
			tint = { r = 0.2, g = 1, b = 0.2, a = 1 },
			icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true
		}
	},
	prerequisites = { "q__direct-logistics-crafting", "bulk-inserter" },
	research_trigger = {
		type = "craft-item",
		item = "bulk-inserter",
		count = 50
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__direct-fast-inserter" },
		{ type = "unlock-recipe", recipe = "q__direct-bulk-inserter" }
	}
},
{
	type = "technology",
	name = "q__advanced-intermediates-4",
	localised_description = { "technology-description.q__advanced-intermediates-4" },
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64, scale = 1, shift = { -32, -32 }},
		{ icon = "__base__/graphics/technology/sulfur-processing.png", icon_size = 256, scale = 0.25, shift = { 32, -32 }},
		{ icon = "__base__/graphics/icons/iron-stick.png", icon_size = 64, scale = 1, shift = { -32, 32 }},
		{ icon = "__base__/graphics/technology/low-density-structure.png", icon_size = 256, scale = 0.25, shift = { 32, 32 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-capacity.png", icon_size = 128, scale = 0.5, shift = { -30, 50 }, floating = true },
		{ icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png", icon_size = 128, scale = 0.5, shift = { 10, 50 }, floating = true },
		{ icon = "__base__/graphics/technology/space-science-pack.png", icon_size = 256, scale = 0.125, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "space-science-pack", "q__advanced-fuel-refining" },
	unit = {
		count = 1000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "space-science-pack", 1 }
		},
		time = 20
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__superior-solid-fuel-from-light-oil" },
		{ type = "unlock-recipe", recipe = "q__efficient-sulfur-with-plastic-byproduct" },
		{ type = "unlock-recipe", recipe = "q__superior-iron-stick" },
		{ type = "unlock-recipe", recipe = "q__bulk-low-density-structure" }
	}
},
{
	type = "technology",
	name = "q__advanced-oil-processing-2",
	localised_name = { "technology-name.q__advanced-oil-processing-2" },
	localised_description = { "technology-description.q__advanced-oil-processing-2" },
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/oil-processing.png", icon_size = 256, scale = 0.5 },
		{ icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64, scale = 0.5, shift = { -44, 12 }},
		{ icon = "__base__/graphics/icons/sulfur.png", icon_size = 64, scale = 0.5, shift = { 44, 12 }},
		{
			icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
			tint = { r = 0.2, g = 1, b = 0.2, a = 1 },
			icon_size = 128, scale = 0.5, shift = { 0, 50 }, floating = true
		},
		{ icon = "__core__/graphics/icons/technology/constants/constant-capacity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "rocket-fuel", "q__advanced-intermediates-3" },
	research_trigger = {
		type = "craft-item",
		item = "rocket-fuel",
		count = 500
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__direct-solid-fuel" },
		{ type = "unlock-recipe", recipe = "q__bulk-sulfur" }
	}
},
{
	type = "technology",
	name = "q__advanced-electronic-component-manufacturing-4",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/advanced-circuit.png", icon_size = 256, scale = 0.5, shift = { 0, 16 }},
		{ icon = "__base__/graphics/technology/processing-unit.png", icon_size = 256, scale = 0.5, shift = { 0, -16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-electronic-component-manufacturing-3" },
	unit = {
		count = 3000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 }
		},
		time = 20
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__fast-battery" },
		{ type = "unlock-recipe", recipe = "q__efficient-advanced-circuit" },
		{ type = "unlock-recipe", recipe = "q__efficient-processing-unit" }
	}
},
{
	type = "technology",
	name = "q__advanced-fuel-refining",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64, scale = 1.5, shift = { -16, -16 }},
		{ icon = "__base__/graphics/technology/rocket-fuel.png", icon_size = 256, scale = 0.375, shift = { 16, 16 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-capacity.png", icon_size = 128, scale = 0.5, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-oil-processing-2" },
	unit = {
		count = 2000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 }
		},
		time = 7.5
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__bulk-solid-fuel" },
		{ type = "unlock-recipe", recipe = "q__bulk-rocket-fuel" }
	}
},
{
	type = "technology",
	name = "q__superior-materials-processing",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/concrete.png", icon_size = 256, scale = 0.375, shift = { -16, -16 }},
		{ icon = "__base__/graphics/technology/uranium-processing.png", icon_size = 256, scale = 0.375, shift = { 16, 16 }},
		{ icon = "__base__/graphics/technology/space-science-pack.png", icon_size = 256, scale = 0.125, shift = { 50, 50 }, floating = true }
	},
	prerequisites = {
		"q__advanced-concrete-processes",
		"kovarex-enrichment-process",
		"q__advanced-intermediates-4"
	},
	unit = {
		count = 12000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "space-science-pack", 1 }
		},
		time = 15
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__superior-concrete" },
		{ type = "unlock-recipe", recipe = "q__superior-refined-concrete" },
		{ type = "unlock-recipe", recipe = "q__superior-uranium-processing" },
	}
},
{
	type = "technology",
	name = "q__advanced-electronic-component-manufacturing-5",
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/advanced-circuit.png", icon_size = 256, scale = 0.5, shift = { 0, 16 }},
		{ icon = "__base__/graphics/technology/processing-unit.png", icon_size = 256, scale = 0.5, shift = { 0, -16 }},
		{ icon = "__base__/graphics/technology/space-science-pack.png", icon_size = 256, scale = 0.125, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-intermediates-4", "q__advanced-electronic-component-manufacturing-4" },
	unit = {
		count = 3000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "space-science-pack", 1 }
		},
		time = 25
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__superior-plastic-bar" },
		{ type = "unlock-recipe", recipe = "q__superior-advanced-circuit" },
		{ type = "unlock-recipe", recipe = "q__superior-processing-unit" }
	}
},
{
	type = "technology",
	name = "q__advanced-intermediates-5",
	localised_description = { "technology-description.q__advanced-intermediates-4" },
	icons = {
		{ icon = "__core__/graphics/empty.png", icon_size = 64 },
		{ icon = "__base__/graphics/technology/advanced-oil-processing.png", icon_size = 256, scale = 0.25, shift = { -32, -32 }},
		{ icon = "__base__/graphics/technology/battery.png", icon_size = 256, scale = 0.25, shift = { 32, -32 }},
		{ icon = "__base__/graphics/technology/rocket-fuel.png", icon_size = 256, scale = 0.25, shift = { -32, 32 }},
		{ icon = "__base__/graphics/technology/low-density-structure.png", icon_size = 256, scale = 0.25, shift = { 32, 32 }},
		{ icon = "__core__/graphics/icons/technology/constants/constant-speed.png", icon_size = 128, scale = 0.5, shift = { -30, 50 }, floating = true },
		{ icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png", icon_size = 128, scale = 0.5, shift = { 10, 50 }, floating = true },
		{ icon = "__base__/graphics/technology/space-science-pack.png", icon_size = 256, scale = 0.125, shift = { 50, 50 }, floating = true }
	},
	prerequisites = { "q__advanced-intermediates-4" },
	unit = {
		count = 4000,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "space-science-pack", 1 }
		},
		time = 40
	},
	effects = {
		{ type = "unlock-recipe", recipe = "q__superior-oil-processing" },
		{ type = "unlock-recipe", recipe = "q__superior-battery" },
		{ type = "unlock-recipe", recipe = "q__efficient-rocket-fuel" },
		{ type = "unlock-recipe", recipe = "q__fast-low-density-structure" }
	}
}
})