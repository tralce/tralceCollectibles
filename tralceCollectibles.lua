tralceCollectibles = {
  name = "tralceCollectibles",

  collectibles = {
    -- Tools --
    [  336] = "Tool_FinvirsTrinket",
    [  341] = "Tool_AlmalexiasEnchantedLantern",
    [ 8006] = "Tool_AntiquariansEye",
    [ 8883] = "Tool_RelicOfTheSentinel",
    -- Assistants --
    [  267] = "Asst_TythisAndromo",
    [  300] = "Asst_Pirharri",
    [  301] = "Asst_Nuzimeh",
    [ 6376] = "Asst_Ezabi",
    [ 6378] = "Asst_Fezez",
    [ 8994] = "Asst_BaronJangleplume",
    [ 8995] = "Asst_PeddlerOfPrizes",
    [ 9245] = "Comp_BastianHallix",
    [ 9353] = "Comp_MirriElendis",
    [ 9743] = "Asst_FactotumPropertySteward",
    [ 9744] = "Asst_FactotumCommerceDelegate",
    [ 9745] = "Asst_Ghrashorog",
    [ 9911] = "Comp_Ember",
    [ 9912] = "Comp_IsobelVeloise",
    [10184] = "Asst_Giladil_the_Ragpicker",
    [10617] = "Asst_Aderene",
    [10618] = "Asst_Zuqoth",
    [11059] = "Asst_Hoarfrost",
    [11097] = "Asst_Pyroclast",
    [11113] = "Comp_SharpAsNight",
    [11114] = "Comp_Azandar",
    [11876] = "Asst_Drinweth",
    -- Mementos --
    [  335] = "Meme_BlackFeatherCourtWhistle",
    [  337] = "Meme_LodorrsCrown",
    [  342] = "Meme_QuestionableMeatSack",
    [  343] = "Meme_BatteredBearTrap",
    [  344] = "Meme_NirnrootWine",
    [  347] = "Meme_FetishOfAnger",
    [  348] = "Meme_BonesnapBindingStone",
    [  349] = "Meme_TokenOfRootSunder",
    [  350] = "Meme_YokudanTotem",
    [  351] = "Meme_Mezha-drosSealingAmulet",
    [  352] = "Meme_NanwenSword",
    [  353] = "Meme_MalacathsWrathfulFlame",
    [  361] = "Meme_CoinOfIllusoryRiches",
    [  596] = "Meme_StormAtronachTransform",
    [  598] = "Meme_JugglersKnives",
    [ 1158] = "Meme_TwilightShard",
    [ 1228] = "Meme_NeramosLightningStick",
    [ 1229] = "Meme_DreamersChime",
    [ 1382] = "Meme_ClockworkObscuros",
    [ 4663] = "Meme_UmbralProjector",
    [ 4789] = "Meme_WyrdElementalPlume",
    [ 5036] = "Meme_SeaSloadDorsalFin",
    [ 5234] = "Meme_MurkmireGrave-Stake",
    [ 5733] = "Meme_KickBall",
    [ 5889] = "Meme_PrismaticBannerRibbon",
    [ 6046] = "Meme_DragonFlightIllusionGem",
    [ 6641] = "Meme_DragonhornCurio",
    [ 7225] = "Meme_WallOfLifeBrush",
    [ 7596] = "Meme_MiniatureDwarvenSun",
    [ 7862] = "Meme_RitualCircleTotem",
    [ 7863] = "Meme_AntiquariansTelescope",
    [ 8008] = "Meme_CampfireKit",
    [ 8072] = "Meme_MostlyStableJugglingPotions",
    [ 8656] = "Meme_TemproaryCandleflyLantern",
    [ 8831] = "Meme_TempermentalGrimoire",
    [ 8834] = "Meme_VoidShard",
    [ 9007] = "Meme_DaedricUnwardingAmulet",
    [ 9361] = "Meme_InfernoCleats",
    [ 9362] = "Meme_ImpartialDecisionCoin",
    [ 9363] = "Meme_Full-ScaleGoldenAnvilReplica",
    [ 9364] = "Meme_WiltingWeedKillerPhial",
    [ 9530] = "Meme_WitchsBonfireDust",
    [ 9591] = "Meme_AgonymiumStone",
    -- Throwables --
    [  601] = "Thro_MudBallPouch",
    [ 1108] = "Thro_CherryBlossomBranch",
    [ 6932] = "Thro_EverlastingSnowball",
    [ 1385] = "Thro_MurderousStrike",
    -- XP --
    [  479] = "XP_WitchWhistle",
    [ 1167] = "XP_PieofMisrule",
    [ 1168] = "XP_BredasMead",
    [11089] = "XP_Cake2023",
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

	ZO_CreateStringId("SI_BINDING_NAME_trC_Mount_Player", "Mount Group Member")
  ZO_CreateStringId("SI_BINDING_NAME_trC_Mount_RandomFav", "Set Mount to Random Favorite")
  ZO_CreateStringId("SI_BINDING_NAME_trC_Mount_Random", "Set Mount to Random")

  EVENT_MANAGER:UnregisterForEvent(tralceCollectibles.name, EVENT_ADD_ON_LOADED)

  for id, code in pairs(tralceCollectibles.collectibles) do
    local name, _, _, _, unlocked = GetCollectibleInfo(id)
    if (unlocked) then
      ZO_CreateStringId("SI_BINDING_NAME_" .. code, zo_strformat(SI_COLLECTIBLE_NAME_FORMATTER, name))
    end
  end

end

-- Function shamelessly stolen from RidinDirty
function tralceCollectibles.DistanceToUnit(unitID)
	local _, selfX, selfY, selfH = GetUnitWorldPosition("player")
	local _, targetX, targetY, targetH = GetUnitWorldPosition(unitID)
	local nDistance = zo_distance3D(targetX, targetY, targetH, selfX, selfY, selfH) / 100
	return nDistance
end

-- Function shamelessly stolen from RidinDirty
function tralceCollectibles.MountPlayer()
  local displayNamePref = nil
  local isMountable = false
  if IsUnitDeadOrReincarnating("player") or IsUnitInCombat("player") or IsMounted() or HasPendingCompanion() then
    df("|cff0055Unable to mount|r")
    return
  end
  for iD = 1, GetGroupSize() do
    local playerID = GetGroupUnitTagByIndex(iD)
    local playerCharName = GetUnitName(playerID)
    local playerDisplayName = GetUnitDisplayName(playerID)
    local mountedState, hasEnabledGroupMount, hasFreePassengerSlot = GetTargetMountedStateInfo(playerDisplayName)
    if mountedState == MOUNTED_STATE_MOUNT_RIDER and hasEnabledGroupMount and hasFreePassengerSlot then isMountable = true else isMountable = false end
    if not ZO_ShouldPreferUserId() then displayNamePref = playerCharName else displayNamePref = playerDisplayName end
    displayNamePref = zo_strformat("<<1>>", displayNamePref)
    if playerDisplayName ~= GetUnitDisplayName("player") and IsUnitOnline(playerID) and IsUnitInGroupSupportRange(playerID) and isMountable and tralceCollectibles.DistanceToUnit(playerID) < 5.0 then
      df("|cff0055Attempting to mount|r")
      UseMountAsPassenger(playerDisplayName)
      return
    end
  end
  df("|cff0055Unable to mount|r")
end

EVENT_MANAGER:RegisterForEvent(tralceCollectibles.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

