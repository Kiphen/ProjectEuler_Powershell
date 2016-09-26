<#
.SYNOPSIS
    Project Euler Problem 20 - Factorial digit sum
.DESCRIPTION
    Find the sum of the digits in the number 100!      
.NOTES
    File Name      : ProjectEuler_020.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$Factorial = 100)

function GetIntArray
    {
    Param ($InputNumber)
    $OutputArray = @()

    for($x=1;$InputNumber -ne 0;$x++)
        {
        $Moduland = [Math]::Pow(10,$x)
        $OutputArray += ($InputNumber % $Moduland)
        $InputNumber -= $OutputArray[-1]
        $OutputArray[-1] = $OutputArray[-1]  / [Math]::Pow(10,($x - 1))
        }
    Write-Output $OutputArray
    }

function AddArrays
    {
    Param([Int[]]$Array1,[Int[]]$Array2)
    $ArraySum = @()
    $CarryArray = @(0)
    [Int]$Multiplied = 0
    while($Array1.Length -gt $Array2.Length){$Array2 += 0}
    while($Array2.Length -gt $Array1.Length){$Array1 += 0}

    for($DigitPlace = 0;$DigitPlace -lt $Array1.Length;$DigitPlace++)
        {
        $Added = $Array1[$DigitPlace] + $Array2[$DigitPlace] + $CarryArray[$DigitPlace]
        $ArraySum+= ($Added % 10)
        $CarryArray += ($Added - ($Added % 10))/10
        if($CarryArray.Length -gt $Array1.Length){if($CarryArray[-1] -ne 0){$ArraySum+= $CarryArray[-1]}}
        }
    Write-Output $ArraySum
    }

$Multiplicand = GetIntArray($Factorial)
for($FactorialNumber=($Factorial-1);$FactorialNumber -ge 1;$FactorialNumber--)
    {
    Write-Host "Factorial - $FactorialNumber"

    $Product = @()    
    $Factor = GetIntArray($FactorialNumber)
    for($FactorIndex=0;$FactorIndex -lt $Factor.Length;$FactorIndex++)
        {
        $SubProduct = @()
        for($SubProductDigits = 0;$SubProductDigits -lt $FactorIndex;$SubProductDigits++){$SubProduct += 0}
        $Carry = @(0)
        for($MultiplicandIndex=0;$MultiplicandIndex -lt $Multiplicand.Length;$MultiplicandIndex++)
            { 
            $DigitProduct = $Factor[$FactorIndex]* $Multiplicand[$MultiplicandIndex] + $Carry[$MultiplicandIndex]
            $Carry += ($DigitProduct - ($DigitProduct % 10))/10
            $SubProduct += $DigitProduct % 10 
            if(($MultiplicandIndex -eq ($Multiplicand.Length -1)) -and $Carry[-1] -eq 1){$Multiplicand += 0}
          
            }
        if($Carry[-1] -ne 0){$SubProduct += $Carry[-1]}
        $Product = AddArrays -Array1 $Product -Array2 $SubProduct
        Remove-Variable -Name Carry
        Remove-Variable -Name SubProduct
        }
    $Multiplicand = $Product
    Remove-Variable -Name Product
    }
$Answer = ($Multiplicand | Measure-Object -Sum).Sum
Write-Output $Answer