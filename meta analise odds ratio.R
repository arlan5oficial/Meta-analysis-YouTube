#META ANÁLISE DE DADOS BINÁRIOS (ODDS RATIO, RISCO RELATIVO)

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#meta analise para Odds Ratio

OR<-metabin(`trat-pos`,`trat-n`,`control-pos`,`control-n`,autor,
            data = tab,sm = "OR")

forest(OR)

#formatar o forest plot

forest(OR,pooled.events = T,lab.e = "Machos",lab.c = "Fêmeas",
       comb.fixed = F,weight.study = "same",test.overall = T,digits.pval = 4,
       print.Q = T,col.diamond.random = "black",
       leftcols = c("studlab", "event.e", "n.e", "event.c", "n.c"),
       leftlabs = c("Autor", "Positivo", "Total", "Positivo", "Total"),
       text.random = "Total",rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("OR","IC 95%","Peso"),col.by = "black")





#META ANÁLISE DE DADOS BINÁRIOS (ODDS RATIO, RISCO RELATIVO) COM SUBGRUPOS

#ativar o pacote

library("meta")

#importar a planilha Excel com os dados

#acessar as colunas individualmente

attach(tab)

#meta analise para Odds Ratio

OR<-metabin(`trat-positivo`,`trat-total`,`control-positivo`,
            `control-total`,autor,data = tab,sm = "OR",byvar = obs)

forest(OR)

forest(OR,pooled.events = T,lab.e = "Alduto",lab.c = "Jovem",
       comb.fixed = F,weight.study = "same",test.overall = T,
       digits.pval = 4,print.Q = T,col.diamond.random = "black",
       leftcols = c("studlab", "event.e", "n.e", "event.c", "n.c"),
       leftlabs = c("Autor", "Positivo", "Total", "Positivo", "Total"),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("OR","IC 95%","Peso"),
       col.by = "black",bylab = "",text.random.w = "Subtotal",
       text.random = "Total")


