#!/bin/bash -x

isPresent=$((RANDOM%2));
perHourSalary=20;
workingHour=0;
if [ $isPresent -eq 0 ]
then
	echo "Employee is absent";
	workingHour=0;
elif [ $isPresent -eq 1 ]
then
	echo "Employee is present";
	workingHour=8;
fi
salary=$(($perHourSalary * $workingHour));
echo "Employee has earned $salary $ today";
