# Libraries
library(tidyverse)
library(readr)

# Read in the unique video titles csv
unique_video_titles <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/unique_video_titles.csv")

# Renaming the data frame and copying the show title column to fixed title column
fixed_show_titles <- unique_video_titles
fixed_show_titles$fixed_title <- unique_video_titles$show_title

# Fixing the show title names in the fixed title column
## 10,000 B.C.
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "10,000 B.C."] <- "10,000 bc"

## 13 Hours: The Secret Soldiers of Benghazi
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "13 Hours: The Secret Soldiers of Benghazi"] <- "13 hours"

## Alive
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Alive"] <- "#alive"

## A Family
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "A Family"] <- "yakuza and the family"

## A Madea Homecoming
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "A Madea Homecoming"] <- "tyler perry's a madea homecoming"

## A Woman With No Filter
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "A Woman With No Filter"] <- "una mujer sin filtro"

## Apocalypse Now Redux
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Apocalypse Now Redux"] <- "apocalypse now"

## Assassination Classroom: Graduation
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Assassination Classroom: Graduation"] <- "assassination classroom: the graduation"

## Barbie Big City Big Dreams
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Barbie Big City Big Dreams"] <- "barbie: big city, big dreams"

## BASTARD‼ -Heavy Metal, Dark Fantasy-
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "BASTARD‼ -Heavy Metal, Dark Fantasy-"] <- "bastard!! heavy metal, dark fantasy"

## Bigbug
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Bigbug"] <- "big bug"

## Blue, Painful, Fragile
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Blue, Painful, Fragile"] <- "blue, painful and brittle"

## Blumhouse's Fantasy Island
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Blumhouse's Fantasy Island"] <- "fantasy island"

## Bordertown: Mural Murders
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Bordertown: Mural Murders"] <- "bordertown: the mural murders"

## Bullsh*t The Gameshow
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Bullsh*t The Gameshow"] <- "bullsh*t the game show"

## Centauro
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Centauro"] <- "centaur"

## Chernobyl 1986
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Chernobyl 1986"] <- "chernobyl: abyss"

## Cold Blood Legacy
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Cold Blood Legacy"] <- "cold blood"

## Crayon Shin-chan the Movie: Crash! Rakuga-Kingdom and Almost Four Heroes
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Crayon Shin-chan the Movie: Crash! Rakuga-Kingdom and Almost Four Heroes"] <- "shinchan: crash! scribble kingdom and almost four heroes"

## Crayon Shin-chan the Movie: Shrouded in Mystery! The Flowers of Tenkazu Academy
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Crayon Shin-chan the Movie: Shrouded in Mystery! The Flowers of Tenkazu Academy"] <- "crayon shin-chan: shrouded in mystery! the flowers of tenkasu academy"

## Devotion, a Story of Love and Desire
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Devotion, a Story of Love and Desire"] <- "fidelity"

## Dr. Seuss' The Cat in the Hat
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Dr. Seuss' The Cat in the Hat"] <- "the cat in the hat"

## Dr. Seuss' The Grinch
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Dr. Seuss' The Grinch"] <- "the grinch"

## Dr. White
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Dr. White"] <- "doctor white"

## É Fada!
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "É Fada!"] <- "it's a fairy!"

## Falsa identidad
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Falsa identidad"] <- "false identity"

## Fear Street Part 1: 1994
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Fear Street Part 1: 1994"] <- "fear street: part one - 1994"

## Fear Street Part 2: 1978
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Fear Street Part 2: 1978"] <- "fear street: part two - 1978"

## Fear Street Part 3: 1666
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Fear Street Part 3: 1666"] <- "fear street: part three - 1666"

## Firedrake the Silver Dragon
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Firedrake the Silver Dragon"] <- "dragon rider"

## Forecasting Love and Weather
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Forecasting Love and Weather"] <- "meteorological administration people: office romance cruelty"

## Gantz II: Perfect Answer
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Gantz II: Perfect Answer"] <- "gantz: perfect answer"

## Ghost in the Shell: SAC_2045 Sustainable War
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Ghost in the Shell: SAC_2045 Sustainable War"] <- "ghost in the shell: sac_2045 - sustainable war"

## Ghost in the Shell: SAC_2045
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Ghost in the Shell: SAC_2045"] <- "ghost in the shell sac_2045"

## GOLGO13
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "GOLGO13"] <- "golgo 13"

## Goosebumps 2: Haunted Halloween
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Goosebumps 2: Haunted Halloween"] <- "goosebumps 2: slappy's revenge"

## Green Mothers' Club
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Green Mothers' Club"] <- "green mothers club"

## Hero (2015)
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Hero (2015)"] <- "hero"

## Honeymoon with My Mother
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Honeymoon with My Mother"] <- "mother's love"

## How I Became a Superhero
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "How I Became a Superhero"] <- "how i became a super hero"

## How to Become the Worst Student at School
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "How to Become the Worst Student at School"] <- "como se tornar o pior aluno da escola"

## Hunter X Hunter (2011)
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Hunter X Hunter (2011)"] <- "hunter x hunter"

## I Swear It Wasn't Me
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "I Swear It Wasn't Me"] <- "it's not me, i swear!"

## Ilhados
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Ilhados"] <- "stranded"

## It’s Your Fault That My Heart Beats
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "It’s Your Fault That My Heart Beats"] <- "mune ga naru no wa kiminosei"

## Jurassic World Camp Cretaceous
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Jurassic World Camp Cretaceous"] <- "jurassic world: camp cretaceous"

## L.A.’s Finest
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "L.A.’s Finest"] <- "l.a.'s finest"

## La bella y las bestias
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "La bella y las bestias"] <- "the beauty and the beasts"

## La ley de Herodes
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "La ley de Herodes"] <- "herod's law"

## La leyenda de la Nahuala
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "La leyenda de la Nahuala"] <- "legend quest: the legend of la nahuala"

## Leon's Heart
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Leon's Heart"] <- "lion's heart"

## Love (ft. Marriage and Divorce)
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Love (ft. Marriage and Divorce)"] <- "love"

## Luccas Neto em: O Plano dos Vilões
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Luccas Neto em: O Plano dos Vilões"] <- "luccas neto em o plano dos vilões"

## Luccas Neto in: The Magical Hotel 2
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Luccas Neto in: The Magical Hotel 2"] <- "luccas neto em: o hotel mágico 2"

## Luis Miguel - The Series
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Luis Miguel - The Series"] <- "luis miguel: the series"

## Mahjong Legend Akagi: The Genius Who Descended Into the Darkness
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Mahjong Legend Akagi: The Genius Who Descended Into the Darkness"] <- "akagi"

## Malverde, el santo patrón
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Malverde, el santo patrón"] <- "malverde: el santo patrón"

## Man Vs Bee
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Man Vs Bee"] <- "man vs. bee"

## Mariah Carey's All I Want for Christmas Is You
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Mariah Carey's All I Want for Christmas Is You"] <- "all i want for christmas is you"

## Meet, Marry, Murder
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Meet, Marry, Murder"] <- "meet marry murder"

## Midsommar: The Director's Cut
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Midsommar: The Director's Cut"] <- "midsommar"

## Mobile Suit Gundam Hathaway
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Mobile Suit Gundam Hathaway"] <- "mobile suit gundam: hathaway"

## Munich – The Edge of War
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Munich – The Edge of War"] <- "munich: the edge of war"

## Murders at the House of Death
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Murders at the House of Death"] <- "murder at shijinso"

## My Dear Exes
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "My Dear Exes"] <- "towako omameda and her three ex-husbands"

## My Liberation Notes
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "My Liberation Notes"] <- "my liberation diary"

## My Lover My Killer
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "My Lover My Killer"] <- "my lover, my killer"

## Nevertheless,
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Nevertheless,"] <- "nevertheless"

## Newly Rich, Newly Poor
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Newly Rich, Newly Poor"] <- "nuevo rico, nuevo pobre"

## One-Punch Man
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "One-Punch Man"] <- "one punch man"

## Peter Rabbit 2
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Peter Rabbit 2"] <- "peter rabbit 2: the runaway"

## Piranha
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Peter Rabbit 2"] <- "peter rabbit 2: the runaway"

## Pretty Guardian Sailor Moon Eternal The Movie
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Pretty Guardian Sailor Moon Eternal The Movie"] <- "sailor moon eternal"

## Retfærdighedens ryttere
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Retfærdighedens ryttere"] <- "riders of justice"

## Rise of the Footsoldier 3: The Pat Tate Story
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Rise of the Footsoldier 3: The Pat Tate Story"] <- "rise of the footsoldier 3"

## Rise of the Footsoldier: Marbella
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Rise of the Footsoldier: Marbella"] <- "rise of the footsoldier: the heist"

## RRR (Hindi)
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "RRR (Hindi)"] <- "rrr"

## Rurouni Kenshin: Origins
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Rurouni Kenshin: Origins"] <- "rurouni kenshin part i: origins"

## Rurouni Kenshin: The Beginning
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Rurouni Kenshin: The Beginning"] <- "rurouni kenshin: final chapter part ii - the beginning"

## Rurouni Kenshin: The Final
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Rurouni Kenshin: The Final"] <- "rurouni kenshin: final chapter part i - the final"

## SAS: Rise of the Black Swan
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "SAS: Rise of the Black Swan"] <- "sas: red notice"

## Search WWW
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Search WWW"] <- "search: www"

## Señora Acero
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Señora Acero"] <- "lady of steel"

## Shameless (U.S.)
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Shameless (U.S.)"] <- "shameless"

## Single’s Inferno
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Single’s Inferno"] <- "single's inferno"

## Snake Eyes: G.I. Joe Origins
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Snake Eyes: G.I. Joe Origins"] <- "snake eyes"

## SP: The Motion Picture Episode V
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "SP: The Motion Picture Episode V"] <- "sp: the motion picture i"

## SP: The Motion Picture Episode VI<The Final Episode>
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "SP: The Motion Picture Episode VI<The Final Episode>"] <- "sp: the motion picture ii"

## Spiral: From the Book of Saw
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Spiral: From the Book of Saw"] <- "spiral"

## Spirit Chronicles
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Spirit Chronicles"] <- "seirei gensouki: spirit chronicles"

## Tadeo Jones 2: El secreto del Rey Midas
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Tadeo Jones 2: El secreto del Rey Midas"] <- "tad, the lost explorer, and the secret of king midas"

## Teenage Mutant Ninja Turtles 2
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Teenage Mutant Ninja Turtles 2"] <- "teenage mutant ninja turtles: out of the shadows"

## The Cinderella Addiction
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Cinderella Addiction"] <- "melancholy"

## The Hangover: Part III
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Hangover: Part III"] <- "the hangover part iii"

## The Hook Up Plan
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Hook Up Plan"] <- "plan coeur"

## The Legend of Black Snake
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Legend of Black Snake"] <- "black snake: the legend of black snake"

## The Master Plan
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Master Plan"] <- "vernacular plan"

## The Mitchells vs. The Machines
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Mitchells vs. The Machines"] <- "the mitchells vs the machines"

## The Prince & Me
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Prince & Me"] <- "the prince and me"

## The Princess Switch 3: Romancing the Star
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Princess Switch 3: Romancing the Star"] <- "the princess switch 3"

## The Suicide Squad (Dubbed Version)
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Suicide Squad (Dubbed Version)"] <- "the suicide squad"

## The Town of Headcounts
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Town of Headcounts"] <- "ninzû no machi"

## The Twilight Saga: Breaking Dawn: Part 1
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Twilight Saga: Breaking Dawn: Part 1"] <- "the twilight saga: breaking dawn - part 1"

## The Twilight Saga: Breaking Dawn: Part 2
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Twilight Saga: Breaking Dawn: Part 2"] <- "the twilight saga: breaking dawn - part 2"

## The UnXplained with William Shatner
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The UnXplained with William Shatner"] <- "the unxplained"

## The Wolf's Call
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "The Wolf's Call"] <- "le chant du loup"

## Tides
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Tides"] <- "the colony"

## Tô Ryca
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Tô Ryca"] <- "i'm rich"

## Todos queremos a alguien
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Todos queremos a alguien"] <- "everybody loves somebody"

## Una película de huevos
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Una película de huevos"] <- "a movie of eggs"

## Under the Stars
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Under the Stars"] <- "hoshi no ko"

## Valentina's Wedding
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Valentina's Wedding"] <- "la boda de valentina"

## Violet Evergarden the Movie
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Violet Evergarden the Movie"] <- "violet evergarden: the movie"

## Welcome Home Roscoe Jenkins
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "Welcome Home Roscoe Jenkins"] <- "welcome home, roscoe jenkins"

## What She Likes...
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "What She Likes..."] <- "she likes that"

## xXx: The Return of Xander Cage
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "xXx: The Return of Xander Cage"] <- "xxx: return of xander cage"

## You're not normal, either!
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "You're not normal, either!"] <- "mato mo janai no wa kimi mo issho"

## أصحاب ...ولا أعزّ
fixed_show_titles$fixed_title[fixed_show_titles$fixed_title == "أصحاب ...ولا أعزّ"] <- "perfect strangers"

# Write csv of the fixed show titles data frame
write_csv(fixed_show_titles, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/imdb/fixed_show_titles.csv")
