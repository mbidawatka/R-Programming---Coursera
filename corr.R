corr <- function(directory,threshold = 0) {
  filelist <- list.files(path=directory, pattern = ".csv", full.names = TRUE)
  dat <- vector(mode = "numeric", length = 0)
  for (i in 1:length(filelist)) {
    data <- read.csv(filelist[i])
    csum <- sum((!is.na(data$sulfate)) & (!is.na(data$nitrate)))
    if (csum > threshold) {
      tmp <- data[which(!is.na(data$sulfate)), ]
      tmp1 <- tmp[which(!is.na(tmp$nitrate)), ]
      dat <- c(dat, cor(tmp1$sulfate, tmp1$nitrate))
    }
    
  }
  dat
}
