<#
.SYNOPSIS
    Project Euler Problem 19 - Counting Sundays
.DESCRIPTION
    How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?      
    •1 Jan 1900 was a Monday.
    •Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    •A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
.NOTES
    File Name      : ProjectEuler_019.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($Years = @(1901..2000))

function GetSundays
    {
    Param($Year)
    $Sundays = 0
    $LeapYear = GetLeapYear($Year)
    $StartDay = GetStartDay($Year)

    $MonthCounts = @(0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30)
    if($LeapYear){$MonthCounts[2] = 29}

    for($m = 0;$m -le 11;$m++){$StartDay += $MonthCounts[$m];if(($StartDay % 7) -eq 0){$Sundays++}}
    Write-Output $Sundays
    }

function GetLeapYear
    {
    Param($AnotherYear)

    $AnotherLeapYear = (($AnotherYear %4) -eq 0) -and (($AnotherYear % 400) -ne 0)
    Write-Output $AnotherLeapYear
    }
    
function GetStartDay
    {
    Param ($SomeYear)
    $Day = 0
    for($i = 1900; $i -lt $SomeYear;$i++)
        {
        if(GetLeapYear($i)){$Day += 2}
        else{$Day += 1}
        }
    $Day = $Day % 7
    Write-Output $Day
    }

$Max = ($Years | Measure-Object -Maximum).Maximum
$Sum = 0

for($n = 1900; $n -le $Max;$n++)
    {
    if($Years.Contains($n))
        {
        $Sum += GetSundays($n)
        }
    }

Write-Output $Sum