SetTitleMatchMode(2)
#SingleInstance force ;프로세스는 한번만
#SuspendExempt 
#UseHook

if !A_IsAdmin { ;관리자모드로 실행
    Run("*RunAs" "%A_AhkPath%" "%A_ScriptFullPath%")
    ExitApp()
}

^#r::Reload() ;스크립트 재시작

^#e::Edit() ;스크립트 수정


^#!u::{
    file := "c:\iks\ikv2.ahk"
    cmd := 'curl.exe -X PUT "https://ghins.iks0423.workers.dev/ikv2.ahk" --data-binary @"' . file . '"'
    RunWait cmd
}

+Space::Send("{VK15}")   ; 한/영 키 직접 전송

+Backspace::{ ;한줄전체삭제
    Send("+{Home}")
    Sleep(50)
    Send("{Backspace}")
}

F15::Send "{PgUp}" ;페이지업
F18::Send "{PgDn}" ;페이지다운

^#/:: !d ;주소창바로가기

^Left::Send "{Home}" ;HOME키

^Right::Send "{End}" ;END키

^up::Send "{PgUp}" ;페이지업

^down::Send "{PgDn}" ;페이지다운

^#Up::Send "^n" ;새창열기

^#Down::Send "^w" ;창닫기

^!Down::Send "^f4" ;프로그램종료

^XButton1::Send("^w") ;마우스창닫기

^XButton2::Send("^n") ;마우스새창

^!XButton1::Send("!{F4}") ;마우스강종

!WheelUp::Send "{PgUp}" ;Alt + WheelUp → PageUp

!WheelDown::Send "{PgDn}" ;Alt + WheelDown → PageDown


^Esc::Run(A_WinDir "\System32\rundll32.exe powrprof.dll SetSuspendState") ;절전작동

^#!down::DllCall("SendMessage", "ptr", 0xFFFF, "uint", 0x112, "ptr", 0xF170, "ptr", 2) ;모니터만 끈다


^#numpad7::{ ; 창크기640640
    winId := WinGetID("A") 
    WinMove(,,640,640,winId) 
}

^#numpad8::{ ;창크기최대
    winId := WinGetID("A")
    WinMaximize("ahk_id " winId)
}

^#numpad9::{ ;창크기되돌리기
    winId := WinGetID("A")
    WinRestore("ahk_id " winId)
}

;브라우저 포커싱
^#numpad1::WinExist("ahk_exe chrome.exe") ? WinActivate() : Run("chrome.exe") ;크롬실행

^#numpad2::WinExist("ahk_exe brave.exe") ? WinActivate() : Run("brave.exe") ;브레이브실행

^#numpad3::WinExist("ahk_exe duckduckgo.exe") ? WinActivate() : Run("duckduckgo.exe") ;덕덕고실행

;프로그램실행(기타)
!Space::WinExist("ahk_exe everything.exe") ? WinActivate() : Run(A_ProgramFiles "\Everything\Everything.exe") ;에브리띵실행
^#!s::Run("windowssandbox.exe") ;윈도우샌드박스실행

^#t::WinExist("ahk_exe telegram.exe") ? WinActivate() : Run("C:\Users\home\AppData\Roaming\Telegram Desktop\Telegram.exe") ;텔레그램실행

^#k::WinExist("ahk_exe kakaoTalk.exe") ? WinActivate() : Run("C:\Program Files (x86)\Kakao\KakaoTalk\KakaoTalk.exe") ;카톡

^#n::WinExist("ahk_exe notepad.exe") ? WinActivate() : Run("notepad.exe") ;메모장
^#!n::WinExist("ahk_exe notepad++.exe") ? WinActivate() : Run("notepad++.exe") ;노트뿔뿔
#!g::WinExist("ahk_exe mspaint.exe") ? WinActivate() : Run("mspaint.exe") ;그림판
#!b::WinExist("ahk_exe Bitwarden.exe") ? WinActivate() : Run("C:\Program Files\Bitwarden\Bitwarden.exe") ;비트워든
#!p::Run("C:\Program Files\AutoHotkey\WindowSpy.ahk") ;윈스파이
#!c::WinExist("ahk_exe code.exe") ? WinActivate() : Run("C:\Users\home\AppData\Local\Programs\Microsoft VS Code\Code.exe") ;vsCode
^+F12::WinExist("ahk_exe auto_keyboard.exe") ? WinActivate() : Run("C:\COIDEA smart keyboard\auto_keyboard.exe") ;매크로키보드설정


;웹사이트바로가기(윈ALT)
#!home::Run("https://google.com") ;구글검색
#!s::Run("https://docs.google.com/spreadsheets/u/0/") ;구글시트
#!x::Run("https://www.perplexity.ai/") ;퍼플렉시티
#!n::Run("https://www.naver.com") ;네이버
#!i::Run("https://gist.github.com/ikgikim/0cecab80889f092eb5b295f3a0b288c5") ;Gist바로가기
^#s::Run("https://send-anywhere.com/") ;샌드애니웨어
^#u::Run("powershell.exe -Command [System.Diagnostics.Process]::Start('brave', 'https://youtube.com')") ;브레이브유툽열기

#!v::{ ;사운드볼륨조절
programPath := A_WinDir "\System32\sndvol.exe" ; sndvol.exe 경로
    processName := "sndvol.exe"

    if ProcessExist(processName) {
        ; 이미 실행 중이면 종료
        ProcessClose(processName)
    } else {
        ; 실행 중이 아니면 실행
        Run(programPath)
    }
}

^#]:: {
CoordMode("Mouse", "Screen")
MouseClick("Left", 2600, 500)
}

^#[:: {
CoordMode("Mouse", "Screen")
MouseClick("Left", 600, 600)
}

;특정프로그램시_액션

#HotIf WinActive('ahk_exe chrome.exe')
~LButton & RButton::Send ("^w") ;Chrome
#HotIf

#HotIf WinActive('ahk_exe brave.exe')
~LButton & RButton::Send ("^w") ;Brave
#HotIf

#HotIf WinActive('ahk_exe duckduckgo.exe')
~LButton & RButton::Send ("^w") ;Duckduckgo
XButton2::Send("^t") ;Duckduckgo
#HotIf

#HotIf WinActive('ahk_exe MonsterHunterWorld.exe')
+1::Send("{Numpad1}") ;MonsterHunterWorld
+2::Send("{Numpad2}") ;MonsterHunterWorld
+3::Send("{Numpad3}") ;MonsterHunterWorld
+4::Send("{Numpad4}") ;MonsterHunterWorld
!1::Send("{Numpad5}") ;MonsterHunterWorld
!2::Send("{Numpad6}") ;MonsterHunterWorld
!3::Send("{Numpad7}") ;MonsterHunterWorld
!4::Send("{Numpad8}") ;MonsterHunterWorld
#HotIf

#HotIf WinActive('ahk_exe Warframe.x64.exe')
`::esc ;Warframe
MButton::Send("{Esc}") ;Warframe
numpadadd::LButton ;Warframe
numpadsub::MouseMove(122, 72) ;Warframe
numpaddot::esc ;Warframe
#HotIf

#HotIf WinActive('ahk_exe PathOfExile_KG.exe')
NumpadDot::Send("{1}") ;POE2
NumpadMult::{ ;POE2
    A_Clipboard := "/hideout"
    Send("^v{enter}")
}

:*:t=::{ ;POE2
    A_Clipboard := "TY have fun :)"
    Send("^v")
}
#HotIf

#HotIf WinActive('ahk_exe ONCE_HUMAN.exe')
XButton1::Send("{Esc}") ;onceHuman
XButton2::Send("{v}") ;onceHuman
q::f ;onceHuman
+q::q ;onceHuman
RButton::/ ;onceHuman
+RButton::RButton ;onceHuman
+e::3 ;onceHuman
`::m ;onceHuman
#HotIf

#HotIf WinActive('ahk_exe GTA5_Enhanced.exe')
SendMode("input")
numpadenter::Send("{Enter}") ;GTA5
numpaddot::del ;GTA5
+Up::PgUp ;GTA5
+Down::PgDn ;GTA5
`::enter ;GTA5
1::esc ;GTA5
#HotIf


^#!Home:: ;지금 모든 창 수면위로
{
    ; 초기 변수 선언 및 기본값 할당
    winList := []
    filteredList := []
    winCount := 0
    colCount := 0
    rowCount := 0
    winW := 0
    winH := 0
    idx := 0
    row := 0
    col := 0
    x := 0
    y := 0
    hwnd := 0
    class := ""

    ; 전체 창 목록 가져오기
    winList := WinGetList()

    ; 유효한 창만 골라내기 (최소화된 창 및 Shell_TrayWnd 제외)
    for _, thisHwnd in winList {  ; ✅ v2: for _, 변수 in 배열
        try {
            if WinGetMinMax(thisHwnd) != 1 {  ; 최소화된 창 제외
                class := WinGetClass(thisHwnd)
                if (class != "Shell_TrayWnd") {
                    filteredList.Push(thisHwnd)
                }
            }
        } catch {
            continue
        }
    }

    winCount := filteredList.Length
    if (winCount = 0) {
        MsgBox("정렬할 창이 없습니다.")
        return
    }

    ; 화면 크기 가져오기
    screenW := A_ScreenWidth
    screenH := A_ScreenHeight

    ; 정렬할 열/행 수 계산
    colCount := Ceil(Sqrt(winCount))  
    rowCount := Ceil(winCount / colCount)
    winW := Floor(screenW / colCount)
    winH := Floor(screenH / rowCount)

    ; 하나씩 나열되며 창 이동
    for idx, hwnd in filteredList {  ;  v2: for 인덱스, 변수 in 배열
        row := Floor((idx - 1) / colCount)
        col := Mod((idx - 1), colCount)  ;  쉼표 추가
        x := col * winW
        y := row * winH
        try WinRestore(hwnd)
        try WinMove(hwnd, x, y, winW, winH)  ;  모든 파라미터에 쉼표
    }
}

;CTRL윈을 사용하는 참고사항
;^#d_가상데스크톱생성 ^#좌우_이동 ^#F4_가상데탑닫기 ^#+b_그래픽드라이버재시작 ^#m_접근성돋보기 ^#n_내레이터
;^#p_멀티화면출력


^#Right:: {  ; 활성창을 두 번째 모니터로 이동 후 최대화
    if (!WinExist("A") || MonitorGetCount() < 2)
        return
    
    if (MonitorGetWorkArea(2, &Left, &Top, &Right, &Bottom) == 2) {
        WinRestore()
        WinMove(Left, Top, Right-Left, Bottom-Top)
        WinMaximize()
    }
}



#Requires AutoHotkey v2.0

ParseHotkeys() {  ; 이 함수를 스크립트 맨 아래에 추가
    FileEncoding("UTF-8")  ; FileRead 전에 필수! 한글 깨짐 방지[web:31]
    hotkeyList := []
    try {
        scriptContent := FileRead(A_ScriptFullPath)  ; 자기 파일 읽기
    } catch {
        MsgBox("스크립트 파일을 읽을 수 없습니다.")
        return []
    }

    ; 정규식: 주석전 핫키 :: 다음 주석 패턴 추출 (멀티라인 지원)
    ; 예: ^#r::Reload()  → 단축키: ^#r, 기능: Reload()
    Loop Parse, scriptContent, "`n", "`r" {
        line := Trim(A_LoopField)
        if RegExMatch(line, "i)^([^:]+)::\s*(.+?)(?:\s*;|$)", &match) {  ; :: 찾기
            key := Trim(match[1])  ; ^#r
            action := Trim(match[2])  ; Reload()
            
            ; 기능 설명: 다음 라인 주석에서 추출 (선택적)
            desc := ""
            if RegExMatch(line, ";(.+?)$", &comment) {
                desc := Trim(comment[1])
            }
            
            hotkeyList.Push([key, action, desc])
        }
    }
    return hotkeyList
}

global myGui := ""

^F1:: { ;단축키 정리창
    global myGui
    if (myGui = "") {
        myGui := Gui("+Resize", "단축키 정리 GUI")
        lv := myGui.Add("ListView", "w700 h450 r20", ["단축키", "기능", "설명"])  ; 열 넓히기

        ; 자동 파싱해서 채우기!
        hotkeys := ParseHotkeys()
        for _, item in hotkeys {
            lv.Add("", item[1], item[2], item[3])  ; [단축키, 기능, 설명]
        }
        lv.ModifyCol(1, 120)  ; 단축키 열 고정
        lv.ModifyCol(2, 200)  ; 기능 열
        lv.ModifyCol(3, 350)  ; 설명 열 (AutoHdr)

        myGui.OnEvent("Close", (*) => (myGui := ""))
        myGui.OnEvent("Escape", (*) => (myGui := ""))
        myGui.Show("w720 h500 Center")
    } else {
        myGui.Destroy()
        myGui := ""
    }
}

CloseGui() {
    global myGui
    myGui.Destroy()
    myGui := ""
}

#Requires AutoHotkey v2.0

^F12::{ ;모든 응용프로그램 창을 닫기
    if MsgBox("모든 응용프로그램 창을 닫나요? (AHK 제외)", "확인", "YesNo") != "Yes"
        return

    myPID := ProcessExist()
    DetectHiddenWindows(false)  ; v2 함수 문법: false/0으로 숨김 창 제외 [web:41]

    for hwnd in WinGetList() {
        pid := WinGetPid("ahk_id " hwnd)
        if (pid == myPID)
            continue
        try WinClose("ahk_id " hwnd,, 5)  ; 5초 타임아웃 추가
    }
    MsgBox("창 종료 완료.")
}

^#!F12:: { ;모든 사용자 프로세스를 강종
    if MsgBox("모든 사용자 프로세스를 강종하나요? (AHK 제외, 위험!)", "확인", "YesNo") != "Yes"
        return
    
    myPID := ProcessExist()  ; 현재 스크립트 PID
    
    try {
        wmi := ComObjGet("winmgmts:")  ; 수정: ComObjGet 사용 [web:56]
        processes := wmi.ExecQuery("Select * from Win32_Process where SessionId > 0")
        
        for process in processes {
            pid := process.ProcessId
            name := process.Name
            
            ; 현재 스크립트 PID 또는 AutoHotkey.exe 제외
            if (pid == myPID || name == "AutoHotkey.exe")
                continue
            
            try ProcessClose(pid)
        }
        MsgBox("종료 완료.")
    } catch as err {
        MsgBox("WMI 오류: " . err.Message . "`n관리자 권한으로 실행하세요.")
    }
}

