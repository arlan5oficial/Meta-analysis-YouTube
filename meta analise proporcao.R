# intalar pacote "meta"

install.packages("meta")

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#meta análise para estudos de prevalência

prev<-metaprop(positivo,total,autor,method = "Inverse",
               sm = "pft",comb.fixed = F,comb.random = T,
               pscale = 100)

#method="Inverse": modelo de meta-análise clássico com base no método de variância inversa

#sm="PFT": Barendregt et al. (2013) recomendam o uso da Freeman-Tukey double arcsine transformation 


#gráfico - forest plot

forest(prev)

forest(prev,smlab = "Soroprevalência",leftcols = c("studlab","event","n"),
       leftlabs = c("Estudos","Positivos","Total"),
       rightcols = c("effect","ci","w.random"),
       rightlabs = c("Soroprevalência (%)","IC 95%","Peso"),
       xlim = c(-3,33),text.random = "Modelo de efeito aleatório",
       pooled.events = T,col.diamond.random = "black",
       weight.study = "random")


#ANALISE DE SUBGRUPO

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#adicionar subgrupos

prev<-metaprop(positivo,total,autor,method = "Inverse",sm = "pft",
               comb.fixed = F,comb.random = T,pscale = 100,
               byvar = continente)

#forest plot com subgrupos

forest(prev)

forest(prev,smlab = "Soroprevalência",leftcols = c("studlab","event","n"),
       leftlabs = c("Estudos","Positivos","Total"),
       rightcols = c("effect","ci","w.random"),
       rightlabs = c("Soroprevalência (%)","IC 95%","Peso"),
       xlim = c(-3,33),text.random = "Total",text.random.w = "Subtotal",
       pooled.events = T,col.diamond.random = "black",
       weight.study = "random",bylab = "",col.by = "black")

