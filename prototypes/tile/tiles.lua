local noise = require('noise')

data.raw.tile["out-of-map"].autoplace = {
  probability_expression = (noise.var("elevation") - 25) * 1.5,
}

data:extend
{
  {
    name = "mountain",
    type = "tile",
    collision_mask =
    {
      "water-tile",
      "item-layer",
      "resource-layer",
      "player-layer",
      "doodad-layer",
      "object-layer",
    },
    autoplace = {
        probability_expression = noise.var("elevation") - 20,
    },
    layer = 1,
    variants =
    {
      main =
      {
        {
          picture = "__togos-experimental-terrain__/graphics/terrain/rock.png",
          count = 1,
          size = 1,
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5
        }
      },
      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5
        }
      },
    },
    map_color={r=60, g=30, b=0},
    pollution_absorption_per_second = 0,
  }
}
