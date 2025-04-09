matriz_registros_ibge_ava_canoeiro <- read_excel("matriz-registros-ibge-ava-canoeiro.xlsx")
abundpred = as.data.frame(matriz_registros_ibge_ava_canoeiro)
abundpred$spordenado = as.factor(abundpred$sp)
abundpred$areaordenado = as.factor(abundpred$nomearea)

#Grafico escala logaritmica
abundpred %>%  
  ggplot(aes(x = abund,
             y = spordenado))+
  geom_col(aes(fill = areaordenado),
           show.legend = F)+
  facet_wrap(facets = vars(areaordenado))+
  scale_x_log10()+
  theme_classic()+
  scale_fill_discrete()

#Grafico Escala Linear
abundpred %>%  
  ggplot(aes(x = abund,
             y = spordenado))+
  geom_col(aes(fill = areaordenado),
           show.legend = F)+
  facet_wrap(facets = vars(areaordenado))+
  theme_classic()+
  scale_fill_discrete()
