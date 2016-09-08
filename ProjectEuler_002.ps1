<#
.SYNOPSIS
    Project Euler Problem 2 - Even Fibonacci numbers
.DESCRIPTION
    By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
    
        
.NOTES
    File Name      : ProjectEuler_002.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>

$UpperLimit = 4000000
$Fib1=1
$Fib2=2
$FibNext = $Fib1 + $Fib2
$Sum = 0

do{
    if(($Fib2 % 2) -eq 0){$Sum += $Fib2}
    $FibNext = $Fib1 + $Fib2
    $Fib1 = $Fib2
    $Fib2 = $FibNext
    }while($FibNext -lt $UpperLimit)

Write-Output $Sum
