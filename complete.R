complete <- function(directory,id=1:332) {
  filelist <- list.files(path=directory, pattern = ".csv", full.names = TRUE)
  dat <- data.frame()
  for (i in id) {
    data <- read.csv(filelist[i])
    nobs <- sum(complete.cases(data))
    tmp  <- data.frame(i,nobs)
    dat  <- rbind (dat,tmp)
  }
  colnames(dat) <- c("id","nobs")
  dat
}
