pollutant_mean <- function(pollutant, id, directory = "specdata") {
    # Setting variables
    setwd(paste("F:\\R learning\\Datasets\\", directory, sep = ""))
    file_list <- list.files()

    # Loading data and appending with for loop
    for (i in id) {

        # Create the first data if no data exist yet
        if (!exists("dataset")) {
            dataset <- read.csv(file_list[i], header = TRUE)
        }

        # if data already exist, then append it together
        if (exists("dataset")) {
            tempory <- read.csv(file_list[i], header = TRUE)
            dataset <- unique(rbind(dataset, tempory))
            rm(tempory)
        }
    }

    # The result
    print(paste("The mean for", pollutant, ":", sep = " "))
    print(mean(dataset[[pollutant]], na.rm = TRUE))

    rm(dataset)
    rm(file_list)
    rm(i)
}