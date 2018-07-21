pollutantmean <- function(directory, pollutant, id=1:332){
	v <- vector()
	for (index in id){
		str_index <- sprintf("%03d.csv", index)
		fn <- file.path(directory, str_index)
		data <- read.csv(fn, header=TRUE)
		v <- c(v, data[pollutant][!is.na(data[pollutant])])
	}
	mean(v)
}

complete <- function(directory, id=1:332){
	m <- matrix(nrow=0, ncol=2, dimnames=list(c(), c("id", "nobs")))

	for (index in id){
		str_index <- sprintf("%03d.csv", index)
		fn <- file.path(directory, str_index)

		data <- read.csv(fn, header=TRUE)
		nobs <- sum(complete.cases(data))
	
		m <- rbind(m, c(index, nobs))
	}	
	as.data.frame(m)
}

corr <- function(directory, threshold=0){
	monitors <- c()
	for (file_id in list.files(directory)){
		fn <- file.path(directory, file_id)
		data <- read.csv(fn, header=TRUE)
		nobs <- sum(complete.cases(data))
		if (nobs > threshold){	
			correlation <- cor(data$sulfate, data$nitrate, use="complete.obs")
			monitors <- c(monitors, correlation)
		}
	}	
	monitors
}
