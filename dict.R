# This Dictionary is the work done by Alok Gautam
# The txt file included in could be found at Project Gutenberg.
# No extra R Packages are needed except the base.

# creating a connection to read the lines from the text

con <- file("../getclean/dict.txt")
dict <- readLines(con = con)
close(con = con)

# subsetting the words
dictfinal <- dict[28:973899]
check <- 1

# Extracting the words from the text using Regular Expressions
wordlist <- grep(pattern = "^[A-Z]$|^[A-Z][A-Z]$|^[A-Z][A-Z][A-Z]",x = dictfinal)
words <- dictfinal[wordlist]

while(check == 1) {
# Inputting the word whose meaning is to be found
userip <- readline(prompt = "Enter the word : ")
cat(userip)
cat("\n")

# changing the value to upper case
word <- toupper(userip)

# Merging the Dictionary words with their Row Numbers
all <- data.frame(wordlist,words,stringsAsFactors = F)

# Finding the row numbers of the matched users' word
match <- grep(pattern = word,x = all[,2])
if (length(match) == 0)
{ cat("\nThe word entered is not in the Dictionary"); break }
df1 <- as.data.frame(all[match,2])
colnames(df1) <- c("matched")
print(df1)
vec <- all[match,]
vec$pos <- c(1:length(match))
if(length(match) == 1) {
        rownum <- as.numeric(rownames(vec[vec$pos %in% 1,]))
        pos1 <- all[rownum,1]
        pos2 <- all[rownum + 1, 1]
        cat(" ___________________________________________________________________________________ \n")
        cat(dictfinal[pos1 : (pos2 - 2)])
        cat("\n ___________________________________________________________________________________ \n")
} else if(length(match) != 1) {
        num <- readline(prompt = "Select the number corresponding to the the matched word: ")
        num <- as.numeric(num)
        rownum <- as.numeric(rownames(vec[vec$pos %in% num,]))
        pos1 <- all[rownum,1]
        pos2 <- all[rownum + 1, 1]
        cat(" ___________________________________________________________________________________ \n")
        cat(dictfinal[pos1 : (pos2 - 2)])
        cat("\n ___________________________________________________________________________________ \n")
}
        cat("Do you Wish to search more words? \n Enter : \n 1. Yes \n 2. No \n")
        ip <- readline()
        ip <- as.numeric(ip)
        if (ip == 2) {break}
}
