completeCases <- function(ids, directory = "specdata") {
    setwd(paste("F:\\R learning\\Datasets\\", directory, sep=""))
    df_obs <- data.frame(matrix(ncol = 2, nrow = 1))
    colnames(df_obs) <- c('id', 'obs')
    for(i in ids){
        files <- file_list[i]  # File name
        df <- read.csv(files)  # Dataframe
        complete <- complete.cases(df)  # T F complete case
        obs <- sum(complete)  # Angka obs
        df_obs[nrow(df_obs) + 1, 1:2] <- c(i, obs)  # Appending to a new row
    }
    df_obs <- df_obs[-1,]
}