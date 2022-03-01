#!/bin/bash

empRatePerHr=20
isFullTime=1
isPartTime=2
counter=0
totalWorkingDays=0
totalWorkingDays=1
totalWorkingHrs=0
maxWorkingDays=20
totalSalary=0
maxWorkingHrs=100
declare -A dailyWage

function getWorkingHr(){
	case $1 in
      $isFullTime) empHrs=8
                ;;
      $isPartTime) empHrs=4
                ;;
             *) empHrs=0
                ;;
   esac
	echo $empHrs
}
function getEmpWagePerDay(){
	echo $(($1 * $empRatePerHr))
}
while [[ $totalWorkingHrs -lt $maxWorkingHrs && $totalWorkingDays -le $maxWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	empHrs=$( getWorkingHr $empCheck )
	totalWorkingHrs=$(($totalWorkingHrs+$empHrs))
	dailyWage[((counter++))]=$( getEmpWagePerDay $empHrs)
	dailyWage["day "$totalWorkingDays]=$( getEmpWagePerDay $empHrs)
	((totalWorkingDays++))
done
totalSalary=$(($totalWorkingHrs * $empRatePerHr))
echo $totalSalary
echo ${dailyWage[@]}
echo ${dailyWage[1]}
echo totalSalary: $totalSalary

for ((day=1;day<=20;day++))
do
	echo day $day:${dailyWage[day $day]}
done
