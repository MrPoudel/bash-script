
#! bin/bash

num1=20.5
num2=5
#for floating point arithmentic | bc is needed
echo "$num1 + $num2" | bc
echo "$num1 - $num2" | bc
echo "$num1 * $num2" | bc

echo "20.5*5" | bc
echo "scale=20;20.5/5" | bc
echo "20.5%5" | bc

num=4

#math functions like square root and cube need -l #a math library
echo "scale=2;sqrt($num)" | bc -l
echo "scale=2;3^3" | bc -l

