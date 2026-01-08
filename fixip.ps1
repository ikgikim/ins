# 네트워크 어댑터 목록 확인
Get-NetAdapter

# 사용자에게 어댑터 이름 입력받기
$adapterName = Read-Host "설정할 네트워크 어댑터 이름을 입력하세요 (예: Ethernet)"

# 사용자에게 IP, 서브넷, 게이트웨이, DNS 입력받기
$ipAddress     = Read-Host "고정 IP 주소를 입력하세요 (예: 192.168.1.100)"
$prefixLength  = Read-Host "서브넷 PrefixLength를 입력하세요 (예: 24 → 255.255.255.0)"
$gateway       = Read-Host "게이트웨이 주소를 입력하세요 (예: 192.168.1.1)"
$dnsServers    = Read-Host "DNS 서버 주소를 입력하세요 (쉼표로 구분, 예: 8.8.8.8,8.8.4.4)"

# 기존 IP 설정 제거 (필요 시)
# Remove-NetIPAddress -InterfaceAlias $adapterName -Confirm:$false

# 새 IP 설정 적용
New-NetIPAddress `
    -InterfaceAlias $adapterName `
    -IPAddress $ipAddress `
    -PrefixLength $prefixLength `
    -DefaultGateway $gateway

# DNS 서버 설정 적용
Set-DnsClientServerAddress `
    -InterfaceAlias $adapterName `
    -ServerAddresses ($dnsServers -split ",")
