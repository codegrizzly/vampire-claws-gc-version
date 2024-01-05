Scriptname VampireClawsPlayerEquip extends SKI_QuestBase

; CONSTANTS ---------------------------------------------------------------------------------------

string  property    EMPTY_CLAW_NAME     = "Claws_Empty"             autoReadOnly
int     property    CLAW_ITEM_SLOT      = 61                        autoReadOnly

; PROPERTIES --------------------------------------------------------------------------------------

VampireClawsRaceMenu    property    VPC_RaceMenu                auto
Actor                   property    PlayerRef                   auto
Armor                   property    DefaultClawStyle            auto


Armor                   property    selectedClawStyle           auto hidden 
bool                    property    evcHideClaws                auto hidden 


; EVENTS ------------------------------------------------------------------------------------------

event OnInit()
    selectedClawStyle = DefaultClawStyle
    evcHideClaws = false
    Debug.Trace("VampireClawsPlayerEquip: Initialized", 0)
endEvent

event OnGameReload() 
    if HasGlovesEquipped() == true
        RemoveClaws()
    Else
        ResetClaws()
    endIf
endEvent

; FUNCTIONS ---------------------------------------------------------------------------------------

; SCRIPT VERSION
int function GetVersion()
    return 1
endFunction

function UpdateClawStyle(Armor a_style)
    RemoveClaws()
    selectedClawStyle = a_style
    EquipClaws()
endFunction

function ResetClaws()
    RemoveClaws()
    EquipClaws()
endFunction

function EquipClaws()
    if selectedClawStyle != DefaultClawStyle
        Debug.Trace("VampireClawsPlayerEquip: Equipping Claws - " + selectedClawStyle.GetName(), 0)
        PlayerRef.EquipItem(selectedClawStyle, true, true)
    endIf
    ForceRedraw()
endFunction

function RemoveClaws()
    Form wornClaws = PlayerRef.GetWornForm(Armor.GetMaskForSlot(CLAW_ITEM_SLOT))
    PlayerRef.UnequipItemSlot(CLAW_ITEM_SLOT)
    Debug.Trace("VampireClawsPlayerEquip: Rmoving Claws", 0)
endFunction

function ForceRedraw()
	if PlayerRef.IsOnMount() == false
		PlayerRef.UpdateWeight(0)
	endIf
endFunction

bool function HasGlovesEquipped() 
    return PlayerRef.GetWornForm(Armor.GetMaskForSlot(33)) != None
endFunction

function ToggleHideClaws()
    evcHideClaws = !evcHideClaws
    if evcHideClaws == true && HasGlovesEquipped()
        RemoveClaws()
    else
        ResetClaws()
    endIf
endFunction
