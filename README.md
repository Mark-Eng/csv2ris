# csv2ris
Simple python script to convert csv files into ris files

This script takes as input a csv spreadsheet with each reference on a separate row, and the first row consiting of two-letter ris tags that serve as column headers. See the Wikipedia entry on the ris file format for a list of tags and their meanings: https://en.wikipedia.org/wiki/RIS_(file_format)
<br>
<br>
Some things to keep in mind:

- The csv file MUST have a column with the header 'TY' that defines each item's type. 
- The author (AU) and keyword (KW) columns can have multiple entries for each item; these should be separate by a semicolon and a space. So the content of an AU cell might look like: Smith, A.; Chakrabarti, S.;  Osei, D.
- Be sure to edit the script each time before you use it, to ensure that the working directory (i.e., where the script will look for the input file and place the output file), the name of the input file, and the name of the output file are all what you want them to be.
