#Project Euler Problem 2

$UpperLimit = 4000000
$Fib1=1
$Fib2=2
$FibNext = $Fib1 + $Fib2
$Sum = 0

do{
    if(($Fib2 % 2) -eq 0){$Sum += $Fib2}
    $FibNext = $Fib1 + $Fib2
    $Fib1 = $Fib2
    $Fib2 = $FibNext
    }while($FibNext -lt $UpperLimit)

Write-Output $Sum
