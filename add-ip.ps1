param(
    [string]$InterfaceAlias,
    [string]$StartIP,
    [string]$EndIP,
    [int]$PrefixLength
)

$start_last_octet = [int]($StartIP.Split('.')[-1])
$end_last_octet = [int]($EndIP.Split('.')[-1])
$base_ip = ($StartIP -split '\.')[0..2] -join '.'

for ($i = $start_last_octet; $i -le $end_last_octet; $i++) {
    $full_ip = "$base_ip.$i"
    New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $full_ip -PrefixLength $PrefixLength
}
