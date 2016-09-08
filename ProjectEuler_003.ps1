<#
.SYNOPSIS
    Project Euler Problem 3 - Largest prime factor
.DESCRIPTION
    What is the largest prime factor of the number 600851475143 ?
    
        
.NOTES
    File Name      : ProjectEuler_003.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>

Param(
  [int64]$Sample = 600851475143
)

function GetPrimeFactors
{
Param([int64]$InputSample)

if($InputSample -le 1){throw "Input must be an integer greater than 1"}
$Limit = [System.Math]::Sqrt($InputSample)
$m = 2
$PrimeFactors = @()
$Factors = @()

#Get initial Factors
while(($Factors[0] -eq $null) -and ($m -le $Limit))
    {
    if(($InputSample % $m) -eq 0){$Factors = ($m, ($InputSample / $m))}
    $m++
    }
#If no factors found the input is Prime
if($Factors[0] -eq $null){$PrimeFactors += $InputSample}
#If not prime Recurse for each Factor and return primes factors
else
    {
    $SubFactors = @()
    foreach($Factor in $Factors)
        {
        $SubFactors += GetPrimeFactors($Factor)
        }
        $PrimeFactors += $SubFactors
    }
return $PrimeFactors
}


$AllPrimeFactors = GetPrimeFactors($Sample)
$LargestPrime = $AllPrimeFactors | Measure-Object -Maximum
Write-Output $LargestPrime.Maximum
