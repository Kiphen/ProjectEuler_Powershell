<#
.SYNOPSIS
    Project Euler Problem 17 - Number letter counts
.DESCRIPTION
    If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?      
.NOTES
    File Name      : ProjectEuler_017.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param([Int]$TopNumber = 1000)

function CountLetters
    {
    Param([Int]$i)
    $Letters = 0
    $Number = $i.ToString()
    switch(($Number.Length))
        {
        4{$Letters+= 11;$Ones = $null}
        3{$Hundreds=0;$Tens = 1;$Ones = 2}
        2{$Hundreds=$null;$Tens = 0;$Ones = 1}
        1{$Hundreds=$null;$Tens = $null;$Ones = 0}
        }
        #Write-Host "Thousands... $Letters"
    if($Hundreds -ne $null)
        {
        switch -regex (($Number[$Hundreds]))
            {
            "[126]"{$Letters += 13}
            "[459]"{$Letters += 14}
            "[378]"{$Letters += 15}
            }
        if(($Number[$Tens] -eq "0")-and($Number[$Ones] -eq "0")){$Letters -= 3}
        }
        #Write-Host "Hundreds... $Letters"
    if($Tens -ne $null)
        {
        switch -regex (($Number[$Tens]))
            {
            "[1]"{switch -regex (($Number[$Ones])){"[012358]"{$Letters += 3}"[4679]"{$Letters += 4}}}
            "[2389]"{$Letters += 6}
            "[456]"{$Letters += 5}
            "[7]"{$Letters += 7}
            }
        }
        #Write-Host "Tens... $Letters"
    if($Ones -ne $null)
        {
        switch -regex (($Number[$Ones]))
            {
            "[126]"{$Letters += 3}
            "[459]"{$Letters += 4}
            "[378]"{$Letters += 5}
            }
        }
    Write-Output $Letters;Write-Host "$Number - $Letters letters."
    }

$Sum = 0
for($n = 1;$n -le $TopNumber;$n++){$Sum += CountLetters($n);Write-Host "`tSum is $Sum"}

Write-Output $Sum