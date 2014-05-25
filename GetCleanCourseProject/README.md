datasciencecoursera
===================

Get and Clean Data - Coursera.
This is the course project.
Author : Yannick Roy
Date : May 25th 2014

I invite you to read the ReadMe_Smartlabs.txt to understand the big picture.
This part is only a small manipulation of their data !

Files :
run_analysis.r - Contains the script to read the data and modify it according to course project instructions.
ReadME.md - *This File*
ReadMe_Smartlabs.txt - Contains the original information from the source of the data.

run_analysis.r :
1) Read X, Y and Subject data. From Test and Training.
2) Combine the Test and Training.
3) Rename the "s" column : Subject, the "y" column : Activity.
4) Match and Modify the Activity name from numerical to characther.
5) Calculate the mean and standard deviation, but don't use it.
6) Combine all the columns for final dataset.
7) melt and dcast it to get a format representing the mean of each sensor and thus for each subject and activity.
8) Export this new tidyDataSet


