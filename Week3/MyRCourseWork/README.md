Project Title: Week 3 - Directories: code, data, results and sandbox.
Description: 

Code:
1. apply1.R
This is an R script. This script demonstrates how to use the *apply family of functions for vectorisation. Apply can be used when you want to apply a function to the rows or columns of a matrix. This script takes no arguments from the command line and prints to the console.

2. apply2.R
This is an R script. This script behaves similarly to apply1.R, however instead of using the *apply family of functions on some of R's inbuilt functions, here it is being demonstrated on our own defined functions. This script takes no arguments from the command line and prints to the console.

3. basic_io1.R
This is an R script. This is a simple script to illustrate R input-output. This script takes in a .csv file from the data directory and appends the data contained in this to a new .csv file in the results directory. 

4. boilerplate.R
This is an R script. This script defines a function that states the class of the given inputs into the function. This function is saved to the workspace and therefore can be called from the command line with given inputs without sourcing the whole boilerplate script. This script prints to the console. 

5. break.R
This is an R script. This script demonstrates the usefulness of breaking out of loops when a condition is met. We use break when we cannot set a target number of iterations and would like to stop the loop execution once some condition is met. This script takes no arguments from the command line and prints to the console. 

6. browse.R
This is an R script. This script illustrates the browser() function, a simple way of debugging in R. The browser function allows you to insert a breakpoint in your script and then step through the code. It is used to examine local variables e.g. inside a for loop. This script takes no command line arguments and prints to the console.

7. control_flow.R
This is an R script. This script exemplifies the use of control-flow tools in fine-tuning a programme, such statements are useful to include in functions and scripts if you only want to perform tasks under a certain condition. This script takes no arguments and prints to the console.

8. DataWrang.R
This is an R script. This script introduces data wrangline, the tidying up of data and formatting before analysis. 

9. DataWrangTidy.R
This is an R script. This script behaves similarly to DataWrang.R except it used the additional package: tidyverse.

10. Florida.Latex.tex
This is a simple .tex file.

11. Florida.R
This is an R script. This script calculates the correlation coefficient between temperature and time in Key West, Florida. This is done using a permutation analysis, in order to answer the question: is Florida getting warmer? This script takes no arguments from the command line but extracts data from a .csv file in the data directory within the script.

12. get_TreeHeight.py
This is a Python script. This script behaves exactly the same as get_TreeHeight.R but imports  extra packages: csv, math, os.path, sys, warnings. 'csv' allows us to use .reader() and .writer() when dealing with .csv files. 'math' computes radians and provides a value for tan without manual calculation. 'os.path'allows us to remove file extensions and pathways in order to extract the input file name and attach to the output file name. 'sys' allows us to deal with command line arguments. 'warnings' allows us to provide feedback to the user if the correct inputs are not provided. 

13. get_TreeHeight.R
This is an R script. This script takes a .csv file name from the command line and outputs the results like TreeHeight.R, but includes the input file name in the ouput file name as InputFileName_treeheights.csv.

14. Girko.R
This is an R script. This script illustrates Girko's circular law, and draws the results of a simulation. This script outputs a .pdf file to the results directory. 

15. GPDD_Data.R
This is an R script. This script demonstrates the capabilities of the additional package: maps. 
16. MyBars.R

17. next.R
This is an R script. This script demonstrates using the next command to skip to the next iteration of a loop. Similarly, next and break can both be used within other loops. This script takes no arguments from the command line and prints to the console. 

18. plotLin.R
19. PP_Dists.R
20. PP_Regress.R
21. preallocate.R
This is an R script. This script demonstrates the efficiency of pre-allocation. Memory allocation for a particular variable is particularly slow in R when you are using loops, due to the loops repeatedly resizing a vector and re-allocating memory. Pre-allocatign a vector that fits all the values, doesnt require a re-allocation of memory each iteration. This script takes no arguments from the command line and prints to the console.

22. R_conditionals.R
This is an R script. This script illustrates examples of functions with conditionals, such as n %% 2 == 0. This conditional only allows execution if n is divisible by two, I.e. if it is an even number. This script saves the functions to the workspace and therefore can be called from the command line with given inputs without sourcing the whole script. This script prints to the console. 

23. Ricker.R
This is an R script. This script illustrates the Ricker model, a classic discrete population model which was introduced in 1954 by Ricker to model recruitment of stock in fisheries. This script takes no arguments from the command line and prints to the console.

24. run_get_TreeHeight.sh
This is a simple shell script. This script tests get_TreeHeight.R and get_TreeHeight.py, using trees.csv from the data directory as the example file. This outputs two files to the results file. 

25. sample.R
This is an R script. This script demonstrates vectorisation using lapply and sapply. Both of these apply a function to each element of a list, but the former returns a list, while the latter returns a vector. This script takes no arguments from the command line and prints to the console.

26. SQLinR.R

27. TAutoCorr.R
This is an R script. This script answers the question: Are temperatures of one year significantly correlated with the next year, across years ina  given location. 

28. TAutoCorr.tex
This is a simple .tex file.

29. TreeHeight.R
This is an R script. This script contains an example of a utility function. The function defined in this script calculates heights of trees given distance of each tree from its base and angle to its top, using the trigonometric formula. This script takes no arguments from the command line, but calls a .csv file from the data directory within the script and outputs a .csv to the results file.

30. try.R
This is an R script. This script illustrates the try function, which catches the errors often found in a script and allows the code to continue. This script takes no arguments from the command line and prints errors to the console.

31. Vectorize1.R
This is an R script. This script demonstrates the computational efficiency of vectorisation, making code more concise, easy to read and less error prone. This script takes no arguments from the command line and prints to the console.

32. Vectorize2.R
This is an R script. This script demonstrates the stochastic Ricker model, similar to the original Ricker model, but with introduced random error. This script behaves in the same way as Ricker.R. This script takes no arguments from the command line and prints to the console. 

Data:
1. EcolArchives-E089-51-D1.csv
2. GPDDFiltered.RData
3. KeyWestAnnualMeanTemperature.RData
4. PoundHillData.csv
5. PoundHillMetaData.csv
6. Results.txt
7. trees.csv

Results:

Sandbox:
Junk files. 