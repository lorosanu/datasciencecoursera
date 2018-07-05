outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
print(dim(outcome))
print(names(outcome))

# Plot the 30-day mortality rate for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

# Finding the best hospital in a state
best <- function(state, outcome) {
	df <- read.csv("outcome-of-care-measures.csv", header=TRUE)

	# get right column name
	outcome <- sub(" ", ".", tools::toTitleCase(outcome))
	outcome <- paste("Hospital.30.Day.Death..Mortality..Rates.from", outcome , sep=".")

	# check that state and outcome are valid
	if (!(state %in% df$State)){
		stop("invalid state")
	}
	if (!(outcome %in% names(df))){
		stop("invalid outcome")
	}

	# extract wanted data
	sd <- df[, c("State", "Hospital.Name", outcome)]
	sd <- sd[sd["State"] == state & sd[outcome] != "Not Available",]
	sd[, outcome] <- as.numeric(as.character(sd[,outcome]))

	# sort by columns
	sd <- sd[order(sd[,outcome], sd[,"Hospital.Name"]),]

	# return the top hospital name
	as.character(sd[1, "Hospital.Name"])
}

# Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, num="best"){
	df <- read.csv("outcome-of-care-measures.csv", header=TRUE)

	# get right column name
	outcome <- sub(" ", ".", tools::toTitleCase(outcome))
	outcome <- paste("Hospital.30.Day.Death..Mortality..Rates.from", outcome , sep=".")

	# check that state and outcome are valid
	if (!(state %in% df$State)){
		stop("invalid state")
	}
	if (!(outcome %in% names(df))){
		stop("invalid outcome")
	}

	# extract wanted data
	sd <- df[, c("State", "Hospital.Name", outcome)]
	sd <- sd[sd["State"] == state & sd[outcome] != "Not Available",]
	sd[, outcome] <- as.numeric(as.character(sd[,outcome]))

	# sort by columns
	sd <- sd[order(sd[,outcome], sd[,"Hospital.Name"]),]

	if (num == "best"){
		num <- 1
	} else if (num == "worst") {
		num <- nrow(sd)
	}

	# return the expected hospital name
	as.character(sd[num, "Hospital.Name"])
}

# Ranking hospitals in all states
rankall <- function(outcome, num="best"){
	df <- read.csv("outcome-of-care-measures.csv", header=TRUE)

	# get right column name
	outcome <- sub(" ", ".", tools::toTitleCase(outcome))
	outcome <- paste("Hospital.30.Day.Death..Mortality..Rates.from", outcome , sep=".")
	
	# check arguments
	if (!(outcome %in% names(df))){
		stop("invalid outcome")
	}

	index <- num
	if (num == "best"){
		index <- 1
	}

	# extract wanted data
	states <- sort(as.character(unique(df$State)))
	m <- matrix(nrow=0, ncol=2, dimnames=list(c(), c("hospital", "state")))

	for (state in states){
		sd <- df[, c("State", "Hospital.Name", outcome)]
		sd <- sd[sd["State"] == state & sd[outcome] != "Not Available",]
		sd[, outcome] <- as.numeric(as.character(sd[,outcome]))

		# sort by columns
		sd <- sd[order(sd[,outcome], sd[,"Hospital.Name"]),]

		if (num == "worst") {
			index <- nrow(sd)
		}

		# return the expected hospital name
		m <- rbind(m, c(as.character(sd[index , "Hospital.Name"]), state))
	}
	
	result <- as.data.frame(m)
	row.names(result) <- states

	result
}

