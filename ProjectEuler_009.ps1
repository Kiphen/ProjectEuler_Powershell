<#
.SYNOPSIS
    Project Euler Problem 9 - Special Pythagorean triplet
.DESCRIPTION
    There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
.NOTES
    File Name      : ProjectEuler_009.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param(
$Sum = 1000
)

if($Sum -le 0){throw "Sum must be greater than 0"}

#a^2 + b^2 = c^2
#a+b+c=1000
#
#a^2+b^2=(1000-a-b)^2
#a^2+b^2=a^2+b^2+2ab-2000a-2000b+1000000
#0=2ab-2000a-2000b+1000000=-ab+1000a+1000b-500000
#ab-1000b=1000a-500000
#b=1000(a-500)/(a-1000)
$Answer = $null
$a = 1
$UpperA = $Sum / (2*[Math]::Sqrt(2))
while(($Answer -eq $null) -and ($a -le $UpperA))
    {
    $b=1000*($a-500)/($a-1000)
    if(($b % 1) -eq 0)
        {
        $c=[Math]::Round([Math]::Abs([Math]::Sqrt([Math]::Pow($a,2)+[Math]::Pow($b,2))),9)
        if(($c % 1) -eq 0)
            {
            if(($a + $b + $c) -eq 1000)
                {
                $Answer = @($a, $b, (1000 -$a - $b))
                }
            }

        }
    $a++
    }
    if($Answer -eq $null){throw "No special Pythagorean triplet matches the given sum."}
Write-Output ($Answer[0]*$Answer[1]*$Answer[2])