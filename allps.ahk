#Requires AutoHotkey v2.0
#SingleInstance Force

; 관리자 권한 실행
if !A_IsAdmin {
    Run '*RunAs "' A_AhkPath '" "' A_ScriptFullPath '"'
    ExitApp
}

; 1. 명령어 리스트
commands := Map(
    "IP 확인", "ipconfig",
    "디렉토리 목록", "ls",
    "시스템 정보", "systeminfo"
)

; 2. GUI 생성 및 전역 변수 설정
myGui := Gui("+AlwaysOnTop", "PS 명령어 제어기")
myGui.SetFont("s10", "Malgun Gothic")

; 전역 변수 lb를 명시적으로 할당
global lb := myGui.Add("ListBox", "r5 w250", MapKeysToArray(commands))

btn := myGui.Add("Button", "Default w80", "실행")
btn.OnEvent("enter", ExecuteCommand)
btn.OnEvent("Click", ExecuteCommand)
lb.OnEvent("DoubleClick", ExecuteCommand)

F1::myGui.Show()

; --- 함수 정의 ---

ExecuteCommand(*) {
    ; 함수 안에서 전역 변수 lb를 사용하겠다고 선언
    global lb 
    
    selectedName := lb.Text
    
    if (selectedName == "") {
        return
    }
    
    cmd := commands[selectedName]
    myGui.Hide()

    ; PowerShell 창 찾기
    SetTitleMatchMode "RegEx"
    targetTitle := "ahk_exe (powershell.exe|pwsh.exe|WindowsTerminal.exe)"
    
    if WinExist(targetTitle) {
        WinActivate 
        if WinWaitActive(targetTitle,, 2) {
            Sleep 150
            
            ; 클립보드를 통한 입력
            OldClipboard := A_Clipboard
            A_Clipboard := cmd
            
            Send "^v"
            Sleep 100
            Send "{Enter}"
            
            ; 클립보드 복구
            SetTimer () => (A_Clipboard := OldClipboard), -500
        }
    } else {
        MsgBox "PowerShell 창을 찾을 수 없습니다."
    }
}

MapKeysToArray(m) {
    arr := []
    for key in m
        arr.Push(key)
    return arr
}