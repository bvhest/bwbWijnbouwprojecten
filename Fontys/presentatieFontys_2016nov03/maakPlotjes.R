setwd("/media/hestbv/Windows/Projecten/R/bwbWijnbouwprojecten/Fontys/presentatieFontys_2016nov04")

p <- c(1:7)
pop_nom <- 300^(p-1)
pop_min <- 200^(p-1)
pop_max <- 400^(p-1)

view <- data.frame(generatie = p, pop_nom = pop_nom, pop_min = pop_min, pop_max = pop_max)

plot(p, pop_nom)



# plot 
library(ggplot2)

title <- "Toename populatie per generatie"
subtitle <- "aannames: nominaal 300 eitjes per vrouwtje, 200 minimum, 400 maximum"

ggplot(data=view,
       aes(x = generatie, y = pop_nom),
       color = "#FA0000", show.legend = FALSE) +
  geom_ribbon(aes(ymin = pop_min, ymax = pop_max, fill = "#FA0000"), alpha = 0.4, show.legend = FALSE) + 
  geom_point() + 
  theme_bw() +
#  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_continuous() +
  scale_y_log10(breaks = c(1,100,10000,1000000,100000000,10000000000,1000000000000,100000000000000)) +
  labs(x = "generatie", y = "aantal Suzuki-fruitvliegjes") +
  ggtitle(bquote(atop(.(title),
                      atop(italic(.(subtitle)), ""))))

file <- "./assets/populatieExplosie.png"
ggsave(filename=file, device="png", width=240, height=150, units="mm", dpi = 300)



