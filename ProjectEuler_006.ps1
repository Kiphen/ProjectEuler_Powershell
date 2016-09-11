<#
.SYNOPSIS
    Project Euler Problem 6 - Sum square difference
.DESCRIPTION
    Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.       
.NOTES
    File Name      : ProjectEuler_006.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($TopNumber = 100)
$Range = @(1..$TopNumber)
$SumofSquares = 0
foreach($number in $Range){$SumofSquares += [Math]::Pow($number,2)}
$SquareofSums = [Math]::Pow( ($Range | Measure-Object -Sum).Sum, 2)


$Answer = $SquareofSums - $SumofSquares
Write-Output $Answer