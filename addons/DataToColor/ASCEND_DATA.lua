if not cTar then
    cTar = {
        "target", "focus", "mouseover", "arena1", "arena2", "arena3", "arena4",
        "arena5", "arenapet1", "arenapet2", "arenapet3", "arenapet4",
        "arenapet5", "pettarget", "arena1pet", "arena2pet", "arena3pet",
        "arena4pet", "arena5pet", "party1target", "party2target",
        "party3target", "party4target", "raid1target", "raid2target",
        "raid3target", "raid4target", "raid5target", "raid6target",
        "raid7target", "raid8target", "raid9target", "raid10target",
        "raid11target", "raid12target", "raid13target", "raid14target",
        "raid15target", "raid16target", "raid17target", "raid18target",
        "raid19target", "raid20target", "raid21target", "raid22target",
        "raid23target", "raid24target", "raid25target", "raid26target",
        "raid27target", "raid28target", "raid29target", "raid30target",
        "raid31target", "raid32target", "raid33target", "raid34target",
        "raid35target", "raid36target", "raid37target", "raid38target",
        "raid39target", "raid40target"
    }
end

if not members then
    members = {
        "target", "focus", "mouseover", "player", "pet", "party1", "party2",
        "party3", "party4", "party5", "raid1", "raid2", "raid3", "raid4",
        "raid5", "raid6", "raid7", "raid8", "raid9", "raid10", "raid11",
        "raid12", "raid13", "raid14", "raid15", "raid16", "raid17", "raid18",
        "raid19", "raid20", "raid21", "raid22", "raid23", "raid24", "raid25",
        "raid26", "raid27", "raid28", "raid29", "raid30", "raid31", "raid32",
        "raid33", "raid34", "raid35", "raid36", "raid37", "raid38", "raid39",
        "raid40", "party1pet", "party2pet", "party3pet", "party4pet",
        "party5pet", "raid1pet", "raid2pet", "raid3pet", "raid4pet", "raid5pet",
        "raid6pet", "raid7pet", "raid8pet", "raid9pet", "raid10pet",
        "raid11pet", "raid12pet", "raid13pet", "raid14pet", "raid15pet",
        "raid16pet", "raid17pet", "raid18pet", "raid19pet", "raid20pet",
        "raid21pet", "raid22pet", "raid23pet", "raid24pet", "raid25pet",
        "raid26pet", "raid27pet", "raid28pet", "raid29pet", "raid30pet",
        "raid31pet", "raid32pet", "raid33pet", "raid34pet", "raid35pet",
        "raid36pet", "raid37pet", "raid38pet", "raid39pet", "raid40pet"
    }
end

if SetFunctions == nil then

    function getcTar()
        cTar = {
            "target", "focus", "mouseover", "arena1", "arena2", "arena3",
            "arena4", "arena5", "arenapet1", "arenapet2", "arenapet3",
            "arenapet4", "arenapet5", "pettarget", "arena1pet", "arena2pet",
            "arena3pet", "arena4pet", "arena5pet", "party1target",
            "party2target", "party3target", "party4target", "raid1target",
            "raid2target", "raid3target", "raid4target", "raid5target",
            "raid6target", "raid7target", "raid8target", "raid9target",
            "raid10target", "raid11target", "raid12target", "raid13target",
            "raid14target", "raid15target", "raid16target", "raid17target",
            "raid18target", "raid19target", "raid20target", "raid21target",
            "raid22target", "raid23target", "raid24target", "raid25target",
            "raid26target", "raid27target", "raid28target", "raid29target",
            "raid30target", "raid31target", "raid32target", "raid33target",
            "raid34target", "raid35target", "raid36target", "raid37target",
            "raid38target", "raid39target", "raid40target"
        }

        for j = 1, #cTar do
            for i = 1, #cTar do
                if not UnitExists(cTar[i]) or UnitIsDeadOrGhost(cTar[i]) or
                    not UnitCanAttack("player", cTar[i]) or
                    (UnitIsCharmed(cTar[i]) and
                        (select(2, GetInstanceInfo()) ~= "raid" or
                            select(2, GetInstanceInfo()) ~= "party" or
                            select(2, GetInstanceInfo()) ~= "scenario")) or
                    (not UnitAffectingCombat(cTar[i]) and
                        (select(2, GetInstanceInfo()) == "raid" or
                            select(2, GetInstanceInfo()) == "party" or
                            select(2, GetInstanceInfo()) == "scenario")) then
                    table.remove(cTar, i)
                    break
                end
            end
        end

        delcTar = {}
        for j = 1, #cTar do
            for i = 1, #cTar do
                if (UnitGUID(cTar[i]) == UnitGUID(cTar[j]) and j ~= i) then
                    table.remove(cTar, i)
                    table.insert(cTar, i, "z")
                end
            end
        end

        for j = 1, #cTar do
            for i = 1, #cTar do
                if cTar[i] == "z" then
                    table.remove(cTar, i)
                    break
                end
            end
        end

    end

    function getmembers()
        members = {
            "target", "focus", "mouseover", "player", "pet", "party1", "party2",
            "party3", "party4", "party5", "raid1", "raid2", "raid3", "raid4",
            "raid5", "raid6", "raid7", "raid8", "raid9", "raid10", "raid11",
            "raid12", "raid13", "raid14", "raid15", "raid16", "raid17",
            "raid18", "raid19", "raid20", "raid21", "raid22", "raid23",
            "raid24", "raid25", "raid26", "raid27", "raid28", "raid29",
            "raid30", "raid31", "raid32", "raid33", "raid34", "raid35",
            "raid36", "raid37", "raid38", "raid39", "raid40", "party1pet",
            "party2pet", "party3pet", "party4pet", "party5pet", "raid1pet",
            "raid2pet", "raid3pet", "raid4pet", "raid5pet", "raid6pet",
            "raid7pet", "raid8pet", "raid9pet", "raid10pet", "raid11pet",
            "raid12pet", "raid13pet", "raid14pet", "raid15pet", "raid16pet",
            "raid17pet", "raid18pet", "raid19pet", "raid20pet", "raid21pet",
            "raid22pet", "raid23pet", "raid24pet", "raid25pet", "raid26pet",
            "raid27pet", "raid28pet", "raid29pet", "raid30pet", "raid31pet",
            "raid32pet", "raid33pet", "raid34pet", "raid35pet", "raid36pet",
            "raid37pet", "raid38pet", "raid39pet", "raid40pet"
        }

        for j = 1, #members do
            for i = 1, #members do
                if not UnitExists(members[i]) or UnitIsDeadOrGhost(members[i]) or
                    UnitCanAttack("player", members[i]) or
                    UnitIsCharmed(members[i]) then
                    table.remove(members, i)
                    break
                end
            end
        end

    end

    -------------------------------------

    function clearcTar()

        delcTar = {}
        for j = 1, #cTar do
            for i = 1, #cTar do
                if ecTar[i].Range ~= nil and ecTar[i].Range > 90 then
                    table.remove(cTar, i)
                    table.insert(cTar, i, "z")
                end
            end
        end

        for j = 1, #cTar do
            for i = 1, #cTar do
                if cTar[i] == "z" then
                    table.remove(cTar, i)
                    break
                end
            end
        end

    end

    function clearmembers()

        delmembers = {}
        for j = 1, #members do
            for i = 1, #members do
                if eMembers[i].Range ~= nil and eMembers[i].Range > 50 then
                    table.remove(members, i)
                    table.insert(members, i, "z")
                end
            end
        end

        for j = 1, #members do
            for i = 1, #members do
                if members[i] == "z" then
                    table.remove(members, i)
                    break
                end
            end
        end

    end

    function primaryTarget(unit)

        for i = 1, #members do
            if not IsHealer(members[i]) and
                UnitIsUnit(members[i] .. "target", unit) then
                return true
            end
        end
    end

    function primaryFriendly(unit)

        for i = 1, #cTar do
            if not IsHealer(cTar[i]) and UnitIsUnit(cTar[i] .. "target", unit) then
                return true
            end
        end
    end

    function farestEnemy(Range, Dist)
        far = 0
        away = 0
        for i = 1, #cTar do
            for y = 1, 40 do

                if UnitExists(cTar[i]) and not LineOfSight(cTar[i]) and
                    ecTar[i].Range > y and ecTar[i].Range < Range and
                    ecTar[i].Range > Dist then
                    if y > far then
                        far = y
                        away = i
                    end
                end
            end
        end
        return away
    end

    function farestFriend(Range, Dist)
        farone = 0
        awayone = 0
        for i = 1, #members do
            for y = 1, 40 do

                if UnitExists(members[i]) and not LineOfSight(members[i]) and
                    eMembers[i].Range > y and eMembers[i].Range < Range and
                    eMembers[i].Range > Dist then
                    if y > farone then
                        farone = y
                        awayone = i
                    end
                end
            end
        end
        return awayone
    end

    function farestHealer(Range, Dist)
        farzwo = 0
        awayzwo = 0
        for i = 1, #members do
            for y = 1, 40 do

                if UnitExists(members[i]) and not LineOfSight(members[i]) and
                    eMembers[i].Range > y and eMembers[i].Range < Range and
                    eMembers[i].Range > Dist and IsHealer(members[i]) then
                    if y > farzwo then
                        farzwo = y
                        awayzwo = i
                    end
                end
            end
        end
        return awayzwo
    end

    function onOff(Question)
        if Question == 1 then
            return "\124cA500EE00On\124r"
        else
            return "\124cA5FF0000Off\124r"
        end
    end

    -------------------------------------------------

    function CokxnpcID(t)
        npcIds = tonumber((UnitGUID(t)):sub(-12, -9), 16)
        return npcIds
    end
    --------------------------------------------------
    if not LineOfSight then
        LoSTable = {}
        function LineOfSight(targetCheck, time)
            local time = time or 0.7
            targetGUID = UnitGUID(targetCheck) or 0

            for i = 1, #LoSTable do
                if time < (GetTime() - LoSTable[i].time) then
                    table.remove(LoSTable, i)
                    break
                end
            end

            function LoSCheck(self, event, ...)
                local targetGUID = targetGUID
                local Log = {...}
                local AlreadyTabled = false
                if Log[2] and Log[2] == "SPELL_CAST_FAILED" and targetGUID then
                    if Log[4] and Log[4] == UnitGUID("player") then
                        if Log[15] and Log[15] == SPELL_FAILED_LINE_OF_SIGHT then
                            for j = 1, #LoSTable do
                                if targetGUID == LoSTable[j].unit then
                                    AlreadyTabled = true
                                    break
                                end
                            end
                            if not AlreadyTabled then
                                table.insert(LoSTable, {
                                    unit = targetGUID,
                                    time = GetTime()
                                })
                                targetGUID = nil
                                _G.NovaLineOfSight:UnregisterAllEvents()
                            end
                        end
                    end
                end

            end

            if not NovaLineOfSight then
                frameLOS = CreateFrame("frame", "NovaLineOfSight")
                frameLOS:SetScript("OnEvent", LoSCheck)
            end

            for k = 1, #LoSTable do
                if targetGUID and targetGUID == LoSTable[k].unit then
                    return false
                end
            end

            _G.NovaLineOfSight:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
            return true

        end
    end

    -- if not tLOS then tLOS={} end
    -- if not fLOS then fLOS=CreateFrame("Frame") end
    --
    --	function LineOfSight(target)
    --		local updateRate=0.5
    --		fLOS:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    --		function fLOSOnEvent(self,event,...)
    --			if event=="COMBAT_LOG_EVENT_UNFILTERED" then
    --				local cLOG={...}
    --				if cLOG[2]=="SPELL_CAST_FAILED" then
    --					local player=UnitGUID("player") or ""
    --					if cLOG[4]==player then 
    --						if cLOG[15]==SPELL_FAILED_LINE_OF_SIGHT then
    --							tinsert(tLOS,{unit=target,time=GetTime()})
    --						end
    --					end
    --				else
    --					table.sort(tLOS,function(x,y) return x.time>y.time end)
    --				end
    --			end
    --		end
    --		fLOS:SetScript("OnEvent",fLOSOnEvent)
    --		for i=1,#tLOS do
    --			if tLOS[i]==target then
    --				return true
    --			end
    --		end
    -- end
    --------------------------------------------------

    function GCDCheck(SpellID)
        if (GetSpellCooldown(GetSpellInfo(SpellID)) +
            select(2, GetSpellCooldown(GetSpellInfo(SpellID))) - GetTime() < 0.1) then
            return true
        else
            return false
        end
    end

    function GlyphInUse(id)
        for i = 1, NUM_GLYPH_SLOTS do
            local _, _, _, gid = GetGlyphSocketInfo(i, 1)
            if gid == id then return true end
        end
    end

    --------------------------------------------------

    function HaveBuff(UnitID, SpellID, TimeLeft, Filter)
        if not TimeLeft then TimeLeft = 0 end

        if type(SpellID) == "number" then SpellID = {SpellID} end
        for i = 1, #SpellID do
            local spell, rank = GetSpellInfo(SpellID[i])
            if spell then
                local buff = select(7, UnitBuff(UnitID, spell, rank, Filter))
                if buff and (buff == 0 or buff - GetTime() > TimeLeft) then
                    return true
                end
            end
        end
    end

    --------------------------------------------------

    function HaveDebuff(UnitID, SpellID, TimeLeft, Filter)
        if not TimeLeft then TimeLeft = 0 end

        if type(SpellID) == "number" then SpellID = {SpellID} end
        for i = 1, #SpellID do
            local spell, rank = GetSpellInfo(SpellID[i])
            if spell then
                local debuff =
                    select(7, UnitDebuff(UnitID, spell, rank, Filter))
                if debuff and (debuff == 0 or debuff - GetTime() > TimeLeft) then
                    return true
                end
            end
        end
    end

    --------------------------------------------------

    function CalculateHP(t)
        if UnitExists(t) then
            return (100 * (UnitHealth(t)) / UnitHealthMax(t))
        else
            return 100
        end

    end

    --------------------------------------------------

    function aoeUnits(Count, Range, Facing)
        local x = 0
        for i = 1, #cTar do
            if (ecTar[i].Range <= Range) and
                ((Facing == 1 and ecTar[i].Facing) or (Facing == 0)) then
                x = x + 1
            end
        end
        if x >= Count then return true end

    end

    function aoeHeal(HP, Range)
        local x = 0
        for i = 1, #members do
            if (eMembers[i].Range <= Range) and UnitIsPlayer(members[i]) and
                CalculateHP(members[i]) <= HP then x = x + 1 end
        end
        return x

    end

    --------------------------------------------------

    function ccUnits(Range)
        local x = 0
        for i = 1, #cTar do
            if (ecTar[i].Range <= Range) and
                HaveDebuff(cTar[i], ccCanBreak(), 0) then x = x + 1 end
        end
        if x > 0 then return true end

    end

    --------------------------------------------------

    function GroupInfo()
        table.sort(members,
                   function(x, y) return CalculateHP(x) < CalculateHP(y) end)
    end

    --------------------------------------------------

    function CastClick()
        if IsMouseButtonDown(1) and MainMenuBar:IsShown() then
            local mousefocus = GetMouseFocus()
            if mousefocus and mousefocus.feedback_action then
                SpellCancelQueuedSpell()
                PQR_DelayRotation(1)
            end
        end
    end

    --------------------------------------------------

    function IsHealer(t)
        local class = select(2, UnitClass(t))
        if (class == "DRUID" or class == "PALADIN" or class == "PRIEST" or class ==
            "MONK" or class == "SHAMAN") and UnitPowerMax(t) >= 290000 and
            not UnitBuffID(t, 24858) and not UnitBuffID(t, 15473) and
            not UnitBuffID(t, 324) then return true end
    end
    --------------------------------------------------
    function inRange(t, spellID)
        if UnitExists(t) and IsSpellInRange(GetSpellInfo(spellID), t) == 1 then
            return true
        end
    end

    function redRing(t, spellID, yards, i)
        if inRange(t, spellID) and ecTar[i].Range > yards then
            table.insert(ecTar, i, {Range = yards, Facing = ecTar[i].Facing})
        end
    end
    ------------------------------------------------
    function RangeCheckcTar()
        ecTar = {Range = 100, Facing = false}
        for i = 1, #cTar do
            if UnitExists(cTar[i]) then
                local facing, range = PQR_UnitFacing("player", cTar[i]),
                                      PQR_UnitDistance("player", cTar[i])
                table.insert(ecTar, i, {Range = range, Facing = facing})
            else
                table.insert(ecTar, i, {Range = 100, Facing = false})
            end
        end
        if #cTar < 2 then
            for i = #cTar + 1, 50 do
                table.insert(ecTar, i, {Range = 100, Facing = false})
            end
        end
        for i = 1, #ecTar do
            if ecTar[i].Range == nil then
                table.insert(ecTar, i, {Range = 100, Facing = false})
            end
        end
    end

    ------------------------------------------------------

    function cokxMacros()

        if not GetCVar("MacroSpell") then RegisterCVar("MacroSpell", 0) end
        if not GetCVar("MacroUnit") then RegisterCVar("MacroUnit", 0) end
        if not GetCVar("MacroHP") then RegisterCVar("MacroHP", 0) end

        MacroSpellNumber = tonumber(GetCVar("MacroSpell"))
        MacroUnitNumber = tonumber(GetCVar("MacroUnit"))
        MacroHPNumber = tonumber(GetCVar("MacroHP"))
        MacroCT = 0
        if MacroUnitNumber == 1 then -- TARGET
            MacroCT = "target"
        end
        if MacroUnitNumber == 2 then -- FOCUS
            MacroCT = "focus"
        end
        if MacroUnitNumber == 3 then -- MOUSEOVER
            MacroCT = "mouseover"
        end
        if MacroUnitNumber == 4 then -- ENEMY HEALER
            for i = 1, #cTar do
                if IsHealer(cTar[i]) and GCDCheck(MacroSpellNumber) and
                    not UnitIsDeadOrGhost(cTar[i]) and
                    UnitCanAttack("player", cTar[i]) and
                    inRange(cTar[i], MacroSpellNumber) and LineOfSight(cTar[i]) then
                    MacroCT = cTar[i]
                    break
                end
            end
        end
        if MacroUnitNumber == 5 then -- ENEMY DPS/Tank
            for i = 1, #cTar do
                if not IsHealer(cTar[i]) and not UnitIsUnit("target", cTar[i]) and
                    GCDCheck(MacroSpellNumber) and UnitIsPlayer(cTar[i]) and
                    not UnitIsDeadOrGhost(cTar[i]) and
                    UnitCanAttack("player", cTar[i]) and
                    inRange(cTar[i], MacroSpellNumber) and LineOfSight(cTar[i]) then
                    MacroCT = cTar[i]
                    break
                end
            end
        end
        if MacroUnitNumber == 6 then -- Friendly DPS/Tank
            for i = 1, #members do
                if not IsHealer(members[i]) and GCDCheck(MacroSpellNumber) and
                    CalculateHP(members[i]) <= MacroHPNumber and
                    not UnitIsDeadOrGhost(members[i]) and
                    inRange(members[i], MacroSpellNumber) and
                    LineOfSight(members[i]) then
                    MacroCT = members[i]
                    break
                end
            end
        end
        if MacroUnitNumber == 7 then -- Friendly Healer
            for i = 1, #members do
                if IsHealer(members[i]) and GCDCheck(MacroSpellNumber) and
                    CalculateHP(members[i]) <= MacroHPNumber and
                    not UnitIsDeadOrGhost(members[i]) and
                    inRange(members[i], MacroSpellNumber) and
                    LineOfSight(members[i]) then
                    MacroCT = members[i]
                    break
                end
            end
        end
        if MacroUnitNumber == 8 then -- Enemy (incl. Pets)
            for i = 1, #cTar do
                if not IsHealer(cTar[i]) and not UnitIsUnit("target", cTar[i]) and
                    GCDCheck(MacroSpellNumber) and
                    not UnitIsUnit("target", cTar[i]) and
                    not UnitIsDeadOrGhost(cTar[i]) and
                    UnitCanAttack("player", cTar[i]) and
                    inRange(cTar[i], MacroSpellNumber) and LineOfSight(cTar[i]) then
                    MacroCT = cTar[i]
                    break
                end
            end
        end
        if MacroUnitNumber == 9 then -- Enemy with Offensive CD's
            for i = 1, #cTar do
                if not IsHealer(cTar[i]) and GCDCheck(MacroSpellNumber) and
                    not UnitIsDeadOrGhost(cTar[i]) and
                    UnitCanAttack("player", cTar[i]) and
                    HaveBuff(cTar[i], attentionBuffs(), 1) and
                    inRange(cTar[i], MacroSpellNumber) and LineOfSight(cTar[i]) then
                    MacroCT = cTar[i]
                    break
                end
            end
        end

        if MacroUnitNumber == 10 then -- Friendly Player
            for i = 1, #members do
                if UnitIsPlayer(members[i]) and GCDCheck(MacroSpellNumber) and
                    CalculateHP(members[i]) <= MacroHPNumber and
                    not UnitIsDeadOrGhost(members[i]) and
                    inRange(members[i], MacroSpellNumber) and
                    LineOfSight(members[i]) then
                    MacroCT = members[i]
                    break
                end
            end
        end
    end

    function clearTables()
        eMembers = {}
        cTar = {}
        members = {}
        ePet = {}
        LoSTable = {}
        ecTar = {}
    end

    -------------------------------------------------------
    function RangeCheckMembers()
        eMembers = {Range = 100, Facing = false}
        for i = 1, #members do
            if UnitExists(members[i]) then
                local facing, range = PQR_UnitFacing("player", members[i]),
                                      PQR_UnitDistance("player", members[i])
                table.insert(eMembers, i, {Range = range, Facing = facing})
            else
                table.insert(eMembers, i, {Range = 100, Facing = false})
            end
        end
        if #eMembers < 5 then
            for i = #eMembers + 1, 50 do
                table.insert(eMembers, i, {Range = 100, Facing = false})
            end
        end
        for i = 1, #eMembers do
            if eMembers[i].Range == nil then
                table.insert(eMembers, i, {Range = 100, Facing = false})
            end
        end
    end
    ----------------------------------------------------------
    function RangeCheckPet()
        ePet = {PRange = 100, TRange = 100}
        if UnitExists("pet") then
            local trange, prange = PQR_UnitDistance("pet", "pettarget"),
                                   PQR_UnitDistance("player", "pet")
            table.insert(ePet, 1, {TRange = trange, PRange = prange})
        else
            table.insert(ePet, 1, {TRange = 100, PRange = 100})
        end
    end

    -----------------------------------------------------------

    -- Nova Notification Frame
    -- Update Debug Frame
    Nova_NotifyFrame = nil
    function Nova_NotifyFrame_OnUpdate()
        if (Nova_NotifyFrameTime < GetTime() - 0.2) then
            local alpha = Nova_NotifyFrame:GetAlpha()
            if (alpha ~= 0) then
                Nova_NotifyFrame:SetAlpha(alpha - .5)
            end
            if (aplha == 0) then Nova_NotifyFrame:Hide() end
        end
    end
    -- Debug messages.
    function Nova_Notify(message)
        Nova_NotifyFrame.text:SetText(message)
        Nova_NotifyFrame:SetAlpha(1)
        Nova_NotifyFrame:Show()
        Nova_NotifyFrameTime = GetTime()
    end
    -- Debug Notification Frame
    Nova_NotifyFrame = CreateFrame('Frame')
    Nova_NotifyFrame:ClearAllPoints()
    Nova_NotifyFrame:SetHeight(300)
    Nova_NotifyFrame:SetWidth(300)
    Nova_NotifyFrame:SetScript('OnUpdate', Nova_NotifyFrame_OnUpdate)
    Nova_NotifyFrame:Hide()
    Nova_NotifyFrame.text = Nova_NotifyFrame:CreateFontString(nil, 'BACKGROUND',
                                                              'PVPInfoTextFont')
    Nova_NotifyFrame.text:SetAllPoints()
    Nova_NotifyFrame:SetPoint('LEFT', 40, -75)
    Nova_NotifyFrameTime = 0

    function CastClick()
        if IsMouseButtonDown(1) and MainMenuBar:IsShown() then
            local mousefocus = GetMouseFocus()
            if mousefocus and mousefocus.feedback_action then
                SpellCancelQueuedSpell()
                PQR_DelayRotation(1)
            end
        end
    end

    -- xrn Chat Overlay 
    local function onUpdate(self, elapsed)
        if self.time < GetTime() - 2.8 then
            if self:GetAlpha() == 0 then
                self:Hide()
            else
                self:SetAlpha(self:GetAlpha() - .05)
            end
        end
    end
    xrn = CreateFrame("Frame", nil, ChatFrame1)
    xrn:SetSize(ChatFrame1:GetWidth(), 30)
    xrn:Hide()
    xrn:SetScript("OnUpdate", onUpdate)
    xrn:SetPoint("TOP", 0, 0)
    xrn.text = xrn:CreateFontString(nil, "OVERLAY", "MovieSubtitleFont")
    xrn.text:SetAllPoints()
    xrn.texture = xrn:CreateTexture()
    xrn.texture:SetAllPoints()
    xrn.texture:SetTexture(0, 0, 0, .50)
    xrn.time = 0
    function xrn:message(message)
        self.text:SetText(message)
        self:SetAlpha(1)
        self.time = GetTime()
        self:Show()
    end

    local function onUpdate(self, elapsed)
        if self.time < GetTime() - 2.8 then
            if self:GetAlpha() == 0 then
                self:Hide()
            else
                self:SetAlpha(self:GetAlpha() - .05)
            end
        end
    end
    cokx = CreateFrame("Frame", nil, ChatFrame1)
    cokx:SetSize(ChatFrame1:GetWidth(), 40)
    cokx:Hide()
    cokx:SetScript("onUpdate", onUpdate)
    cokx:SetPoint("TOP", 0, 60)
    cokx.text = cokx:CreateFontString(nil, "OVERLAY", "ZoneTextFont")
    cokx.text:SetAllPoints()
    cokx.text:SetTextHeight(15)
    cokx.texture = cokx:CreateTexture()
    cokx.texture:SetAllPoints()
    cokx.texture:SetTexture(0, 0, 0, 0.3)
    cokx.time = 0
    function cokx:message(message)
        self.text:SetText(message)
        self:SetAlpha(1)
        self.time = GetTime()
        self:Show()
    end

    Nova_CustomT = {}

    SetFunctions = true

end

if SetLocals == nil then

    local aBuffs = {
        107574, -- Avatar
        51713, -- Shadow Dance
        1719, -- Recklessness
        51271, -- Pillar of Frost
        49016, -- Unholy Frenzy
        114049, -- Ascendance
        31884, -- Avenging Wrath
        12472, -- Icy Veins
        12042, -- Arcane Power
        113860, -- Dark Soul: Misery
        113861, -- Dark Soul: Knowledge
        113858, -- Dark Soul: Instability
        102560, -- Incarnation: Chosen of Elune
        102543, -- Incarnation: King of the Jungle
        34692 -- The Beast Within
    }

    function attentionBuffs() return aBuffs end

    local ccthatcanbreak = {
        28272, -- Pig Poly  (cast)
        118, -- Sheep Poly  (cast)
        61305, -- Cat Poly  (cast)
        61721, -- Rabbit Poly  (cast)
        61780, -- Turkey Poly  (cast)
        28271, -- Turtle Poly  (cast)
        20066, -- Repentance  (cast)
        115078, -- Paralysis
        104045, -- Sleep (Metamorphosis)
        115268, -- Mesmerize (Shivarra)
        82691, -- Ring of Frost
        6358, -- Seduction (Succubus)
        2094, -- Blind
        10326, -- Turn Evil
        115750, -- Blinding Light
        6770, -- Sap
        33786, -- Cyclone
        113506, --
        99, -- Disorienting Roar
        2637, -- Hibernate
        113056, -- Intimidating Roar
        3355, -- Freezing Trap
        19503, -- Scatter Shot
        19386, -- Wyvern Sting
        126246, -- Lullaby
        90337, -- Bad Manner
        24394, -- Intimidation
        126355, -- Paralyzing Quill
        126423, -- Petrifying Gaze
        50519, -- Sonic Blast
        56626, -- Sting
        96201, -- Web Wrap
        82691, -- Ring of Frost
        9484, -- Shackle Undead
        88625, -- Holy Word: Chastise
        115268, -- Mesmerize
        6358, -- Seduction
        20511 -- Intimidating Shout

    }
    function ccCanBreak() return ccthatcanbreak end

    local InterruptChannel = {
        1120, -- Drain Soul		(channeling cast)
        12051, -- Evocation		(channeling cast)
        115294, -- Mana Tea		(channeling cast)
        115175, -- Soothing Mist	(channeling cast)
        64843, -- Divine Hymn		(channeling cast)
        64901, -- Hymn of Hope		(channeling cast)
        115176, -- Zen Meditaion
        103103, -- Malefic Grasp
        605, -- Dominate Mind
        15407, -- Mind Flay
        129197, -- Insanity
        47540 -- Penance
    }
    function channelInt() return InterruptChannel end

    local EphysRAs = {
        781, -- Disengage
        1833, -- Cheap Shot
        408, -- Kidney Shot
        5211, -- Mighty Bash
        107570 -- Storm Bolt

    }
    function EphysRA() return EphysRAs end

    local EspellRAs = {
        12043, -- Presence of Mind
        16188, -- Ancestral Swiftness
        132158 -- Nature Swiftness
    }
    function EspellRA() return EspellRAs end

    local defBuffs = {
        55233, -- Vampiric Blod
        48792, -- Icebound Fortitude
        102342, -- Ironbark
        106922, -- Might of Ursoc
        61336, -- Survival Instincts
        19263, -- Deterrence
        45438, -- Ice Block
        108978, -- Alter Time
        116849, -- Life Cocoon
        1022, -- Hand of Protection
        498, -- Divine protection
        642, -- Divine Shield
        33206, -- Pain Suppression
        47788, -- Guardian Spirit
        5277, -- Evasion
        31224, -- Cloak of Shadows
        30823, -- Shamanistic Rage
        104773, -- Unending Resolve
        110913, -- Dark Bargain
        871, -- Shield Wall
        118038 -- Die by the Sword
    }
    function defBuff() return defBuffs end

    local spellRAs = {
        33786, -- Cyclone
        44572, -- Deep Freeze
        2139, -- Counterspell
        12598, -- Improved Counterspell
        11129, -- Combustion
        118, -- Polymorph
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        15487, -- Silence
        51514, -- Hex
        5782, -- Fear
        17877, -- Shadowburn
        19647, -- Spell Lock
        103135, -- Spell Lock zwo
        6789 -- Mortal Coil
    }
    function spellRA() return spellRAs end

    local HealerphysRAs = {
        19503, -- Scatter Shot
        2094, -- Blind
        408, -- Kidney Shot
        107570, -- Storm Bolt
        5211 -- Mighty Bash
    }
    function HealerphysRA() return HealerphysRAs end

    local InterruptSpells = {
        118, 116, 61305, 28271, 28272, 61780, 61721, 2637, 33786, 5185, 8936,
        50464, 19750, 82326, 2061, 9484, 605, 8129, 331, 8004, 51505, 403,
        77472, 51514, 5782, 1120, 48181, 30108, 33786, -- Cyclone		(cast)
        28272, -- Pig Poly		(cast)
        118, -- Sheep Poly		(cast)
        61305, -- Cat Poly		(cast)
        82691, 31687, 10326, 113792, -- Psyfiend Fear
        61721, -- Rabbit Poly		(cast)
        61780, -- Turkey Poly		(cast)
        28271, -- Turtle Poly		(cast)
        51514, -- Hex			(cast)
        51505, -- Lava Burst		(cast)
        339, -- Entangling Roots	(cast)
        30451, -- Arcane Blast		(cast)
        605, -- Dominate Mind		(cast)
        20066, -- Repentance		(cast)
        116858, -- Chaos Bolt		(cast)
        113092, -- Frost Bomb		(cast)
        8092, -- Mind Blast		(cast)
        11366, -- Pyroblast		(cast)
        48181, -- Haunt			(cast)
        102051, -- Frost Jaw		(cast)
        1064, -- Chain Heal		(cast)
        77472, -- Greater Healing Wave	(cast)
        8004, -- Healing Surge		(cast)
        73920, -- Healing Rain		(cast)
        51505, -- Lava Burst		(cast)
        8936, -- Regrowth		(cast)
        2061, -- Flash Heal		(cast)
        2060, -- Greater Heal		(cast)
        -- 32375, -- Mass Dispel		(cast)
        2006, -- Resurrection		(cast)
        5185, -- Healing Touch		(cast)
        596, -- Prayer of Healing	(cast)
        19750, -- Flash of Light	(cast)
        635, -- Holy Light		(cast)
        7328, -- Redemption		(cast)
        2008, -- Ancestral Spirit	(cast)
        50769, -- Revive		(cast)
        2812, -- Denounce		(cast)
        82327, -- Holy Radiance		(cast)
        10326, -- Turn Evil		(cast)
        82326, -- Divine Light		(cast)
        82012, -- Repentance		(cast)
        116694, -- Surging Mist		(cast)
        124682, -- Enveloping Mist	(cast)
        115151, -- Renewing Mist	(cast)
        115310, -- Revival		(cast)
        126201, -- Frost Bolt		(cast)
        44614, -- Frostfire Bolt	(cast)
        133, -- Fireball		(cast)
        1513, -- Scare Beast		(cast)
        982, -- Revive Pet		(cast)
        111771, -- Demonic Gateway			(cast)
        118297, -- Immolate				(cast)
        124465 -- Vampiric Touch			(cast)
        -- 32375 -- Mass Dispel				(cast) 
    }
    function castInt() return InterruptSpells end

    local disarmDamage = {
        51271, -- Pillar of Frost
        49016, -- Unholy Frenzy
        13750, -- Adrenaline Rush
        79140, -- Vendetta
        51713, -- Shadow Dance
        34692, -- Beast Within
        121471, -- Shadow Blades
        31884, --  Avenging Wrath
        107574, --  Avatar
        12292, -- Bloodbath
        1719, -- Recklessness
        114049 -- Ascendance
    }
    function disarmdmg() return disarmDamage end
    local fears = {
        5782, -- fear
        8122, -- psychic scream
        10326, -- Turn Evil
        5484, -- Howl of terror
        5246, -- Intimidating shout
        64044, -- Psychic horror
        111397, -- Blood fear
        113792, -- Pcychic terror
        16508 -- Intimidating roar
    }
    function fear() return fears end
    local immunDMG = {
        33786, -- Cyclone
        113506, -- Cyclone
        45438, -- Ice Block
        110700, -- Divine Shield (Paladin)
        110696, -- Ice Block (Mage)
        19263, -- Deterrence
        45438, -- Ice Block
        122464, -- Dematerialize
        -- 122470,		-- touch of karma
        642 -- Divine Shield
    }
    function iDMG() return immunDMG end
    local dispelPoisonCC = {
        19386, -- Wyvern Sting
        113953 -- Paralysis (Paralytic Poison)
    }
    function dPoisonCC() return dispelPoisonCC end

    local ccStun = {
        108194, 115001, 91800, 22570, 5211, 9005, 102546, 110698, 118271, 44572,
        120086, 119381, 119392, 46968, 105593, 853, 1833, 408, 113953, 30283,
        89766, 7922, 105771
    }
    function ccStuns() return ccStun end

    local dispelCurseCC = {
        51514 -- Hex
    }
    function dCurseCC() return dispelCurseCC end
    local dispelMagicCC = {
        115001, -- Remorseless Winter
        2637, -- Hibernate
        110698, -- Hammer of Justice (Paladin)
        117526, -- Binding Shot
        3355, -- Freezing Trap
        145206, -- Aqua Bomb
        1513, -- Scare Beast
        118271, -- Combustion Impact
        44572, -- Deep Freeze
        31661, -- Dragon's Breath
        118, -- Polymorph
        10326, -- Turn Evil
        61305, -- Polymorph: Black Cat
        28272, -- Polymorph: Pig
        61721, -- Polymorph: Rabbit
        61780, -- Polymorph: Turkey
        28271, -- Polymorph: Turtle
        82691, -- Ring of Frost
        11129, -- Combustion
        123393, -- Breath of Fire (Glyph of Breath of Fire)
        115078, -- Paralysis
        105421, -- Blinding Light
        115752, -- Blinding Light (Glyph of Blinding Light)
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        119072, -- Holy Wrath
        20066, -- Repentance
        64044, -- Psychic Horror
        8122, -- Psychic Scream
        113792, -- Psychic Terror (Psyfiend)
        9484, -- Shackle Undead
        118905, -- Static Charge (Capacitor Totem)
        5782, -- Fear
        118699, -- Fear
        5484, -- Howl of Terror
        6789, -- Mortal Coil
        30283, -- Shadowfury
        104045, -- Sleep (Metamorphosis)
        115268, -- Mesmerize (Shivarra)
        113092, -- Frost Bomb
        6358 -- Seduction (Succubus)
    }
    function dMagicCC() return dispelMagicCC end
    local immunSpell = {
        48707, -- Anti-Magic Shell
        110570, -- Anti-Magic Shell (Death Knight)
        110788, -- Cloak of Shadows (Rogue)
        113002, -- Spell Reflection (Warrior)
        115760, -- Glyph of Ice Block
        131523, -- Zen Meditation
        114239, -- Phantasm
        31224, -- Cloak of Shadows
        8178, -- Grounding Totem Effect (Grounding Totem)
        23920, -- Spell Reflection
        114028 -- Mass Spell Reflection
    }
    function iSpell() return immunSpell end
    local immunSpells = {
        -- 48707,	-- Anti-Magic Shell
        -- 110570,	-- Anti-Magic Shell (Death Knight)
        110788, -- Cloak of Shadows (Rogue)
        113002, -- Spell Reflection (Warrior)
        115760, -- Glyph of Ice Block
        131523, -- Zen Meditation
        114239, -- Phantasm
        31224, -- Cloak of Shadows
        8178, -- Grounding Totem Effect (Grounding Totem)
        23920, -- Spell Reflection
        114028 -- Mass Spell Reflection
    }
    function iSpells() return immunSpells end
    local dispelSilence = {
        47476, -- Strangulate
        114238, -- Fae Silence (Glyph of Fae Silence)
        34490, -- Silencing Shot
        102051, -- Frostjaw (also a root)
        55021, -- Silenced - Improved Counterspell
        31935, -- Avenger's Shield
        15487, -- Silence
        24259, -- Spell Lock (Felhunter/Observer)
        25046, -- Arcane Torrent (Energy)
        28730, -- Arcane Torrent (Mana)
        50613, -- Arcane Torrent (Runic Power)
        69179, -- Arcane Torrent (Rage)
        80483, -- Arcane Torrent (Focus)
        129597 -- Arcane Torrent (Chi)
    }
    function dSilence() return dispelSilence end
    local immunDispel = {
        45438, -- Ice Block
        110700, -- Divine Shield (Paladin)
        110696, -- Ice Block (Mage)
        45438, -- Ice Block
        1022, -- Hand of Protection
        642 -- Divine Shield
    }
    function iDispel() return immunDispel end
    local dmgSilenceCC = {
        47476, -- Strangulate
        114238, -- Fae Silence (Glyph of Fae Silence)
        81261, -- Solar Beam
        102051, -- Frostjaw (also a root)
        55021, -- Silenced - Improved Counterspell
        12598, -- Improved Counterspell
        31935, -- Avenger's Shield
        15487, -- Silence
        1330, -- Garrote - Silence
        18498 -- Silenced - Gag Order
    }
    function dSilenceCC() return dmgSilenceCC end
    local dmgCC = {
        108194, -- Asphyxiate
        115001, -- Remorseless Winter
        91800, -- Gnaw
        91797, -- Monstrous Blow (Dark Transformation)
        102795, -- Bear Hug
        22570, -- Maim
        5211, -- Mighty Bash
        9005, -- Pounce
        102546, -- Pounce (Incarnation)
        110698, -- Hammer of Justice (Paladin)
        113004, -- Intimidating Roar [Fleeing in fear] (Warrior)
        118271, -- Combustion Impact
        44572, -- Deep Freeze
        126451, -- Clash
        122242, -- Clash (not sure which one is right)
        119392, -- Charging Ox Wave
        119381, -- Leg Sweep
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        88625, -- Holy Word: Chastise
        64044, -- Psychic Horror
        8122, -- Psychic Scream
        113792, -- Psychic Terror (Psyfiend)
        1833, -- Cheap Shot
        408, -- Kidney Shot
        113953, -- Paralysis (Paralytic Poison)
        51514, -- Hex
        118905, -- Static Charge (Capacitor Totem)
        54786, -- Demonic Leap (Metamorphosis)
        5782, -- Fear
        118699, -- Fear
        5484, -- Howl of Terror
        6789, -- Mortal Coil
        30283, -- Shadowfury
        89766, -- Axe Toss (Felguard/Wrathguard)
        7922, -- Charge Stun
        118895, -- Dragon Roar
        5246, -- Intimidating Shout (aoe)
        132168, -- Shockwave
        105771 -- Warbringer
    }
    function dCC() return dmgCC end
    local dispelRoot = {
        96294, -- Chains of Ice (Chilblains)
        339, -- Entangling Roots
        19975, -- Entangling Roots (Nature's Grasp)
        102359, -- Mass Entanglement
        110693, -- Frost Nova (Mage)
        19185, -- Entrapment
        50245, -- Pin (Crab)
        54706, -- Venom Web Spray (Silithid)
        4167, -- Web (Spider)
        122, -- Frost Nova
        109298, -- Narrow Escape
        111340, -- Ice Ward
        33395, -- Freeze
        113275, -- Entangling Roots (Symbiosis)
        123407, -- Spinning Fire Blossom
        113275, -- Entangling Roots (Symbiosis)
        87194, -- Glyph of Mind Blast
        114404, -- Void Tendril's Grasp
        115197, -- Partial Paralysis
        64695, -- Earthgrab (Earthgrab Totem)
        63685 -- Freeze (Frozen Power)
    }
    function dRoot() return dispelRoot end
    local allRoots = {
        91807, -- Shambling Rush (Dark Transformation)
        45334, -- Immobilized (Wild Charge - Bear)
        128405, -- Narrow Escape
        116706, -- Disable
        107566, -- Staggering Shout
        96294, -- Chains of Ice (Chilblains)
        339, -- Entangling Roots
        19975, -- Entangling Roots (Nature's Grasp)
        102359, -- Mass Entanglement
        110693, -- Frost Nova (Mage)
        19185, -- Entrapment
        50245, -- Pin (Crab)
        54706, -- Venom Web Spray (Silithid)
        4167, -- Web (Spider)
        122, -- Frost Nova
        111340, -- Ice Ward
        33395, -- Freeze
        113275, -- Entangling Roots (Symbiosis)
        123407, -- Spinning Fire Blossom
        113275, -- Entangling Roots (Symbiosis)
        87194, -- Glyph of Mind Blast
        114404, -- Void Tendril's Grasp
        115197, -- Partial Paralysis
        64695, -- Earthgrab (Earthgrab Totem)
        63685 -- Freeze (Frozen Power)
    }
    function aRoots() return allRoots end
    local allSRS = {
        96294, -- Chains of Ice (Chilblains)
        45524, -- Chains of Ice
        50435, -- Chilblains
        115001, -- Remorseless Winter
        115000, -- Remorseless Winter
        91800, -- Gnaw
        91797, -- Monstrous Blow (Dark Transformation)
        91807, -- Shambling Rush (Dark Transformation)
        102795, -- Bear Hug
        22570, -- Maim
        5211, -- Mighty Bash
        9005, -- Pounce
        102546, -- Pounce (Incarnation)
        339, -- Entangling Roots
        19975, -- Entangling Roots (Nature's Grasp)
        45334, -- Immobilized (Wild Charge - Bear)
        102359, -- Mass Entanglement
        50259, -- Dazed (Wild Charge - Cat)
        58180, -- Infected Wounds
        61391, -- Typhoon
        127797, -- Ursol's Vortex
        110698, -- Hammer of Justice (Paladin)
        110693, -- Frost Nova (Mage)
        117526, -- Binding Shot
        19185, -- Entrapment
        109298, -- Narrow Escape
        35101, -- Concussive Barrage
        5116, -- Concussive Shot
        61394, -- Frozen Wake (Glyph of Freezing Trap)
        13810, -- Ice Trap
        50245, -- Pin (Crab)
        54706, -- Venom Web Spray (Silithid)
        4167, -- Web (Spider)
        50433, -- Ankle Crack (Crocolisk)
        54644, -- Frost Breath (Chimaera)
        118271, -- Combustion Impact
        44572, -- Deep Freeze
        122, -- Frost Nova
        111340, -- Ice Ward
        11113, -- Blast Wave - gone?
        121288, -- Chilled (Frost Armor)
        120, -- Cone of Cold
        116, -- Frostbolt
        44614, -- Frostfire Bolt
        113092, -- Frost Bomb
        31589, -- Slow
        33395, -- Freeze
        126451, -- Clash
        122242, -- Clash (not sure which one is right)
        119392, -- Charging Ox Wave
        119381, -- Leg Sweep
        116706, -- Disable
        113275, -- Entangling Roots (Symbiosis)
        123407, -- Spinning Fire Blossom
        116095, -- Disable
        118585, -- Leer of the Ox
        123727, -- Dizzying Haze
        123586, -- Flying Serpent Kick
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        110300, -- Burden of Guilt
        63529, -- Dazed - Avenger's Shield
        20170, -- Seal of Justice
        113275, -- Entangling Roots (Symbiosis)
        87194, -- Glyph of Mind Blast
        114404, -- Void Tendril's Grasp
        15407, -- Mind Flay
        1833, -- Cheap Shot
        408, -- Kidney Shot
        115197, -- Partial Paralysis
        3409, -- Crippling Poison
        26679, -- Deadly Throw
        119696, -- Debilitation
        77505, -- Earthquake
        118905, -- Static Charge (Capacitor Totem)
        64695, -- Earthgrab (Earthgrab Totem)
        63685, -- Freeze (Frozen Power)
        3600, -- Earthbind (Earthbind Totem)
        77478, -- Earthquake (Glyph of Unstable Earth)
        8034, -- Frostbrand Attack
        8056, -- Frost Shock
        51490, -- Thunderstorm
        30283, -- Shadowfury
        18223, -- Curse of Exhaustion
        47960, -- Shadowflame
        89766, -- Axe Toss (Felguard/Wrathguard)
        7922, -- Charge Stun
        118895, -- Dragon Roar
        132168, -- Shockwave
        105771, -- Warbringer
        107566, -- Staggering Shout
        1715, -- Hamstring
        129923, -- Hindering Strikes
        12323 -- Piercing Howl
    }

    function aSRS() return allSRS end
    local immuneSlow = {
        1044, -- Hand of Freedom
        47585, -- Dispersion
        46924, -- Bladestorm
        34692, -- Beast Within
        108273, -- WindWalk
        53271 -- masters call
    }

    function iSlow() return immuneSlow end

    local reflectSpellsIDs = {
        5782, -- Fear
        118699, -- Fear
        118, -- Polymorph
        10326, --
        61305, -- Polymorph: Black Cat
        28272, -- Polymorph: Pig
        61721, -- Polymorph: Rabbit
        61780, -- Polymorph: Turkey
        28271, -- Polymorph: Turtle
        33786, -- Cyclone
        113506, -- Cyclone
        20066, -- Repentance
        51514, -- Hex
        605, -- Dominate Mind
        14515

    }
    function reflectSpells() return reflectSpellsIDs end

    local reflectSpellsDMGIDs = {
        51505, -- Lava Burst
        116858, -- Chaos Bolt
        113092, -- Frost Bomb
        48181, -- Haunt
        78674, -- starsurge
        102051 -- Frost Jaw
    }
    function reflectSpellsDMG() return reflectSpellsDMGIDs end

    local groundSpellsIDs = {
        51505, -- Lava Burst
        116858, -- Chaos Bolt
        113092, -- Frost Bomb
        48181, -- Haunt
        78674, -- starsurge
        10326, 102051, -- Frost Jaw
        117014, -- Elemental Blast
        5782, -- Fear
        118699, -- Fear
        118, -- Polymorph
        61305, -- Polymorph: Black Cat
        28272, -- Polymorph: Pig
        61721, -- Polymorph: Rabbit
        61780, -- Polymorph: Turkey
        28271, -- Polymorph: Turtle
        33786, -- Cyclone
        113506, -- Cyclone
        20066, -- Repentance
        51514, -- Hex
        605, -- Dominate Mind
        14515
    }
    function groundSpells() return groundSpellsIDs end

    local reflectInstantSpellsMageIDs = {
        122, -- Frost Nova
        110693, -- Frost Nova (Mage)
        33395, -- Freeze
        63685, -- Freeze (Frozen Power)
        111340 -- Ice Ward
    }
    function reflectSpellsMage() return reflectInstantSpellsMageIDs end

    local reflectInstantSpellIDs = {
        132158, -- Natures Swiftness
        111397, 19975 -- Entangling Roots (Nature's Grasp)

    }
    function reflectInstantSpells() return reflectInstantSpellIDs end

    SetLocals = true

end
