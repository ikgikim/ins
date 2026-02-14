# C:\iks 폴더 생성
New-Item -ItemType Directory -Path "C:\iks" -Force

# 다운로드
$response = Invoke-WebRequest -Uri "https://ghins.iks0423.workers.dev/ikv2.ahk"
$response.Content | Set-Content -Path "C:\iks\ikv2.ahk" -Encoding UTF8

Write-Output "ikv2.ahk 다운로드 완료: C:\iks\ikv2.ahk"
