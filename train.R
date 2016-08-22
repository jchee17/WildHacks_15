# load datasets
df_Jan14 <- read.csv("/home/jerry/Desktop/2014_Flight/Jan14_113965754_T_ONTIME.csv", header=TRUE)
df_Feb14 <- read.csv("/home/jerry/Desktop/2014_Flight/Feb14_113965754_T_ONTIME.csv", header=TRUE)
df_Mar14 <- read.csv("/home/jerry/Desktop/2014_Flight/Mar14_113965754_T_ONTIME.csv", header=TRUE)
df_Apr14 <- read.csv("/home/jerry/Desktop/2014_Flight/Apr14_113965754_T_ONTIME.csv", header=TRUE)

# take random subsets
num = 3000
subset_Jan14 <- df_Jan14[sample(nrow(df_Jan14), num), ]
subset_Feb14 <- df_Feb14[sample(nrow(df_Feb14), num), ]
subset_Mar14 <- df_Mar14[sample(nrow(df_Mar14), num), ]
subset_Apr14 <- df_Apr14[sample(nrow(df_Apr14), num), ]

# remove these loaded datasets
rm(df_Jan14)
rm(df_Feb14)
rm(df_Mar14)
rm(df_Apr14)


# load datasets 2
df_May14 <- read.csv("/home/jerry/Desktop/2014_Flight/Mar14_113965754_T_ONTIME.csv", header=TRUE)
df_June14 <- read.csv("/home/jerry/Desktop/2014_Flight/June14_113965754_T_ONTIME.csv", header=TRUE)
df_July14 <- read.csv("/home/jerry/Desktop/2014_Flight/July14_113965754_T_ONTIME.csv", header=TRUE)
df_Aug14 <- read.csv("/home/jerry/Desktop/2014_Flight/Aug14_113965754_T_ONTIME.csv", header=TRUE)

# take random subsets 2
num = 2000
subset_May14 <- df_May14[sample(nrow(df_May14), num), ]
subset_June14 <- df_June14[sample(nrow(df_June14), num), ]
subset_July14 <- df_July14[sample(nrow(df_July14), num), ]
subset_Aug14 <- df_Aug14[sample(nrow(df_Aug14), num), ]

# remove these loaded datasets 2
rm(df_May14)
rm(df_June14)
rm(df_July14)
rm(df_Aug14)


# load datasets 3
df_Sept14 <- read.csv("/home/jerry/Desktop/2014_Flight/Setp14_113965754_T_ONTIME.csv", header=TRUE)
df_Oct14 <- read.csv("/home/jerry/Desktop/2014_Flight/Oct14_113965754_T_ONTIME.csv", header=TRUE)
df_Nov14 <- read.csv("/home/jerry/Desktop/2014_Flight/Nov14_113965754_T_ONTIME.csv", header=TRUE)
df_Dec14 <- read.csv("/home/jerry/Desktop/2014_Flight/Dec14_113965754_T_ONTIME.csv", header=TRUE)

# take random subsets
num = 2000
subset_Sept14 <- df_Sept14[sample(nrow(df_Sept14), num), ]
subset_Oct14 <- df_Oct14[sample(nrow(df_Oct14), num), ]
subset_Nov14 <- df_Nov14[sample(nrow(df_Nov14), num), ]
subset_Dec14 <- df_Dec14[sample(nrow(df_Dec14), num), ]

# remove these loaded datasets
rm(df_Sept14)
rm(df_Oct14)
rm(df_Nov14)
rm(df_Dec14)

# bind the various subsets
subset <- rbind(subset_Jan14, subset_Feb14, subset_Mar14, subset_Apr14, subset_May14,
                subset_June14, subset_July14, subset_Aug14, subset_Sept14, subset_Oct14,
                subset_Nov14, subset_Dec14)

# convert AIRLINE_ID to strings
subset$AIRLINE_ID <- as.character(subset$AIRLINE_ID)

# convert categorical var to factors

subset$MONTH <- factor(subset$MONTH)
subset$DAY_OF_MONTH <- factor(subset$DAY_OF_MONTH)
subset$DAY_OF_WEEK <- factor(subset$DAY_OF_WEEK)
subset$AIRLINE_ID <- factor(subset$AIRLINE_ID)
subset$ORIGIN <- factor(subset$ORIGIN)
subset$ORIGIN_CITY_NAME <- factor(subset$ORIGIN_CITY_NAME)
subset$DEST <- factor(subset$DEST)
subset$DEST_CITY_NAME <- factor(subset$DEST_CITY_NAME)

lm.fit <- lm(ARR_DELAY ~ MONTH + DAY_OF_MONTH
             + DAY_OF_WEEK + AIRLINE_ID
             + ORIGIN + ORIGIN_CITY_NAME
             + DEST + DEST_CITY_NAME +
               CRS_DEP_TIME + CRS_ARR_TIME,
             data=subset)

# create matrix of levels of factors
levels = list(MONTH=levels(subset$MONTH), DAY_OF_MONTH=levels(subset$DAY_OF_MONTH), 
             DAY_OF_WEEK=levels(subset$DAY_OF_WEEK), AIRLINE_ID=levels(subset$AIRLINE_ID),
             ORIGIN=levels(subset$ORIGIN), ORIGIN_CITY_NAME=levels(subset$ORIGIN_CITY_NAME),
             DEST=levels(subset$DEST), DEST_CITY_NAME=levels(subset$DEST_CITY_NAME))

# save the lm
save(lm.fit, levels, file='/home/jerry/GitHub/WildHacks_15/lm_2014_v5.RData')

