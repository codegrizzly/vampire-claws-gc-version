Scriptname VampireClawsRaceMenu extends RaceMenuBase

; CONSTANTS ---------------------------------------------------------------------------------------

string 	property 	EVC_CLAW_CALLBACK   = "evc_claw_callback"		autoReadOnly

; PROPERTIES --------------------------------------------------------------------------------------

VampireClawsPlayerEquip     property       PlayerEquip         auto
FormList                    property 	   ClawFormList        auto

; EVENTS ------------------------------------------------------------------------------------------

event OnInit()
    parent.OnInit()
    Debug.Trace("VampireClawsRaceMenu: Initialized", 0)
endEvent

event OnSliderRequest(Actor player, ActorBase playerBase, Race actorRace, bool isFemale)
    float clawMax = ClawFormList.GetSize() - 1
    AddSlider("Vampire Claws", CATEGORY_BODY, EVC_CLAW_CALLBACK, 0, clawMax, 1.0, ClawFormList.Find(PlayerEquip.selectedClawStyle))
endEvent

event OnSliderChanged(string callback, float value)
    if callback == EVC_CLAW_CALLBACK
        Debug.Trace("VampireClawsRaceMenu: Claw Slider adjusted to position " + value, 0)
        Armor selectedClaw = ClawFormList.GetAt(value as int) as Armor
        Debug.Trace("VampireClawsRaceMenu: Selected Claw: " + selectedClaw.GetName(), 0)
        PlayerEquip.UpdateClawStyle(selectedClaw)
	endIf
endEvent
