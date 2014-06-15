complete <- function(directory, id = 1:332) {
  fn <- dir(directory)
  idx <- as.numeric(substr(fn,1,3))
  fn <- paste(directory,"/",fn,sep="")
  #
  names(fn) <- idx
  
  ret = data.frame("id"=0,"nobs"=0)  
  
  for (i in id) {
    #print(i)
    #print(fn[id])
    dat <- read.csv(fn[i])
    #print(dim(dat))
    dat <- dat[complete.cases(dat),]
    count <- dim(dat)[1]
    ret <- rbind(ret,list("id"=i,"nobs"=count))
    
  }
  
  ret <- ret[2:dim(ret)[1],]
  return(ret)
  
}

