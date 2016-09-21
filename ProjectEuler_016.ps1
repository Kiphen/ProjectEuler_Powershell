<#
.SYNOPSIS
    Project Euler Problem 16 - Power digit sum
.DESCRIPTION
    What is the sum of the digits of the number 2^1000?      
.NOTES
    File Name      : ProjectEuler_016.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$Power = 1000)
$Factor = 2
$Multiplicand = @(2)

for($n=2;$n -le $Power;$n++)
    {
    $Product = @()
    $Carry = @(0)
    for($i=0;$i -lt $Multiplicand.Length;$i++)
        {
        
        $DigitProduct = $Factor* $Multiplicand[$i]
        if($DigitProduct -gt 9){$Carry += 1;$DigitProduct -= 10}
        else{$Carry += 0}
        $Product += $DigitProduct + $Carry[$i]
        if(($i -eq ($Multiplicand.Length -1)) -and $Carry[-1] -eq 1){$Multiplicand += 0}    
        }
    $Multiplicand = $Product
    Remove-Variable -Name Product
    Remove-Variable -Name Carry
    }

$Answer = ($Multiplicand | Measure-Object -Sum).Sum
Write-Output $Answer