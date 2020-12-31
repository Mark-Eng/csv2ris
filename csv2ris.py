import os
os.chdir('C:\\Users\\ME\\Desktop\\Py') #Sets working directory—replace with the directory on your computer you want to use
import csv

infile = open('filename.csv', mode='r', encoding='utf-8-sig', errors='ignore') #Open input csv file—replace 'filename' with the name of your csv file.

dict = csv.DictReader(infile) #Load csv parsing library

all_fields = ['TY', 'TI', 'AB', 'A1', 'A2', 'A3', 'A4', 'AD', 'AN', 'AU', 'AV', 'BT', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'CA', 'CN', 'CP', 'CT', 'CY', 'DA', 'DB', 'DO', 'DP', 'ED', 'EP', 'ET', 'ID', 'IS', 'J1', 'J2', 'JA', 'JF', 'JO', 'KW', 'L1', 'L2', 'L3', 'L4', 'LA', 'LB', 'LK', 'M1', 'M2', 'M3', 'N1', 'N2', 'NV', 'OP', 'PB', 'PP', 'PY', 'RI', 'RN', 'RP', 'SE', 'SN', 'SP', 'ST', 'T1', 'T2', 'T3', 'TA', 'TT', 'U1', 'U2', 'U3', 'U4', 'U5', 'UR', 'VL', 'VO', 'Y1', 'Y2', 'ER']

outfile = open('filename.txt', "w", encoding='utf-8', errors='replace') #Create output txt (ris) file—replace 'filename' with the desired name of your txt/ris file

output = "" #Create an address for a location in memory where the output will go

for row in dict:
    for header in all_fields: 
        if header == 'AU' or header == 'KW': #Authors and keywords will have multiple values, delimited by '; '. Need to split these up.
            try:    
                collection = row[header].split('; ')
                for item in collection:
                    output += '\n' + header + '  - ' + item #Pair each value for author/keyword with its heading, put each on a new line.
            except:
                pass
        else:
            try:
                output += '\n' + header + '  - ' + row[header] #For all fields besides author/keyword, pair the value with its heading, put each on a new line.
            except:
                pass
    output += '\nER  - ' #Puts an empty "ER" (End of Reference) tag at the end of each record
    output += '\n' #Add one blank line, start loop again for next record.

outfile.write(output)

infile.close()
outfile.close()
