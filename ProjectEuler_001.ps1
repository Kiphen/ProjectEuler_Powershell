#Project Euler Problem 1
Param(
  [int]$Multiple_1 = 3,
  [int]$Multiple_2 = 5,
  [int]$TopNumber = 1000
)
if(($Multiple_1 -lt 1)-or($Multiple_2 -lt 1)-or($TopNumber -lt 1)){throw "Negative integers are not allowed."}
$Multiples = @()


$n = 1

do{
if((($n % $Multiple_1) -eq 0)-or (($n % $Multiple_2) -eq 0)){$Multiples += $n}
$n++
}while($n -lt $TopNumber)

$Result = $Multiples | Measure-Object -Sum

Return $Result.Sum