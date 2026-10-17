local Registries = require("selene.registries")
local Resources = require("selene.resources")
local Maps = require("selene.map")
local Dimensions = require("selene.dimensions")
local Saves = require("selene.saves")
local Doors = require("gobaith_doors")
local Signposts = require("gobaith_signposts")
local Depots = require("gobaith_depots")
local Altars = require("gobaith_altars")
local Portals = require("gobaith_portals")
local ExplorerStones = require("gobaith_explorer_stones")

function convertMap(tilesFile)
    local basePath = tilesFile:gsub(".tiles.txt", "")
    local baseName = basePath:gsub("illarion%-gobaith%-map/server/maps/", "")
    local outputPath = "maps/partial/" .. baseName .. ".selenemap"
    -- Skip if a converted version of this map is already present
    if Saves.has(outputPath) then
        return outputPath
    end

    local unknownTiles = {}
    local unknownItems = {}

    local map = Maps.create()
    local tilesInput = Resources.loadAsString(tilesFile)
    local header = {}
    local startX, startY, z
    for line in tilesInput:gmatch("([^\n]*)\n?") do
        if stringx.trim(line) ~= "" and stringx.trim(line):sub(1, 1) ~= "#" then
            -- Headers are in the format Key: Value
            local key, value = line:match("([^:]+):([^;]+);?")
            if key then
                header[key] = stringx.trim(value)
                if key == "X" then
                    startX = tonumber(header["X"])
                elseif key == "Y" then
                    startY = tonumber(header["Y"])
                elseif key == "L" then
                    z = tonumber(header["L"]) - 31000
                end
            else
                -- Tiles are in the format X;Y;Tile;Music
                local x, y, combinedTileId, music = line:match("(-?%d+);(-?%d+);(%d+);(%d+)")

                local BASE_MASK = 0x001F
                local OVERLAY_MASK = 0x03E0
                local SHAPE_MASK = 0xFC00
                local tileId = tonumber(combinedTileId)
                if (tileId & SHAPE_MASK) ~= 0 then
                    tileId = tileId & BASE_MASK
                end

                local tile = Registries.findByName("tiles", "illarion:tile_" .. tileId)
                if tile ~= nil and tileId ~= 0 then
                    map:placeTile(startX + tonumber(x), startY + tonumber(y), z, tile:getName())
                elseif tileId ~= 0 then
                    unknownTiles[tileId] = unknownTiles[tileId] and unknownTiles[tileId] + 1 or 1
                end
            end
        end
    end
    local itemsInput = Resources.loadAsString(basePath .. ".items.txt")
    for line in itemsInput:gmatch("([^\n]*)\n?") do
        if stringx.trim(line) ~= "" and stringx.trim(line):sub(1, 1) ~= "#" then
            -- Items are in the format X;Y;Item;Quality
            local x, y, itemId, quality = line:match("(-?%d+);(-?%d+);(-?%d+);(-?%d+)")
            local worldX, worldY = tonumber(x) + startX, tonumber(y) + startY
            local annotations
            itemId, annotations = Doors.convert(worldX, worldY, z, tonumber(itemId), quality)
            annotations = Altars.convert(worldX, worldY, z) or annotations
            local tile = Registries.findByMetadata("tiles", "itemId", itemId)
            if tile == nil then
                unknownItems[tonumber(itemId)] = quality
            else
                map:placeTile(worldX, worldY, z, tile:getName())
                if annotations then
                    map:annotateTile(worldX, worldY, z, tile:getName(), annotations)
                end
            end
        end
    end
    local warpsInput = Resources.loadAsString(basePath .. ".warps.txt")
    for line in warpsInput:gmatch("([^\n]*)\n?") do
        if stringx.trim(line) ~= "" and stringx.trim(line):sub(1, 1) ~= "#" then
            -- Warps are in the format X;Y;ToX;ToY;ToLevel
            local x, y, toX, toY, toLevel = line:match("(-?%d+);(-?%d+);(-?%d+);(-?%d+);(-?%d+)")
            map:annotateTile(tonumber(x) + startX, tonumber(y) + startY, z, "illarion:warp", {
                x = tonumber(toX),
                y = tonumber(toY),
                z = tonumber(toLevel) - 31000
            })
        end
    end

    for k, v in pairs(unknownTiles) do
        print("Unknown tile id " .. k .. " in " .. baseName .. " (x " .. v .. ")")
    end
    for k, v in pairs(unknownItems) do
        print("Unknown item id " .. k .. " in " .. baseName)
    end

    print("Saving " .. outputPath)
    Saves.save(map, outputPath)
    return outputPath
end

local mergedMapPath = "maps/illarion-gobaith.selenemap"
if not Saves.has(mergedMapPath) then
    local mergedMap = Maps.create()
    local files = Resources.listFiles("illarion-gobaith-map", "server/maps/*.tiles.txt")
    for _, file in pairs(files) do
        local outputPath = convertMap(file)
        local mapTree = Saves.load(outputPath)
        if mapTree then
            mergedMap:merge(mapTree)
        else
            print("Failed to load " .. outputPath)
        end
    end
    local depotTile = assert(Registries.findByMetadata("tiles", "itemId", 321), "Missing depot tile")
    Depots.apply(mergedMap, depotTile)
    local portalTile = assert(Registries.findByMetadata("tiles", "itemId", 10), "Missing portal tile")
    Portals.apply(mergedMap, portalTile)
    if ExplorerStones.enabled then
        local stoneTile = assert(Registries.findByMetadata("tiles", "itemId", 1272), "Missing explorer stone tile")
        ExplorerStones.apply(mergedMap, stoneTile)
    end
    Signposts.apply(mergedMap)
    Saves.save(mergedMap, mergedMapPath)
end

print("Loading " .. mergedMapPath)
local gobaithMap = Saves.load(mergedMapPath)
Dimensions.getDefault():setMap(gobaithMap)
