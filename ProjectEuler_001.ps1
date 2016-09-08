<#
.SYNOPSIS
    Project Euler Problem 1 - Multiples of 3 and 5
.DESCRIPTION
    Find the sum of all the multiples of 3 or 5 below 1000.
    
        
.NOTES
    File Name      : ProjectEuler_001.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param(
  [int]$Multiple_1 = 3,
  [int]$Multiple_2 = 5,
  [int]$TopNumber = 1000
)
if(($Multiple_1 -lt 1)-or($Multiple_2 -lt 1)-or($TopNumber -lt 1)){throw "Negative integers are not allowed."}
$Multiples = @()


$n = 1

do{
if((($n % $Multiple_1) -eq 0)-or (($n % $Multiple_2) -eq 0)){$Multiples += $n}
$n++
}while($n -lt $TopNumber)

$Result = $Multiples | Measure-Object -Sum

Return $Result.Sum