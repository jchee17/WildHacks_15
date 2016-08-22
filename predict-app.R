options(warn=-1)

# location of lim.fit and levels
load(file='/home/jerry/GitHub/WildHacks_15/lm_2014_v4_levels.RData')

# read in csv
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

num=1
subset_Jan15 <- df_Jan15[sample(nrow(df_Jan15), num), ]

predict.lm <- predict(lm.fit, subset_Jan15, interval="prediction")

cat(predict.lm[1])
cat('\n')