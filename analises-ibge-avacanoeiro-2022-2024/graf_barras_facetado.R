matriz_habitat_1 <- 
  read_csv("matriz - habitat (1).csv",
           col_select = -Biomas)

matriz_habitat_1 <- 
  matriz_habitat_1 %>% 
    filter(Nome_bioma == "savana"|
             Nome_bioma == "area_urbana") %>% 
    pivot_longer(2:length(matriz_habitat_1),
                 names_to = "sp",
                 values_to = "abund") 

matriz_habitat <- 
  matriz_habitat_1 %>% 
    group_by(Nome_bioma) %>% 
    mutate(sp_ordenado = factor(sp,
                                levels = matriz_habitat_1 %>% 
                                          filter(Nome_bioma == "savana") %>% 
                                          arrange(abund) %>% 
                                          pull(sp)),
           bioma_ordenado = factor(Nome_bioma,
                                   levels = c("savana", "area_urbana")))

 matriz_habitat %>%  
  ggplot(aes(x = abund,
             y = sp_ordenado))+
  geom_col(aes(fill = bioma_ordenado),
           show.legend = F)+
  facet_wrap(facets = vars(bioma_ordenado))+
  scale_x_log10()+
  theme_classic()+
  scale_fill_discrete()
