library(twitteR)
library(tm)
library(wordcloud)
library(plyr)
library(ggplot2)

#major help from
#https://sites.google.com/site/miningtwitter/questions/sentiment/analysis

myKey<-"your information here"
mySecret<-"your information here"
request_token<-"https://api.twitter.com/oauth/request_token"
authorize<-"https://api.twitter.com/oauth/authorize"
access_token<-"https://api.twitter.com/oauth/access_token"
AccessToken<-"your information here"
AccessSecret<-"your information here"

download.file(url="http://curl.haxx.se/ca/cacert.pem",
              destfile="~/TwitterAgAnalysis/cacert.pem")

cred<-OAuthFactory$new(consumerKey=myKey,
                       consumerSecret=mySecret,
                       requestURL=request_token,
                       accessURL=access_token,
                       authURL=authorize)
cred2<-setup_twitter_oauth(consumer_key=myKey,
                           consumer_secret=mySecret,
                           access_token=access_token)

cred$handshake(cainfo="cacert.pem")
5712765

save(cred,file="twitterAuthentification.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(consumer_key=myKey, 
                    consumer_secret=mySecret, 
                    access_token=AccessToken, 
                    access_secret=AccessSecret)

agriculture<-searchTwitter("#agriculture",
                           n=1500,
                           lan="en"
                           #since="2015-12-01",
                           #geocode="40.5122,-88.9886,1000mi"
                           )
                        Rtweets(n=1)
monsanto<-searchTwitter("#Monsanto",
                           n=1500,
                           lan="en"
                           #since="2015-12-01",
                           #geocode="40.5122,-88.9886,1000mi"
                           )
ILcorn<-searchTwitter("corn+Illinois",
                        n=1500,
                        lan="en"
                        #since="2015-12-01",
                        #geocode="40.5122,-88.9886,2500mi"
                        )
FactoryFarms<-searchTwitter("Factory Farm",
                      n=1500,
                      lan="en"
                      #since="2015-12-01",
                      #geocode="40.5122,-88.9886,2500mi"
                     )
farming<-searchTwitter("#farming",
                      n=1500,
                      lan="en"
                      #since="2015-12-01",
                     #geocode="40.5122,-88.9886,1000mi"
                     )
FarmCredit<-searchTwitter("#FarmCredit",
                       n=1500
                       #lan="en"
                       #since="2015-12-01",
                       #geocode="40.5122,-88.9886,1000mi"
                        )
GMO<-searchTwitter("#GMO",
                       n=1500,
                       lan="en"
                       #since="2015-12-01",
                       #geocode="40.5122,-88.9886,1000mi"
                        )
GMOs<-searchTwitter("#GMOs",
                   n=1500,
                   lan="en"
                   #since="2015-12-01",
                   #geocode="40.5122,-88.9886,1000mi"
                     )
Orgainc<-searchTwitter("#Organic",
                    n=1500,
                    lan="en"
                    #since="2015-12-01",
                    #geocode="40.5122,-88.9886,1000mi"
                     )

Orgainc<-searchTwitter("@OrganicLiveFood",
                       n=1500,
                       lan="en"
                       #since="2015-12-01",
                       #geocode="40.5122,-88.9886,1000mi"
                     )
FarmPesticide<-searchTwitter("farms+pesticides",
                       n=1500,
                       lan="en"
                       #since="2015-12-01",
                       #geocode="40.5122,-88.9886,1000mi"
                        )
farmers<-searchTwitter("farmers",
                             n=1500,
                             lan="en"
                             #since="2015-12-01",
                             #geocode="40.5122,-88.9886,1000mi"
                           )
cropinsurance<-searchTwitter("#cropinsurance",
                       n=1500,
                       lan="en"
                       #since="2015-12-01",
                       #geocode="40.5122,-88.9886,1000mi"
                        )
climateChangeAg<-searchTwitter("#cropinsurance",
                             n=1500,
                             lan="en"
                             #since="2015-12-01",
                             #geocode="40.5122,-88.9886,1000mi"
                              )
ToxicFarms<-searchTwitter("Toxic Farms",
                               n=1500,
                               lan="en"
                               #since="2015-12-01",
                               #geocode="40.5122,-88.9886,1000mi"
                              )
cornfarm<-searchTwitter("#corn+farm",
                          n=1500,
                          lan="en"
                          #since="2015-12-01",
                          #geocode="40.5122,-88.9886,1000mi"
                           )
beanfarm<-searchTwitter("#soybean+farm",
                        n=1500,
                        lan="en"
                        #since="2015-12-01",
                        #geocode="40.5122,-88.9886,1000mi"
                        )
Feedthe9<-searchTwitter("#Feedthe9",
                        n=1500,
                        lan="en"
                        #since="2015-12-01",
                        #geocode="40.5122,-88.9886,1000mi"
                        )

rate.limit<-getCurRateLimitInfo(c("lists"))

agricultureDF<-do.call(rbind,lapply(agriculture,as.data.frame))
   agricultureDF$searchTerm<-"#agriculture"
FacoryFarmsDF<-do.call(rbind,lapply(FactoryFarms ,as.data.frame))
   FacoryFarmsDF$searchTerm<-"Factory Farm"
FarmPesticideDF<-do.call(rbind,lapply(FarmPesticide ,as.data.frame))
   FarmPesticideDF$searchTerm<-"farms+pesticides"
Feedthe9DF<-do.call(rbind,lapply(Feedthe9 ,as.data.frame))
   Feedthe9DF$searchTerm<-"#Feedthe9"
GMODF<-do.call(rbind,lapply(GMOs ,as.data.frame))
   GMODF$searchTerm<-"#GMO"
GMOsDF<-do.call(rbind,lapply(GMOs ,as.data.frame))
   GMOsDF$searchTerm<-"#GMOs"
ILcornDF<-do.call(rbind,lapply( ILcorn,as.data.frame))
   ILcornDF$searchTerm<-"corn+Illinois"
OrgaincDF<-do.call(rbind,lapply(Orgainc ,as.data.frame))
   OrgaincDF$searchTerm<-"@OrganicLiveFood"
ToxicFarmsDF<-do.call(rbind,lapply(ToxicFarms ,as.data.frame))
   ToxicFarmsDF$searchTerm<-"Toxic Farms"
beanfarmDF<-do.call(rbind,lapply(beanfarm ,as.data.frame))
   beanfarmDF$searchTerm<-"#soybean+farm"
cornfarmDF<-do.call(rbind,lapply( cornfarm,as.data.frame))
   cornfarmDF$searchTerm<-"#corn+farm"
cropinsuranceDF<-do.call(rbind,lapply(cropinsurance ,as.data.frame))
   cropinsuranceDF$searchTerm<-"#cropinsurance"
farmersDF<-do.call(rbind,lapply(farmers ,as.data.frame))
   farmersDF$searchTerm<-"farmers"
farmingDF<-do.call(rbind,lapply(farming ,as.data.frame))
   farmingDF$searchTerm<-"#farming"
monsantoDF<-do.call(rbind,lapply(monsanto ,as.data.frame))
   monsantoDF$searchTerm<-"#Monsanto"
FarmCreditDF<-do.call(rbind,lapply(FarmCredit ,as.data.frame))
   FarmCreditDF$searchTerm<-"#FarmCredit"

Master<-rbind(FarmCreditDF,
              monsantoDF,
              farmingDF,
              cropinsuranceDF,
              cornfarmDF,
              beanfarmDF,
              ToxicFarmsDF,
              OrgaincDF,
              ILcornDF,
              GMOsDF,
              GMODF,
              Feedthe9DF,
              FarmPesticideDF,
              FacoryFarmsDF,
              agricultureDF)

write.csv(Master,"~/TwitterAgAnalysis/MasterTwitter.csv")

FarmCreditList<-sapply(FarmCredit,function(x)x$getText())
monsantoList<-sapply(monsanto,function(x)x$getText())
farmingList<-sapply(farming,function(x)x$getText())
cropinsuranceList<-sapply(cropinsurance,function(x)x$getText())
cornfarmList<-sapply(cornfarm,function(x)x$getText())
beanfarmList<-sapply(beanfarm,function(x)x$getText())
ToxicFarmsList<-sapply(ToxicFarms,function(x)x$getText())
OrgaincList<-sapply(Orgainc,function(x)x$getText())
ILcornList<-sapply(ILcorn,function(x)x$getText())
GMOsList<-sapply(GMOs,function(x)x$getText())
GMOList<-sapply(GMO,function(x)x$getText())
Feedthe9List<-sapply(Feedthe9,function(x)x$getText())
FarmPesticideList<-sapply(FarmPesticide,function(x)x$getText())
FactoryFarmsList<-sapply(FactoryFarms,function(x)x$getText())
agricultureList<-sapply(agriculture,function(x)x$getText())

MasterList<-c(
   FarmCreditList,
   monsantoList,
   farmingList,
   cropinsuranceList,
   cornfarmList,
   beanfarmList,
   ToxicFarmsList,
   OrgaincList,
   ILcornList,
   #GMOsList,
   GMOList,
   Feedthe9List,
   FarmPesticideList,
   FactoryFarmsList,
   agricultureList
   )

MasterCorpus<-Corpus(VectorSource(MasterList))
MasterCorpus<-tm_map(MasterCorpus,removePunctuation)
MasterCorpus<-tm_map(MasterCorpus,function(x)removeWords(x,stopwords()))
MasterCorpus<-tm_map(MasterCorpus,content_transformer(tolower))

wordcloud(MasterCorpus,max.words=150) 
Mastertdm <- TermDocumentMatrix(MasterCorpus)
m <- as.matrix(Mastertdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

wc<-read.csv("~/TwitterAgAnalysis/WordCloudData.csv")
wordcloud(d$word,d$freq,c(8,.5),2,750,FALSE,.1)
wc_img<-wordcloud(wc$word,wc$freq,c(8,.5),2,750,FALSE,.1)
write.csv(d,"~/TwitterAgAnalysis/WordCloudData.csv")


#Sentiment Analysis

# function score.sentiment
score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
   # Parameters
   # sentences: vector of text to score
   # pos.words: vector of words of postive sentiment
   # neg.words: vector of words of negative sentiment
   # .progress: passed to laply() to control of progress bar
   
   # create simple array of scores with laply
   scores = laply(sentences,
                  function(sentence, pos.words, neg.words)
                  {
                     # remove punctuation
                     sentence = gsub("[[:punct:]]", "", sentence)
                     # remove control characters
                     sentence = gsub("[[:cntrl:]]", "", sentence)
                     # remove digits?
                     sentence = gsub('\\d+', '', sentence)
                     
                     # define error handling function when trying tolower
                     tryTolower = function(x)
                     {
                        # create missing value
                        y = NA
                        # tryCatch error
                        try_error = tryCatch(tolower(x), error=function(e) e)
                        # if not an error
                        if (!inherits(try_error, "error"))
                           y = tolower(x)
                        # result
                        return(y)
                     }
                     # use tryTolower with sapply 
                     sentence = sapply(sentence, tryTolower)
                     
                     # split sentence into words with str_split (stringr package)
                     word.list = str_split(sentence, "\\s+")
                     words = unlist(word.list)
                     
                     # compare words to the dictionaries of positive & negative terms
                     pos.matches = match(words, pos.words)
                     neg.matches = match(words, neg.words)
                     
                     # get the position of the matched term or NA
                     # we just want a TRUE/FALSE
                     pos.matches = !is.na(pos.matches)
                     neg.matches = !is.na(neg.matches)
                     
                     # final score
                     score = sum(pos.matches) - sum(neg.matches)
                     return(score)
                  }, pos.words, neg.words, .progress=.progress )
   
   # data frame with scores for each sentence
   scores.df = data.frame(text=sentences, score=scores)
   return(scores.df)
}

# import positive and negative words
pos = readLines("~/TwitterAgAnalysis/positive_words.txt")
neg = readLines("~/TwitterAgAnalysis/negative_words.txt")

# get text
agriculture_txt = sapply(agriculture, function(x) x$getText())
FactoryFarms_txt = sapply(FactoryFarms, function(x) x$getText())
FarmCredit_txt = sapply(FarmCredit, function(x) x$getText())
FarmPesticide_txt = sapply(FarmPesticide, function(x) x$getText())
Feedthe9_txt = sapply(Feedthe9, function(x) x$getText())
GMO_txt = sapply(GMO, function(x) x$getText())
ILcorn_txt = sapply(ILcorn, function(x) x$getText())
#Orgainc_txt = sapply(Orgainc, function(x) x$getText())
ToxicFarms_txt = sapply(ToxicFarms, function(x) x$getText())
beanfarm_txt = sapply(beanfarm, function(x) x$getText())
cornfarm_txt = sapply(cornfarm, function(x) x$getText())
cropinsurance_txt = sapply(cropinsurance, function(x) x$getText())
farmers_txt = sapply(farmers, function(x) x$getText())
farming_txt = sapply(farming, function(x) x$getText())
monsanto_txt = sapply(monsanto, function(x) x$getText())


# how many tweets of each drink
nd = c(length(agriculture_txt), 
       length(FactoryFarms_txt),
       length(FarmCredit_txt),
       length(FarmPesticide_txt), 
       length(Feedthe9_txt),
       length(GMO_txt),
       length(ILcorn_txt),
       #length(Orgainc_txt),
       length(ToxicFarms_txt),
       length(beanfarm_txt),
       length(cornfarm_txt),
       length(cropinsurance_txt),
       length(farmers_txt),
       length(farming_txt),
       length(monsanto_txt))

# join texts
Master_txt = c(agriculture_txt
               ,FactoryFarms_txt
               ,FarmCredit_txt
               ,FarmPesticide_txt
               ,Feedthe9_txt
               ,GMO_txt
               ,ILcorn_txt
              # ,Orgainc_txt
               ,ToxicFarms_txt
               ,beanfarm_txt
               ,cornfarm_txt
               ,cropinsurance_txt
               ,farmers_txt
               ,farming_txt
               ,monsanto_txt) 

# apply function score.sentiment
scores = score.sentiment(Master_txt, pos, neg, .progress='text')

# add variables to data frame
scores$term = factor(rep(c("agriculture"
                            ,"Factory Farm"
                            ,"#FarmCredit"
                            ,"farms+pesticides"
                            ,"#Feedthe9"
                            ,"#GMO"
                            ,"corn+Illinis"
                           # ,"@OrganicLiveFood"
                            ,"Toxic Farms"
                            ,"#soybean+farm"
                            ,"#corn+farm"
                            ,"#cropinsurance"
                            ,"farmers"
                            ,"#farming"
                            ,"#Monsanto"), nd))
scores$very.pos = as.numeric(scores$score >= 2)
scores$very.neg = as.numeric(scores$score <= -2)

# how many very positives and very negatives
numpos = sum(scores$very.pos)
numneg = sum(scores$very.neg)

# global score
global_score = round( 100 * numpos / (numpos + numneg) )

# colors
cols = c("#7CAE00", "#00BFC4", "#F8766D", "#C77CFF")
names(cols) = c("beer", "coffee", "soda", "wine")

# boxplot
bp<-ggplot(scores, aes(x=term, y=score, group=term)) +
   geom_boxplot(aes(fill=term)) +
   #scale_fill_manual(values=term) +
   geom_jitter(colour="gray40",
               position=position_jitter(width=0.2), alpha=0.3) +
   theme(axis.text.x = element_text(angle = 90, hjust = 1))+
   ggtitle("Boxplot - Twitter Search Term Sentiment Scores")
bp
png("~/TwitterAgAnalysis/bp.png", width=720, height=720)
plot(bp)
dev.off()

png("~/TwitterAgAnalysis/wc.png", width=720, height=720)
plot(wordcloud(wc$word,wc$freq,c(8,.5),2,750,FALSE,.1))
dev.off()