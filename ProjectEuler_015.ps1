<#
.SYNOPSIS
    Project Euler Problem 15 - Lattice paths
.DESCRIPTION
    Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
    How many such routes are there through a 20×20 grid?       
.NOTES
    File Name      : ProjectEuler_015.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$GridSize = 20)
if($GridSize -eq 1){return 2}
elseif($GridSize -eq 0){return 1}
elseif($GridSize -lt 0){throw "GridSize must not be negative"}

$Edge = @(1,2)
$Previous = @()

while($Edge.Length -le $GridSize)
    {
    for($n=($Edge.Length-1);$n -gt 0;$n--){$Edge[$n] = ($Edge[0..$n] | Measure-Object -Sum).Sum}
    $Edge += 2*$Edge[($Edge.Length - 1)]

    }
$Answer = $Edge[-1]
Write-Output $Answer