
start_time <- proc.time()
  
  n <- 100000000
  n <- as.integer(n)
  if(n > 1e8){
    stop("слишком большой аргумент")
  }
  # булева матрица
  mat <- rep(T, n)
  # число 1 не простое
  mat[1] <- F
  # последнее простое число
  last <- 2L
  # округленный в большую сторону квадратный корень из n
  fsqr <- floor(sqrt(n))
  
  while (last <= fsqr)
  {
    mat[seq.int(2L*last, n, last)] <- F
    sel <- which(mat[(last+1):(fsqr+1)])
    if(any(sel)){
      last <- last + min(sel)
    }else last <- fsqr+1
  }
  mat <- which(mat) 
  
proc.time() - start_time
