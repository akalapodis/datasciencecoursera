complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    files <- sort(list.files(directory, full.names=TRUE))
    
    result <- matrix(nrow=0, ncol = 2)
    for (i in id) {
        a <- read.csv(files[i])
        result <- rbind(result, c(i, sum(complete.cases(a))))
    }

    result <- data.frame(result)
    colnames(result) <- c("id", "nobs")
    result
}

