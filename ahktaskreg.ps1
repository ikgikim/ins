$taskName = "AutoHotkey_Admin_Run"
$ahkPath = "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
$scriptPath = "C:\iks\ikv2.ahk"
$action = New-ScheduledTaskAction -Execute $ahkPath -Argument "`"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERNAME" -LogonType Interactive -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal -Settings $settings
