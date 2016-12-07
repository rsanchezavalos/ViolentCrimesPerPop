install.packages("repmis")
library(repmis)
library(R2OpenBUGS)

source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_NFLDraft_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_DatosMexico_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_Donohue&Levitt_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_MEXBaseline_Data.RData?raw=true")
source_data("https://github.com/jcmartinezovando/est46111_datos/blob/master/EST46111_USCommData_Data.RData?raw=true")

source("https://raw.githubusercontent.com/jcmartinezovando/est46111_datos/master/BayLinReg.R")
source("https://raw.githubusercontent.com/jcmartinezovando/est46111_datos/master/BayHierLinReg.R")

