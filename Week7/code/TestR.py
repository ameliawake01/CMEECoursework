"""
This script demonstrates how to command Python to open and run commands in R.
"""

import subprocess
subprocess.Popen("Rscript --verbose TestR.R > ../results/TestR.Rout 2> ../results/TestR_errFile.Rout", shell=True).wait() #write an R script containing the contents of TestR.R and output the results.