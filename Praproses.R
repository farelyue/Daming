#Praproses Data di R

#[1] Nilai Khusus di R

#NA : Not Avaliable

#Operasi NA
NA + 1
sum(c(NA, 1, 2))

median(c(NA, 1, 2, 3))
median(c(NA, 1, 2, 3), na.rm = TRUE)
length(c(NA, 2, 3, 4))

3 == NA
NA == NA
TRUE | NA

#NULL : Nilai Kosong
length(c(1, 2, NULL, 4))
sum(c(1, 2, NULL, 4))
x <- NULL
c(x, 2)

#Inf : Infinity
pi/0
2 * Inf
Inf - 1e+10
Inf + Inf
3 < -Inf
Inf == Inf

#NaN : Not a Number
NaN + 1
exp(NaN)

#[2] Praproses Data di R

# 2.1 Eksplorasi Data
data <- airquality
str(data)
summary(data)

library(mice)
md.pattern(data)

# 2.2 Pembersihan Data

#Mengisi nilai missing values dengan Mean
data$Solar.R[is.na(data$Solar.R)] <- mean(data$Solar.R, na.rm= TRUE)
md.pattern(data)

#Mengisi nilai missing values dengan Modus
names(sort(table(mtcars$cyl), decreasing = TRUE))[1]

# 2.3 Transformasi Data
data <- airquality
data$bulan <- NULL

data$bulan[data$Month == 5] <- "Mei"
data$bulan[data$Month == 6] <- "Juni"
data$bulan[data$Month == 7] <- "Juli"
data$bulan[data$Month == 8] <- "Agustus"
data$bulan[data$Month == 9] <- "September"

# 2.4 Reduksi Data
#Menghapus variabel
data$Month <- NULL
str(data)

#Sampling
# Bulan Juli dan Wind lebih besar dari 10
dataBaru <- data[which(data$bulan == "Juli" & data$Wind >=10),]

dataRandom <- data[sample(1:nrow(data), 50, replace = FALSE),]

# 2.5 Integrasi Data
# Gabung Baris : Jumlah dan tipe variabel harus sama
kode_dep <- c("G5","G9","G6","G2")
nama <- c("said", "aji", "endang", "rahmat")
df1 <- data.frame(Kode = kode_dep, Nama = nama)

kode_baru <- c("G1", "G1")
nama_baru <- c("yoiq", "audhi")
df2 <- data.frame(Kode = kode_baru, Nama = nama_baru)

gabung <- rbind(df1, df2)

# Gabung Kolom : Banyak baris dan id harus sama
nilai <- c(80, 92, 90, 87, 94, 88)
gabung_dep <- cbind(gabung, Nilai = nilai)

# Merge
kode <- c("G1","G2","G3","G4","G5","G6","G7","G8","G9") 
dep <- c("Statistika", "GeoFisika", "Biologi", "Kimia", "Matematika",
          "Ilmu Komputer", "Fisika", "Biokimia", "Aktuaria")
df3 <- data.frame(Kode = kode, Departemen = dep)
View(df3)

# 2.6 Diskretisasi Data
#Membagi Variabel wind menjadi 3 kelompok
data$Wind <- cut(data$Wind, 3, include.lowest = TRUE)
table(data$Wind)

#install.packages("infotheo")
library(infotheo)

#Diskretisasi variabel sepal menjadi 3 kategori dengan metode equal width
ew.Sepal <- discretize(iris$Sepal.Length, "equalwidth", 3)
table(ew.Sepal)

#Diskretisasi variabel petal  menjadi 3 kategori dengan metode equal frequency
ef.Petal <- discretize(iris$Petal.Length, "equalfreq", 3)
table(ef.Petal)
