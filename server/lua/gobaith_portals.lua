local MagePortals = require("content.mage_portals")
local Registries = require("selene.registries")
-- Portal destinations, including the magical door out of the GM prison.
local portals = {}
local function AddNoobiaPortal(destination, x, y, z)
    portals[#portals + 1] = {destination = destination, x = x, y = y, z = z}
end
local AddMagicalDoor = AddNoobiaPortal

    AddMagicalDoor("illarion:trolls_bane", -495, -484, -40); -- leads to hometown of char(from Prison)

	-- in the castle
	---- to towns
	AddNoobiaPortal("illarion:trolls_bane",	69,	35,	101	); -- TB
	AddNoobiaPortal("illarion:varshikar",	73,	35,	101	); -- V
	AddNoobiaPortal("illarion:greenbriar",	73,	33,	101	); -- GB
	AddNoobiaPortal("illarion:tol_vanima",	71,	31,	101	); -- TV
	AddNoobiaPortal("illarion:silverbrand",	69,	31,	101	); -- SB
	---- to craftmasters
	AddNoobiaPortal("illarion:noobia_cooking_and_baking",	72,	40,	101	); -- cooking and baking
	--AddNoobiaPortal("illarion:noobia_carpentry",	72,	42,	101	); -- carpentry
	AddNoobiaPortal("illarion:noobia_glassblowing",	72,	44,	101	); -- glassblowing
	--AddNoobiaPortal("illarion:noobia_farming",	72,	46,	101	); -- farming
	AddNoobiaPortal("illarion:noobia_gold_and_smithing",	69,	40,	101	); -- gold-/smithing
	AddNoobiaPortal("illarion:noobia_tailoring",	69,	42,	101	); -- tailoring
	AddNoobiaPortal("illarion:noobia_mining",	69,	44,	101	); -- mining
	AddNoobiaPortal("illarion:noobia_gem_cutting",	69,	46,	101	); -- gem cutting
	--AddNoobiaPortal("illarion:noobia_fishing",	69,	48,	101	); -- fishing
	-- at the craftmasters, back to the castle
	AddNoobiaPortal("illarion:noobia_castle",	163,21,	100	);
	AddNoobiaPortal("illarion:noobia_castle",	162,60,	100	);
	AddNoobiaPortal("illarion:noobia_castle",	162,104,100	);
	AddNoobiaPortal("illarion:noobia_castle",	168,156,100	);
	AddNoobiaPortal("illarion:noobia_castle",	108,163,100	);
	AddNoobiaPortal("illarion:noobia_castle",	114,109,100	);
	AddNoobiaPortal("illarion:noobia_castle",	105,30,	100	);
	AddNoobiaPortal("illarion:noobia_castle",	106,66,	100	);
	AddNoobiaPortal("illarion:noobia_castle",	64,	154,100	);

local M = {}
function M.apply(map, tile)
    local name = tile:getName()
    for _, portal in ipairs(portals) do
        map:removeTile(portal.x, portal.y, portal.z, name)
        map:placeTile(portal.x, portal.y, portal.z, name)
        local destination = assert(Registries.findByName("illarion:mage_portal_destinations", portal.destination),
            "Missing portal destination: " .. portal.destination)
        local data = MagePortals.data(destination)
        data.quality, data.wear = 333, 255
        map:annotateTile(portal.x, portal.y, portal.z, name, data)
    end
end
return M
