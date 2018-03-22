# QMSS-Thesis
Code behind my QMSS Thesis: How Gentrification Effects Landlord Behavior in New York City. There are a bunch of useful files here for anyone interested in scraping 311 calls, NYC real estate sales records, or looking up census tracts based off of coordinates. I will continue adding files as things are getting cleaned and ready to be put on the internet. 

## Call_Scraper
This file probably took the longest to put together. The workflow is as follows: for each year from 2004-2016 retrieve all HPD specfic 311 complaints, group these by complaint type and sum by address. Merge these files with the PLUTO datasets to get information about the buildings and census tracts. Then separate the addresses that do not have census tract labels and send them in batches of 1000's to the census geocoder. To create a full panel, make a master list of addresses and, for each year, make sure every address that has appeared is in each year by adding rows of 0's for missing tracts. At the end I merge all of these rows into one file and export for statistical analysis. 

## Sales_Scraper

This file is the code that scraped all of the New York City residential real estate data from 2004-2016. The code downloads all sale records from each of these years, cleans the data, filters down to residential sales with square footage information, finds census tracts, and samples from neighboring tracts for tracts with low sales counts. 
