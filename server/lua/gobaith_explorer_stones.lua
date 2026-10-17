-- These example registrations were disabled in the legacy reload script.
local M = {enabled = false}
local stones = {}
local function AddExplorerStone(x, y, z, number, value)
    stones[#stones + 1] = {x = x, y = y, z = z, data = tostring(number), quality = value}
end

    AddExplorerStone(10, 0, 0, 0, 1);
    AddExplorerStone(12, 0, 0, 1, 1);
    AddExplorerStone(11, 3, 0, 2, 1);

function M.apply(map, tile)
    if not M.enabled then return end
    local name = tile:getName()
    for _, stone in ipairs(stones) do
        map:removeTile(stone.x, stone.y, stone.z, name)
        map:placeTile(stone.x, stone.y, stone.z, name)
        map:annotateTile(stone.x, stone.y, stone.z, name, {
            data = stone.data, quality = stone.quality
        })
    end
end
return M
