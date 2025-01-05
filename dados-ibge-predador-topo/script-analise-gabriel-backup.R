#Analise dados predador de topo planilha gabriel ibge agosto 2024
predadortopo = as.data.frame(DADOS_IBGE_PREDADORES_DE_TOPO_2022_2024_Copiar)
#dados_xm1$hora <- str_sub(dados_xm1$Date, 12, 13)  # prints hour
library(stringr)
predadortopo$hora <- str_sub(predadortopo$Horário, 12,16)
# convert hour:minute into decimal hour
#https://stackoverflow.com/questions/5186972/how-to-convert-time-mmss-to-decimal-form
#minPerGame <- c("4:30","2:20","34:10")

#sapply(strsplit(minPerGame,":"),
#       function(x) {
#         x <- as.numeric(x)
#         x[1]+x[2]/60
 #      }
#)
predadortopo$horadecimal <- sapply(strsplit(predadortopo$hora,":"),
       function(x) {
         x <- as.numeric(x)
         x[1]+x[2]/60
       }
       )
#select jaguatirica e onca parda from dataframe using filter from dplyr
#https://stackoverflow.com/questions/11612235/select-rows-from-a-data-frame-based-on-values-in-a-vector
# vc <- c('a', 'c')
# filter(df, fct %in% vc)
#comparar jaguatirica e onça
vc <- c('Jaguatirica', 'Onça Parda')
library(dplyr)
predador2sp <- filter(predadortopo, Espécie %in% vc )
library(ggpubr)
ggdensity(predador2sp, x = "horadecimal",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

#comparar lobinho e lobo guará
vc <- c('Lobinho', 'Lobo Guará')

library(dplyr)
predador2spv2 <- filter(predadortopo, Espécie %in% vc )
library(ggpubr)
ggdensity(predador2spv2, x = "horadecimal",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

