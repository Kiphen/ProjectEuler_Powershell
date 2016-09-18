<#
.SYNOPSIS
    Project Euler Problem 12 - Highly divisible triangular number
.DESCRIPTION
    What is the value of the first triangle number to have over five hundred divisors?       
.NOTES
    File Name      : ProjectEuler_011.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$Divisors = 500)
if($Divisors -le 1){throw "Divisors must be greater than 1"}
$TestNumber = 0
$n = 1
$LowestNumber = [Math]::Pow(($Divisors / 2),2)
while($TestNumber -lt $LowestNumber){$TestNumber = $TestNumber + $n;$n++}
$Answer = $null

function CountDivisors
    {
    Param($InputNumber)
    $d = 0
    $m = 1
    $Max = [Math]::Sqrt($InputNumber)
    while($m -lt $Max){if(($InputNumber % $m) -eq 0){$d = $d + 2};$m++}
    if(($InputNumber % $Max) -eq 0){$d++}

    Write-Output $d
    }

while($Answer -eq $null)
    {
    $DivisorCount = CountDivisors($TestNumber)
    if($DivisorCount -ge $Divisors){$Answer = $TestNumber}
    $TestNumber = $TestNumber + $n;$n++
    }


Write-Output $Answer