# creating a connection to read the lines from the text

con <- file("./getclean/dict.txt")
dict <- readLines(con = con)
close(con = con)

# subsetting the words
dictfinal <- dict[28:973899]

# Extracting the words from the text using Regular Expressions
wordlist <- grep(pattern = "^[A-Z]$|^[A-Z][A-Z]$|^[A-Z][A-Z][A-Z]",x = dictfinal)
words <- dictfinal[wordlist]

# Inputting the word whose meaning is to be found
userip <- readline(prompt = "Enter the word : ")
print(userip)

# changing the value to upper case
word <- toupper(userip)
all <- data.frame(wordlist,words,stringsAsFactors = F)
match <- grep(pattern = word,x = all[,2])
df1 <- as.data.frame(all[match,2])
colnames(df1) <- c("matched")
print(df1)
vec <- all[match,]
vec$pos <- c(1:length(match))
if(length(match) == 1) {
        rownum <- as.numeric(rownames(vec[vec$pos %in% 1,]))
        pos1 <- all[rownum,1]
        pos2 <- all[rownum + 1, 1]
        print(dictfinal[pos1 : (pos2 - 2)])
} else if (length(match) == 0)
{ print("The word entered is not in the Dictionary")
} else {
        num <- readline(prompt = "Select the number corresponding to the the matched word: ")
        num <- as.numeric(num)
        rownum <- as.numeric(rownames(vec[vec$pos %in% num,]))
        pos1 <- all[rownum,1]
        pos2 <- all[rownum + 1, 1]
        cat(" ___________________________________________________________________________________ \n")
        print(dictfinal[pos1 : (pos2 - 2)])
        cat(" ___________________________________________________________________________________ \n")
}
