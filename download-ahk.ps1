New-Item -ItemType Directory -Path "C:\iks" -Force

$response = Invoke-WebRequest -Uri "https://ghins.iks0423.workers.dev/ikv2.ahk"
[System.IO.File]::WriteAllBytes("C:\iks\ikv2.ahk", $response.Content)

Write-Output "ikv2.ahk 다운로드 완료: C:\iks\ikv2.ahk"
