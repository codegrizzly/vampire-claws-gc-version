Scriptname VampireClawsMCM extends SKI_ConfigBase  

; CONSTANTS ---------------------------------------------------------------------------------------

string property     MOD_NAME                    = "$CG_EVC_MOD_NAME"            autoReadOnly
string property     MOD_VERSION                 = "1.0.0"                       autoReadOnly
string property		PAGE_SETTINGS		        = "$CG_EVG_PAGE_SETTINGS"       autoReadOnly

; PROPERTIES --------------------------------------------------------------------------------------

VampireClawsPlayerEquip    property        EVC_PlayerEquip     auto

; EVENTS ------------------------------------------------------------------------------------------
event OnPageReset(string page)
    UnloadCustomContent()
    RenderSettingsPage()
endEvent

; INITIALIZATION
event OnConfigInit()
        Debug.Trace("VampireClawsMCM: Initializing", 0)
        ModName = MOD_NAME
        Pages = new string[1]
        Pages[0] = PAGE_SETTINGS
endEvent

; FUNCTIONS ---------------------------------------------------------------------------------------

; SCRIPT VERSION
int function GetVersion()
    return 1
endFunction

function RenderSettingsPage()
    Debug.Trace("VampireClawsMCM: Rendering Settings Page", 0)
    SetCursorFillMode(TOP_TO_BOTTOM)
    AddHeaderOption("$CG_EVC_FORM_HEADER")
    AddToggleOptionST("HideClawsToggle", "$CG_EVG_HIDE_CLAWS_LABEL", EVC_PlayerEquip.evcHideClaws)
endFunction

; STATES ------------------------------------------------------------------------------------------

state HideClawsToggle
    event OnSelectST()
        EVC_PlayerEquip.ToggleHideClaws()
        SetToggleOptionValueST(EVC_PlayerEquip.evcHideClaws)
    endEvent

    event onHighlightST()
        SetInfoText("$CG_EVC_HIDE_CLAWS_HL")
    endEvent
endState