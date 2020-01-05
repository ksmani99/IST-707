library(ggplot2)
library(RColorBrewer)
ggplot(diamonds, aes(cut,fill=color))+geom_bar(position="dodge")


ggplot(diamonds, aes(cut,fill=color))+
  geom_bar(position="dodge")+ scale_fill_discrete(h= c(0,360)+25, c=100, l=65, h.start = 0, direction = 1, na.value = "grey50")

ggplot(diamonds, aes(cut,fill=color))+
  geom_bar(position="dodge")+ scale_fill_discrete(h= c(180,360)+25, c=100, l=65, h.start = 0, direction = 1, na.value = "grey50")

ggplot(diamonds, aes(cut,fill=color))+
  geom_bar(position="dodge")+ scale_fill_discrete(h= c(0,360)+25, c=100, l=35, h.start = 0, direction = 1, na.value = "grey50")

ggplot(diamonds, aes(cut,fill=color))+
  geom_bar(position="dodge")+ scale_fill_discrete(h= c(360,180)+25, c=100, l=25, h.start = 0, direction = 1, na.value = "grey50")



ggplot(diamonds, aes(cut,fill=color))+
  geom_bar(position="dodge") + 
  scale_fill_brewer()
display.brewer.all


ggplot(diamonds, aes(cut,fill=color))+
  geom_bar(position="dodge")+ scale_fill_brewer(palette = "Pastel1")


require("ggplot2")
require("purrr")
require("tibble")
canva_df <- map2_df(canva_palettes, names(canva_palettes),
                    ~ tibble(colors = .x, .id = seq_along(colors), palette = .y))
ggplot(canva_df, aes(y = palette, x = .id, fill = colors)) +
  geom_raster() +
  scale_fill_identity(guide = FALSE) +
  theme_minimal() +
  theme(panel.grid = element_blank(),
        axis.text.x = element_blank()) +
  labs(x = "", y = "")
 