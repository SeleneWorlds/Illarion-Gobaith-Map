-- Map-owned depot locations and shared storage IDs, in legacy registration order.
local depots = {}
local function AddDepot(x, y, z, data)
    depots[#depots + 1] = {x = x, y = y, z = z, data = tostring(data)}
end

    AddDepot( 263,-308,  0, 1); -- Varshikar
    AddDepot( -44,-220,  1, 2); -- Graue Rose
    AddDepot( -59,-234,  0, 2); -- Graue Rose
    AddDepot(-403,  74,  0, 3); -- Greenbriar
    AddDepot(-370,  75,  0, 3); -- Greenbriar
    AddDepot(-416,  60,  0, 3); -- Greenbriar
    AddDepot(-415,  75,  0, 3); -- Greenbriar
    AddDepot( 375, 214,  0, 4); -- Tol Vanima
    AddDepot( 307, 224,  0, 4); -- Tol Vanima
    AddDepot( 374, 218, -3, 4); -- Tol Vanima
    AddDepot(-175,  70,  0, 5); -- Farmers Union
    AddDepot(-170,  68, -3, 5); -- Farmers Union
    AddDepot( 176,-450,  1, 6); -- Orc Cave
    AddDepot( 181,-412, -6, 6); -- Orc Cave
    AddDepot( 119,-185, -3, 7); -- Silverbrand
    AddDepot(  92,-212, -3, 7); -- Silverbrand
    AddDepot( 159,-188, -3, 7); -- Silverbrand
    AddDepot( 127,-199, -9, 7); -- Silverbrand
    AddDepot( 116,-203, -3, 7); -- Silverbrand
    AddDepot( 140,-169, -9, 7); -- Silverbrand
    AddDepot( 108,-228,  1, 7); -- Silverbrand
    AddDepot( 139,-202, -3, 7); -- Silverbrand
    AddDepot( 140, -193, 0, 7); -- Silverbrand
    AddDepot(  65,  60, 50, 8); -- Magic Academy
    AddDepot(  40,  62, 50, 8); -- Magic Academy
    AddDepot(  54,  27, 51, 8); -- Magic Academy
    AddDepot( -12,  -4,-57, 8); -- Magic Academy
    AddDepot(-402,-157,  0, 9); -- Eldan & Druids House
    AddDepot(-379,-144,  1, 9); -- Eldan & Druids House
    AddDepot(-263,  22,-25,10); -- Temple of Bjolmur
    AddDepot(-263,  27,-25,10); -- Temple of Bjolmur
    AddDepot(-253,  53,-25,10); -- Temple of Bjolmur
    AddDepot(-253,  55,-25,10); -- Temple of Bjolmur
    AddDepot(-253,  57,-25,10); -- Temple of Bjolmur
    AddDepot(-236,  58,-25,10); -- Temple of Bjolmur
    AddDepot(-251,  37,-22,10); -- Temple of Bjolmur
    AddDepot( -98,-144,  0,11); -- Town Guard
    AddDepot(  31,-157,  0,12); -- Miners Guild
    AddDepot(-348,-463,  0,13); -- Nordmark
    AddDepot(-353,-460,  0,13); -- Nordmark
    AddDepot(-353,-440,  0,13); -- Nordmark
    AddDepot(-361,-461,  0,13); -- Nordmark
    AddDepot(-461, -71,  0,14); -- Caelum
    AddDepot(-470, -72,  0,14); -- Caelum
    AddDepot(-199,   7, -3,15); -- Thief Hideout
    AddDepot(-109,  -97, 0,16); -- Trolls Bane Hospital
    AddDepot(-132, -106, 0,17); -- Trolls Bane Seahorse
    AddDepot(-134,  -85, 0,18); -- Trolls Bane - Flat 1
    AddDepot( -85,  -95, 0,19); -- Trolls Bane Taverne
    AddDepot( -95, -104,-3,19); -- Trolls Bane Taverne
    AddDepot( -95,  -98,-3,19); -- Trolls Bane Taverne
    AddDepot( -22, -127, 0,20); -- Trolls Bane Garon
    AddDepot( 343, -151, 0,21); -- Zzyathis
    AddDepot(-416,   60, 0,22); -- Greenbriar - Creek house
    AddDepot(-416,   74, 8,23); -- Greenbriar - Hospital
    AddDepot(-274,   34, 0,24); -- Hafen
    AddDepot(-235, -343,-3,25); -- Hexenhaus
    AddDepot( 472,  240,-3,26); -- Hellbriar
    AddDepot( 174, -152,-9,27); -- Goldburg
    AddDepot( 160, -180, 0,27); -- Goldburg
    AddDepot(-419,   96, 0,28); -- Greenbriar - Prison
    AddDepot( 385,  149, 0,29); -- Tol Vanima - Workshop
    AddDepot( -73, -68, -3,30); -- Klohaus
    AddDepot( -71, -65,  0,30); -- Klohaus
    AddDepot( 236, -338, 0,31); -- Varshikar - Apartment 3
    AddDepot (269, -327, 0,32); -- Northerot
    AddDepot(115,-184, -3, 33); -- Silverbrand Waffendepot

local M = {}
function M.apply(map, tile)
    local name = tile:getName()
    for _, depot in ipairs(depots) do
        -- Ensure a depot exists even where the source map did not contain one.
        -- Remove the existing depot first to avoid placing a duplicate.
        map:removeTile(depot.x, depot.y, depot.z, name)
        map:placeTile(depot.x, depot.y, depot.z, name)
        map:annotateTile(depot.x, depot.y, depot.z, name, {data = depot.data})
    end
end
return M
