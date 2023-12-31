--====================================================================================================
--CONTENT UPDATES
--====================================================================================================

-- add to recipes to techs
table.insert(data.raw["technology"]["logistics"].effects, {
    type = "unlock-recipe",
    recipe = "underground-splitter"
})

-- table.insert(data.raw["technology"]["logistics-2"].effects, {
--     type = "unlock-recipe",
--     recipe = "fast-underground-splitter"
-- })

-- table.insert(data.raw["technology"]["logistics-3"].effects, {
--     type = "unlock-recipe",
--     recipe = "express-underground-splitter"
-- })