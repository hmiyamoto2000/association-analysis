#MBA
#memory clear
rm(list=ls(all=TRUE))
invisible(replicate(20, gc()))
library(dplyr)

if (!require("arules")) install.packages("arules")
if (!require("arulesViz")) install.packages("arulesViz")
require(arules) # MBAのパッケージ
require(arulesViz)

readfile="A_Nichika.csv" # ファイル読み込み【要ファイル名】

### 0,1タイプ ##

# Read CSV
x=read.csv(readfile, header=T, colClasses="factor")
rulesAp1 <- apriori(x, parameter=list(support=0.063,confidence=0.3,maxlen=2))
rule_Ap1<-rulesAp1[quality(rulesAp1)$lift>1.1]

write(rule_Ap1,"AAAA_03_11.csv",sep=",")
