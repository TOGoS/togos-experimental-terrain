local noise = require('noise')

--data.raw.tile["out-of-map"].autoplace = {
--  probability_expression = (noise.var("elevation") - 25) * 1.5,
--}

local function rock_sprite(x, y)
  return
  {
    picture = "__togos-experimental-terrain__/graphics/terrain/rock/rock2.png",
    count = 1,
    size = 1,
    scale = 2,
    x = x * 16,
    y = y * 16,
  }
end
--local main_rock_pic = rock_sprite(0, 4)
local main_rock_pic =
{
  picture = "__base__/graphics/terrain/out-of-map.png",
  count = 1,
  size = 1,
  scale = 1,
}
local empty_mask =
{
  picture = "__togos-experimental-terrain__/graphics/terrain/rock/side-mask.png",
  count = 1,
  scale = 2,
}

data:extend
{
  {
    name = "mountain",
    type = "tile",
    collision_mask =
    {
      "ground-tile",
      -- "water-tile",
      -- "resource-layer",
      -- "floor-layer",
      -- "item-layer",
      -- "object-layer",
      -- "player-layer",
      -- "doodad-layer"
    },
    autoplace = {
        probability_expression = noise.var("elevation") - 20,
    },
    -- because of the way collisions work (the boundary is *inside* our tile)
    -- we need to put this at a low layer,
    -- so that bordering tiles will be drawn over it
    layer_group = "zero",
    layer = 0,
    
    variants =
    {
      main =
      {
        main_rock_pic
      },
      inner_corner_mask = empty_mask,
      --[[
      inner_corner = rock_sprite(0,0),
      inner_corner_mask =
      {
        picture = "__togos-experimental-terrain__/graphics/terrain/rock/inner-corner-mask.png",
	count = 1,
	scale = 2,
      },
      --]]
      outer_corner_mask = empty_mask,
      side_mask = empty_mask,
    },
    map_color={r=60, g=30, b=0},
    pollution_absorption_per_second = 0,
  }
}
