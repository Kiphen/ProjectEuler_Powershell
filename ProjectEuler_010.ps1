<#
.SYNOPSIS
    Project Euler Problem 10 - Summation of primes
.DESCRIPTION
    Find the sum of all the primes below two million.       
.NOTES
    File Name      : ProjectEuler_010.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($TopPrime = 2000000)
if($TopPrime -le 3)
    {
    if($TopPrimeCount -eq 3){return 2}
    else{throw "Input must be an integer greater than 2"}
    }

function TestPrime
{
Param($TestNumber)
$n = 3
$High = [Math]::Sqrt($TestNumber)
$Prime = $true
while(($n -le $High) -and ($Prime -eq $true))
    {
    if(-not ($TestNumber % $n)){$Prime = $false}
    $n++
    }
Write-Output $Prime
}

$Sum = 2
for($TestNumber =3;$TestNumber -lt $TopPrime;$TestNumber += 2)
    {
    if(TestPrime($TestNumber)){$Sum += $TestNumber}    
    }

Write-Output $Sum