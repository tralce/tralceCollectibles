tralceCollectibles = {
  name = "tralceCollectibles",

  collectibles = {
    -- Tools --
    [ 336] = "tool_FinvirsTrinket",
    [8006] = "tool_AntiquariansEye",
    [8883] = "tool_RelicOfTheSentinel",
    -- Assistants --
    [ 267] = "assistant_TythisAndromo",
    [ 300] = "assistant_Pirharri",
    [ 301] = "assistant_Nuzimeh",
    [6376] = "assistant_Ezabi",
    [6378] = "assistant_Fezez",
    [8994] = "assistant_BaronJangleplume",
    [8995] = "assistant_PeddlerOfPrizes",
    [9245] = "companion_BastianHallix",
    [9353] = "companion_MirriElendis",
    [9745] = "assistant_Ghrashorog",
    -- Mementos --
    [ 344] = "memento_NirnrootWine",
    [ 348] = "memento_BonesnapBindingStone",
    [ 353] = "memento_MalacathsWrathfulFlame",
    [ 361] = "memento_CoinOfIllusoryRiches",
    [ 596] = "memento_StormAtronachTransform",
    [ 598] = "memento_JugglersKnives",
    [1158] = "memento_TwilightShard",
    [1228] = "memento_NeramosLightningStick",
    [5733] = "memento_KickBall",
    [5889] = "memento_PrismaticBannerRibbon",
    [6046] = "memento_DragonFlightIllusionGem",
    [6641] = "memento_DragonhornCurio",
    [7225] = "memento_WallOfLifeBrush",
    [7862] = "memento_RitualCircleTotem",
    [8008] = "memento_CampfireKit",
    [8072] = "memento_MostlyStableJugglingPotions",
    [8656] = "memento_TemproaryCandleflyLantern",
    [8834] = "memento_VoidShard",
    [9361] = "memento_InfernoCleats",
    [9362] = "memento_ImpartialDecisionCoin",
    [9530] = "memento_WitchsBonfireDust",
    [9591] = "memento_AgonymiumStone",
    -- Throwables --
    [ 601] = "throwable_MudBallPouch",
    [1108] = "throwable_CherryBlossomBranch",
    [6932] = "throwable_EverlastingSnowball",
    [1385] = "throwable_MurderousStrike",
  }
}

-- Force multi-key bindings. Shamelessly stolen from EssentialHousingTools.
if not KEYBINDING_MANAGER.IsChordingAlwaysEnabled or not KEYBINDING_MANAGER:IsChordingAlwaysEnabled() then
  function KEYBINDING_MANAGER:IsChordingAlwaysEnabled()
    return true
  end
end

local function SpamChatWarning()
  zo_callLater(function()
    d("tralce's Collectible Keybinds: in the next release I will be making a couple code changes, and these may result in you needing to re-bind your keys. Back them up now!")
  end, 2000)
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

EVENT_MANAGER:RegisterForEvent("TCK_SPAM", EVENT_PLAYER_ACTIVATED, SpamChatWarning)

EVENT_MANAGER:RegisterForEvent(tralceCollectibles.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

