# Dictionary-using-R
This is an R program which takes a word and return its meaning.
You can download the zip file and extract it to a specified folder. You need R to be installed in your sytem.
This dictionary work offline.

# Note:
This program requires R to be preinstalled. If not installed you can install it from CRAN.

The Dictionary txt file is inclded in the 'files' subfolder.

The dict.txt file is The Project Gutenberg EBook of Webster's Unabridged Dictionary of 2009 edition, so words added after that wont be there.

# Link :
https://www.gutenberg.org/ebooks/29765

If you have R installed on your system, you can simply extarct the downloaded zip file then source the dict.R file as follows:

```{r, echo = FALSE}
setwd("C:/../Dictionary-using-R-master/")                          # Your extracted dir
source("dict.R")
```
Or you can download the R binaries from CRAN.

https://cran.r-project.org/bin/windows/base/R-3.4.1-win.exe
