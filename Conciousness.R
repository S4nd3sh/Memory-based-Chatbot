#Create a data.frame within the R environment and start feeding the data in or read a knowledge table provided for some questions preloaded.
#knowledge <- data.frame(Question=1,Answer=1)

#Set working environment
setwd("E://Conciousness/")

#Read knowledge to conciousness
knowledge <- read.csv("knowledge_2016_05_19_17_36_27.csv",stringsAsFactors = F)

#Arithmetic operations
arithmetic <- function(){
  repeat{
    xprsn <- readline(prompt = ">>> : ")
    # tryCatch({eval(parse(text=xprsn))},{error=arithmetic()})
    print(eval(parse(text = xprsn)))
    if(xprsn=="q"){
      concious()
    }}
}

google <- function(){
    search <- readline(prompt = ">>> Search >>> : ")
    browseURL(paste("https://www.google.co.in/#q=",search,sep = ""))
    print("Opening Browser")
    concious()
    }

Question <- function(userQuestion){
  userQuestion <- tolower(userQuestion)
  userQuestion <- gsub("\\?|\\'|!|#|@|%|\\^|&| +$|^ +","",userQuestion)
  
  if(userQuestion=="calculator"){
    print("--Press q to quit--")
    arithmetic()
  }
  else if(tolower(unlist(strsplit(userQuestion," ",fixed = T))[1])=="search"){
    browseURL(paste("https://www.google.co.in/#q=",unlist(strsplit(userQuestion," ",fixed=T))[2],sep = ""))
    print("Opening Browser")
    concious()
  }
  
  if(userQuestion %in% knowledge$Question){
    if(length(grep("[\\(\\)]",knowledge[which(knowledge$Question==userQuestion),"Answer"]))==1){
      print(eval(parse(text=knowledge[which(knowledge$Question==userQuestion),"Answer"])))
      concious()
    }
    print(knowledge[which(knowledge$Question==userQuestion),"Answer"])
    concious()
  }else{
    answer <- readline(prompt = "I don't know, Tell me if you know the answer?  ")
    if(tolower(answer) %in% c("no","naa","no clue","no idea","not a clue","I don't know","I do not know","affirmative","negative")){
      concious()
    }
    knowledge <<- rbind(knowledge,data.frame(Question=userQuestion,Answer=answer))
    print("Great!! Thanks for the answer.")
    knowledge <- unique(knowledge)
    concious()
  }}


concious <- function(){
  question <- readline(prompt ="Please type your Question and press enter - ")
  
  if(question=="1"){
    print("This is what I know for now. :-)  ")
    print(knowledge)
    concious()
  }else{
    Question(question)
  }}


#Fun starts here!!
print("Hi there!!!")
concious()


#To Save today's learnings
write.csv(knowledge,paste("knowledge_",gsub(":| ","_",Sys.Date()),".csv",sep = ""),row.names = F)
