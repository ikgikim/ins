# PotPlayer 인터넷 차단
New-NetFirewallRule `
    -DisplayName "Block PotPlayer Internet" `
    -Direction Outbound `
    -Program "C:\Program Files\DAUM\PotPlayer\PotPlayerMini64.exe" `
    -Action Block

# 반디집 인터넷 차단
New-NetFirewallRule `
    -DisplayName "Block Bandizip Internet" `
    -Direction Outbound `
    -Program "C:\Program Files\Bandizip\Bandizip.exe" `
    -Action Block
