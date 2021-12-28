# Correlation function from files in directory

corr <- function(directory, threshold = 0) {
    # variables setting
    result_list <- list()
    corr_list <- list()

    # Catching files above threshold
    all_files <- completeCases(1:332)
    for (i in 1:nrow(df_obs)) {
        if (df_obs$obs[i] > threshold) {
            corr_list[[i]] <- df_obs$id[i]
        } else {
            next
        }
    }

    # Correlation from screened files
    for (i in corr_list[!corr_list == "NULL"]) {
        filename <- file_list[i]
        file_df <- read.csv(filename)
        result_list <- append(
            result_list,
            cor(
                file_df$nitrate,
                file_df$sulfate,
                use = "complete.obs"
            )
        )
    }
    result_list <- unlist(result_list)
}