<#
.SYNOPSIS
    Project Euler Problem 7 - 10001st prime
.DESCRIPTION
    What is the 10 001st prime number?       
.NOTES
    File Name      : ProjectEuler_007.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($TopPrimeCount = 10001)
if($TopPrimeCount -lt 2)
    {
    if($TopPrimeCount -eq 1){return 2}
    elseif($TopPrimeCount -eq 2){return 3}
    else{throw "Input must be an integer greater than 1"}
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



$PrimeCount = 1
$TestNumber = 1

while($PrimeCount -lt $TopPrimeCount)
    {
    $TestNumber += 2
    if(TestPrime($TestNumber)){$PrimeCount++}    
    }

Write-Output $TestNumber