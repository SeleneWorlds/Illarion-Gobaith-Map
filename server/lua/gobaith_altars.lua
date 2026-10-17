-- God IDs are map item data; keep these independent of gameplay script loading.
local GOD_CHERGA = 10
local GOD_ELARA = 7
local GOD_ELDAN = 3
local GOD_MALACHIN = 11
local GOD_TANORA = 4
local GOD_THEDEVS = 99
local GOD_THEFIVE = 17
local GOD_USHARA = 1

local altars = {}
local function key(x, y, z)
    return x .. ":" .. y .. ":" .. z
end
local function AddAltar(x, y, z, god)
    altars[key(x, y, z)] = tostring(god)
end

    AddAltar( -477, -488,    0, GOD_THEDEVS);
    AddAltar( -434, -482,    0, GOD_THEDEVS);
    AddAltar( -200, -271,    0, GOD_USHARA);
    AddAltar( -414, -149,    0, GOD_ELDAN);
    AddAltar(  429, -120,    0, GOD_TANORA);
    AddAltar(  -84, -116,    0, GOD_ELARA);
    AddAltar(  363,  217,    0, GOD_THEFIVE);
    AddAltar(  -54,  185,   -9, GOD_TANORA);
    AddAltar(  -25, -213,   -3, GOD_MALACHIN);
    AddAltar(   76,   16,   -6, GOD_CHERGA);
    AddAltar(  369,  217,    1, GOD_THEFIVE);

local M = {}
function M.convert(x, y, z)
    local god = altars[key(x, y, z)]
    if god then return {data = god} end
end
return M
