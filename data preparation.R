# Data Preparatio or data cleaning Method

getwd() # to get the Directory name where R environment is working

setwd("E:\\Vineeth\\R-DS") # Setting the directory where R environment Work

getwd()

fin <- read.csv("Future-500.csv") # open csv file and Create data frame of fin name

fin_backup <- fin # Create new object of same vector values

View(fin) # open the dataframe in tabular view

head(fin) # print top 6 row of the dataframe
head(fin, 10)

View(fin)

tail(fin) # print bottom 6 row of dataframe
tail(fin, 10) # bottom 10 row

str(fin) # print meta data & to perfom the operation

# Note Industry factor, ID, Year, Inception, State, Revenue and Expenses
summary(fin) # to perform Basic statistics
#Id and Inception Value should Unique and doesn't required to perform statistics function on that
# Industry and City Shows categorial Data
# Expences and rEvenue Should be numeric data so that we can perform Statistics on that
# Check once str(fin)

# to change from nonfactorial to factorial
fin$ID # vector representation of ID data

factor(fin$ID) #Converted into factorial It have 500 levels

fin$ID <- factor(fin$ID) # Converting Non-factorial to factorial and saving into fin$ID column
# overwriting ID variable this is called overwritting
fin$ID

summary(fin)
str(fin) # Notice ID is recognized as factor
# Repeat this process for Inception also

fin$Inception <- factor(fin$Inception)

str(fin)
summary(fin)
head(fin)

# Note profit is simple scenario
str(fin)

# Notice Revenue and expences are factor and we need to convert into numeric
# to understand this lets start with profit

fin$Profit <- factor(fin$Profit)
head(fin) # there is no difference

str(fin) # notice profit is now factorial

summary(fin)
# so now we want to cover profit into a non numeric var
# First inclination is incorrect way

fin$Profit <- as.numeric(fin$Profit)

str(fin) # fin data is messed up check profit column and comapre with previous profit column
# notice profit is a num

head(fin) 
summary(fin)

fin <- read.csv("Future-500.csv")
fin

head(fin)

tail(fin, 10)

str(fin)

summary(fin)

# Changing from non factor to factorial

factor(fin$ID)

fin$ID <- factor(fin$ID)

str(fin)

fin$Inception <- factor(fin$Inception)
str(fin)
summary(fin)
head(fin)

# Revenue and expenses are numeric data treated as factor

?gsub
?sub

fin$Expenses <- gsub("Dollars", "", fin$Expenses)
head(fin)
str(fin)

fin$Expenses <- gsub(",", "", fin$Expenses)
str(fin) # Notice now expences is no longer a factorial but a character
head(fin) 

fin$Revenue <- gsub("$", "", fin$Revenue)
str(fin) # notice $ is still there as it is a special character

fin$Revenue <- gsub("\\$", "", fin$Revenue)
str(fin)
fin$Revenue <- gsub(",", "", fin$Revenue)
str(fin) # Now it is character

fin$Growth <- gsub("%", "", fin$Growth)
str(fin)
head(fin)

# Now 3 of variables are now character
# Which means we can convert character into numerics
# It is more convenient to convert character into numeric rather than factorial into numerics


fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)

View(fin)
str(fin) # Notice Expenses, Revenue and Growth are numeric
summary(fin)

# What is NA
# Dealing with missing data

?NA # NA is 3rd Logical component

TRUE #1 This is first Logical component in R
FALSE # This is 2nd Logical component in R
NA

TRUE == FALSE
TRUE == 5
TRUE == 1
FALSE == FALSE
FALSE == 0
!FALSE == TRUE
FALSE == 4
NA == TRUE
NA == FALSE
NA == 15
15 == NA
NA == NA

# Locating Missing Data

head(fin, 24) # Note NA's, row 22 has <NA>, also there are empty Values

?complete.cases
View(fin)

complete.cases(fin)
# Return a logical vector indicating which cases are complete, i.e., have no missing values
# a logical vector specifying which observation / rows have no missing value across the entire sequence
# return a vector in true and false

!complete.cases(fin)

# how to look at subset of Dataframe

fin[complete.cases(fin),]

View(fin[!complete.cases(fin),])

head(fin[!complete.cases(fin),])

fin[!complete.cases(fin),]

nrow(fin)
fin <- read.csv("Future-500.csv")
fin[!complete.cases(fin),]

# The best way to import Data or create Dataframe

fin <- read.csv("Future-500.csv", na.string=c(""))
# after importing value by this syntax then again we have to convert factorial into numeric(Expences, Revenue and Growth)
# and numeric value into factor(ID & Inception)
View(fin)

View(fin[complete.cases(fin),])
View(fin[!complete.cases(fin),])

head(fin,24)
# <NA> for character empty value
#NA for numeric

# if i want to consider any value as NA
# For Example treat NY as NA
# fin <- read.csv("Future-500.csv",na.string = c("","NY"))

fin

# now notice it picks up more rows for NA's
# What is the difference between NA and NA's

str(fin)

head(fin, 20) # Notice now row 14 & 15 <NA>

fin$ID <- factor(fin$ID)
str(fin)
levels(fin$ID)

fin$Inception <- factor(fin$Inception)
str(fin)
summary(fin)

fin$Expenses <- gsub("Dollars", "", fin$Expenses)
summary(fin)
str(fin)
fin$Expenses <- gsub(",", "", fin$Expenses)

fin$Expenses <- as.numeric(fin$Expenses)
summary(fin)
View(fin)

str(fin)

fin$Revenue <- gsub("$", "", fin$Revenue)
str(fin)
fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
str
str(fin)

fin$Revenue <- as.numeric(fin$Revenue)
str(fin)

fin$Growth <- gsub("%", "", fin$Growth)
str(fin)
fin$Growth <- as.numeric(fin$Growth)
str(fin)
View(fin[!complete.cases(fin),])

# It picks more from previous one
# what is the difference between <NA> and Na
# it is factor VS numeric

# filtering : using which() for non missing data
head(fin)

# lets say we want every single row with rev 9746272
fin$Revenue == 9746272 
fin[fin$Revenue == 9746272,]
# there are so many NA's in the two row below
# they are mysterious rows
# when we execute this 

fin$Revenue == 9746272 # notice there are NAs here for same value

NA == 9746272
9746272 == NA

?which # give the true indices of logical object
which(fin$Revenue == 9746272)
# it looks thru the vals where they are true
# it ignores NAs

fin[3]

fin[which(fin$Revenue == 9746272)]
View(fin[which(fin$Revenue == 9746272)])

fin[which(fin$Revenue == 9746272),]
# View(fin[which(fin$Revenue == 9746272),])
# now we are passing this
# previously we used logical vector to filter our column
# now this will end up passing this row nums
# this is second approach
# fin[c(2,3,5),]

head(fin)

fin$Employees == 45
fin[fin$Employees == 45,]
View(fin[fin$Employees == 45,])
fin[which(fin$Employees == 45),] # Notice NAs are gone
View(fin[which(fin$Employees == 45),]) 

# Filtering: using is.na() for missing data
# how we pick those rows which have NAs

head(fin)

# lets say we want all the rows which have NAs in Expenses column

fin$Expenses == NA # This is how the filter looks

fin[fin$Expenses == NA, ] # this is not what we want and this is not helpful

is.na()

a <- c(1, 24, 543, NA, 76)
is.na(a)

is.na(fin$Expenses)
fin[is.na(fin$Expenses), ]
# Notice we get exact 3 rows and all of them have expenses as NA

# Removing records with missing data
# first always make backup of your Data

View(fin)

fin_backup <- fin
View(fin_backup)

View(fin[!complete.cases(fin),])
# This will gives us all the row which have NAs or missing value in some or other column

fin[is.na(fin$Industry), ] # This gives which rows are NAs for Industry column 
View(fin[is.na(fin$Industry), ])
View(fin[!complete.cases(fin$Industry),])

fin[!is.na(fin$Industry),]

View(fin)
fin

View(fin[!complete.cases(fin),])

# Resetting the Dataframe index
fin

fin <- fin[!is.na(fin$Industry),]
View(fin)

rownames(fin)
nrow(fin)

1:nrow(fin)

rownames(fin) <- 1:nrow(fin)
rownames(fin)
View(fin) # now notice the row index is 498 different from ID column

# Another alternative way

fin <- fin_backup
View(fin[!complete.cases(fin), ])

fin[is.na(fin$Industry), ] # gives which rows are empty
fin[!is.na(fin$Industry), ] # gives which rows are not Empty

fin <- fin[!is.na(fin$Industry),]
View(fin)

head(fin)
View(fin[!complete.cases(fin),]) # notice the index is same as ID again

fin
head(fin)
rownames(fin) <- NULL
rownames(fin)
head(fin)

fin

# Replacing Missing Data

View(fin[!complete.cases(fin),])

fin[is.na(fin$State), ] # Notice state and city

View(fin[is.na(fin$State) & fin$City == "New York" ,])
fin[c(11, 377),]

fin[is.na(fin$State) & fin$City == "New York","State"] <- "NY"
fin[c(11,377),]

View(fin[is.na(fin$state) & fin$city == "New York",]) # No data is available 

# Check Manually
fin[c(11, 377),]

View(fin[!complete.cases(fin),])
View(fin)

View(fin[is.na(fin$State) & fin$City == "San Francisco",])
fin[c(82,265),]
fin[is.na(fin$State) & fin$City == "San Francisco","State"] <- "CA"
View(fin[c(82,265),])
View(fin[!complete.cases(fin),]) # Now this is getting smaller everytime

# Median imputation Method
# Now we will deal with Employees col it is number of employee in a company
# we have total of 500 companies
# the 

View(fin[!complete.cases(fin),])
median(fin[,"Employees"])

?median

median(fin[,"Employees"], na.rm = TRUE) # by default na.rm is false
#na.rm is used where NA is present. it remove the NA before computation

mean(fin[,"Employees"],na.rm = TRUE)

# find the median for the specific Value
median(fin[fin$Industry == "Retail","Employees"], na.rm = TRUE)
mean(fin[fin$Industry == "Retail","Employees"], na.rm = TRUE)

med_emp_retail <- median(fin[fin$Industry == "Retail","Employees"], na.rm = TRUE)

# Check
fin[3,]

fin[is.na(fin$Employees) & fin$Industry == "Retail","Employees"] <- med_emp_retail
# Check
fin[3,]

# Repeat the same procedure for financial services

mean(fin[, "Employees"], na.rm = TRUE)

# Mean for financial Services

mean(fin[fin$Industry == "Financial Services","Employees"], na.rm = TRUE)

median(fin[,"Employees"], na.rm = TRUE)

median(fin[fin$Industry == "Financial Services" ,"Employees"], na.rm = TRUE)

med_emp_finserv <- median(fin[fin$Industry == "Financial Services" , "Employees"], na.rm = TRUE)

fin[is.na(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- med_emp_finserv
View(fin[!complete.cases(fin),])

# Check 
fin[330,]

# Growth Column
median(fin[fin$Industry == "Construction","Growth"], na.rm = TRUE)
med_grow_constr <- median(fin[fin$Industry == "Construction","Growth"], na.rm = TRUE)

fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"] <- med_grow_constr
View(fin[!complete.cases(fin),])


median(fin[,"Growth"], na.rm = TRUE)

# Check
fin[8,]

View(fin[!complete.cases(fin),])

# Revenue
fin[fin$Industry == "Construction", "Revenue"]
median(fin[fin$Industry == "Construction" , "Revenue"])
median(fin[fin$Industry == "Construction" , "Revenue"],na.rm = TRUE)

med_rev_constr <- median(fin[fin$Industry == "Construction" , "Revenue"],na.rm = TRUE)
fin[is.na(fin$Revenue) & fin$Industry == "Construction" , "Revenue"] <- med_rev_constr
View(fin[!complete.cases(fin),])

# Expences
#notice for industry 8 and 44 have NAs for both expences and profit
# and there is a relationship between these variables

fin[!complete.cases(fin),]
# Notice we got 4 rows
# for rows 8 and 42 not only is expences missing but also
# profit, so we can not calculate Expences = Revenue - profit
# in other words we can not impute 100% accuracy
# but for row 15 we have rev and profit so we can compute with 100% accuracy

fin[fin$Industry == "Construction" , "Expenses"]
median(fin[fin$Industry == "Construction" , "Expenses"],)
median(fin[fin$Industry == "Construction" , "Expenses"],na.rm = TRUE)
med_exp_constr <- median(fin[fin$Industry == "Construction" , "Expenses"], na.rm = TRUE)
fin[is.na(fin$Expenses) & fin$Industry == "Construction" , "Expenses"] <- med_exp_constr
View(fin[!complete.cases(fin),])

fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit), "Expenses"] <- med_exp_constr
# Once check lab book few lines is not written

fin[is.na(fin$Expenses) & is.na(fin$Profit),]
fin[is.na(fin$Expenses) & is.na(fin$Profit), "Expenses"]

# Deriving Values

View(fin[!complete.cases(fin),])
# Expenses = Revenue - Profit
# Revenue = Expenses - Profit

fin[c(8,42),]
fin[is.na(fin$Profit),]
fin[is.na(fin$Profit),"Revenue"]
fin[is.na(fin$Profit),"Expenses"]

fin[is.na(fin$Profit), "Profit"] <- fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit) , "Expenses"]
View(fin[!complete.cases(fin),])

fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]
View(fin[!complete.cases(fin) ,])

# notice there is only one row
# and for inception column is NA
# and it will really affect our analysis
# so we have agreed to keep it empty

# Visualize Results
# Scatterplot Classified by industry showing rev, Expences, profit
# Scplt that includes industry trends for the expences- revenue reletionship
# Boxplot Showing growth by industry

# install.packages("ggplot2")
library(ggplot2)

# Scatter plot classified by industry showing rev, expenses, profit

p <- ggplot(data=fin)
p # Graph is not ploting because we did not provide geometry function


p + geom_point(aes(x = Revenue, y= Expenses))

p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry))

p + geom_point(aes(x = Revenue , y = Profit, colour = Industry, size = 10))

#Scatterplot that includes industry trends for the expenses-revenue relationship

p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry))

p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry)) + geom_smooth(aes(x = Revenue , y = Expenses, colour = Industry))

d <- ggplot(data =fin , aes(x = Revenue , y = Expenses , colour = Industry))
d # Geometry layer is not mentioned

d + geom_point() + geom_smooth()

d + geom_point() + geom_smooth(fill = NA, size = 1.2)

#notice construction trends
# They reach the 10 digit revenue
# their Expenses are decreasing
# It means that is the seew spot to be in
# as rev is growing expense are decreasing
# for fin service as revenue is increasing 

# Boxplots showing growth by industry

f <- ggplot(data = fin, aes(x = Industry, y = Growth, colour = Industry))

f + geom_boxplot()

f + geom_boxplot(size=1)

# notice the medians
# for IT services it is the highest
# for Govt it is lowest
# for construction is 10

f + geom_jitter() + geom_boxplot(size = 1)

f + geom_jitter() + geom_boxplot(size = 1, alpha = 0.5, outlier.color = NA)
