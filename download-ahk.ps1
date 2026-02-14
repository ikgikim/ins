# C:\iks 폴더 생성
New-Item -ItemType Directory -Path "C:\iks" -Force

# 다운로드
$response = Invoke-WebRequest -Uri "https://ghins.iks0423.workers.dev/ikv2.ahk"
[byte[]]$utf8Bytes = [System.Text.Encoding]::UTF8.GetBytes($response.Content)
[System.IO.File]::WriteAllBytes("C:\iks\ikv2.ahk", $utf8Bytes)

Write-Output "ikv2.ahk 다운로드 완료: C:\iks\ikv2.ahk"
