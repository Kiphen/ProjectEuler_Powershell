<#
.SYNOPSIS
    Project Euler Problem 22 - Names scores
.DESCRIPTION
    Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
      
.NOTES
    File Name      : ProjectEuler_022.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($NamesPath)

$Names = @((Get-Content -Path $NamesPath).Replace("`"","").Split(",")) | Sort-Object
$Answer = 0
for($n=0;$n -lt $Names.Length;$n++)
    {
    $AlphabetValue = 0
    for($m =0; $m -lt ($Names[$n]).Length;$m++)
        {
        $NotFound = $true
        for($i = 97;($i -le 122)-and($NotFound);$i++)
            {if("$([char]$i)" -like ($Names[$n])[$m]){$AlphabetValue++;$NotFound = $false}else{$AlphabetValue++}}
        }
    $Answer += ($n+1) * $AlphabetValue
    }

Write-Output $Answer