setwd("C:\\Users\\fanning1207\\Desktop")
news=readxl::read_xlsx("news.xlsx")
news=as.data.frame(news)

for (i in 1:length(news$elecredit_entname)){
  count=length(strsplit(news$news_title[i], "[,]")[[1]])
  count0=length(strsplit(news$news_url[i], "[,]")[[1]])
  count1=length(strsplit(news$news_time[i], "[,]")[[1]])
  count2=length(strsplit(news$news_name[i], "[,]")[[1]])
  if (count==count0 & count==count1 & count==count2){
    outing=data.frame("elecredit_entname"=rep(news$elecredit_entname[i],count),
                      "news_title"=rep("",count),
                      "news_url"=rep("",count),
                      "news_time"=rep("",count),
                      "news_name"=rep("",count))
    outing$news_title=strsplit(news$news_title[i],"[,]")[[1]]
    outing$news_url=strsplit(news$news_url[i],"[,]")[[1]]
    outing$news_time=strsplit(news$news_time[i],"[,]")[[1]]
    outing$news_name=strsplit(news$news_name[i],"[,]")[[1]]
    if (i==1){
      write.table(outing,"news.csv",row.names=FALSE)
    }
    else{
      write.table(outing,"news.csv",row.names=FALSE,col.names = FALSE,append = TRUE)
    }
    print(i)
    }
}