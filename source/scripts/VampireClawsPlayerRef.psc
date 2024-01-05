Scriptname VampireClawsPlayerRef extends ReferenceAlias

; PROPERTIES --------------------------------------------------------------------------------------

VampireClawsPlayerEquip    property        EVC_PlayerEquip     auto

; EVENTS ------------------------------------------------------------------------------------------

event OnObjectEquipped(Form akBaseObject, ObjectReference akReference) 
    if (akBaseObject as Armor).GetSlotMask() == Armor.GetMaskForSlot(33)
        if EVC_PlayerEquip.evcHideClaws == true && EVC_PlayerEquip.HasGlovesEquipped() == true
            Debug.Trace("VampireClawsPlayerRef: gloves equipped, removing claws", 0)
            EVC_PlayerEquip.RemoveClaws()
            EVC_PlayerEquip.ForceRedraw()
        endIf
    endIf
endEvent

event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    if (akBaseObject as Armor).GetSlotMask() == Armor.GetMaskForSlot(33)
        if EVC_PlayerEquip.evcHideClaws == true && EVC_PlayerEquip.HasGlovesEquipped() == false
            Debug.Trace("VampireClawsPlayerRef: gloves removed, restoring claws", 0)
            EVC_PlayerEquip.ResetClaws()
        endIf
    endIf
endEvent