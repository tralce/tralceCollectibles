tralceCollectibles = {
  name = "tralceCollectibles",

  collectibles = {
    -- Tools --
    [ 336] = "Tool_FinvirsTrinket",
    [8006] = "Tool_AntiquariansEye",
    [8883] = "Tool_RelicOfTheSentinel",
    -- Assistants --
    [ 267] = "Asst_TythisAndromo",
    [ 300] = "Asst_Pirharri",
    [ 301] = "Asst_Nuzimeh",
    [6376] = "Asst_Ezabi",
    [6378] = "Asst_Fezez",
    [8994] = "Asst_BaronJangleplume",
    [8995] = "Asst_PeddlerOfPrizes",
    [9245] = "Comp_BastianHallix",
    [9353] = "Comp_MirriElendis",
    [9745] = "Asst_Ghrashorog",
    -- Mementos --
    [ 344] = "Meme_NirnrootWine",
    [ 348] = "Meme_BonesnapBindingStone",
    [ 353] = "Meme_MalacathsWrathfulFlame",
    [ 361] = "Meme_CoinOfIllusoryRiches",
    [ 596] = "Meme_StormAtronachTransform",
    [ 598] = "Meme_JugglersKnives",
    [1158] = "Meme_TwilightShard",
    [1228] = "Meme_NeramosLightningStick",
    [5733] = "Meme_KickBall",
    [5889] = "Meme_PrismaticBannerRibbon",
    [6046] = "Meme_DragonFlightIllusionGem",
    [6641] = "Meme_DragonhornCurio",
    [7225] = "Meme_WallOfLifeBrush",
    [7862] = "Meme_RitualCircleTotem",
    [8008] = "Meme_CampfireKit",
    [8072] = "Meme_MostlyStableJugglingPotions",
    [8656] = "Meme_TemproaryCandleflyLantern",
    [8834] = "Meme_VoidShard",
    [9361] = "Meme_InfernoCleats",
    [9362] = "Meme_ImpartialDecisionCoin",
    [9530] = "Meme_WitchsBonfireDust",
    [9591] = "Meme_AgonymiumStone",
    -- Throwables --
    [ 601] = "Thro_MudBallPouch",
    [1108] = "Thro_CherryBlossomBranch",
    [6932] = "Thro_EverlastingSnowball",
    [1385] = "Thro_MurderousStrike",
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

