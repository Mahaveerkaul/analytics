#Data Structure in R


#Vector----
v1 = 10
v1
print(v1)
v2=1:100
v2
(v3 = c(1,6,4,10)) #create & print when both the sides are in paranthesis
v4 = seq(1,100,5)
v4
v5 <- c('A','Dhiraj',"IIFT")
(v6 = 1:100000)
(v7=rnorm(100, mean=60, sd=10))
mean(v7)
v7[1:10]
v7[seq(1,100,2)]
v7[v7>50]
mean(v7[v7>50])
mean(v7[v7>70|v7<50])
hist(v7)
plot(density(v7))
hist(v7, breaks=10)
quantile(v7)
summary(v7)
#matrix----
(data= 24:1)
v12 = c(1,2,'A')
v13 =1:10 
v13+2
v13/sum(v13)
data
m1 = matrix(data)
(m2 = matrix(data,nrow = 4))
(m2 = matrix(data,nrow = 4, byrow = T))
?matrix
m2[1,]
m2[,1]
m2[,seq(1,3,2)]
m2[,c(1,3)]
m2[c(2,4),c(2,4,5)]
rowSums(m2)
colSums(m2)
m2
t1 = table(mtcars$cyl,mtcars$gear,dnn=c('cyl','gear'))
margin.table(t1)
margin.table(t1,2)
?margin.table
addmargins(t1)
?addmargins
addmargins(t1,FUN = mean)
addmargins(t1,FUN=list(list(mean,sum),list(sd,var)))
sweep(m2,MARGIN = 1,STATS = 4,FUN = '+')
m2
m2+4
sweep(m2,MARGIN = 1,STATS = c(1,2,3,4),FUN = '*')
sweep(m2,MARGIN = 2,STATS = c(1,2,3,4,5,6),FUN = '*')
#dataframe----
mtcars
data
AirPassengers
class(mtcars)
head(mtcars,n=3)
tail(mtcars,n=12)
dim(mtcars)
nrow(mtcars)
names(mtcars)
rownames(mtcars)
summary(mtcars)


#summarising / filtering data from DF
mtcars[mtcars$gear==4,]
mtcars[mtcars$gear & mtcars$mpg <25 ,c('mpg','gear','cyl')]
mtcars
mtcars[order(mtcars$mpg),]
head(mtcars)
mtcars[row.names(mtcars)=='Mazda RX4',]

mtcars[c(1,3,5),c(1,5)]
write.csv(mtcars,'mahaveer.csv')
df1 = read.csv('mahaveer.csv')
write.csv(mtcars,'mahaveer1.csv',row.names = F)
(carnames = paste('car',1:32,sep = '_'))


#create DF
#rollno, name, gender , marks , grade
(rollno= 1:30)
(name = paste('student',1:30))
rep('M',3)
set.seed(123) # fixes the sampling function pattern
(gender=sample(c('M','F'),size = 30, replace = T))
(gender=sample(c('M','F'),size = 30, replace = T, prob = c(0.6,0.4)))
prop.table(table(gender))
marks = runif(30,min = 50,max = 100)
x=c(-14.45,-14.67,14.45,14.67)
x
trunc(x)
floor(x)
round(x)
ceiling(x)
(grades = sample(c('A','B','C'),size = 30,replace = T,prob = c(.3,.45,.25)))
prop.table(table(grades))
students= data.frame(rollno,name,gender,marks,grades)
students$name = as.character(students$name)
summary(students)
students$grades = factor(students$grades, ordered=T)
students$grades = factor(students$grades, ordered=T, levels = c('C','B','A'))
table(students$grades)
barplot(table(students$grades),col=1:3)

students[students$gender == 'M' &  students$marks >70,]

#install.packages(dplyr)
students %>% filter(gender=='M'& marks>70) %>% arrange(marks) %>% head(n=3) %>% select(rollno, name)
