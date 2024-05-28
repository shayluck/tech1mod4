
ESM<-X265_2024_3481_MOESM3_ESM
summary(ESM)


library(ggplot2)
ggplot(data=Book9, aes(year, y=catch, fill= species)) +
  geom_col()+
  theme_light()+
  labs(x = "Year",y="Numbers Caught", fill = "Species") +
  scale_fill_discrete(labels = c("Bigeye Tuna", "Other Tuna Species","Swordfish"))


p<-ggplot(data=Book9, aes(x=year, y=catch, colour= species)) +
  geom_line()+
  theme_light()+
  labs(x = "Year",y="Numbers Caught", colour = "Species") +
  scale_fill_manual(labels = c("Bigeye Tuna", "Other Tuna Species","Swordfish"))


p<-ggplot(data=Book9, aes(x=trips, y=catch, colour= species)) +
  geom_line(size=12)+
  theme_bw()+
  labs(x = "Trips", y="Numbers Caught", colour = "Species", labels = c("Bigeye Tuna", "Other Tuna Species","Swordfish"), size=10) 

p + theme(legend.position="bottom")+
  theme(legend.text = element_text(size = 10))
