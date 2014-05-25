datasciencecoursera
===================

Get and Clean Data - Coursera.<br>
This is the course project.<br>
Author : Yannick Roy<br>
Date : May 25th 2014<br>

I invite you to read the ReadMe_Smartlabs.txt to understand the big picture.<br>
This part is only a small manipulation of their data !<br>

Files :<br>
run_analysis.r - Contains the script to read the data and modify it according to course project instructions.<br>
ReadME.md - *This File*<br>
ReadMe_Smartlabs.txt - Contains the original information from the source of the data.<br>
<br>
run_analysis.r :<br>
1) Read X, Y and Subject data. From Test and Training.<br>
2) Combine the Test and Training.<br>
3) Rename the "s" column : Subject, the "y" column : Activity.<br>
4) Match and Modify the Activity name from numerical to characther.<br>
5) Calculate the mean and standard deviation, but don't use it.<br>
6) Combine all the columns for final dataset.<br>
7) melt and dcast it to get a format representing the mean of each sensor and thus for each subject and activity.<br>
8) Export this new tidyDataSet<br>
<br><br>

