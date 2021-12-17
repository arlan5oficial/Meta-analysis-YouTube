
#Adicionar colunas metaprop

#meta análise toxoplasmose em caprinos

library(meta)

attach(tab)

prev<-metaprop(positivo,total,studlab = paste(autor,pais),
               method = "Inverse",method.ci = "CP",type.random = "diamond",
               text.fixed = "",fixed = F,weight.study = "same",
               subgroup = continente,data = tab,sm = "pft")

#tab$stud<-paste(tab$autor,tab$país) ### DESNECESSÁRIO!!

#prev$autor<-as.data.frame(prev,tab,autor) ### DESNECESSÁRIO!!

#prev$país<-as.data.frame(prev,tab,país) ### DESNECESSÁRIO!!


forest(prev)

forest(prev,pooled.events = T,xlab = "",xlim = c(-3,93),
       digits.tau2 = 2,digits.pval = 4,digits = 2,col.by = "black",
       smlab = "Seroprevalence",colgap.forest.right = "0.0mm",
       subgroup.name = "", studlab = pais,pscale = 100,
       leftcols = c("studlab","event","n","effect", "ci","w.random"),
       leftlabs = c("Region","Positive","Sample size","Seroprevalence (%)","95% CI","Weight"),
       rightcols =c("autor"),rightlabs = c("Author"),bylab = "",text.random = "Total",
       text.random.w = "Subtotal",squaresize = 0.93,col.diamond.random = "black",
       just.addcols.right = "left")

forest(prev,pooled.events = T,xlab = "",xlim = c(-3,93),digits.tau2 = 4,
       digits.pval = 4,col.by = "black",smlab = "Seroprevalence",
       colgap.forest.right = "0.0mm",
       subgroup.name = "", studlab = pais,pscale = 100,
       leftcols = c("studlab","event","n","effect", "ci","w.random"),
       leftlabs = c("Region","Positive","Sample size","Seroprevalence (%)","95% CI","Weight"),
       rightcols =c("autor"),rightlabs = c("Author"),bylab = "",text.random = "Total",
       text.random.w = "Subtotal",squaresize = 0.93,col.diamond.random = "black",
       just.addcols.right = "left",digits = 2,print.Q = T,print.pval.Q = T,
       print.Q.subgroup = T,digits.pval.Q = 4)

