#!/usr/bin/env bats

@test "By default 10 random numbers will be generated." {
  result="$(./random.sh)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 55 ]
}

@test "Sum of numbers from 1 to 10 should be 55" {
  result="$(./random.sh -n 10)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 55 ]
}

@test "Sum of numbers from 1 to 9 should be 45" {
  result="$(./random.sh -n 9)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 45 ]
}

@test "Sum of numbers from 1 to 8 should be 36" {
  result="$(./random.sh -n 8)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 36 ]
}

@test "Sum of numbers from 1 to 7 should be 28" {
  result="$(./random.sh -n 7)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 28 ]
}

@test "Sum of numbers from 1 to 6 should be 21" {
  result="$(./random.sh -n 6)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 21 ]
}

@test "Sum of numbers from 1 to 5 should be 15" {
  result="$(./random.sh -n 5)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 15 ]
}

@test "Sum of numbers from 1 to 4 should be 10" {
  result="$(./random.sh -n 4)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 10 ]
}

@test "Sum of numbers from 1 to 3 should be 6" {
  result="$(./random.sh -n 3)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 6 ]
}

@test "Sum of numbers from 1 to 2 should be 3" {
  result="$(./random.sh -n 2)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 3 ]
}

@test "Sum of numbers from 1 to 1 should be 1" {
  result="$(./random.sh -n 1)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 1 ]
}

@test "Sum of 0 numbers should be 0" {
  result="$(./random.sh -n 0)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -eq 0 ]
}

@test "Sum of 10 numbers should not be 66" {
  result="$(./random.sh -n 10)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -ne 66 ]
}

@test "Sum of 100 numbers should be greater than 100" {
  result="$(./random.sh -n 100)"
  sum=0
  for c in ${result[@]}; do
    sum=$(echo "${sum} + $c" | bc -l)
  done

  [ "$sum" -gt 100 ]
}

@test "-v should print verbose message as well." {
  result="$(./random.sh -v -n 10)"

  readarray -t y <<<"${result}"

  [ "${y}" == "Verbose mode on." ]
}

# @test "-h should print help message." {
#   result2="$(./random.sh -h)"

#   [ "${result2[0]}" == "Usuage: ./random.sh [-n NUMBERS] [-vh]" ]

# }










