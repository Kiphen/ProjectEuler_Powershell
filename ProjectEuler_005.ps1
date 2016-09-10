<#
.SYNOPSIS
    Project Euler Problem 5 - Smallest multiple
.DESCRIPTION
    What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    
        
.NOTES
    File Name      : ProjectEuler_005.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($TopNumber = 20)
if($TopNumber -lt 1){throw "Input must be an integer greater than 0"}
$Range = @(1..$TopNumber)
$Answer = $null
$n = 1
$TestableRange = $Range.Length / 2
while($Answer -eq $null)
    {
    $TestNumber = $TopNumber[-1] * $n
    $Indivisible = $false
    $m = 1
    while(($m -le $TestableRange) -and ($Indivisible -eq $false))
        {
        $Indivisible = ($TestNumber % $Range[(-$m)])
        $m++
        }
    if($Indivisible -eq $false){$Answer = $TestNumber; Write-Host "Success!"}
    #else{Write-Host "$TestNumber is indivisible by $($Range[(-($m -1))]) - returned $(-not ($TestNumber % $Range[(-($m-1))]))"; Start-Sleep -Milliseconds 100}
    $n++
    }
Write-Output "$Answer is the smallest positive number evenly divisible by all numbers from 1 to $TopNumber ."

