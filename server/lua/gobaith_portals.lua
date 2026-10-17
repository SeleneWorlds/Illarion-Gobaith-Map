-- Portal destinations, including the magical door out of the GM prison.
local portals = {}
local function AddNoobiaPortal(data, x, y, z)
    portals[#portals + 1] = {data = tostring(data), x = x, y = y, z = z}
end
local AddMagicalDoor = AddNoobiaPortal

    AddMagicalDoor(1, -495, -484, -40); -- leads to hometown of char(from Prison)

	-- in the castle
	---- to towns
	AddNoobiaPortal(1,	69,	35,	101	); -- TB
	AddNoobiaPortal(7,	73,	35,	101	); -- V
	AddNoobiaPortal(5,	73,	33,	101	); -- GB
	AddNoobiaPortal(6,	71,	31,	101	); -- TV
	AddNoobiaPortal(8,	69,	31,	101	); -- SB
	---- to craftmasters
	AddNoobiaPortal(76,	72,	40,	101	); -- cooking and baking
	--AddNoobiaPortal(77,	72,	42,	101	); -- carpentry
	AddNoobiaPortal(78,	72,	44,	101	); -- glassblowing
	--AddNoobiaPortal(79,	72,	46,	101	); -- farming
	AddNoobiaPortal(80,	69,	40,	101	); -- gold-/smithing
	AddNoobiaPortal(81,	69,	42,	101	); -- tailoring
	AddNoobiaPortal(82,	69,	44,	101	); -- mining
	AddNoobiaPortal(83,	69,	46,	101	); -- gem cutting
	--AddNoobiaPortal(84,	69,	48,	101	); -- fishing
	-- at the craftmasters, back to the castle
	AddNoobiaPortal(85,	163,21,	100	);
	AddNoobiaPortal(85,	162,60,	100	);
	AddNoobiaPortal(85,	162,104,100	);
	AddNoobiaPortal(85,	168,156,100	);
	AddNoobiaPortal(85,	108,163,100	);
	AddNoobiaPortal(85,	114,109,100	);
	AddNoobiaPortal(85,	105,30,	100	);
	AddNoobiaPortal(85,	106,66,	100	);
	AddNoobiaPortal(85,	64,	154,100	);

local M = {}
function M.apply(map, tile)
    local name = tile:getName()
    for _, portal in ipairs(portals) do
        map:removeTile(portal.x, portal.y, portal.z, name)
        map:placeTile(portal.x, portal.y, portal.z, name)
        map:annotateTile(portal.x, portal.y, portal.z, name, {
            data = portal.data, quality = 333, wear = 255
        })
    end
end
return M
