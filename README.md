# Memory-based-Chatbot
Simple Memory based Chatbot - Version 1. 

This started as a basic fun idea of recording data from the user and replying back with answers recorded from the user.  

Looks boring alright even to me but, what makes this exciting is the ability of teaching functions as answers.  
Very similar to what Amazon Lamda function does. I found out about lamda functions just recently while I built this a year ago and   
ya this kind of models have applications in the real world. No matter how stupid and boring it sounds.

Simple tasks like performing arithmetic operations, searching on google, question answer reply, asking time, asking date are  
are provided as of know as part of knowledge base csv file.  
  

To add a function:
Example1 :  
   concious()  
   Please type your Question and press enter - time?
   I don't know, Tell me if you know the answer?  Sys.time()  
   [1] "Great!! Thanks for the answer."  

   Please type your Question and press enter - time?
   [1] "2017-12-17 13:36:40 IST"
  


Example2 :  
   concious()
   Please type your Question and press enter - What's yesterday's date?
   I don't know, Tell me if you know the answer? Sys.Date() - 1
   [1] "Great!! Thanks for the answer."  

   Please type your Question and press enter - What's yesterday's date?
   [1] "2017-12-16"


That's it add a function to your reply and done.

Advanced methods are on the way. This starts getting smarter and faster with next versions.
