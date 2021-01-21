# csv2ris
Simple python script to convert csv files into ris files

This script takes as input a .csv spreadsheet with each reference on a separate row, and the first row consiting of two-letter ris tags that serve as column headers. See the Wikipedia entry on the .ris file format for a list of tags and their meanings: https://en.wikipedia.org/wiki/RIS_(file_format). See the Example.csv file for a template.
<br>
<br>
**Some things to keep in mind:**

- The csv file MUST have a column with the header 'TY' that defines each item's type. Check the ris Wikipedia page for a list of acceptable values for this field.
- The script should take care of any special characters in the import .csv file, but just in case, it's wise to save your file as type "CSV UTF-8"
- The author (AU) and keyword (KW) columns can have multiple entries for each item. These should be separated by a semicolon and a space. So the content of an AU cell might look like: Smith, A.; Chakrabarti, S.;  Osei, D.
- Be sure to open the script in a text editor and edit it each time before you use it, to ensure that the working directory (i.e., where the script will look for the input file and place the output file), the name of the input file, and the name of the output file are all what you want them to be.


**A note on the Example.csv file**
<br>
In the example, the source metadata contained a column with some useful information that does not fit neatly with any ris tag. This column has been labelled "N1", so this information will go into the "Notes", "Comments", or "Extra" field of most reference managers. This can be a useful way to preserve information that doesn't correspond to any standard ris tag.
