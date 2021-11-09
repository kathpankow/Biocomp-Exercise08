###Question 1
#load data into R
scores <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="")
#create empty matrix for each team's score over time
UW <- matrix(nrow=(nrow(scores[scores$team=="UW",])+1), ncol=2)
MSU <- matrix(nrow=(nrow(scores[scores$team=="MSU",])+1), ncol=2)
UW[1,] <- 0
MSU[1,] <- 0
#for loop to fill in scores and times
UWrow <- 2
MSUrow <- 2
UWscore <- 0
MSUscore <- 0
for(n in 1:nrow(scores)){
  if(scores$team[n]=="UW"){
    UW[UWrow,1] <- scores$time[n]
    UWscore <- UWscore + scores$score[n]
    UW[UWrow,2] <- UWscore
    UWrow <- UWrow + 1
  }else{
    MSU[MSUrow,1] <- scores$time[n]
    MSUscore <- MSUscore + scores$score[n]
    MSU[MSUrow,2] <- MSUscore
    MSUrow <- MSUrow + 1
  }
}#end loop
#make plot
plot(UW[,1],UW[,2],type='l')
lines(MSU[,1],MSU[,2])

###Question 2
#generate random number
randnum <- sample(c(1:100), 1)
#let user input first guess
guess <- as.integer(readline("I'm thinking of a number from 1 to 100! You have 10 guesses: "))
#for loop
for(n in 1:10){
  if(guess < randnum){
    print("Higher")
    if(n < 10){
      guess <- as.integer(readline("Try again: "))
    }
    if(n == 10){
      print("Sorry! You used up all 10 guesses!")
    }
  }else if(guess > randnum){
    print("Lower")
    if(n < 10){
      guess <- as.integer(readline("Try again: "))
    }
    if(n == 10){
      print("Sorry! You used up all 10 guesses!")
    }
  }else if(guess==randnum){
    print("Correct! Great job!")
    break
  }
}  
