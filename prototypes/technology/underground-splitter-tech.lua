
--make splitters upgradeable
-- data.raw["splitter"]["underground-splitter"].next_upgrade = "fast-underground-splitter"
-- data.raw["splitter"]["fast-underground-splitter"].next_upgrade = "express-underground-spliter"
data:extend(
{
{
    type = "technology",
    name = "underground-splitter",
    icon = "__base__/graphics/technology/logistics-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "underground-splitter"
      }
    },
    prerequisites = {"logistics-3"},
        unit =
        {
          count = 300,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        order = "a-f-a",
  }, 
}
)
    