#META REGRESSÃO

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#meta análise para estudos de prevalência

prev<-metaprop(positivo,total,autor,method = "Inverse",method.ci = "CP",
               type.random = "diamond",text.fixed = "",comb.fixed = F,
               weight.study = "same",sm = "PRAW")

forest(prev,pooled.events = T,xlab = "Prevalence",pscale = 100,
       xlim = c(-3,36),digits.tau2 = 4)

#Meta regressão

metareg(prev,latitude1)

metareg(prev,longitude1)

metareg(prev,latitude1+longitude1)

#Gráfico de bolhas

graph<-metareg(prev,latitude1)

bubble(graph,ylim = c(-0.1,0.3),xlim = c(0,60),
       xlab = "Latitude",ylab = "Seroprevalence",bg = "transparent",box = F,
       axes = T,col = "black",regline = T,min.cex = 3,max.cex = 7,cex = "fixed",
       lty = 2,lwd = 2)

a<-metareg(prev,longitude1)

bubble(a,cex = "fixed",min.cex = 2.5,max.cex = 7,
       bg = "transparent",xlab = "Longitude",
       ylab = "Seroprevalence",ylim = c(-0.03,0.3),col = "black",
       box = F,lty = 2,lwd = 2)

title(main = list("Meta-regression of latitude on general seroprevalence",font=1))

