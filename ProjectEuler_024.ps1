<#
.SYNOPSIS
    Project Euler Problem 24 -Lexicographic permutations
.DESCRIPTION
    What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?     
.NOTES
    File Name      : ProjectEuler_024.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int[]]$PermutationSet=@(0..9), [Int]$Place=1000000)
function Factorial
    {
    Param($InputFactorial)
    $FactorialOutput = 1
    for($n = 1;$n -le $InputFactorial;$n++)
        {
        $FactorialOutput = $FactorialOutput * $n
        }
    Write-Output $FactorialOutput
    }
function RemoveFromSet
    {
    Param($InputSet,$InputRemove)

    $OutputSet = @()
    for($x=0;$x -lt $InputSet.Length;$x++)
        {
        if($InputSet[$x] -ne $InputRemove){$OutputSet += $InputSet[$x]}
        }
    Write-Output ($OutputSet | Sort-Object)
    }
$Answer = @()
$Place--
$PermutationSet = $PermutationSet | Sort-Object

for($n= $PermutationSet.Length;$PermutationSet.Length -gt 0;$n--)
    {    
    $Unit = Factorial($n - 1)
    for($m=0;$Place -ge $Unit;$m++)
        {
        $Place -= $Unit
        }    
    $Answer +=$PermutationSet[$m]
    $PermutationSet = RemoveFromSet -InputSet $PermutationSet -InputRemove $PermutationSet[$m]
    }

Write-Output "$Answer"