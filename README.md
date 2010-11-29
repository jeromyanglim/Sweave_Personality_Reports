
### Sweave Example: Personality Reports

This is an example of using Sweave to produce a set of individualised
personality reports based.

### Overview of Main files

* `data` folder includes the raw responses to the 50 item survey
* `meta` folder includes metadata about the personality test
* `main.R` imports the data and loads external packages
* `Report_Template.Rnw` includes the report LaTeX and R code
* `run.R` has the script to load `main.R` and run Sweave
* `run1test.R`, `run5test.R` and `runAll.R`
run Sweave on one case, five cases, all the cases.

A copy of some sample reports can be found in the `backup` folder.

For further explanation on how the source code works go to:
<http://jeromyanglim.blogspot.com>

### To build the project
* Run `make` on the makefile to build one test report
* Run `make test5` to build the first five reports
* Run `make runall` to build all reports. *Warning*: To run the code for every report takes a while to run (perhaps around 10 to 30 minutes) 
* Run `make clean` to clean the `.output` directory
* Run `make backup` to copy the generated reports into the backup directory


### Requirements
The reports were built on a system running:

* R 2.11.1
* Rtools 2.11
* MikTeX 2.8
* Windows 7

It should run on other systems with R, a LaTeX distribution, and tools required for running `make`.

