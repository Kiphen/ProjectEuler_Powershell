<#
.SYNOPSIS
    Project Euler Problem 23 - Non-abundant sums
.DESCRIPTION
    Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
      
.NOTES
    File Name      : ProjectEuler_023.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>

$AbundantNumbers = @()
$SumofAbundants = @()
$SumofAbundants += (1..28123)
$Answer = 0
function Abundants
    {
    Param($PossibleAbundant)
    $Divisors = GetDivisors($PossibleAbundant)
    if(($Divisors | Measure-Object -Sum).Sum -gt $PossibleAbundant){Write-Output $true}
    else{Write-Output $false}
    }

function GetDivisors
    {
    Param($Multiple)
    #TODO
    $ResultantDivisors = @(1)
    $MaxDivisor= [Math]::Sqrt($Multiple)
    if(($MaxDivisor % 1) -eq 0){$ResultantDivisors += $MaxDivisor}
    for($n=2;$n -lt $MaxDivisor;$n++)
        {
        if(($Multiple % $n) -eq 0)
            {
            $ResultantDivisors += $n
            $ResultantDivisors += $Multiple / $n
            }
        }
    Write-Output $ResultantDivisors
    }

for($n=2;$n -le 28123;$n++)
    {
    if(Abundants($n)){$AbundantNumbers += $n;Write-Host "$n is abundant"}
    $Test = 0
    for($m = 0;($Test -lt 28123) -and ($m -lt $AbundantNumbers.Length);$m++)
        {
        $Test = $AbundantNumbers[-1] + $AbundantNumbers[$m]
        $SumofAbundants[$Test-1] = 0
        }
    }
$Answer = ($SumofAbundants | Measure-Object -Sum).Sum

Write-Output $Answer