library(tidyverse)

csv2ris <- function(filename) {
  infile <- read_csv(paste0(filename,".csv"),locale = locale(encoding = "UTF-8"))
  outfile <- file(paste0(filename, ".txt"))
  
  output <- c()  # Creates an empty character vector to store the output
  
  all_fields <- c('TY', 'TI', 'AB', 'A1', 'A2', 'A3', 'A4', 'AD', 'AN', 'AU', 'AV', 'BT', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'CA', 'CN', 'CP', 'CT', 'CY', 'DA', 'DB', 'DO', 'DP', 'ED', 'EP', 'ET', 'ID', 'IS', 'J1', 'J2', 'JA', 'JF', 'JO', 'KW', 'L1', 'L2', 'L3', 'L4', 'LA', 'LB', 'LK', 'M1', 'M2', 'M3', 'N1', 'N2', 'NV', 'OP', 'PB', 'PP', 'PY', 'RI', 'RN', 'RP', 'SE', 'SN', 'SP', 'ST', 'T1', 'T2', 'T3', 'TA', 'TT', 'U1', 'U2', 'U3', 'U4', 'U5', 'UR', 'VL', 'VO', 'Y1', 'Y2', 'ER')
  
  for (i in 1:nrow(infile)) {
    record <- character()  # Create a variable to store the record for each row
    for (header in all_fields) {
      if (header %in% colnames(infile) && !is.na(infile[[header]][i])) {  # Check if the header exists in the CSV file and the value is not missing
        if (header == 'AU' || header == 'KW') {  # Authors and keywords will have multiple values, delimited by '; '. Need to split these up.
          collection <- str_split(infile[[header]][i], pattern = "; ")[[1]]
          for (item in collection) {
            record <- c(record, paste(header, "  - ", item))  # Pair each value for author/keyword with its heading, put each on a new line.
          }
        } else {
          record <- c(record, paste(header, "  - ", infile[[header]][i]))  # For all fields besides author/keyword, pair the value with its heading, put each on a new line.
        }
      }
    }
    if (length(record) > 0) {
      record <- c(record, "ER  - ")  # Puts an empty "ER" (End of Reference) tag at the end of each record
      record <- c(record, "")  # Add one blank line after each record
      output <- c(output, record)  # Append the record to the output
    }
  }
  
  
  writeLines(output, outfile)
  
  close(outfile)
  
  }

