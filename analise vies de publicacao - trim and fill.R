
#trim and fill

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#vies de publicação - funnel plot

prev<-metaprop(positivo,total,autor,method = "Inverse",method.ci = "CP",
               type.random = "diamond", text.fixed = "",comb.fixed = F,
               weight.study = "same",sm = "pft")

metabias(prev,method.bias = "linreg")

funnel(prev)


#trim and fill

s<-trimfill(prev)

funnel(s)

metabias(s,method.bias = "linreg")

funnel.meta(s,comb.fixed = T,comb.random = T,level = 0.95,bg = "black",
            lty.fixed = 3,lty.random = 1,
            pch = if (!inherits(s,"trimfill")) 21 else ifelse(s$trimfill, 1, 21))

legend("topright",inset = 0.03,legend = c("Studies","Missing studies"),
       pch = c(21,1),pt.cex = 1.3,cex = 0.8,pt.bg = "black",xjust = 0.5)

title(main = list("Funnel plot with pseudo 95% confidence limits",font=1))

title(main = list("Funnel plot of the seroprevalence in Europe",font=1))
