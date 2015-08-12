local libFilters = LibStub("libFilters")

local function HideBoundItems()
	local function filterCallback(slot)
		return not IsItemBound(slot.bagId, slot.slotIndex)
	end

	libFilters:RegisterFilter("HideBoundItems", LAF_BAGS, filterCallback)
end

local function UnhideBoundItems()
	libFilters:UnregisterFilter("HideBoundItems", LAF_BAGS)
end

EVENT_MANAGER:RegisterForEvent("HideBoundItems", EVENT_OPEN_GUILD_BANK, HideBoundItems)
EVENT_MANAGER:RegisterForEvent("UnhideBoundItems", EVENT_CLOSE_GUILD_BANK, UnhideBoundItems)

EVENT_MANAGER:RegisterForEvent("HideBoundItems", EVENT_OPEN_TRADING_HOUSE, HideBoundItems)
EVENT_MANAGER:RegisterForEvent("UnhideBoundItems", EVENT_OPEN_TRADING_HOUSE, UnhideBoundItems)
