tralceCollectibles = {
  name = "tralceCollectibles",

  collectibles = {
    -- Tools --
    [ 336] = "TRINKET",
    [8006] = "EYE",
    [8883] = "RELICSENTINEL",
    -- Assistants --
    [ 267] = "TYTHIS",
    [ 300] = "PIRHARRI",
    [ 301] = "NUZHIMEH",
    [6376] = "EZABI",
    [6378] = "FEZEZ",
    [8994] = "BARON",
    [8995] = "PEDDLER",
    [9245] = "BASTIAN",
    [9353] = "MIRRI",
    [9745] = "ARMORY",
    -- Mementos --
    [ 344] = "NIRNROOTWINE",
    [ 348] = "BONESNAP",
    [ 353] = "WRATHFLAME",
    [ 361] = "ILLCOIN",
    [ 596] = "STORMATRO",
    [ 598] = "JUGGKNIVES",
    [1158] = "TSHARD",
    [1228] = "LIGHTNINGSTICK",
    [5733] = "KICKBALL",
    [5889] = "RAINBOW",
    [6046] = "DRAGONFLIGHT",
    [6641] = "DRAGONHORN",
    [7225] = "WALLLIFE",
    [7862] = "TOTEM",
    [8008] = "CAMPFIRE",
    [8072] = "MOSTLYSTABLE",
    [8656] = "CANDLEFLY",
    [8834] = "VOIDSHARD",
    [9361] = "INFCLEATS",
    [9362] = "DECCOIN",
    [9530] = "MEM_WITCH_BONFIRE",
    [9591] = "AGONYMIUM",
    -- Throwables --
    [ 601] = "MUDBALL",
    [1108] = "BLOSSOMS",
    [6932] = "SNOWBALL",
    [1385] = "MURDSTRIKE",
  }
}

-- Force multi-key bindings. Shamelessly stolen from EssentialHousingTools.
if not KEYBINDING_MANAGER.IsChordingAlwaysEnabled or not KEYBINDING_MANAGER:IsChordingAlwaysEnabled() then
  function KEYBINDING_MANAGER:IsChordingAlwaysEnabled()
    return true
  end
end

local function OnAddOnLoaded( eventCode, addonName )
  if (addonName ~= tralceCollectibles.name) then return end

  EVENT_MANAGER:UnregisterForEvent(tralceCollectibles.name, EVENT_ADD_ON_LOADED)

  for id, code in pairs(tralceCollectibles.collectibles) do
    local name, _, _, _, unlocked = GetCollectibleInfo(id)
    if (unlocked) then
      ZO_CreateStringId("SI_BINDING_NAME_" .. code, zo_strformat(SI_COLLECTIBLE_NAME_FORMATTER, name))
    end
  end
end

EVENT_MANAGER:RegisterForEvent(tralceCollectibles.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

