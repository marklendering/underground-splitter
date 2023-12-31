underground_splitter_lib = require("lib/lib-data")


data:extend({
    {
        name = "underground-splitter",
        type = "item",
        icon = underground_splitter_item_path.."underground-splitter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "belt",
        order = "h[underground-splitter]_a",
        place_result = "underground-splitter",
        stack_size = 50
    },
    -- {
    --     name = "fast-underground-splitter",
    --     type = "item",
    --     icon = underground_splitter_item_path.."fast-underground-splitter.png",
    --     icon_size = 64,
    --     icon_mipmaps = 4,
    --     subgroup = "belt",
    --     order = "h[underground-splitter]_b",
    --     place_result = "fast-underground-splitter",
    --     stack_size = 50
    -- },
    -- {
    --     name = "express-underground-splitter",
    --     type = "item",
    --     icon = underground_splitter_item_path.."express-underground-splitter.png",
    --     icon_size = 64,
    --     icon_mipmaps = 4,
    --     subgroup = "belt",
    --     order = "h[underground-splitter]_c",
    --     place_result = "express-underground-splitter",
    --     stack_size = 50
    -- },
    {
        name = "underground-splitter",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"transport-belt", 4},
            {"electronic-circuit", 6},
            {"iron-plate", 6},
        },
        result = "underground-splitter",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "underground-splitter",
    },
    -- {
    --     name = "fast-underground-splitter",
    --     type = "recipe",
    --     category = "crafting",
    --     energy_required = 3,
    --     ingredients =
    --     {
    --         {"underground-splitter", 1},
    --         {"electronic-circuit", 20},
    --         {"iron-gear-wheel", 20},
    --     },
    --     result = "fast-underground-splitter",
    --     result_count = 1,
    --     enabled = false,
    --     always_show_made_in = true,
    --     main_product = "fast-underground-splitter",
    -- },
    -- {
    --     name = "express-underground-splitter",
    --     type = "recipe",
    --     category = "crafting",
    --     energy_required = 4,
    --     ingredients =
    --     {
    --         {"fast-underground-splitter", 1},
    --         {"advanced-circuit", 20},
    --         {"iron-gear-wheel", 40},
    --     },
    --     result = "express-underground-splitter",
    --     result_count = 1,
    --     enabled = false,
    --     always_show_made_in = true,
    --     main_product = "express-underground-splitter",
    -- },
})

-- add entities

local belt = data.raw["transport-belt"]["transport-belt"]
local fast_belt = data.raw["transport-belt"]["fast-transport-belt"]
local express_belt = data.raw["transport-belt"]["express-transport-belt"]


underground_splitter_lib.make_splitter(nil, "fast-underground_splitter", belt.belt_animation_set, belt.speed)

-- underground_splitter_lib.make_loader("fast", "express-underground_splitter", fast_belt.belt_animation_set, fast_belt.speed)
-- underground_splitter_lib.make_loader("express", nil, express_belt.belt_animation_set, express_belt.speed)