flood = 2

-- floods
minetest.register_abm({ 
	nodenames = {"default:river_water_source"},
	neighbors = {"air"},
	interval = 5.0, -- Run every 5 seconds
	chance = 1, -- Select every 1 in 1 nodes

	action = function(pos, node, active_object_count, active_object_count_wider)
		if(flood == 1 or flood == 2)
			then
				minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "floods:flood_water_source"})
			end
		end
})

minetest.register_abm({ 
	nodenames = {"default:river_water_flowing"},
	neighbors = {"air"},
	interval = 5.0, -- Run every 5 seconds
	chance = 1, -- Select every 1 in 1 nodes

	action = function(pos, node, active_object_count, active_object_count_wider)
		if(flood == 1 or flood == 2)
			then
				minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "floods:flood_water_flowing"})
			end
		end
})

-- davastating floods
minetest.register_abm({ 
	nodenames = {"floods:flood_water_source"},
	neighbors = {"air"},
	interval = 5.0, -- Run every 5 seconds
	chance = 1, -- Select every 1 in 1 nodes

	action = function(pos, node, active_object_count, active_object_count_wider)
		if(flood == 2)
			then
				minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "floods:dev_flood_water_source"})
			end
		end
})

minetest.register_abm({ 
	nodenames = {"floods:flood_water_flowing"},
	neighbors = {"air"},
	interval = 5.0, -- Run every 5 seconds
	chance = 1, -- Select every 1 in 1 nodes

	action = function(pos, node, active_object_count, active_object_count_wider)
		if(flood == 2)
			then
				minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name = "floods:dev_flood_water_flowing"})
			end
		end
})

-- end floods
minetest.register_abm({ 
	nodenames = {"floods:flood_water_source", "floods:flood_water_flowing", "floods:dev_flood_water_source", "floods:dev_flood_water_flowing"},
	interval = 5.0, -- Run every 5 seconds
	chance = 1, -- Select every 1 in 1 nodes

	action = function(pos, node, active_object_count, active_object_count_wider)
		if(flood == -1)
			then
				minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
			end
		end
})



minetest.register_node("floods:flood_water_source", { 
    description = "Flood Water",

    drawtype = "liquid",
    paramtype = "light", --prove heavy?

    tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type     = "vertical_frames",
				aspect_w = 20,
				aspect_h = 16,
				length   = 2.0
			}
		}
    },
    
    walkable     = false, -- The player falls through
	pointable    = true, -- The player can't highlight it DEBUGGG
	diggable     = false, -- The player can't dig it
    buildable_to = true,  -- Nodes can be replace this nod
    alpha = 160,

    post_effect_color = {a=64, r=100, g=100, b=200},

    drowning = 1,
	liquidtype = "source",

	liquid_alternative_flowing = "floods:flood_water_flowing",
	-- ^ when the liquid is flowing

	--liquid_alternative_source = "default:river_water_source",
	-- ^ when the liquid is a source

	liquid_viscosity = WATER_VISC,
	-- ^ how fast

	liquid_range = 2,
	-- ^ how far

})

minetest.register_node("floods:flood_water_flowing", {
	description = "Flowing Flood Water",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_river_water.png"},
	special_tiles = {
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	alpha = 191,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = true, --DEBUG
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "floods:flood_water_flowing",
	liquid_alternative_source = "floods:flood_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("floods:dev_flood_water_source", { 
    description = "Devastating Flood Water",

    drawtype = "liquid",
    paramtype = "light", --prove heavy?

    tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type     = "vertical_frames",
				aspect_w = 20,
				aspect_h = 16,
				length   = 2.0
			}
		}
    },
    
    walkable     = false, -- The player falls through
	pointable    = true, -- The player can't highlight it DEBUGGG
	diggable     = false, -- The player can't dig it
    buildable_to = true,  -- Nodes can be replace this nod
    alpha = 160,

    post_effect_color = {a=64, r=100, g=100, b=200},

    drowning = 1,
	liquidtype = "source",

	liquid_alternative_flowing = "floods:dev_flood_water_flowing",
	-- ^ when the liquid is flowing

	--liquid_alternative_source = "default:river_water_source",
	-- ^ when the liquid is a source

	liquid_viscosity = WATER_VISC,
	-- ^ how fast

	liquid_range = 2,
	-- ^ how far

})

minetest.register_node("floods:dev_flood_water_flowing", {
	description = "Devastating Flowing Flood Water",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_river_water.png"},
	special_tiles = {
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	alpha = 191,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = true, --DEBUG
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "floods:dev_flood_water_flowing",
	liquid_alternative_source = "floods:dev_flood_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

