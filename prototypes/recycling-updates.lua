--To keep things in line with the devs' official Quality mod, we'll follow the same pattern.
--We'll return only 25% of the ingredients (on average), & it'll require 1/16th the crafting time of one batch

local recipe = data.raw.recipe[ "iron-gear-wheel-recycling" ]
recipe.energy_required = 0.625 / 16 --One-sixteenth the crafting time of the slowest recipe
recipe.results = {
	{ type = "item", name = "iron-plate", amount = 1, probability = 0.25 }
} --One-fourth the item ingredients of the lowest-cost recipe

recipe = data.raw.recipe[ "iron-stick-recycling" ]
recipe.energy_required = 0.5 / 16
recipe.results = {{ type = "item", name = "iron-plate", amount = 1, probability = 0.0625 }}

recipe = data.raw.recipe[ "copper-cable-recycling" ]
recipe.energy_required = 0.5 / 16
recipe.results = {{ type = "item", name = "copper-plate", amount = 1, probability = 0.0625 }}

recipe = data.raw.recipe[ "electronic-circuit-recycling" ]
recipe.energy_required = 0.6 / 16
--Some circuits are made from iron, others from plastic, so we can't get EITHER back from recycling
-- or else it would constitute a way to magically turn iron into plastic or vice versa
recipe.results = {{ type = "item", name = "copper-cable", amount = 1, probability = 0.5833333333333 }}

recipe = data.raw.recipe[ "advanced-circuit-recycling" ]
recipe.energy_required = 6 / 16
recipe.results = {
	{ type = "item", name = "electronic-circuit", amount = 1, probability = 0.25 },
	{ type = "item", name = "plastic-bar", amount = 1, probability = 0.25 },
	{ type = "item", name = "copper-cable", amount = 1, probability = 0.75 }
}

recipe = data.raw.recipe[ "processing-unit-recycling" ]
recipe.energy_required = 10 / 16
recipe.results = {
	{ type = "item", name = "electronic-circuit", amount = 4 },
	{ type = "item", name = "advanced-circuit", amount = 1, probability = 0.375 }
}

recipe = data.raw.recipe[ "low-density-structure-recycling" ]
recipe.energy_required = 15 / 16
recipe.results = {
	{ type = "item", name = "steel-plate", amount = 1, probability = 0.04642857143 },
	{ type = "item", name = "copper-plate", amount = 4, extra_count_fraction = 0.214285714 },
	{ type = "item", name = "plastic-bar", amount = 1, extra_count_fraction = 0.142857143 }
}

recipe = data.raw.recipe[ "rocket-fuel-recycling" ]
recipe.energy_required = 15 / 16
recipe.results = {{ type = "item", name = "solid-fuel", amount = 2, extra_count_fraction = 0.25 }}

recipe = data.raw.recipe[ "concrete-recycling" ]
recipe.energy_required = 10 / 16
--There is a way to make concrete from steel rather than from iron ore.
--In that case, this is effectively a way to turn steel back into iron ore.
--There's a problem here because there are many steps to turn iron ore into steel, so productivity applies many times.
--1 iron ore, at max productivity (+300%), can turn into 4 iron plates.
--4 iron plates, at max productivity, can turn into 3.2 steel plates.
--Turning that into concrete at max productivity would make 384 concrete.
--So, we need to adjust the ratio so that, on average, 384 concrete makes *at most* 1 iron ore.
--In practice, though, maybe the player has a mod that improves smelting even more?
--But they probably won't have much productivity when crafting the concrete.
--So, I'll bump down the chance of getting an iron ore to a nice, round number & leave it for now.
--There is an edge case for a player to potentially exploit, but it requires a lot of setup.
recipe.results = {
	{ type = "item", name = "iron-ore", amount = 1, probability = 0.01 },
	{ type = "item", name = "stone-brick", amount = 1, probability = 0.06666666666666666666667 }
}

recipe = data.raw.recipe[ "refined-concrete-recycling" ]
recipe.energy_required = 15 / 16
recipe.results = {
	{ type = "item", name = "steel-plate", amount = 1, probability = 0.0125 },
	{ type = "item", name = "iron-stick", amount = 1, probability = 0.0875 },
	{ type = "item", name = "concrete", amount = 1, probability = 0.25 }
}

recipe = data.raw.recipe[ "engine-unit-recycling" ]
recipe.energy_required = 10 / 16
recipe.results = {
	{ type = "item", name = "steel-plate", amount = 1, probability = 0.2 },
	{ type = "item", name = "iron-gear-wheel", amount = 1, probability = 0.25 },
	{ type = "item", name = "pipe", amount = 1, probability = 0.45 }
}

recipe = data.raw.recipe[ "electric-engine-unit-recycling" ]
recipe.energy_required = 10 / 16
recipe.results = {
	{ type = "item", name = "electronic-circuit", amount = 1, probability = 0.41666666666667 },
	{ type = "item", name = "engine-unit", amount = 1, probability = 0.25 }
}