# csv2ris
Simple Python/R script to convert csv files into ris files

This script takes as input a .csv spreadsheet with each reference on a separate row, and the first row consisting of two-letter ris tags that serve as column headers. See the Wikipedia entry on the .ris file format for a list of tags and their meanings: https://en.wikipedia.org/wiki/RIS_(file_format). See the Example.csv file for a template.
<br>
<br>
**Some things to keep in mind:**

- The csv file MUST have a column with the header 'TY' that defines each item's type. Check the ris Wikipedia page for a list of acceptable values for this field. All other tags/fields are optional.
- The script should take care of any special characters in the import .csv file, but just in case, it's wise to save your file as type "CSV UTF-8"
- The author (AU) and keyword (KW) columns can have multiple entries for each item. These should be separated by a semicolon and a space. So the content of an AU cell might look like: Smith, A.; Chakrabarti, S.;  Osei, D.
- Usually your source data will have page numbers in the format "42-55", but note that .ris files must have the starting page (SP) and ending page (EP) in separate fields. You can use Excel's "text to columns" feature to split the page numbers in your .csv.
- For Python version:
     - Be sure to open the script in a text editor and edit it each time before you use it, to ensure that the working directory (i.e., where the script will look for the input file and place the output file), the name of the input file, and the name of the output file are all what you want them to be.
     - Once the import .csv file and the script are set up, just double-click the csv2ris.py file to run the script (assuming you have Python installed).
- For R version:
     - You'll need to open the R console and run the script to define the ```csv2ris``` function. Then you can use the command ```setwd``` to set the working directory to the location of your csv file. Then type ```csv2ris("Example")```, replacing "Example" with the name of your csv file (put the name in quotes, and don't include the ".csv" file extension). Then your output .txt file will appear in the working directory.


**A note on the Example.csv file**
<br>
In the example, the source metadata contained a column with some useful information that does not fit neatly with any ris tag. This column has been labelled "N1", so this information will go into the "Notes", "Comments", or "Extra" field of most reference managers. This can be a useful way to preserve information that doesn't correspond to any standard ris tag.
