tralceCollectibles = {
  name = "tralceCollectibles",

  collectibles = {
    [ 267] = "TYTHIS",
    [ 300] = "PIRHARRI",
    [ 301] = "NUZHIMEH",
    [ 336] = "TRINKET",
    [ 344] = "NIRNROOTWINE",
    [ 348] = "BONESNAP",
    [ 353] = "WRATHFLAME",
    [ 361] = "ILLCOIN",
    [ 596] = "STORMATRO",
    [ 598] = "JUGGKNIVES",
    [ 601] = "MUDBALL",
    [1108] = "BLOSSOMS",
    [1158] = "TSHARD",
    [1174] = "EBONWOLF",
    [1185] = "SPIDERMOUNT",
    [1228] = "LIGHTNINGSTICK",
    [1232] = "THEOD",
    [1385] = "MURDSTRIKE",
    [5733] = "KICKBALL",
    [5889] = "RAINBOW",
    [6046] = "DRAGONFLIGHT",
    [6376] = "EZABI",
    [6378] = "FEZEZ",
    [6641] = "DRAGONHORN",
    [6932] = "SNOWBALL",
    [7225] = "WALLLIFE",
    [7862] = "TOTEM",
    [8006] = "EYE",
    [8008] = "CAMPFIRE",
    [8072] = "MOSTLYSTABLE",
    [8551] = "SCARAB",
    [8656] = "CANDLEFLY",
    [8834] = "VOIDSHARD",
    [8883] = "RELICSENTINEL",
    [8994] = "BARON",
    [8995] = "PEDDLER",
    [9245] = "BASTIAN",
    [9353] = "MIRRI",
    [9361] = "INFCLEATS",
    [9362] = "DECCOIN",
    [9530] = "MEM_WITCH_BONFIRE",
    [9591] = "AGONYMIUM",
    [9745] = "ARMORY"
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

