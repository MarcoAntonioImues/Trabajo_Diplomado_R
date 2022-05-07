# ---------------------------------------
# Trabajo del Diplomado en R 
# Análisis Exploratorio de datos
# ---------------------------------------

library(stats)
library(ggplot2)
library(psych)
library (readxl)
library(readr)

Chlorella <- read_excel("Chlorella.xlsx", na="NA")
Chlorella$FBR <- as.factor(Chlorella$FBR)
Chlorella$Ciclo <- as.factor(Chlorella$Ciclo)
Chlorella$Dias <- as.factor(Chlorella$Dias)
Chlorella$Muestra <- as.factor(Chlorella$Muestra)
summary(Chlorella)
str(Chlorella)
table(Chlorella$FBR)
table(Chlorella$Ciclo)
table(Chlorella$Dias)
table(Chlorella$Muestra)

Chlorella <- data.frame(Chlorella)
ggplot(Chlorella, aes(x=Densidad)) +
  geom_histogram(aes(color=FBR), bins=10) + 
  labs(title = "Figura 1. Densidad celular (cel/ml)", y="Frecuencia")

ggplot(Chlorella, aes(x=TCS)) +
  geom_histogram(aes(color=FBR), bins=10, na.rm = TRUE) +
  labs(title = "Figura 2. Tasa de crecimiento simple (TCS)", y="Frecuencia")

ggplot(Chlorella, aes(x=Temperatura)) +
  geom_histogram(aes(color=FBR), bins=10) +
  labs(title = "Figura 3. Temperatura promedio diario (°C)", y="Frecuencia")

ggplot(Chlorella, aes(x=CO2)) +
  geom_histogram(aes(color=FBR), bins=10) +
  labs(title = "Figura 4. CO2 (mg/L)", y="Frecuencia")

ggplot(Chlorella, aes(x=OD)) +
  geom_histogram(aes(color=FBR), bins=10) +
  labs(title = "Figura 4. Oxígeno disuelto (mg/L)", y="Frecuencia")

ggplot(Chlorella, aes(x=FBR, y=Densidad)) +
  geom_boxplot(aes(fill=Ciclo)) +
  labs(title = "Figura 5. Densidad (cel/ml) agrupado por FBR y Ciclo", y="Densidad (cel/ml)")

ggplot(Chlorella, aes(x=Temperatura, y=Densidad)) +
  geom_point(aes(color=FBR)) +
  geom_smooth(span=0.2)

ggplot(Chlorella, aes(x=CO2, y=Densidad)) +
  geom_point() +
  geom_smooth(span=0.2)

ggplot(Chlorella, aes(x=OD, y=Densidad)) +
  geom_point(aes(color=FBR)) +
  geom_smooth(span=0.2)



# plot(ecdf(Chlorella$Densidad))
# ggplot(Chlorella, aes(x=FBR, y=Densidad)) +
#  geom_boxplot()
# ggplot(Chlorella, aes(x=Ciclo, y=Temperatura)) +
#  geom_boxplot(aes(fill=Ciclo))

