# Libraries
library(data.table)
library(tidyverse)
library(stringr)
library(dplyr)
library(readr)
library(fastDummies)

# Read in the data from IMDb
imdb_genre <- fread("https://datasets.imdbws.com/title.basics.tsv.gz")
imdb_ratings <- fread("https://datasets.imdbws.com/title.ratings.tsv.gz")

# Read in the fixed video titles of Netflix 
fixed_show_titles_netflix <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/imdb/fixed_show_titles.csv")

# Merging the two data from IMDb sets by tconst
imdb_genre_ratings <- merge(imdb_genre, imdb_ratings, by = "tconst")

# Removing unnecessary columns
imdb_data <-
  subset(imdb_genre_ratings, select = -c(1,5,8)) 

# Filtering the data frame on the required titleType's
imdb_data <-
  imdb_data %>% 
  filter(
    titleType == "movie" | titleType == "tvSeries" | titleType == "tvMovie" | titleType == "tvMiniSeries" | titleType == "tvSpecial" | titleType == "video"
  )

fixed_show_titles_netflix$fixed_title <- str_to_lower(fixed_show_titles_netflix$fixed_title)
imdb_data$primaryTitle <- str_to_lower(imdb_data$primaryTitle)

# Merge the unique video titles with the IMDb data set
imdb_data_merge <-
  left_join(fixed_show_titles_netflix, imdb_data, by = c("fixed_title" = "primaryTitle"))

# Filtering the data such that the titleType corresponds to the category, to keep the right videos in the data frame.
imdb_data_merge <-
  imdb_data_merge %>% 
  filter(
    category == "Films" & titleType == "movie" |
      category == "Films" & titleType == "tvMovie" |
      category == "Films" & titleType == "video" |
      category == "Films" & titleType == "tvSpecial" |
      category == "TV" & titleType == "tvMiniSeries" |
      category == "TV" & titleType == "tvSeries" |
      category == "TV" & titleType == "tvSpecial"
  )

# Still too many video titles in the data set. Let's check the number of duplicated video titles - 1208 duplicates.
sum(duplicated(imdb_data_merge$video_title))

# Since there are a lot of duplicates (1224) in the data set, we need to chose the right video titles in the IMDb data set.
imdb_data_unique <- imdb_data_merge[-c(6, 12, 14, 23, 24, 44, 47, 51:54, 56, 58, 59, 61, 64, 65, 75:81, 83:88, 94, 102, 104, 106, 109, 110, 112, 118, 126:145,
                                       149, 153, 158, 162, 163, 167, 171, 179, 186, 195:210, 212:214, 216, 223, 227:232, 236:238, 259, 265:268, 270, 279, 286,
                                       287, 289, 290, 291, 293, 296, 298, 299, 309, 310, 312, 314, 319, 321, 324:326, 328:333, 335:343, 347, 349, 352, 359:362,
                                       368, 370, 374, 376, 378, 379, 392:394, 397, 399:404, 411:416, 417:424, 429, 430, 434:438, 447:450, 454, 456, 463, 468:475,
                                       484, 485, 494, 495, 498, 500:502, 506, 512, 517, 519, 522:524, 536:538,  544, 545, 550:554, 556:562, 570, 572:574, 576,
                                       577, 581, 586, 588, 595, 596, 598, 599, 601, 604, 605:614, 616:626, 630, 633:636, 638, 646:649, 652, 654, 655, 657, 659,
                                       678, 679, 681, 683, 685, 686:688, 693, 698, 700, 702, 708, 710:716, 720, 724, 728, 729, 735, 738:740, 746, 753:756, 758:761, 764,
                                       765, 767:771, 774, 778, 779, 783:788, 790:821, 823, 824, 830:842, 844:853, 855, 857, 861, 862, 864:871, 873:876, 883, 893,
                                       895, 897:899, 909:921, 923:925, 929, 930, 935, 936, 939, 941:944, 946, 948:955, 959, 960, 962, 964, 965, 976, 990, 992:998,
                                       1008, 1024, 1028, 1044, 1045, 1049, 1051, 1052, 1057:1059, 1063:1068, 1071:1073, 1075:1086, 1089:1092, 1094:1099, 1101,
                                       1105, 1107, 1109, 1110, 1117:1119, 1121, 1123, 1125, 1127:1131, 1134, 1136, 1146, 1147, 1162, 1164, 1166, 1174, 1176,
                                       1177, 1178, 1181, 1182, 1184, 1186, 1188, 1190, 1193, 1195, 1204, 1207, 1216, 1218, 1220, 1221, 1227, 1242, 1243, 1247,
                                       1250:1256, 1258, 1259, 1262, 1284, 1292, 1297, 1299, 1303, 1304, 1310:1312, 1314, 1315, 1317, 1318, 1320, 1322:1324, 1326,
                                       1328, 1330, 1331, 1335, 1338:1341, 1343:1345, 1354, 1359, 1360, 1362:1364, 1372, 1374, 1384, 1394, 1396, 1398, 1400, 1406,
                                       1407, 1410, 1411, 1417, 1419, 1420:1428, 1436, 1438:1443, 1445:1448, 1451, 1452, 1454, 1457, 1463, 1465:1468, 1470:1472,
                                       1474:1476, 1479, 1480, 1485:1487, 1489:1496, 1498:1503, 1505, 1508, 1514:1517, 1519:1521, 1532, 1533, 1535, 1536, 1540,
                                       1542, 1549, 1553, 1555, 1557, 1559, 1560, 1562, 1563, 1568, 1570, 1580:1583, 1587, 1592:1594, 1603, 1605, 1607, 1614, 1617,
                                       1618, 1620:1623, 1628, 1632, 1637, 1646, 1647, 1650, 1653:1655, 1680:1683, 1685:1691, 1693:1700, 1702, 1712, 1714, 1719,
                                       1721, 1723, 1725, 1728, 1741:1745, 1747:1749, 1751, 1758, 1759, 1766, 1767, 1774, 1775, 1778, 1783, 1788, 1789, 1798:1801,
                                       1804:1807, 1809:1815, 1816, 1818:1820, 1821, 1823, 1829, 1830, 1832, 1833, 1836:1838, 1840, 1841, 1846, 1853, 1855, 1856, 
                                       1864, 1868, 1877, 1879, 1882, 1883, 1885:1895, 1898:1900, 1902, 1906:1914, 1916, 1918, 1929:1933, 1936, 1938, 1939, 1941,
                                       1942, 1948:1955, 1957:1963, 1966:1977, 1981, 1984:1986, 1988, 1990, 1991, 1994:2011, 2013, 2015:2017, 2019, 2020, 2021:2026,
                                       2028:2036, 2037, 2040, 2042, 2047:2049, 2051, 2052, 2058, 2065, 2067, 2068, 2070, 2072, 2073, 2074, 2078, 2080, 2081, 2083,
                                       2084, 2087:2089, 2091, 2092, 2094, 2100, 2102:2109, 2110, 2111, 2113:2115, 2117, 2119, 2121:2123, 2125, 2130, 2131:2133,
                                       2135:2137, 2140:2144,2148:2151, 2154:2168, 2170:2172, 2175:2177, 2179, 2180, 2182, 2184, 2192, 2196, 2203, 2205:2213, 
                                       2216:2218, 2221, 2228, 2229, 2245, 2247:2251, 2254, 2258, 2269:2271, 2273:2276, 2278:2281, 2293:2295, 2297:2299, 2301:2304,
                                       2310, 2311, 2313, 2314, 2316, 2319:2321, 2323, 2327:2329, 2333, 2335, 2336, 2342, 2346:2350, 2353, 2355, 2356, 2357, 2359:2365,
                                       2367, 2368, 2374, 2377, 2386, 2390, 2400:2404, 2406, 2411:2419, 2421, 2422, 2428:2434, 2436, 2438:2440, 2442:2445, 2450, 2451,
                                       2454:2460, 2462:2466, 2468:2472, 2474, 2475, 2477:2479, 2482, 2484:2487, 2490, 2493:2501, 2503:2506, 2508, 2511:2516, 2523,
                                       2525:2530, 2532, 2533, 2535, 2536, 2538, 2546, 2552, 2553, 2560, 2561, 2564, 2566:2568, 2570, 2572, 2573, 2575, 2585, 2590:2592,
                                       2600, 2602, 2604:2611, 2625:2628, 2630:2637),]

# Check whether there are duplicates - No more duplicates.
sum(duplicated(imdb_data_unique$video_title))

# Creating the sequel dummy variable
## For TV-series
imdb_data_unique <-
  imdb_data_unique %>%
  mutate(
    sequel = case_when(
      category == "TV" & str_detect(video_title, "Season") & startYear != endYear ~ 1,
      category == "TV" & str_detect(video_title, "season") & startYear != endYear ~ 1,
      category == "TV" & str_detect(video_title, "Series") & startYear != endYear ~ 1,
      category == "TV" & str_detect(video_title, "Part") & startYear != endYear ~ 1,
      TRUE ~ 0
    )
  )

## For movies
imdb_data_unique$sequel[c(17, 18, 20, 41, 42, 73, 74, 77, 78, 89, 90, 106, 121, 122, 172, 256, 264, 276, 278, 285, 286,
                          344:346, 353:355, 383, 385, 386, 391, 392, 405, 414, 425, 426, 436, 437, 440, 474, 475, 484,
                          496, 516, 517, 522, 523, 525, 527, 535:537, 541, 543:545, 547, 554, 560, 566, 569:571, 631:633,
                          643, 646, 678, 679, 686:688, 721, 725, 749, 763, 770, 788, 789, 803, 811, 812, 818, 834, 835, 
                          842, 852, 861:863, 872:874, 888, 889, 921, 924, 925, 934, 935, 946, 959, 960, 963:968, 978,
                          979, 1007:1009, 1011, 1015, 1027:1029, 1048, 1049, 1056, 1076:1080, 1108, 1109, 1112:1114,
                          1138, 1149, 1193, 1199, 1217, 1218, 1221, 1229, 1237, 1238, 1253:1256, 1275, 1310, 1316:1319,
                          1323, 1425)] <- 1

# Change the Genre column to dummies, such that every column is a genre. In addition, the unnecessary columns are dropped.
genre.split <- strsplit(imdb_data_unique$genres, ",")

lev <- unique(unlist(genre.split))

genre_dummy <- lapply(genre.split, function(x) table(factor(x, levels = lev)))

imdb_data_unique <- with(imdb_data_unique, data.frame(video_title, category, averageRating, numVotes, sequel, do.call(rbind, genre_dummy)))

# Write csv to export the data frame
write_csv(imdb_data_unique, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/imdb/imdb.csv")
