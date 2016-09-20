<#
.SYNOPSIS
    Project Euler Problem 14 - Longest Collatz sequence
.DESCRIPTION
    Which starting number, under one million, produces the longest chain?       
.NOTES
    File Name      : ProjectEuler_014.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$MaxValue = 1000000)

function GetLength
    {
    Param($CollatzNumber)
    $Count = 1
    while($CollatzNumber -ne 1)
        {
        if(($CollatzNumber % 2) -eq 1)
            {$CollatzNumber = 3 * $CollatzNumber + 1}
        else
            {$CollatzNumber = $CollatzNumber / 2}
        $Count++
        }
    Write-Output $Count
    }

$HighValue = 0
for($n=1;$n -lt $MaxValue;$n++)
    {
    $Length = GetLength($n)
    if($Length -gt $HighValue){$HighValue = $Length;$Answer=$n}
    }

Write-Output $Answer