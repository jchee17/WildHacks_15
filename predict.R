#load(file='/home/jerry/GitHub/WildHacks_15/lm_2014_v5.RData')

df_Jan15 <- read.csv(file='/home/jerry/GitHub/WildHacks_15/Jan15_114140123_T_ONTIME.csv')


#convert AIRLINE_ID to strings
df_Jan15$AIRLINE_ID <- as.character(df_Jan15$AIRLINE_ID)

#convert to factors
df_Jan15$MONTH <- factor(df_Jan15$MONTH)
df_Jan15$DAY_OF_MONTH <- factor(df_Jan15$DAY_OF_MONTH)
df_Jan15$DAY_OF_WEEK <- factor(df_Jan15$DAY_OF_WEEK)
df_Jan15$AIRLINE_ID <- factor(df_Jan15$AIRLINE_ID)
df_Jan15$ORIGIN <- factor(df_Jan15$ORIGIN)
df_Jan15$ORIGIN_CITY_NAME <- factor(df_Jan15$ORIGIN_CITY_NAME)
df_Jan15$DEST <- factor(df_Jan15$DEST)
df_Jan15$DEST_CITY_NAME <- factor(df_Jan15$DEST_CITY_NAME)

# factor function
isDesiredFactor <- function(i, df) {
  x = colnames(df)[i]
  if ( (x == "MONTH") || (x == "DAY_OF_MONTH") ||
       (x == "DAY_OF_WEEK") || (x == "AIRLINE_ID") ||
       (x == "ORIGIN") || (x == "ORIGIN_CITY_NAME") ||
       (x == "DEST") || (x == "DEST_CITY_NAME") ) {
    return(TRUE)
  }else return(FALSE)
}

# level function
isSeenLevel <- function(lvl, lvl_col) {
  
    if (!is.na(match(as.character(lvl), lvl_mtx$col))) {
      # we have a match
      return(TRUE)
    } else 
    { return(FALSE) }
}


num=1
subset_Jan15 <- df_Jan15[sample(nrow(df_Jan15), num), ]

can_predict = TRUE

# now choose the rows with levels we've seen before
# for (i in 1:ncol(subset_Jan15)) {
#   print(i)
#   if (isDesiredFactor(i, subset_Jan15) == TRUE) {
#     if (isSeenLevel(subset_Jan15[1,i], levels[i]) == TRUE) {
#       can_predict = TRUE 
#     } else {
#       #print(subset_Jan15[1,i])
#       #print(colnames(subset_Jan15)[i])
#       can_predict = FALSE
#       break
#     }
#   }
# }


# lm.fit$xlevels[['ORIGIN']] <- union(lm.fit$xlevels[['ORIGIN']], levels(subset_Jan15$ORIGIN))
# lm.fit$xlevels[['ORIGIN_CITY_NAME']] <- union(lm.fit$xlevels[['ORIGIN_CITY_NAME']], levels(subset_Jan15$ORIGIN_CITY_NAME))
# lm.fit$xlevels[['DEST']] <- union(lm.fit$xlevels[['DEST']], levels(subset_Jan15$DEST))
# lm.fit$xlevels[['DEST_CITY_NAME']] <- union(lm.fit$xlevels[['DEST_CITY_NAME']], levels(subset_Jan15$DEST_CITY_NAME))
# lm.fit$xlevels[['AIRLINE_ID']] <- union(lm.fit$xlevels[['AIRLINE_ID']], levels(subset_Jan15$AIRLINE_ID))
#if (can_predict == TRUE) {
  predict.lm <- predict(lm.fit, subset_Jan15, interval="prediction")
#} else print('cannot make prediction\n')
