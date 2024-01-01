local underground_splitter_lib = {}

--====================================================================================================
--DATA VALUES
--====================================================================================================

-- for building handler
---------------------------------------------------------
local loaders = {
    ["ei_loader"] = true,
    ["ei_fast-loader"] = true,
    ["ei_express-loader"] = true,
    ["ei_neo-loader"] = true,
}

local belts = {
    ["transport-belt"] = true,
    ["underground-belt"] = true,
    ["splitter"] = true,
}

local splitters = {
    ["underground-splitter"] = true,
    ["fast-underground-splitter"] = true,
    ["express-underground-splitter"] = true,
}

-- for utility functions
---------------------------------------------------------
local belt_like = {
    "transport-belt",
    "splitter",
    "underground-belt",
    "loader-1x1", 
    "loader-1x2",
    "underground-splitter",
}

local container_like = {
    "container",
    "logistic-container",
    "assembling-machine",
    "furnace",
    "lab",
    "rocket-silo",
    "reactor",
    "boiler",
}

local loader_like = {
    "ei_loader",
    "ei_fast-loader",
    "ei_express-loader",
    "ei_neo-loader",
}

--====================================================================================================
--UTIL FUNCTIONS
--====================================================================================================

-- function underground_splitter_lib.flip_direction(direction)
--     if direction == defines.direction.north then
--         return defines.direction.south
--     elseif direction == defines.direction.south then
--         return defines.direction.north
--     elseif direction == defines.direction.east then
--         return defines.direction.west
--     elseif direction == defines.direction.west then
--         return defines.direction.east
--     end
-- end


-- function underground_splitter_lib.get_splitter_positions(splitter, input_pos, output_pos)
--     local new_input_pos = nil
--     local new_output_pos = nil
--     local new_input_pos2 = nil
--     local new_output_pos2 = nil
    
--     if splitter.direction == defines.direction.north then
--         new_input_pos = {x = input_pos.x + 0.5, y = input_pos.y}
--         new_output_pos = {x = output_pos.x + 0.5, y = output_pos.y}

--         new_input_pos2 = {x = input_pos.x - 0.5, y = input_pos.y}
--         new_output_pos2 = {x = output_pos.x - 0.5, y = output_pos.y}
--     elseif splitter.direction == defines.direction.east then
--         new_input_pos = {x = input_pos.x, y = input_pos.y - 0.5}
--         new_output_pos = {x = output_pos.x, y = output_pos.y - 0.5}

--         new_input_pos2 = {x = input_pos.x, y = input_pos.y + 0.5}
--         new_output_pos2 = {x = output_pos.x, y = output_pos.y + 0.5}
--     elseif splitter.direction == defines.direction.south then
--         new_input_pos = {x = input_pos.x - 0.5, y = input_pos.y}
--         new_output_pos = {x = output_pos.x - 0.5, y = output_pos.y}

--         new_input_pos2 = {x = input_pos.x + 0.5, y = input_pos.y}
--         new_output_pos2 = {x = output_pos.x + 0.5, y = output_pos.y}
--     elseif splitter.direction == defines.direction.west then
--         new_input_pos = {x = input_pos.x, y = input_pos.y + 0.5}
--         new_output_pos = {x = output_pos.x, y = output_pos.y + 0.5}

--         new_input_pos2 = {x = input_pos.x, y = input_pos.y - 0.5}
--         new_output_pos2 = {x = output_pos.x, y = output_pos.y - 0.5}
--     end

--     return new_input_pos, new_output_pos, new_input_pos2, new_output_pos2
-- end


-- function underground_splitter_lib.get_positions(entity, selfPos)
--     -- get the position of the entity and the direction it is facing
--     -- return output and input position

--     -- input [->] output

--     -- or

--     -- input
--     -- [V]
--     -- output

--     -- factorio positions:
--     -- | -y
--     -- |
--     -- ------> +x

--     local output = entity.position
--     local input = entity.position
--     local direction = entity.direction

--     if(selfPos) then
--         output.y = output.y
--         input.y = input.y
--     elseif direction == defines.direction.north then
--         output.y = output.y - 1
--         input.y = input.y + 1
--     elseif direction == defines.direction.east then
--         output.x = output.x + 1
--         input.x = input.x - 1
--     elseif direction == defines.direction.south then
--         output.y = output.y + 1
--         input.y = input.y - 1
--     elseif direction == defines.direction.west then
--         output.x = output.x - 1
--         input.x = input.x + 1
--     end

--     return output, input
-- end

function underground_splitter_lib.get_inserter_direction(direction, inline)
    local x = 0
    local y = 0
    if(inline) then
        if direction == defines.direction.north then
            x = -1
        elseif direction == defines.direction.east then
            y = -1
        elseif direction == defines.direction.south then
            x = 1
        elseif direction == defines.direction.west then
            y = 1
        end
    -- else
    --     if direction == defines.direction.north then
    --         x = 1
    --     elseif direction == defines.direction.east then
    --         y = 1
    --     elseif direction == defines.direction.south then
    --         x = -1
    --     elseif direction == defines.direction.west then
    --         y = -1
    --     end
    end
    return {x, y}
end


-- function underground_splitter_lib.flip_loader_type(loader)
--     if loader.loader_type == "input" then
--         loader.loader_type = "output"
--     elseif loader.loader_type == "output" then
--         loader.loader_type = "input"
--     end
-- end

-- local function create_underground_splitter_inserter(splitter, straight)
--     local new_inserter = splitter.surface.create_entity{
--       name = splitter.name,
--       position = splitter.position,
--       direction = splitter.direction,
--       force = splitter.force,
--       fast_replace = false,
--       spill = false,
--       create_build_effect_smoke = false,
--     }
--     if(straight) then
--             new_inserter.
--     end
--     new_inserter.last_user = splitter.last_user
--     if settings.global["miniloader-lock-stack-sizes"].value then
--       new_inserter.inserter_stack_size_override = 1
--     end
--     return new_inserter
--   end


--====================================================================================================
--SNAPPING LOGIC
--====================================================================================================


--====================================================================================================
--SNAPPERS AND HANDLER
--====================================================================================================

-- building handler
---------------------------------------------------------
function underground_splitter_lib.on_built_entity(e)

    -- -- if entity is a belt
    -- if belts[e.created_entity.type] then
    --     underground_splitter_lib.snap_belt(e.created_entity)
    -- end

    -- if entity is a splitter
    if splitters[e.created_entity.name] then
        -- create a container with limited input



        local s = e.created_entity.surface
		local X = e.created_entity.position.x
		local Y = e.created_entity.position.y
        game.print("splitter on built")

        local insert_pos_inline = underground_splitter_lib.get_inserter_direction(e.created_entity.direction, true)
        local insert_pos_output = underground_splitter_lib.get_inserter_direction(e.created_entity.direction, false)
        -- local belt_in = s.create_entity{name = "underground-splitter", position = e.created_entity.position, force = e.created_entity.force, direction = defines.direction.east, type="input"}
        local belt_out = s.create_entity{name = "underground-splitter", position = {e.created_entity.position.x + 4, e.created_entity.position.y} , force = e.created_entity.force, direction = defines.direction.east, type="output"}
        local inserter = s.create_entity{name = "underground-splitter-inserter", position = e.created_entity.position, force= e.created_entity.force, direction=e.created_entity.direction, drop_position = {0, -1} , pickup_position = {0, 1} } --insert_pos_inline
        local inserter2 = s.create_entity{name = "underground-splitter-inserter", position = e.created_entity.position, force= e.created_entity.force, direction=e.created_entity.direction, drop_position = {0, 0} , pickup_position = {0, 1}} --insert_pos_output
    end
end

function underground_splitter_lib.on_remove_entity(e)
    if splitters[e.entity.name] then
        local b = e.entity
		local X = b.position.x
		local Y = b.position.y

        -- storage = b.surface.find_entity("ei_splitter-storage",{X, Y})
        -- if storage ~= nil then
        --     storage.destroy()
        -- end

        -- loader = b.surface.find_entity("underground-belt",{X, Y})
        -- if loader ~= nil then
        --     loader.destroy()
        -- end
    end
end


return underground_splitter_lib