#ANÁLISE DE VIÉS DE PUBLICAÇÃO

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#meta-análise de prevalência

prev<-metaprop(positivo,total,autor,method = "Inverse",
               method.ci = "CP",type.random = "diamond",
               text.fixed = "",comb.fixed = F,weight.study = "same",sm = "pft")

metabias(prev,method.bias = "linreg")

funnel.meta(prev,comb.fixed = T,comb.random = T,level = 0.95,
            lty.fixed = 3,lty.random = 1,pch = 21)

legend("topright",inset = 0.03,legend = c("Studies"),pch = c(21),
       pt.cex = 1.3,cex = 0.8,pt.bg = "gray")

title(main = list("Funnel plot with pseudo 95% confidence limits",font=1))


#meta-análise dados binários (odds ratio; risco relativo)

a<-metabin(`trat-positivo`,`trat-total`,`control-positivo`,`control-total`,
           autor,data=tab,sm = "OR")

metabias(a,method.bias = "linreg")

funnel.meta(a,comb.fixed = T,comb.random = T,level = 0.95,
            lty.fixed = 3,lty.random = 1,pch = 21,bg = "black")

legend("topright",inset = 0.03,legend = c("Studies"),pch = c(21),
       pt.cex = 1.3,cex = 0.8,pt.bg = "black",xjust = 0.5)

title(main = list("Funnel plot - Age",font=1))

