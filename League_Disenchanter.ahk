;################Copyright##################
;# Twitter: https://twitter.com/StealthOrc #
;# Github: https://github.com/StealthOrc   #
;# Discord: Stealth#8256                   #
;###########################################

msgbox "
       (
        Make sure your League Client Window Size is set to 1600 x 900.
        Open your League Client, open Settings, under General scroll down 'Window Size'
       )", "Hotkeys", 48

msgbox "
       ( 
        Windows Key+F2: Start the Script
        Windows Key+F3: Toggle: Stop/Resume Script
        Windows Key+F4: Quit Script
        Script by https://github.com/StealthOrc
       )", "Hotkeys", "iconi"

PID := 0

FindLeague()
{
    global PID
    if PID == WinActive
      return
    if (not PID := WinWait("League of Legends", , 3))
    {
        msgbox "
            (
                Could not find League Client. 
                Please start the League Client, then restart this script.
            )", "Could not find League", "Iconx"

        ExitApp
    }
    if (not WinActive())  
    {  
        WinActivate()
        WinShow()
    }
    return    
}

#F2::
{    
    ;Crafting
    FindLeague()
    Click 980, 60
    Sleep 2000
    ;Champions only
    FindLeague()
    Click 36, 249
    while (not A_IsPaused)
    {
        ;Champ
        FindLeague()
        Click 128, 274
        Sleep 200
        ;Disenchant
        FindLeague()
        Click 250, 334
        Sleep 200
        ;Acutally Disenchant
        FindLeague()
        Click 679, 644
        Sleep 1400
    }
}

#F3::pause -1  ; pause application

#F4::ExitApp   ; Assign a hotkey to terminate this script