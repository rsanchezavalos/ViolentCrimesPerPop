#install.packages("repmis")
library(repmis)
library(R2OpenBUGS)
library(Hmisc)



source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_NFLDraft_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_DatosMexico_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_Donohue&Levitt_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_MEXBaseline_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_USCommData_Data.RData?raw=true")

source("https://raw.githubusercontent.com/jcmartinezovando/est46111_datos/master/BayLinReg.R")
source("https://raw.githubusercontent.com/jcmartinezovando/est46111_datos/master/BayHierLinReg.R")

# Selección de Variables


# Especifiquen un modelo de probabilidad (con base en la distribución normal o gamma) para
# describir la variabilidad de la tasa de incidencia criminal entre las comunidades.

n <- length(USCommData$ViolentCrimesPerPop)

#-Defining data-
data<-list("n"=n,"x"=USCommData$ViolentCrimesPerPop)

#-Defining inits-
inits<-function(){list(mu=0,sig=1,x1=0)}
#inits<-function(){list(r=1,eta=1,x1=0)}

#-Selecting parameters to monitor-
parameters<-c("mu","sig","x1")

#-Running code-
#OpenBUGS
ej2.sim<-bugs(data,inits,parameters,model.file="a.txt",
              n.iter=5000,n.chains=1,n.burnin=500)

ej2.sim$summary
hist(rlnorm(2000,.23,1/.23))


ggplot() + geom_histogram(USCommData,aes(USCommData$ViolentCrimesPerPop)) 

+ geom_histogram(aes(rlnorm(10000,.23,.23)))


# Efectúen un contraste de hipótesis para evidenciar si existen diferencias en las tasas de incidencia
# criminal entre los estados.


# Definan un modelo de probabilidad que explique la incidencia criminal de las comunidades
# en términos de las otras variables socioeconómicas y demográficas disponibles. Determinen
# cuál conjunto de estas variables socioeconómicas y demográficas es más relevante para
# explicar las tasas de incidencia criminal.


# Decriban si existe evidencia empírica para suponer que la relación de la tasa de incidencia
# criminal en las comunidades con las variables socioeconómicas y demográficas disponibles
# es distinta entre entidades.



 <- read.csv("roubik_2002_coffe_yield.csv")
new_yield_80 <- d$yield_61_to_80[d$world == "new"]
new_yield_01 <- d$yield_81_to_01[d$world == "new"]
t.test(new_yield_01, new_yield_80, paired = TRUE, alternative = "greater")


install.packages("BayesianFirstAid")
library(BayesianFirstAid)
bayes.t.test(new_yield_01, new_yield_80, paired = TRUE, alternative = "less")

old_yield_80 <- d$yield_61_to_80[d$world == "old"]
old_yield_01 <- d$yield_81_to_01[d$world == "old"]
bayes.t.test(old_yield_01, old_yield_80, paired = TRUE)

