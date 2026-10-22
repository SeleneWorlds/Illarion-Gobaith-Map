-- Map-owned door registrations. Repeated coordinates retain the last registration,
-- matching the original reload order. The final argument means unlocked, not opened.
local doors = {}
local function key(x, y, z)
    return x .. ":" .. y .. ":" .. z
end
local function AddDoor(x, y, z, data, unlocked)
    doors[key(x, y, z)] = {data = tostring(data), unlocked = unlocked}
end

    --Zipcode for different regions and settlements

    -- Irundar 1xx
    AddDoor( -42, 193, -9,  100,false); -- Irundar Gate
    AddDoor( -49, 174, -9,  101,false); -- Irundar Smith
    AddDoor( -49, 175, -9,  101,false); -- Irundar Smith
    AddDoor( -35, 195, -9,  102,false); -- Irundar Mage Tower
    AddDoor( -35, 196, -9,  102,false); -- Irundar Mage Tower
    AddDoor( -30, 194, -7,  103,false); -- Irundar Mage Tower
    AddDoor( -53, 159, -9,  104,false); -- Irundar General Store
    AddDoor( -50, 166, -9,  104,false); -- Irundar General Store
    AddDoor( -51, 166, -9,  104,false); -- Irundar General Store
    AddDoor( -47, 147, -9,  105,false); -- Irundar Castle - Advisor
    AddDoor( -45, 149, -9,  105,false); -- Irundar Castle - Advisor
    AddDoor( -44, 150, -8,  106,false); -- Irundar Castle - Bedroom
    AddDoor( -44, 151, -8,  106,false); -- Irundar Castle - Bedroom
    AddDoor( -44, 143, -8,  107,false); -- Irundar Castle - Storage Room
    AddDoor( -49, 142, -8,  108,false); -- Irundar Castle - Tower

    --North (Varshikar/Orc Cave): 10xx
    AddDoor( 163,-449, -3, 1012,false); -- Orc Cell
    AddDoor( 164,-449, -3, 1012,false); -- Orc Cell
    AddDoor( 169,-456, 1, 1011,false); -- Orc Cave
    AddDoor( 177,-453, 1, 1011,false); -- Orc Cave private room
    AddDoor( 188,-444, 1, 1011,true); -- Orc Cave Entrace
    AddDoor( 188,-443, 1, 1011,true); -- Orc Cave Entrace
    AddDoor( 239,-319, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 240,-319, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 245,-350, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 245,-351, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 248,-334, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 248,-335, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 251,-331, -3, 1050,false); -- Notherot Dungeon
    AddDoor( 252,-331, -3, 1050,false); -- Notherot Dungeon
    AddDoor( 258,-331, -3, 1051,false); -- Notherot Dungeon
    AddDoor( 259,-331, -3, 1051,false); -- Notherot Dungeon
    AddDoor( 267,-331, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 274,-331, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 276,-327, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 277,-316, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 277,-327, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 280,-331, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 243,-339, -0, 1060,false); -- flat maggie kemoc
    AddDoor( 238,-327, -0, 1061,true); -- Apartement flat 1
    AddDoor( 235,-336, -0, 1062,false); -- Apartement flat 2
    AddDoor( 235,-341, -0, 1063,false); -- Apartement flat 3
    AddDoor( 256,-308, -0, 1064,false); -- flat Athian
    AddDoor( 264,-310, -0, 1065,false); -- flat Taylor
    AddDoor( 268,-302, -0, 1066,true); -- Libary

    -- Tol Vanima: 20xx
    AddDoor( 408,258,  0, 2001, false); -- Vanima House 1, Lord Acria
    AddDoor( 315,240,  0, 2002, false); -- Vanima House 2, Magnus Magnol
    AddDoor( 316,240,  0, 2002, false); -- Vanima House 2, Magnus Magnol
    AddDoor( 387,151,  0, 2010, false); -- Vanima Workshop
    AddDoor( 388,151,  0, 2010, false); -- Vanima Workshop

    -- Silverbrand 30xx
    AddDoor( 75, -211,  0, 3001, true); -- SB West Gate
    AddDoor( 74, -211,  0, 3001, true); -- SB West Gate
    AddDoor( 81, -215,  0, 3001,false); -- SB West Gate Storage
    AddDoor( 81, -214,  0, 3001,false); -- SB West Gate Storage
	AddDoor( 102,-181, -3, 3001,false); -- SB Clan of Axe
    AddDoor( 102,-180, -3, 3001,false); -- SB Clan of Axe
    AddDoor( 111,-200, -3, 3001,false); -- SB Clan of Hammer
    AddDoor( 110,-200, -3, 3001,false); -- SB Clan of Hammer
    AddDoor( 120,-199, -3, 3001,false); -- SB Shooting Area
    AddDoor( 120,-198, -3, 3001,false); -- SB Shooting Area
    AddDoor( 120,-194, -3, 3001,false); -- SB Great Hall
    AddDoor( 120,-193, -3, 3001,false); -- SB Great Hall
    AddDoor( 138,-174, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 139,-174, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 138,-163, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 137,-163, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 107,-181, -6, 3002,false); -- SB Prisons
    AddDoor( 110,-186, -6, 3002,false); -- SB Prisons
    AddDoor( 105,-186, -6, 3002,false); -- SB Prisons
    AddDoor( 106,-151, -3, 3004,false); -- SB Mine
    AddDoor( 105,-226,  1, 3001,false); -- SB Storage
    AddDoor( 106,-151, -3, 3004,false); -- SB Mine
    AddDoor( 105,-226,  1, 3001,false); -- SB Storage
    AddDoor( 169,-148, -9, 3050,false); -- Goldburg Gate to Mine
    AddDoor( 169,-147, -9, 3050,false); -- Goldburg Gate to Mine
    AddDoor( 161,-168, -3, 3050,false); -- Goldburg Entrance
    AddDoor( 162,-168, -3, 3050,false); -- Goldburg Entrance

    -- Trolls Bane: 40xx
    AddDoor(-129,-102, 0, 4050, true); -- Seahorse Main Entrace
    AddDoor(-130,-102, 0, 4050, true); -- Seahorse Main Entrace
    AddDoor(-136,-105, 0, 4050, true); -- Seahorse Garden Entrace
    AddDoor(-136,-106, 0, 4050, true); -- Seahorse Garden Entrace
    AddDoor(-132,-110, 0, 4050,false); -- Seahorse Kitchen
    AddDoor(-129,-103, 1, 4050, true); -- Seahorse Balcony
    AddDoor(-127,-110, 0, 4051,false); -- Seahorse Laboratory
    AddDoor(-130,-110, 1, 4051,false); -- Seahorse Room 1
    AddDoor(-127,-110, 1, 4052,false); -- Seahorse Room 2
    AddDoor(-130,-106, 1, 4053, true); -- Seahorse Room 3
    AddDoor(-127,-106, 1, 4054,false); -- Seahorse Room 4
    AddDoor(-111,-106, 0, 4020, true); -- Hospital
    AddDoor( -99,-140, 0, 4035,false); -- Prison Entrance
    AddDoor( -97,-139,-3, 4035,false); -- Prison Cell 1
    AddDoor(-101,-143, 0, 4034,false); -- Prison Office
    AddDoor(-104,-139,-3, 4034,false); -- Prison Cell 2
    AddDoor(-103,-143, 1, 4034,false); -- Prison Cell 3
    AddDoor(-100,-143, 1, 4034,false); -- Prison Cell 4
    AddDoor( -60, -88, 0, 4000, true); -- Towngate
    AddDoor( -61, -88, 0, 4000, true); -- Towngate
    AddDoor(-151, -83, 0, 4000, true); -- Towngate
    AddDoor( -80,-149, 0, 4000, true); -- Towngate
    AddDoor( -80,-150, 0, 4000, true); -- Towngate
    AddDoor(-139, -90, 0, 4041,false); -- Trolls Bane Flathouse 1
    AddDoor(-135, -82, 0, 4041,false); -- Trolls Bane Flathouse 1
    AddDoor(-136, -82, 0, 4041,false); -- Trolls Bane Flathouse 1
    AddDoor( -29, -94, 0, 4031,false); -- Arena
    AddDoor( -95, -94, 0, 4062, true); -- Taverne Entrance 1
    AddDoor( -89, -90, 0, 4062, true); -- Taverne Entrance 2
    AddDoor( -89, -90, 0, 4062, true); -- Taverne Entrance to cellar
    AddDoor( -90,-106,-3, 4061,false); -- Tavern Cellar 1
    AddDoor( -90,-100,-3, 4062,false); -- Tavern Cellar 2
    AddDoor( -87,-110,-3, 4063,false); -- Tavern Cellar 3
    AddDoor( -88, -96,-3, 4064,false); -- Tavern Cellar 4
    AddDoor(  28,-150, 0, 4070,false); -- Miner Guild
    AddDoor(  27,-159, 1, 4070,false); -- Miner Guild
    AddDoor(  23,-143, 0, 4070, true); -- Miner Guild
    AddDoor( -27,-127, 1, 4080,false); -- Garons goldsmith workshop
    AddDoor( -28,-127, 1, 4080,false); -- Garons goldsmith workshop
    AddDoor( -27,-121, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -26,-121, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -29,-127, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -28,-127, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -22,-129,-3, 4080,false); -- Garons goldsmith workshop
    AddDoor( -22,-130,-3, 4080,false); -- Garons goldsmith workshop
    AddDoor(-66,-88, 0, 4021, true); -- Trolls Bane Apartment 1
    AddDoor(-67,-83, 0, 4022, true); -- Trolls Bane Apartment 2

    --Northern Woods (Grey Refuge, Lighthouse): 50xx
    AddDoor( -55,-219, 0, 5014, true); -- GR castle Gate
    AddDoor( -56,-219, 0, 5014, true); -- GR castle Gate
    AddDoor( -57,-227, 0, 5014, true); -- GR Market Hall
    AddDoor( -57,-226, 0, 5014, true); -- GR Market Hall
    AddDoor( -51,-229, 0, 5014,false); -- GR Wehrgang
    AddDoor( -48,-223, 1, 5014,false); -- GR Storage
    AddDoor( -57,-230, 1, 5014,true); -- GR Terrace
    AddDoor( -50,-225, 1, 5014,true); -- GR Terrace
    AddDoor( -58,-238, 0, 5014,false); -- GR Private Rooms
    AddDoor( -61,-235, 0, 5014, true); -- GR Workshop
    AddDoor( -56,-235, 2, 5014, true); -- GR Tower
    AddDoor( -63,-240, 3, 5014, true); -- GR Tower
    AddDoor( -50,-239, 4, 5014, true); -- GR Tower
    AddDoor( -73,-220, 0, 5014, true); -- GR prison Main door
    AddDoor( -71,-217, 0, 5015,false); -- GR prison
    AddDoor( -72,-216, 1, 5015,false); -- GR prison
    AddDoor( -59,-244, 0, 5015,false); -- GR secret door
    AddDoor(-241,-340, 0, 5020,false); -- Witch House in the forest
    AddDoor(-360,-460, 0, 5030,true); -- Nordmark Drachenklan Gate
    AddDoor(-360,-459, 0, 5030,true); -- Nordmark Drachenklan Gate
    AddDoor(-359,-458, 0, 5030,true); -- Nordmark Drachenklan Garden
    AddDoor(-352,-459, 0, 5030,true); -- Nordmark Drachenklan House
    AddDoor(-357,-465, 0, 5030,true); -- Nordmark Door Tailor Shop
    AddDoor(-360,-466, 0, 5032,true); -- Nordmark Gate Tailor workshop
    AddDoor(-360,-467, 0, 5032,true); -- Nordmark Gate Tailor workshop
    AddDoor(-352,-439, 0, 5031,true); -- Nordmark Tavern
    AddDoor(-352,-438, 0, 5031,true); -- Nordmark Tavern
    AddDoor(-347,-437, 0, 5031,true); -- Nordmark Tavern
    AddDoor(-342,-441, 0, 5031,false); -- Nordmark Tavern second room
    AddDoor(-340,-437, 0, 5031,false); -- Nordmark Tavern second room
    AddDoor(-344,-430, 0, 5031,true); -- Nordmark Storage
    AddDoor(-361,-447, 0, 5032,false); -- Nordmark Gate House
    AddDoor(-358,-446, 0, 5032,false); -- Nordmark Gate House

    --Western Woods (Farmer Union, Harbour, Eldan Monastery, Druidenhouse): 60xx
    AddDoor(-416,-136,  0, 6010, true); -- Eldan Monastery Entrace
    AddDoor(-381,-143,  0, 6020, true); -- Druidhouse
    AddDoor(-174,  69,  0, 6031,false); -- Farmer Union
    AddDoor(-170,  67,  0, 6031,false); -- Farmer Union

    -- Greenbriar: 70xx
    AddDoor(-377, 76, 0, 7100,false); -- Greenbriar Taverne
    AddDoor(-374, 83, 0, 7100, true); -- Greenbriar Taverne
    AddDoor(-402, 76, 0, 7121, true); -- Greenbriar House 1
    AddDoor(-417, 77, 0, 7102, true); -- Greenbriar House 2 - Hospital
    AddDoor(-415, 81, 0, 7102, true); -- Greenbriar House 2 - Hospital
    AddDoor(-414, 63, 0, 7105,false); -- Greenbriar House 4
    AddDoor(-417, 62, 0, 7106, true); -- Greenbriar House 4 Bedroom
    AddDoor(-418, 97, 0, 7120, false); -- Greenbriar Jail Entrance
    AddDoor(-417, 95, 0, 7120, false); -- Greenbriar Jail Cell
    AddDoor(-262, 24,-25, 7010, true); -- Hell Briar, Temple Entrace
    AddDoor(-262, 25,-25, 7010, true); -- Hell Briar, Temple Entrace
    AddDoor(-250, 31,-22, 7011,false); -- Hell Briar, Temple Prison
    AddDoor(-250, 27,-22, 7011,false); -- Hell Briar, Temple Prison
    AddDoor(-469, -69, 0, 7200,false); -- Caelum Gate
    AddDoor(-469, -68, 0, 7200,false); -- Caelum Gate

    -- Eastern Woods (Kallahorn, Graveyard, Zzyathis): 80xx

    -- Magic Academy: 90xx
    AddDoor(37, 60,50, 9010, false); -- Magic academy, Main Entrace
    AddDoor(38, 60,50, 9010, false); -- Magic academy, Main Entrace
    AddDoor(31, 31,50, 9010, false); -- Magic academy, Garden Door
    AddDoor(32, 31,50, 9010, false); -- Magic academy, Garden Door
    AddDoor(6, 23,-57, 9020, false); -- Magic academy, Secret Meeting Room
    AddDoor(31, 26,51, 9051, false); -- Magic academy, Sleeping Room 1
    AddDoor(35, 26,51, 9052, false); -- Magic academy, Sleeping Room 2
    AddDoor(41, 26,51, 9053, false); -- Magic academy, Sleeping Room 3
    AddDoor(42, 40,51, 9054, false); -- Magic academy, Sleeping Room 4
    AddDoor(36, 40,51, 9055, false); -- Magic academy, Sleeping Room 5


    -- GM Things: 100xx
    AddDoor(-471,-485,0,10000,false); -- GM Prison

-- Open/closed item pairs from the legacy door definitions.
local closedDoors = {}
local openDoors = {}
local function pair(opened, closed)
    openDoors[opened] = closed
    closedDoors[closed] = true
end
pair(86, 497)
pair(87, 922)
pair(927, 925)
pair(928, 925)
pair(929, 925)
pair(930, 925)
pair(317, 926)
pair(476, 480)
pair(477, 481)
pair(478, 482)
pair(479, 483)
pair(499, 903)
pair(900, 904)
pair(901, 905)
pair(902, 906)
pair(484, 486)
pair(485, 487)
pair(924, 496)
pair(923, 920)
pair(668, 656)
pair(669, 657)
pair(660, 648)
pair(661, 649)
pair(684, 652)
pair(685, 653)
pair(664, 644)
pair(665, 645)
pair(670, 658)
pair(666, 654)
pair(671, 659)
pair(667, 655)
pair(662, 650)
pair(686, 646)
pair(663, 651)
pair(687, 647)
pair(715, 711)
pair(714, 710)
pair(712, 708)
pair(713, 709)
pair(865, 861)
pair(866, 862)
pair(867, 863)
pair(868, 864)

local M = {}
function M.convert(x, y, z, itemId, quality)
    local door = doors[key(x, y, z)]
    if not door or not (openDoors[itemId] or closedDoors[itemId]) then
        return itemId
    end
    if not door.unlocked then
        itemId = openDoors[itemId] or itemId
        quality = 3
    elseif closedDoors[itemId] then
        quality = 2
    end
    return itemId, {data = door.data, quality = door.unlocked and 2 or 3, durability = 99, locked = not door.unlocked and "true" or nil}
end
return M
