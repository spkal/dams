library(dams)
# Get all the data:
dams_all <- extract_nid(sample_only = FALSE)
dim(dams_all)
names(dams_all)
# First look:
library(dplyr)
library(ggplot2)
with(dams_all, hist(Volume))
with(dams_all, hist(Dam_Length))
with(dams_all, summary(Dam_Length))
with(dams_all, sum(Dam_Length > 1000, na.rm = TRUE))
dams_all %>%
    filter(!is.na(Dam_Height)) %>%
    filter(Dam_Length > 1000) %>%
    ggplot(aes(x=Dam_Length)) + geom_histogram()
dams_all %>%
    filter(!is.na(Dam_Height)) %>%
    ggplot(aes(x=Dam_Height)) + geom_histogram()
dams_all %>%
    filter(!is.na(Dam_Height)) %>%
    filter(Dam_Height > 32) %>%
    ggplot(aes(x=Dam_Height)) + geom_histogram()

