scriptName AdventurerLikeYou_HailOfThorns extends ActiveMagicEffect

Faction property AdventurerLikeYou_TargetFaction auto

Spell property AdventurerLikeYou_SingleArrow_Spell auto

; iProjectileMaxRefCount ; World
; fAttachedArrowAgeMax ; Seconds
; iMaxAttachedArrows ; Actor

    ; npc.SetActorValue("Aggression", 1)
    ; npc.SetActorValue("Confidence", 4)
    ; npc.SetActorValue("Assistance", 0)

event OnEffectStart(Actor target, Actor caster)
    Game.SetGameSettingInt("iProjectileMaxRefCount", 300)
    Game.SetGameSettingFloat("fAttachedArrowAgeMax", 120)
    Game.SetGameSettingInt("iMaxAttachedArrows", 300)

    ActorBase ourNpcBase = Game.GetFormFromFile(0x807, "AdventurerLikeYou.esp") as ActorBase

    Actor npc = target.PlaceAtMe(ourNpcBase) as Actor
    npc.SetRelationshipRank(target, -4)
    target.AddToFaction(AdventurerLikeYou_TargetFaction)
    npc.StartCombat(target)

    npc = target.PlaceAtMe(ourNpcBase) as Actor
    npc.SetRelationshipRank(target, -4)
    target.AddToFaction(AdventurerLikeYou_TargetFaction)
    npc.StartCombat(target)

    npc = target.PlaceAtMe(ourNpcBase) as Actor
    npc.SetRelationshipRank(target, -4)
    target.AddToFaction(AdventurerLikeYou_TargetFaction)
    npc.StartCombat(target)
endEvent

event OnEffectStart_Cheeken(Actor target, Actor caster)
    ActorBase cheeckenBase = Game.GetForm(0xa91a0) as ActorBase

    Game.SetGameSettingInt("iProjectileMaxRefCount", 300)
    Game.SetGameSettingFloat("fAttachedArrowAgeMax", 120)
    Game.SetGameSettingInt("iMaxAttachedArrows", 300)

    int i = 0
    while i < 50
        Actor cheecken = target.PlaceAtMe(cheeckenBase) as Actor
        cheecken.MoveTo( \
            target, \
            afXOffset = Utility.RandomFloat(-250, 250), \
            afYOffset = Utility.RandomFloat(-250, 250), \
            afZOffset = Utility.RandomFloat(0, 100) \
        )
        AdventurerLikeYou_SingleArrow_Spell.Cast(cheecken, target)
        cheecken.Delete()
        i += 1
    endWhile
endEvent
