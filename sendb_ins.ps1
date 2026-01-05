# PowerShell 스크립트: install-apps.ps1
# 관리자 권한으로 실행해야 합니다.

# 설치할 프로그램 목록
$apps = @(
    "TorProject.TorBrowser",
    "Rizonesoft.Notepad3",
    "7zip.7zip",
    "Ditto.Ditto",
    "SMPlayer.SMPlayer",
    "DuckDuckGo.DesktopBrowser"
)

foreach ($app in $apps) {
    Write-Host "Installing $app ..."
    winget install --id $app --silent --accept-package-agreements --accept-source-agreements --source winget
}
