# Submission Franziska Ahrend - Stage 2 - Hack Bio
print('Submission by Franziska Ahrend')
#Calculate the product of 31 and 78
31*78
#Divide 697 by 41
697/41
#Add 314 and 654
314+654
#Subtract 23 from 56765
56765-23
#Assign 39 to x
x <- 39
#Assign 14 to y
y <- 14
#Make z the value of x - y
z <- x - y
z
#Calculate the square root of 2345, and perform a log2 transformation on the result
log2(sqrt(2345))
#Create a vector called vec1 containing the numbers 2,5,8,12 and 16
vec1 <- c(2,5,8,12,16)
#Use seq() to make a vector of 100 values starting at 2 and increasing by 3 each time and store it in a new variable
vec2 <- seq(2,300,3)
vec2
#Extract the values at positions 5,10,15 and 20 in the vector of 100 values you made
vec2[5]
vec2[10]
vec2[15]
vec2[20]
#Extract the values at positions 10 to 30 in the vector of 100 values you made
vec2[10:30]
#Enter the following into a vector with the name mouse_colour. Remember to surround each piece of text with quotes: purple, red, yellow, brown
mouse_colour <- c('purple', 'red', 'yellow', 'brown')
mouse_colour
#Enter the following into a vector with the name mouse_weight: 23, 21, 18, 16
mouse_weight <- c(23, 21, 18, 16)
mouse_weight
#Join the 2 vectors together using the data.frame function 
#to make a data frame named mouse_info with 2 columns and 4 rows. 
#Call the first column ‘color’ and the second one ‘weight’
mouse_data <- data.frame('color' = mouse_colour,  'weight' = mouse_weight)
print(mouse_data)
#Read the file ‘small_file.txt’ [https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt] into a new data structure using read.table() OR read.delim(). 
#Remember to assign a name to the data that you read in using the assignment operator
testDS <- read.table('https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt')
# View the data set to check that it has imported correctly
print(testDS)
# Read the file ‘Child_Variants.csv’ [https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true] into a new data. 
#This is a comma-separated file so you should use read.csv(). Again, remember to assign a name to the data when you import it
childVariants <- read.csv('https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true')
#Use head and View to look at the data set to check that it has imported correctly.
View(head(childVariants)) #just showing the first 6 lines, if 'View' and 'head' is swiched, then we see the whole table.
#Calculate the mean of the column named MutantReadPercent. 
#Think about how you are going to access a single column first (probably by using the $ notation or [] notation), then once you can access the data pass it to the mean function
View(childVariants['MutantReadPercent'])
#childVariants[5,11] #test
#typeof(childVariants[5,11])
meanMutantReadPercent = mean(childVariants[,11], na.rm = TRUE)
meanMutantReadPercent
#Create a filtered version of the child variants dataset that only includes rows where the MutantReadPercent is >=70 using subset() function or the [] notation
filterDF <- subset(childVariants, MutantReadPercent >= 70 )
View(filterDF)
#Visualization:
#Search google for the “`Iris flower dataset`”. You are searching for the dataset because we want you to learn on how to search for datasets yourself.
irisFlDF <- read.csv('https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7/raw/0e7a9b0a5d22642a06d3d5b9bcbad9890c8ee534/iris.csv')
View(irisFlDF)
#With relevant plots, which species of flower has
#shorter sepal length but longer width
irisSetosa  <- subset(irisFlDF, species == 'setosa' )
irisVersicolor <- subset(irisFlDF, species == 'versicolor' )
irisVirginica  <- subset(irisFlDF, species == 'virginica' )
#View(irisVirginica)

boxplot(irisVirginica$sepal_length, irisVirginica$sepal_width, irisVersicolor$sepal_length, irisVersicolor$sepal_width, irisSetosa$sepal_length, irisSetosa$sepal_width, main="Flowers' length and width of sepal ", col = c(3,4), ylab = 'Sepal length (green) and width (blue) in cm')
axis(side= 1, at = c(1.5, 3.5, 5.5), labels = c('Virginica','Versicolor','Setosa'))
print('The Setosa has shorter sepal length but longer width')
#longer sepal lengths and shorter sepal widths
print('The Virginica has longer sepal lengths and shorter sepal widths.')

#With relevant plots, which specie of flower has
#shorter petal length as well as petal width
meanPetalLegthSetosa <- mean(irisSetosa$petal_length)
meanPetalLegthVersicolor <- mean(irisVersicolor$petal_length)
meanPetalLegthVirginica<- mean(irisVirginica$petal_length)
print(c(meanPetalLegthSetosa, meanPetalLegthVersicolor, meanPetalLegthVirginica))

meanPetalWidthSetosa <- mean(irisSetosa$petal_width)
meanPetalWidthVersicolor <- mean(irisVersicolor$petal_width)
meanPetalWidthVirginica<- mean(irisVirginica$petal_width)
print(c(meanPetalWidthSetosa, meanPetalWidthVersicolor,meanPetalWidthVirginica))

meanLengths <- c(meanPetalLegthSetosa,meanPetalLegthVersicolor, meanPetalLegthVirginica)
meanWidths <- c(meanPetalWidthSetosa, meanPetalWidthVersicolor, meanPetalWidthVirginica)

plot(x = meanLengths, xlim=c(0,6), y = meanWidths, bg = 'red', main="Flowers' length and width of petal ", xlab = 'Petal legth in cm', ylab = 'Petal width in cm')
text(x = meanLengths, y = meanWidths, labels = c('Setosa','Versicolor','Virginica'), pos = 2)

print('The Setosa has shorter petal length as well as petal width')
#longer petal length as well as petal width
print('The Virginica has longer petal length as well as petal width')


#Which variables (or columns) correlate best (use pairs() function)

#Separation of numeric variables and species groups
df <- irisFlDF[1:4]
species <- iris[, 5]
#print(unique(species)) #set of species
l <- length(unique(species)) # Number of different species
#l
pairs(df, col='red', main = "pairs() plot, green: virginica, blue: versicolor, red: setosa")
par(xpd = TRUE)
#legend("bottom", fill = c('red','blue','green'), legend = c(levels(species)), ncol = 3)
# col = c('red','blue','green')[species]
print('Strong positive correlation is between the petal_length and petal_width.')



#Short reminders for me:
#install.packages("modeest")


