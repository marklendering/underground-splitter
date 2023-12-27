function BuiltEntity(event)
    --	game.players[1].print("builtentity")
    if event.created_entity.name == "underground-splitter" then	
        local e = event.created_entity
        local s = e.surface
        local X = e.position.x
        local Y = e.position.y
        local belt = s.create_entity{name = "underground-belt", position = {X,Y}, force= game.forces.neutral}
        belt.destructible = false
    elseif event.created_entity.name == "fast-underground-splitter" then	
        local e = event.created_entity
        local s = e.surface
        local X = e.position.x
        local Y = e.position.y
        local belt = s.create_entity{name = "fast-underground-belt", position = {X,Y}, force= game.forces.neutral}
        belt.destructible = false
    elseif event.created_entity.name == "express-underground-splitter" then	
        local e = event.created_entity
        local s = e.surface
        local X = e.position.x
        local Y = e.position.y
        local belt = s.create_entity{name = "express-underground-belt", position = {X,Y}, force= game.forces.neutral}
        belt.destructible = false
    end
end
    
function MinedEntity(event)
    if event.entity.name == "underground-splitter" then
        local b = event.entity
        local X = b.position.x 
        local Y = b.position.y		
        belt = b.surface.find_entity("underground-belt",{X, Y})
        if belt ~= nil then
            belt.destroy()
        end
    elseif event.entity.name == "fast-underground-splitter" then
        local b = event.entity
        local X = b.position.x 
        local Y = b.position.y		
        belt = b.surface.find_entity("fast-underground-belt",{X, Y})
        if belt ~= nil then
            belt.destroy()
        end
    elseif event.entity.name == "express-underground-splitter" then
        local b = event.entity
        local X = b.position.x 
        local Y = b.position.y		
        belt = b.surface.find_entity("express-underground-belt",{X, Y})
        if belt ~= nil then
            belt.destroy()
        end
    end
end
    

-- script.on_event(defines.events.on_built_entity, BuiltEntity)
-- script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
-- script.on_event(defines.events.on_preplayer_mined_item , MinedEntity)
-- script.on_event(defines.events.on_entity_died , MinedEntity)
-- script.on_event(defines.events.on_robot_pre_mined  , MinedEntity)