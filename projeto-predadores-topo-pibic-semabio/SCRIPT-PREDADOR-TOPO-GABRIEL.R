#ANALISE DADOS PREDADORES DE TOPO IBGE-2022-2024
#PRIMEIRO IMPORTAMOS O DATA FRAME

PREDADORTOPO<- data.frame(Dados_Predtop)
# A COLUNA HORARIO É IMPORTADA DE FORMA ERRADA CONTENDO DATA ALEATORIA NA C HORARIO
# A SEGUIR SELECIONAMOS O INTERVALO DENTRO DA COLUNA QUE REPRESENTE APENAS O HORARIO
# dados_xm1$hora <- str_sub(dados_xm1$Date, 12, 13)

library(stringr)
PREDADORTOPO$hora<- str_sub(PREDADORTOPO$Horário, 12,16)

# A SEGUIR CONVERTEMOS A HORA:MINUTO EM HORA DECIMAL
# FONTE ABAIXO
#https://stackoverflow.com/questions/5186972/how-to-convert-time-mmss-to-decimal-form

PREDADORTOPO$HORADECIMAL<- sapply(strsplit(PREDADORTOPO$hora,":"),
                                  function(x) {x<-as.numeric(x)
                                  x[1]+x[2]/60})

# AGORA VAMOS SELECIONAR AS ESPECIES E USAR O FILTRO DO PACOTE dplyr
# FONTE ABAIXO
#https://stackoverflow.com/questions/11612235/select-rows-from-a-data-frame-based-on-values-in-a-vector
# vc <- c('a', 'c')
# filter(df, fct %in% vc)

Felinos <- c("Jaguatirica","Onça Parda")
Canideos<- c("Lobinho","Lobo Guará")
library(dplyr)
Fel2sp<- filter(PREDADORTOPO, Espécie %in% Felinos)
Can2sp<- filter(PREDADORTOPO, Espécie %in% Canideos)

# AGORA VAMOS COMPARAR JAGUATIRIC E ONÇA PARDA

library(ggpubr)
ggdensity(Fel2sp, x = "HORADECIMAL",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

# AGORA A ANALISE DO LOBINHO E Lobo Guará

ggdensity(Can2sp, x = "HORADECIMAL",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

ggdensity(ONCAH, x = "HORADECIMAL",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

ggdensity(JAGUAH, x = "HORADECIMAL",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

ggdensity(LOBOH, x = "HORADECIMAL",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))

ggdensity(CACHOH, x = "HORADECIMAL",
          add = "mean", rug = TRUE,
          color = "Espécie", fill = "Espécie",
          palette = c("#00AFBB", "#E7B800"))


ONCA <- subset(PREDADORTOPO, PREDADORTOPO$Espécie == "Onça Parda")
jaguatirica = subset(PREDADORTOPO, PREDADORTOPO$Espécie == "Jaguatirica")
Guara = subset(PREDADORTOPO,PREDADORTOPO$Espécie == "Lobo Guará")
Cachorro =subset(PREDADORTOPO,PREDADORTOPO$Espécie == "Cachorro do mato")
Human = subset(PREDADORTOPO,PREDADORTOPO$Espécie == "Humano")

bayestestR::overlap(ONCA$HORADECIMAL, jaguatirica$HORADECIMAL)
bayestestR::overlap(Cachorro$HORADECIMAL, Guara$HORADECIMAL)
bayestestR::overlap(Human$HORADECIMAL, jaguatirica$HORADECIMAL)
bayestestR::overlap(Human$HORADECIMAL, Guara$HORADECIMAL)
bayestestR::overlap(Human$HORADECIMAL, ONCA$HORADECIMAL)
bayestestR::overlap(Human$HORADECIMAL, Cachorro$HORADECIMAL)
bayestestR::overlap(jaguatirica$HORADECIMAL, Guara$HORADECIMAL)
