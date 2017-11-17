rm(list = ls())
library(tidyr)
library(dplyr)
library(wordcloud2)

wordcloud2(demoFreq,size = 1,shape = 'star')


wordcloud2(demoFreqC, size = 2, fontFamily = "微软雅黑",  
           color = "random-light", backgroundColor = "grey") 

data1 <- demoFreq
data2 <- demoFreqC


batman = system.file("examples/timg.png",package = "wordcloud2")  
###读取形状图片，注意图片默认放在wordclou2的sample包中
wordcloud2(demoFreq, figPath = batman, size = 1,color = "black")  
###绘制云此图，其中demoFreg即为所用的数据，figPath = batman为所用图片  


letterCloud(demoFreq, word = "高考", wordSize = 2,color = 'random-dark',
            backgroundColor = "snow")  
###其中demoFreqC为需要用的词语以及词频数据，word是需要可视化的文字  



#################################################
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_131')

if (!suppressWarnings(require("rJava"))) {
  install.packages("rJava")
  require("rJava")
}
.jinit()
s <- .jnew("java/lang/String", "Hello World!")
s
#########################################################

library(rJava)
library(Rwordseg)
test1 <- "小都督促织女将R语言学习到底！"
test2 <- "小都是统计之都的昵称：)"

require(rmmseg4j)
mmseg4j(test1)
mmseg4j(test2)

require(Rwordseg)


segmentCN(test1)
segmentCN(test2)
insertWords(c("昵称","小都"))
segmentCN(test1)
segmentCN(test2)

system.time(for(i in 1:10000) segmentCN(test1))


segmentCN("结合成分子时")
segmentCN(c("说的确实在理","一次性交多少钱"))


segmentCN("想渊明、《停云》诗就，此时风味。")


segmentCN("花一元钱买了一朵美丽的花",nature =TRUE)
getOption("isNameRecognition")
segmentCN("梅野石是东昆仑盟主")
segment.options(isNameRecognition = TRUE)
segmentCN("梅野石是东昆仑盟主")
getOption("isNameRecognition")


segmentCN("F:\\鬼吹灯.txt")



system.time(segmentCN("F:\\鬼吹灯.txt"))



listDict()
segmentCN("湖北大鼓真是不错啊")
installDict(dictpath = "F:/default.dic",dictname = "aaa")
segmentCN("湖北大鼓真是不错啊")
listDict()

installDict(dictpath = "F:/math.scel",dictname = "math")


segmentCN("真武七截阵和天罡北斗阵哪个厉害")

installDict(dictpath = "F:/金庸武功招式.scel",dictname = "jinyong")

segmentCN("真武七截阵和天罡北斗阵哪个厉害")


uninstallDict(removedict = "math")

segmentCN("画角声断谯门")
insertWords("谯门")
segmentCN("画角声断谯门")

insertWords("谯门",save = TRUE)
###############################################################


content <- readLines("F:\\鬼吹灯.txt")
words = segmentCN(content)
words <- unlist(words)
result <- as.data.frame(table(words))

result <-result[-1,]
result <-result[146:24608,]
result <- result %>% arrange(desc(Freq)) %>% filter(Freq>100)

letterCloud(result, word = "鬼吹灯", wordSize = 2,color = 'random-dark',
            backgroundColor = "snow")  







#######################################################################

library(jiebaRD)
library(jiebaR)#加载包
cutter=worker()#设置分词引擎
content="这是内容，大家自己复制文章就行，这里就不展示了"
segWords<-segment(content,cutter)#对文本进行分词处理
segWords


f<- readLines("F:\\chinese_stopword.txt",encoding = 'UTF-8')

stopwords <- c(NULL)
for(i in 1:length(f)){
  stopwords[i] <- f[i]
}
segWords <- filter_segment(segWords,stopwords)


segWords<-gsub("[0-9a-zA-Z]+?","",segWords)###去除数字和英文
library(stringr)#加载stringr包
segWords<-str_trim(segWords)#去除空格

library(plyr)
tableWord<-count(segWords)##形成词频表,tableWord是数据框格式


library(RColorBrewer)
library(wordcloud)
windowsFonts(myFont=windowsFont("华文彩云")) ##使用华文彩云字体
wordcloud(tableWord[,1],tableWord[,2],random.order=F,col= rainbow(length(freq)),family="myFont")




















