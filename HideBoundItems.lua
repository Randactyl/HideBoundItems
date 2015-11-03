local libFilters = LibStub("libFilters")

local function filterCallback(slot)
	return not IsItemBound(slot.bagId, slot.slotIndex)
end

local function HideBoundItemsAtBank()
	libFilters:RegisterFilter("HideBoundItems", LAF_BAGS, filterCallback)
end

local function HideBoundItemsAtAuction()
	libFilters:RegisterFilter("HideBoundItems", LAF_GUILDSTORE, filterCallback)
end

local function UnhideBoundItems()
	libFilters:UnregisterFilter("HideBoundItems")
end

EVENT_MANAGER:RegisterForEvent("HideBoundItems", EVENT_OPEN_GUILD_BANK, HideBoundItemsAtBank)
EVENT_MANAGER:RegisterForEvent("UnhideBoundItems", EVENT_CLOSE_GUILD_BANK, UnhideBoundItems)

EVENT_MANAGER:RegisterForEvent("HideBoundItems", EVENT_OPEN_TRADING_HOUSE, HideBoundItemsAtAuction)
EVENT_MANAGER:RegisterForEvent("UnhideBoundItems", EVENT_CLOSE_TRADING_HOUSE, UnhideBoundItems)
