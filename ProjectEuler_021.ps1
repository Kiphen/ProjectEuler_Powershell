<#
.SYNOPSIS
    Project Euler Problem 21 - Amicable numbers
.DESCRIPTION
    Evaluate the sum of all the amicable numbers under 10000.      
.NOTES
    File Name      : ProjectEuler_021.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$Max = 10000)

function GetDivisorSum
    {
    Param([Int]$Divisor)
    $DivisorSum = 0
    $Divisors = @(1)
    $MaxDivisor= [Math]::Sqrt($Divisor)
    if(($MaxDivisor % 1) -eq 0){$Divisors += $MaxDivisor}
    for($n=2;$n -lt $MaxDivisor;$n++)
        {
        if(($Divisor % $n) -eq 0)
            {
            $Divisors += $n
            $Divisors += $Divisor / $n
            }
        }
    $DivisorSum += ($Divisors | Measure-Object -Sum).Sum
    Write-Output $DivisorSum
    }

$Sum = 0
$AmicableNumbers = @()

for($TestNumberA = 4;$TestNumberA -le $Max;$TestNumberA++)
    {
    $SumA = GetDivisorSum($TestNumberA)
    $SumB = GetDivisorSum($SumA)
    if(($SumB -eq $TestNumberA) -and ($SumB -ne $SumA)){$Sum += $TestNumberA;$Sum+=$SumA}
    }
    $Answer = $Sum /2
Write-Output $Answer