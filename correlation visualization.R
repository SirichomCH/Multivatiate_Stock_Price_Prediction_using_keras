install.packages("quantmod")
library(quantmod)
install.packages("ggplot2")
library(ggplot2)
install.packages("GGally")
library(GGally)
#install.packages("mvtnorm")
library(mvtnorm)
#getSymbols(("SCB.BK"), from = "2015-01-01")
#getSymbols(("KBANK.BK"), from = "2015-01-01")
#getMetals(("Gold"), from = "2015-01-01")
library(tibble)
KBANK <- read.csv("C:\\Users\\Administrator\\Documents\\project\\KBANK2.csv")
p <- 6
p2 <- ggcorr(KBANK, label = TRUE, label_round = 4)
#ggcorr(KBANK, method = c("everything","pearson"))
p1 <- ggpairs(KBANK, lower = list(continuose = "smooth"))
#RAndom sampling
g2 <- ggplotGrob(p2)
colors <- g2$grobs[[6]]$children[[3]]$gp$fill
idx <- 1 
for (k1 in 1:(p-1)) {
  for (k2 in (k1+1):p) {
    plt <- getPlot(p1,k1,k2) + theme(panel.background = element_rect(fill = colors[idx], colour = "white"),
                                     panel.grid.major = element_line(colour = colors[idx]))
    p1 <- putPlot(p1,plt,k1,k2)
    idx <- idx+1
  }
}
print(p1)