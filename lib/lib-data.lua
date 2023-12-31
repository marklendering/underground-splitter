local underground_splitter_lib = {}


local empty_sheet = {
    filename = "__core__/graphics/empty.png",
    priority = "very-low",
    width = 1,
    height = 1,
    frame_count = 1,
  }

--====================================================================================================
--BASE PROTOTYPES
--====================================================================================================



local splitter = util.table.deepcopy(data.raw["underground-belt"]["underground-belt"])

splitter.name = "underground_splitter"
-- splitter.selection_box = {{0,0}, {0,0}}
splitter.structure = {
    direction_in = {
        sheet = {
            filename = underground_splitter_entity_path.."underground-splitter.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106*2,
            height = 85*2,
            y = 85*2,
            scale = 0.25
        }
    },
    direction_out = {
        sheet = {
            filename = underground_splitter_entity_path.."underground-splitter.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106*2,
            height = 85*2,
            scale = 0.25
        }
    }
}



--====================================================================================================
--UTIL FUNCTIONS
--====================================================================================================

function underground_splitter_lib.make_splitter(tier, next_upgrade, belt_animation_set, speed)
    local splitter = table.deepcopy(splitter)

    if tier then
        tier = tier .. "-"
    else
        tier = ""
    end

    splitter.name = ""..tier.."underground-splitter"
    splitter.icon = underground_splitter_item_path..tier.."underground-splitter.png"
    splitter.minable.result = ""..tier.."underground-splitter"
    splitter.speed = speed
    splitter.belt_animation_set = belt_animation_set
    splitter.structure.direction_in.sheet.filename = underground_splitter_entity_path..tier.."underground-splitter.png"
    splitter.structure.direction_out.sheet.filename = underground_splitter_entity_path..tier.."underground-splitter.png"

    data:extend({splitter})

    underground_splitter_lib.create_inserters(tier, next_upgrade, util.color("ffc340D1"))

end

function underground_splitter_lib.create_inserters(tier, next_prefix, tint)
    local underground_splitter = tier .. "underground-splitter"
    local name = underground_splitter .. "-inserter"
    local next_upgrade = nil --next_upgrade and next_upgrade .. "underground-splitter-inserter"
    local base_entity = data.raw["underground-belt"][underground_splitter]
    local rounded_items_per_second = math.floor(base_entity.speed * 480 * 100 + 0.5) / 100
    local description = {"",
      "[font=default-semibold][color=255,230,192]", {"description.belt-speed"}, ":[/color][/font] ",
      rounded_items_per_second, " ", {"description.belt-items"}, {"per-second-suffix"}}
  
    local underground_splitter_inserter = {
      type = "inserter",
      name = name,
      -- this name and icon appear in the power usage UI
      localised_name = {"entity-name." .. underground_splitter},
      localised_description = description,
      icon = underground_splitter_item_path..tier.."underground-splitter.png",
      icon_size = 64,
      minable = { mining_time = 0.1, result = underground_splitter },
      collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
      collision_mask = {"floor-layer", "object-layer", "water-tile"},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      selection_priority = 50,
      allow_custom_vectors = true,
      energy_per_movement = ".0000001J",
      energy_per_rotation = ".0000001J",
      energy_source = {
        type = "void",
      },
      extension_speed = 1,
      rotation_speed = 0.5,
      fast_replaceable_group = "miniloader-inserter",
      pickup_position = {0, 0},
      insert_position = {0, 0},
      draw_held_item = false,
      draw_inserter_arrow = false,
      platform_picture = {
        sheet = {
          filename = underground_splitter_entity_path.."underground-splitter.png",
          priority = "extra-high",
          shift = {0.15625, 0.0703125},
          width = 106*2,
          height = 85*2,
          scale = 0.25
        }
        -- sheets = {
        --   -- Base
        --   {
        --     filename = "__miniloader__/graphics/entity/miniloader-inserter-base.png",
        --     width    = 96,
        --     height   = 96,
        --     y        = 96,
        --     hr_version = 
        --     {
        --       filename = "__miniloader__/graphics/entity/hr-miniloader-inserter-base.png",
        --       height   = 192,
        --       priority = "extra-high",
        --       scale    = 0.5,
        --       width    = 192,
        --       y        = 192
        --     }
        --   },
        --   -- Mask
        --   {
        --     filename = "__miniloader__/graphics/entity/miniloader-structure-mask.png",
        --     width    = 96,
        --     height   = 96,
        --     y        = 96,
        --     tint	 = tint,
        --     hr_version = 
        --     {
        --       filename = "__miniloader__/graphics/entity/hr-miniloader-structure-mask.png",
        --       height   = 192,
        --       priority = "extra-high",
        --       scale    = 0.5,
        --       width    = 192,
        --       y        = 192,
        --       tint     = tint
        --     }
        --   },
        --   -- Shadow
        --   {
        --     filename = "__miniloader__/graphics/entity/miniloader-structure-shadow.png",
        --     width    = 96,
        --     height   = 96,
        --     y        = 96,
        --     draw_as_shadow = true,
        --     hr_version = 
        --     {
        --       filename = "__miniloader__/graphics/entity/hr-miniloader-structure-shadow.png",
        --       height   = 192,
        --       priority = "extra-high",
        --       scale    = 0.5,
        --       width    = 192,
        --       y        = 192,
        --       draw_as_shadow = true,
        --     }
        --   }
        -- }
      },
      hand_base_picture = empty_sheet,
      hand_open_picture = empty_sheet,
      hand_closed_picture = empty_sheet,
      next_upgrade = next_upgrade,
    }
  
    -- --Space Exploration
    -- if (prefix == "space-") or (prefix == "deep-space-") then
    --   underground_splitter_inserter.collision_mask = {"floor-layer", "item-layer", "object-layer", "water-tile"}
    -- end
  
    for _,k in ipairs{"flags", "max_health", "resistances", "vehicle_impact_sound"} do
      underground_splitter_inserter[k] = base_entity[k]
    end

  
    data:extend{underground_splitter_inserter}


  end

return underground_splitter_lib


