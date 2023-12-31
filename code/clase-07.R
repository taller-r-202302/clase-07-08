## Eduard Martinez
## Update: 11-10-2023

## limpiar entonro
rm(list=ls())

## instalar/llamar pacman
require(pacman)

## usar la función p_load de pacman para instalar/llamar las librerías de la clase
p_load(tidyverse, ## manipular/limpiar conjuntos de datos.
       rio, ## para leer/escribir archivos desde diferentes formatos. 
       skimr, ## skim: describir un conjunto de datos
       janitor) ##  tabyl: frecuencias relativas


## **[1.] Operador pipe (%>%)**

### Veamos un ejemplo:
df = as_tibble(x = women)

df = mutate(.data = df , height_cm = height*2.54,
            weight_hcm = weight/height_cm)

df = arrange(.data=df , desc(height_cm))

head(x=df , n=5)

## Otra forma de hacerlo es emplear el operador pipe `%>%`:  

df = as_tibble(x = women) %>% 
     mutate(height_cm = height*2.54, weight_hcm = weight/height_cm) %>%
     arrange(desc(height_cm))

head(x=df , n=5)

## Con `%>%` no es necesario mencionar el objeto en cada nueva transformación. Además, las líneas de código se redujeron a la mitad.

### Veamos otro ejemplo:

## Intente reescribir el siguiente código usando el operador `%>%`:
df <- import("https://www.datos.gov.co/resource/epsv-yhtj.csv")
df <- as_tibble(df)
df <- select(df, -cod_ase_)
df <- mutate(df,ifelse(is.na(estrato),1,estrato))


## **[2.] Combinar conjuntos de datos (adicionar filas/columnas)**

### **2.1 Agregar observaciones**

## Generar conjuntos de datos para hacer la aplicación:
set.seed(0117) # Fijar semilla
obs_1 = tibble(id = 100:105 , 
             age = runif(6,18,25) %>% round() , 
             height = rnorm(6,170,10) %>% round())

obs_2 = tibble(id = 106:107 , 
             age = runif(2,40,50)  %>% round() , 
             height = rnorm(2,165,8) %>% round() , 
             name = c("Lee","Bo"))

## Inspeccionar los datos:


## Combinar el conjunto de datos (bind_rows): 

### **2.2 Adicionar variables a un conjunto de datos**
db_1 <- tibble(id = 102:105 , income = runif(4,1000,2000) %>% round())
db_2 <- tibble(id = 103:106 , age = runif(4,30,40)  %>% round())

## Inspeccionar los datos:


## Combinar el conjunto de datos (bind_cols): 
print("Algo salió mal! la función bind_cols() no tiene en cuenta el identificador de cada observación.") 

### **2.3 Adicionar variables a un conjunto de datos:** `join()`

## Puede adicionar variables a un conjunto de datos usando la familia de funciones de `join()`:
data_1 <- tibble(Casa=c(101,201,201,301),
              Visita=c(2,1,2,1),
              Sexo=c("Mujer","Mujer","Hombre","Hombre"))
data_2 <- tibble(Casa=c(101,101,201,201),
              Visita=c(1,2,1,2),
              Edad=c(23,35,7,24),
              Ingresos=c(500000,1000000,NA,2000000))

#### **Ejemplo: left_join()**


#### **Ejemplo: right_join()**


#### **Ejemplo: inner_join()**


#### **Ejemplo: full_join()**


#### **Ejemplo: Join sin identificador único**


### **3.4 Chequear valores unicos**
df_1 <- tibble(Hogar=1,Visita=1,Sexo=1)
df_2 <- tibble(Hogar=1,Visita=1,Edad=1,Ingresos=1)

## Coincidencia en variables:

## unique


