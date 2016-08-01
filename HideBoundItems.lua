local LibFilters = LibStub("LibFilters-2.0")
LibFilters:InitializeLibFilters()

local function filterCallback(slot)
	return not IsItemBound(slot.bagId, slot.slotIndex)
end

local function HideBoundItemsAtBank()
	LibFilters:RegisterFilter("HideBoundItems", LF_GUILDBANK_DEPOSIT, filterCallback)
	LibFilters:RequestUpdate(LF_GUILDBANK_DEPOSIT)
end

local function HideBoundItemsAtAuction()
	LibFilters:RegisterFilter("HideBoundItems", LF_GUILDSTORE_SELL, filterCallback)
	LibFilters:RequestUpdate(LF_GUILDSTORE_SELL)
end

local function UnhideBoundItems()
	LibFilters:UnregisterFilter("HideBoundItems")
	LibFilters:RequestUpdate(LF_GUILDBANK_DEPOSIT)
	LibFilters:RequestUpdate(LF_GUILDSTORE_SELL)
end

EVENT_MANAGER:RegisterForEvent("HideBoundItems", EVENT_OPEN_GUILD_BANK, HideBoundItemsAtBank)
EVENT_MANAGER:RegisterForEvent("UnhideBoundItems", EVENT_CLOSE_GUILD_BANK, UnhideBoundItems)

EVENT_MANAGER:RegisterForEvent("HideBoundItems", EVENT_OPEN_TRADING_HOUSE, HideBoundItemsAtAuction)
EVENT_MANAGER:RegisterForEvent("UnhideBoundItems", EVENT_CLOSE_TRADING_HOUSE, UnhideBoundItems)