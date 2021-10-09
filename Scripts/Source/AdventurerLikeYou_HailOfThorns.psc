scriptName AdventurerLikeYou_HailOfThorns extends ActiveMagicEffect

Spell property AdventurerLikeYou_SingleArrow_Spell auto

; iProjectileMaxRefCount ; World
; fAttachedArrowAgeMax ; Seconds
; iMaxAttachedArrows ; Actor

event OnEffectStart(Actor target, Actor caster)
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
