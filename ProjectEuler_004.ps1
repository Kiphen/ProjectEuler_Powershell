<#
.SYNOPSIS
    Project Euler Problem 4 - Largest palindrome product
.DESCRIPTION
    Find the largest palindrome made from the product of two 3-digit numbers.
    
        
.NOTES
    File Name      : ProjectEuler_004.ps1
    Author         : Louis Kiphen (Louis.Kiphen@Outlook.com)

.LINK
    https://github.com/Kiphen/ProjectEuler_Powershell
.EXAMPLE

#>
Param($Digits = 3)
if($Digits -lt 1){throw "Input must be an integer greater than 0"}
$LargestNumber = [Math]::Pow(10,$Digits) -1

function CheckPalindrome
{
Param($InputProduct)
$Result = $false
$ProductString = $InputProduct.ToString()
$ReverseString = $null
for($i = $ProductString.Length;$i -gt 0;$i--){$ReverseString += "$($ProductString[$i -1])"}
if($ProductString -eq $ReverseString){$Result = $true}
Write-Output $Result
}

$Palindrome = 0
$n=$LargestNumber
$m=$LargestNumber
$Product = $m * $n

while(($Product -gt $Palindrome) -and ($n -ge [Math]::Pow(10,($Digits -1))))
    {
    while(($Product -gt $Palindrome) -and ($m -ge [Math]::Pow(10,($Digits -1))))
        {    
        if(CheckPalindrome($Product))
            {
            $Palindrome = $Product; $Answer = "Product of $n and $m ..."
            }
        $m--
        $Product = $m * $n
        }
    $n--
    $m=$LargestNumber
    $Product = $n * $m
    }
Write-Output "$Answer The largest palindrom made from two $Digits - digit numbers is $Palindrome"