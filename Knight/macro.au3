#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <GUIComboBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiConstants.au3>
#include <Array.au3>
#include <Misc.au3>
#include <WinAPIDlg.au3>
Global $aKeyStillPressed[255] ;used to keep track of keystates
Global $dll = DllOpen("user32.dll") ;Open the dll used in _IsPressedEx
HotKeySet ( "{ESC}" , "Executer" )
$listBoxStyle = BitOr(0x1, 0x200000, 0x800000)
#Region ### START Koda GUI section ### Form=C:\Users\bbubu\OneDrive\Masaüstü\Form1.kxf
Global $Form1_1 = GUICreate("Form1", 1071, 456, 200, 138)
Global $Group1 = GUICtrlCreateGroup("Atak Skill Listesi", 8, 8, 177, 433)
Global $List1 = GUICtrlCreateList("", 24, 32, 145, 292,$listBoxStyle)
Global $Skiller = GUICtrlCreateCombo("Skiller", 32, 344, 97, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
Global $ComboBoxSkillList2 = "Jab|Blood_Drain|Pierce|Shock|Thrust|Cut|Vampiric_Touch|Spike|Throwing_Knife|Bloody_Beast|Blinding|Beast_Hiding|Critical_Point|Evade|Safety|Scaled_Skin|Magic_Shield|Weapon_Cancelation|Eskrima|Stroke|Stab|Stab_2"
Global $ComboBoxSkillList = "Jab|Blood_Drain|Pierce|Shock|Thrust|Cut|Vampiric_Touch|Spike|Throwing_Knife|Bloody_Beast|Blinding|Beast_Hiding|Critical_Point|Evade|Safety|Scaled_Skin|Magic_Shield|Weapon_Cancelation|Eskrima|Stroke|Stab|Stab_2|Lupine_Eyes|Strength_of_Wolf|Illusion|Minor_Healing|Light_Feet|Cure_Curse|Cure_Disease|HP_Potion|MP_Potion"
GUICtrlSetData(-1, $ComboBoxSkillList2)
Global $Button1 = GUICtrlCreateButton("Ekle", 32, 376, 81, 25)
Global $Button2 = GUICtrlCreateButton("Çıkar", 32, 408, 81, 25)
Global $Button4 = GUICtrlCreateButton("^", 152, 344, 17, 25)
Global $Button5 = GUICtrlCreateButton("v", 152, 368, 17, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Label15 = GUICtrlCreateLabel("Skiller Arası Gecikme(ms)", 208, 384, 122, 17)
Global $Input29 = GUICtrlCreateInput("100", 208, 408, 65, 21)
Global $Button6 = GUICtrlCreateButton("Kaydet", 472, 408, 81, 25)
Global $Input30 = GUICtrlCreateInput("", 856, 72, 177, 21)
Global $Combo1 = GUICtrlCreateCombo("Boş", 240, 40, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo2 = GUICtrlCreateCombo("Boş", 240, 64, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo3 = GUICtrlCreateCombo("Boş", 240, 88, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo4 = GUICtrlCreateCombo("Boş", 240, 112, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo5 = GUICtrlCreateCombo("Boş", 240, 136, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo6 = GUICtrlCreateCombo("Boş", 240, 160, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo7 = GUICtrlCreateCombo("Boş", 240, 184, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo8 = GUICtrlCreateCombo("Boş", 240, 208, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo9 = GUICtrlCreateCombo("Boş", 240, 232, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo10 = GUICtrlCreateCombo("Boş", 240, 256, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo11 = GUICtrlCreateCombo("Boş", 336, 40, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo12 = GUICtrlCreateCombo("Boş", 336, 64, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo13 = GUICtrlCreateCombo("Boş", 336, 88, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo14 = GUICtrlCreateCombo("Boş", 336, 112, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo15 = GUICtrlCreateCombo("Boş", 336, 136, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo16 = GUICtrlCreateCombo("Boş", 336, 160, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo17 = GUICtrlCreateCombo("Boş", 336, 184, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo18 = GUICtrlCreateCombo("Boş", 336, 208, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo19 = GUICtrlCreateCombo("Boş", 336, 232, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo20 = GUICtrlCreateCombo("Boş", 336, 256, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo21 = GUICtrlCreateCombo("Boş", 432, 40, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo22 = GUICtrlCreateCombo("Boş", 432, 64, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo23 = GUICtrlCreateCombo("Boş", 432, 88, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo24 = GUICtrlCreateCombo("Boş", 432, 112, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo25 = GUICtrlCreateCombo("Boş", 432, 136, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo26 = GUICtrlCreateCombo("Boş", 432, 160, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo27 = GUICtrlCreateCombo("Boş", 432, 184, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo28 = GUICtrlCreateCombo("Boş", 432, 208, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo29 = GUICtrlCreateCombo("Boş", 432, 232, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo30 = GUICtrlCreateCombo("Boş", 432, 256, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo31 = GUICtrlCreateCombo("Boş", 528, 40, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo32 = GUICtrlCreateCombo("Boş", 528, 64, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo33 = GUICtrlCreateCombo("Boş", 528, 88, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo34 = GUICtrlCreateCombo("Boş", 528, 112, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo35 = GUICtrlCreateCombo("Boş", 528, 136, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo36 = GUICtrlCreateCombo("Boş", 528, 160, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo37 = GUICtrlCreateCombo("Boş", 528, 184, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo38 = GUICtrlCreateCombo("Boş", 528, 208, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo39 = GUICtrlCreateCombo("Boş", 528, 232, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo40 = GUICtrlCreateCombo("Boş", 528, 256, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo41 = GUICtrlCreateCombo("Boş", 624, 40, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo42 = GUICtrlCreateCombo("Boş", 624, 64, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo43 = GUICtrlCreateCombo("Boş", 624, 88, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo44 = GUICtrlCreateCombo("Boş", 624, 112, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo45 = GUICtrlCreateCombo("Boş", 624, 136, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo46 = GUICtrlCreateCombo("Boş", 624, 160, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo47 = GUICtrlCreateCombo("Boş", 624, 184, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo48 = GUICtrlCreateCombo("Boş", 624, 208, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo49 = GUICtrlCreateCombo("Boş", 624, 232, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Combo50 = GUICtrlCreateCombo("Boş", 624, 256, 89, 25, BitOR($CBS_DROPDOWNLIST+ $WS_VSCROLL,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $ComboBoxSkillList)
Global $Label1 = GUICtrlCreateLabel("F1                            F2                            F3                            F4                            F5", 240, 16, 400, 17)
Global $Label2 = GUICtrlCreateLabel("0", 208, 40, 10, 17)
Global $Label3 = GUICtrlCreateLabel("1", 208, 64, 10, 17)
Global $Label4 = GUICtrlCreateLabel("2", 208, 88, 10, 17)
Global $Label5 = GUICtrlCreateLabel("3", 208, 112, 10, 17)
Global $Label6 = GUICtrlCreateLabel("4", 208, 136, 10, 17)
Global $Label7 = GUICtrlCreateLabel("5", 208, 160, 10, 17)
Global $Label8 = GUICtrlCreateLabel("6", 208, 184, 10, 17)
Global $Label9 = GUICtrlCreateLabel("7", 208, 208, 10, 17)
Global $Label10 = GUICtrlCreateLabel("8", 208, 232, 10, 17)
Global $Label11 = GUICtrlCreateLabel("9", 208, 256, 10, 17)
Global $ComboList[50] = [$Combo1,$Combo2,$Combo3,$Combo4,$Combo5,$Combo6,$Combo7,$Combo8,$Combo9,$Combo10,$Combo11,$Combo12,$Combo13,$Combo14,$Combo15,$Combo16,$Combo17,$Combo18,$Combo19,$Combo20,$Combo21,$Combo22,$Combo23,$Combo24,$Combo25,$Combo26,$Combo27,$Combo28,$Combo29,$Combo30,$Combo31,$Combo32,$Combo33,$Combo34,$Combo35,$Combo36,$Combo37,$Combo38,$Combo39,$Combo40,$Combo41,$Combo42,$Combo43,$Combo44,$Combo45,$Combo46,$Combo47,$Combo48,$Combo49,$Combo50]

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $UsedOnes[27] = []
If FileExists("saved.txt") Then
	$key = FileRead("saved.txt")
	$splitter = StringSplit($key,"---------------")
	$first=StringSplit($splitter[1],@LF)
	$second=StringSplit($splitter[16],",")
	For $i = 1 To $first[0]
		AddString($List1, $first[$i])
	Next
	For $i = 0 to 49 Step 1
		$deneme = $ComboList[$i]
		GUICtrlSetData($deneme,$second[$i+1])
		if $second[$i+1]<>"Boş" Then
			_ArrayAdd($UsedOnes,$second[$i+1])
		EndIf
	Next
EndIf
Global $SkillList[22][6] = [["Critical_Point","","",60,0,"0"],["Eskrima","","",50,0,"-1"],["Blinding","","",60,0,"-1"],["Beast_Hiding","","",40,0,"-1"],["Spike","","",11.2,0,"-1"],["Thrust","","",10.2,0,"-1"],["Bloody_Beast","","",5.2,0,"-1"],["Cut","","",5.2,0,"-1"],["Shock","","",5.2,0,"-1"],["Jab","","",5.2,0,"-1"],["Stab_2","","",5.2,0,"-1"],["Pierce","","",10.2,0,"-1"],["Stab","","",5.2,0,"-1"],["Stroke","","",0.5,0,"-1"],["Blood_Drain","","",60,0,"1"],["Vampiric_Touch","","",60,0,"1"],["Throwing_Knife","","",10,0,"1"],["Evade","","",30,0,"0"],["Safety","","",30,0,"0"],["Scaled_Skin","","",30,0,"0"],["Magic_Shield","","",60,0,"1"],["Weapon_Cancelation","","",60,0,"1"]]
Global $OneUseSkills[27] = ["Critical_Point","Eskrima","Blinding","Beast_Hiding","Spike","Thrust","Bloody_Beast","Cut","Shock","Jab","Stab_2","Pierce","Stab","Stroke","Blood_Drain","Vampiric_Touch","Throwing_Knife","Evade","Safety","Scaled_Skin","Magic_Shield","Weapon_Cancelation","Lupine_Eyes","Strength_of_Wolf","Illusion","Cure_Curse","Cure_Disease"]

While 1
	If _IsPressedEx('bd', $dll) Then Macro()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Combo1,$Combo2,$Combo3,$Combo4,$Combo5,$Combo6,$Combo7,$Combo8,$Combo9,$Combo10,$Combo11,$Combo12,$Combo13,$Combo14,$Combo15,$Combo16,$Combo17,$Combo18,$Combo19,$Combo20,$Combo21,$Combo22,$Combo23,$Combo24,$Combo25,$Combo26,$Combo27,$Combo28,$Combo29,$Combo30,$Combo31,$Combo32,$Combo33,$Combo34,$Combo35,$Combo36,$Combo37,$Combo38,$Combo39,$Combo40,$Combo41,$Combo42,$Combo43,$Combo44,$Combo45,$Combo46,$Combo47,$Combo48,$Combo49,$Combo50
			If GUICtrlRead($nMsg)=="Light_Feet" Then
				For $i=0 To 49 Step 1
					$deneme = $ComboList[$i]
					If GUICtrlRead($deneme)== "Light_Feet" Then
						If  $deneme <> $nMsg Then
							_GUICtrlComboBox_SelectString($deneme,"Boş")
						EndIf
					EndIf
					Local $first = ControlGetPos("","",$deneme)
					Local $second = ControlGetPos("","",$nMsg)
					If IsArray($first) And IsArray($second) And $first[0] <> $second[0] And $first[1] == $second[1] Then
						_GUICtrlComboBox_SelectString($deneme,"Light_Feet")
					EndIf
				Next
			ElseIf _ArraySearch($OneUseSkills,GUICtrlRead($nMsg))<>-1 Then
				If _ArraySearch($UsedOnes,GUICtrlRead($nMsg))==-1 Then
					_ArrayAdd($UsedOnes,GUICtrlRead($nMsg))
				Else
					For $i=0 To 49 Step 1
						If GUICtrlRead($ComboList[$i])== GUICtrlRead($nMsg) Then
							$deneme = $ComboList[$i]
							If  $deneme <> $nMsg Then
								_GUICtrlComboBox_SelectString($deneme,"Boş")
							EndIf
						EndIf
					Next
				EndIf
			EndIf
		Case $Button1
			$u=0
			For $i=0 To 49 Step 1
				$deneme=$ComboList[$i]
				If GUICtrlRead($deneme)== GUICtrlRead($Skiller) Then
					$u=1
				EndIf
			Next
			If $u==0 Then
				MsgBox("","","deneme")
				Break
			EndIf
			$z=GUICtrlRead($Skiller)
			If _GUICtrlListBox_FindString($List1,$z)==-1 And $z<>"Skiller" Then
				AddString($List1, $z)
			EndIf
		Case $Button2
			DeleteString($List1)
		Case $Button6
			$total = _GUICtrlListBox_GetCount($List1)
			$save1 = ""
			For $i = 0 To $total-1 Step 1
				$save1&=_GUICtrlListBox_GetText($List1,$i)
				if($i <> $total-1) Then
					 $save1&= @LF
				EndIf
			Next
			$save1&="---------------"
			$save1&=GUICtrlRead($Combo1) &","&GUICtrlRead($Combo2) & ","&GUICtrlRead($Combo3) & ","&GUICtrlRead($Combo4) & ","&GUICtrlRead($Combo5) & ","&GUICtrlRead($Combo6) & ","&GUICtrlRead($Combo7) & ","&GUICtrlRead($Combo8) & ","&GUICtrlRead($Combo9) & ","&GUICtrlRead($Combo10) & ","&GUICtrlRead($Combo11) & ","&GUICtrlRead($Combo12) & ","&GUICtrlRead($Combo13) & ","&GUICtrlRead($Combo14) & ","&GUICtrlRead($Combo15) & ","&GUICtrlRead($Combo16) & ","&GUICtrlRead($Combo17) & ","&GUICtrlRead($Combo18) & ","&GUICtrlRead($Combo19) & ","&GUICtrlRead($Combo20) & ","&GUICtrlRead($Combo21) & ","&GUICtrlRead($Combo22) & ","&GUICtrlRead($Combo23) & ","&GUICtrlRead($Combo24) & ","&GUICtrlRead($Combo25) & ","&GUICtrlRead($Combo26) & ","&GUICtrlRead($Combo27) & ","&GUICtrlRead($Combo28) & ","&GUICtrlRead($Combo29) & ","&GUICtrlRead($Combo30) & ","&GUICtrlRead($Combo31) & ","&GUICtrlRead($Combo32) & ","&GUICtrlRead($Combo33) & ","&GUICtrlRead($Combo34) & ","&GUICtrlRead($Combo35) & ","&GUICtrlRead($Combo36) & ","&GUICtrlRead($Combo37) & ","&GUICtrlRead($Combo38) & ","&GUICtrlRead($Combo39) & ","&GUICtrlRead($Combo40) & ","&GUICtrlRead($Combo41) & ","&GUICtrlRead($Combo42) & ","&GUICtrlRead($Combo43) & ","&GUICtrlRead($Combo44) & ","&GUICtrlRead($Combo45) & ","&GUICtrlRead($Combo46) & ","&GUICtrlRead($Combo47) & ","&GUICtrlRead($Combo48) & ","&GUICtrlRead($Combo49) & ","&GUICtrlRead($Combo50)
			FileRecycle("saved.txt")
			FileWrite("saved.txt",$save1)
		Case $Button4
			Listbox_ItemMoveUD($List1,-1)
		Case $Button5
			Listbox_ItemMoveUD($List1,1)
	EndSwitch
WEnd
Func Listbox_ItemMoveUD($hLB_ID, $iDir = -1)
    ;Listbox_ItemMoveUD - Up/Down  Move Multi/Single item in a ListBox
    ;$iDir: -1 up, 1 down
    ;Return values -1 nothing to do, 0 nothing moved, >0 performed moves
    Local $iCur, $iNxt, $aCou, $aSel, $i, $m = 0, $y, $slb = 0 ;Current, next, Count, Selection, loop , movecount

    $aSel = _GUICtrlListBox_GetSelItems($hLB_ID) ;Put selected items in an array
    $aCou = _GUICtrlListBox_GetCount($hLB_ID) ;Get total item count of the listbox

    If $aSel[0] = 0 Then
        $y = _GUICtrlListBox_GetCurSel($hLB_ID)
        If $y > -1 Then
            _ArrayAdd($aSel, $y)
            $aSel[0] = 1
            $slb = 1
        EndIf
    EndIf

    ;WinSetTitle($hGUI, "", $aSel[0])                   ;Debugging info

    Select
        Case $iDir = -1 ;Move Up
            For $i = 1 To $aSel[0]
                If $aSel[$i] > 0 Then
                    $iNxt = _GUICtrlListBox_GetText($hLB_ID, $aSel[$i] - 1) ;Save the selection index - 1 text
                    _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i] - 1, _GUICtrlListBox_GetText($hLB_ID, $aSel[$i])) ;Replace the index-1 text with the index text
                    _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i], $iNxt) ;Replace the selection with the saved var
                    $m = $m + 1
                EndIf
            Next
            For $i = 1 To $aSel[0] ;Restore the selections after moving
                If $aSel[$i] > 0 Then
                    If $slb = 0 Then
                        _GUICtrlListBox_SetSel($hLB_ID, $aSel[$i] - 1, 1)
                    Else
                        _GUICtrlListBox_SetCurSel($hLB_ID, $aSel[$i] - 1)
                    EndIf
                EndIf
            Next
            Return $m
        Case $iDir = 1 ;Move Down
            If $aSel[0] > 0 Then
                For $i = $aSel[0] To 1 Step -1
                    If $aSel[$i] < $aCou - 1 Then
                        $iNxt = _GUICtrlListBox_GetText($hLB_ID, $aSel[$i] + 1)
                        _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i] + 1, _GUICtrlListBox_GetText($hLB_ID, $aSel[$i]))
                        _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i], $iNxt)
                        $m = $m + 1
                    EndIf
                Next
            EndIf
            For $i = $aSel[0] To 1 Step -1 ;Restore the selections after moving
                If $aSel[$i] < $aCou - 1 Then
                    If $slb = 0 Then
                        _GUICtrlListBox_SetSel($hLB_ID, $aSel[$i] + 1, 1)
                    Else
                        _GUICtrlListBox_SetCurSel($hLB_ID, $aSel[$i] + 1)
                    EndIf
                EndIf
            Next
            Return $m
    EndSelect
    Return -1
EndFunc   ;==>Listbox_ItemMoveUD
Func DeleteString($hLB_ID)

	Local $aSel = _GUICtrlListBox_GetSelItems($hLB_ID)        ;Get selected items
    Local $i, $slb = 0, $y, $x
    If $aSel[0] = 0 Then            ;If the array is empty, there is no selection, or it is a single selection listbox
        For $x = 0 To _GUICtrlListBox_GetCount($hLB_ID) - 1
            $y = _GUICtrlListBox_GetSel($hLB_ID, $x)
            If $y = True Then
                $slb = 1
                _GUICtrlListBox_DeleteString($hLB_ID, $x) ;Perform a delete on single sel. LB
                ExitLoop
            EndIf
        Next
    EndIf

    If $slb = 0 Then
        _GUICtrlListBox_BeginUpdate($hLB_ID)
        For $i = $aSel[0] To 1 Step -1                    ;Loop backwards and delete the selected items
            _GUICtrlListBox_DeleteString($hLB_ID, $aSel[$i])
        Next
        _GUICtrlListBox_EndUpdate($hLB_ID)
    EndIf

EndFunc   ;==>AddString
Func AddString($hListBox, $String)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	_GUICtrlListBox_AddString($hListBox, $String)
	_GUICtrlListBox_UpdateHScroll($hListBox)
	_GUICtrlListBox_EndUpdate($hListBox)

EndFunc   ;==>AddString
Func Macro()
	$total = _GUICtrlListBox_GetCount($List1)
	$delay1 = GUICtrlRead($Input29)
	$exitt = False
	For $i=0 To 21 Step 1
		For $j=0 To 49 Step 1
			$combod = $ComboList[$j]
			if GUICtrlRead($combod)==$SkillList[$i][0] Then
				$SkillList[$i][2] = Mod($j,10)
				Switch $j
					Case 0,1,2,3,4,5,6,7,8,9
						$SkillList[$i][1]="F1"
					Case 10,11,12,13,14,15,16,17,18,19
						$SkillList[$i][1]="F2"
					Case 20,21,22,23,24,25,26,27,28,29
						$SkillList[$i][1]="F3"
					Case 30,31,32,33,34,35,36,37,38,39
						$SkillList[$i][1]="F4"
					Case 40,41,42,43,44,45,46,47,48,49
						$SkillList[$i][1]="F5"
				EndSwitch
				ExitLoop
			EndIf
		Next
	Next
	While(_IsPressedEx('bd', $dll))
		For $i = 0 To $total-1 Step 1
			if _IsPressedEx('bd', $dll) <> 1 Then ExitLoop
			For $j = 0 To 13 Step 1
				If _GUICtrlListBox_GetText($List1,$i) == $SkillList[$j][0] And $SkillList[$j][4] <=TimerInit()-($SkillList[$j][3]*10000000) Then
					$exitt=True
					Switch $SkillList[$j][1]
						Case "F1"
							Send("{F1 down}")
							Sleep(20)
							Send("{F1 up}")
						Case "F2"
							Send("{F2 down}")
							Sleep(20)
							Send("{F2 up}")
						Case "F3"
							Send("{F3 down}")
							Sleep(20)
							Send("{F3 up}")
						Case "F4"
							Send("{F4 down}")
							Sleep(20)
							Send("{F4 up}")
						Case "F5"
							Send("{F5 down}")
							Sleep(20)
							Send("{F5 up}")
						Case "F6"
							Send("{F6 down}")
							Sleep(20)
							Send("{F6 up}")
						Case "g"
							Send("{F7 down}")
							Sleep(20)
							Send("{F7 up}")
						Case "h"
							Send("{F8 down}")
							Sleep(20)
							Send("{F8 up}")
					EndSwitch
					Switch $SkillList[$j][2]
						Case 0
							Send("{0 down}")
							Sleep($delay1)
							Send("{0 up}")
						Case 1
							Send("{1 down}")
							Sleep($delay1)
							Send("{1 up}")
						Case 2
							Send("{2 down}")
							Sleep($delay1)
							Send("{2 up}")
						Case 3
							Send("{3 down}")
							Sleep($delay1)
							Send("{3 up}")
						Case 4
							Send("{4 down}")
							Sleep($delay1)
							Send("{4 up}")
						Case 5
							Send("{5 down}")
							Sleep($delay1)
							Send("{5 up}")
						Case 6
							Send("{6 down}")
							Sleep($delay1)
							Send("{6 up}")
						Case 7
							Send("{7 down}")
							Sleep($delay1)
							Send("{7 up}")
						Case 8
							Send("{8 down}")
							Sleep($delay1)
							Send("{8 up}")
						Case 9
							Send("{9 down}")
							Sleep($delay1)
							Send("{9 up}")
					EndSwitch
					$SkillList[$j][4]=TimerInit()
					Switch $SkillList[$j][5]
						Case "1"
							Sleep(80)
							For $i = 0 To 7 Step 1 ;Restore the selections after moving
								Send("{r down}")
								Sleep(10)
								Send("{r up}")
								Sleep(10)
							Next
						Case "-1"
							For $i = 0 To 7 Step 1 ;Restore the selections after moving
								Send("{r down}")
								Sleep(10)
								Send("{r up}")
								Sleep(10)
							Next
					EndSwitch
					ExitLoop
				EndIf
			Next
			If $exitt Then
				$exitt=False
				ExitLoop
			EndIf
		Next
	WEnd
EndFunc
Func Executer()
	Execute("Exit")
EndFunc
Func _IsPressedEx($hexKey, $u32dll)
    Local $iKey = Dec($hexKey)
    If $iKey > 255 Or $iKey < 0 Then Return SetError(1,0,0)
    Local $aR = DllCall($u32dll, "int", "GetAsyncKeyState", "int",'0x' & $hexKey)
    If @error Then Return SetError(2,0,0)
    If $aKeyStillPressed[$iKey] Then ;If the key was already registered as pressed
        If BitAND($aR[0], 0x8000) <> 0x8000 Then $aKeyStillPressed[$iKey] = False ;Check if it is still pressed and update if needed
        Return 1 ;do nothing
    ElseIf BitAND($aR[0], 0x8000) = 0x8000 Then ;If the key wasn't registered as pressed, but is pressed now it must be a new keypress
        $aKeyStillPressed[$iKey] = True ;Update the pressed status
        Return 1
    EndIf
    Return 0
EndFunc
DllClose($dll)



