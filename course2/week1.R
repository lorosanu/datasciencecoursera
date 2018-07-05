# ex4
x <- 4L
print(class(x))

# ex5
x <- c(4, "a", TRUE)
print(class(x))

# ex6
x <- c(1, 3, 5)
y <- c(3, 2, 10)
r <- rbind(x, y)
print(r)

# ex8
x <- list(2, "a", "b", TRUE)
print(x[[1]])

# ex9
x <- 1:4
y <- 2:3
print(x + y)

# ex10
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
print(x)

# ex11
data <- read.csv('hw1_data.csv', header=TRUE)
print(names(data))

# ex12
print(head(data, 2))

# ex13
print(nrow(data))

# ex14
print(tail(data, 2))

# ex15
print(data[47, 'Ozone'])

# ex16
print(sum(is.na(data$Ozone)))

# ex17
print(mean(data$Ozone[!is.na(data$Ozone)]))

# ex18
s <- data[data$Ozone > 31, , drop=FALSE]
s <- s[s$Temp > 90, , drop=FALSE]
s <- na.omit(s)
print(mean(s$Solar.R))

# ex19
s <- data[data$Month == 6, , drop=FALSE]
print(mean(s$Temp))

# ex20
s <- data[data$Month == 5, , drop=FALSE]
v <- s$Ozone
print(max(v[!is.na(v)]))
