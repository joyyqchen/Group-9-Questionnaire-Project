# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <headingcell level=1>

# <FONT COLOR=#0404B4>Findings: Learning Styles, Programming Language Proficiencies, and Class Experience</font>

# <markdowncell>

# <font size="5">
# Joy Chen | Brian Liou | Eric Tsai <br>
# Group 9 <br>
# Statistics 157
# </font>

# <headingcell level=2>

# Set-Up and Data Importing

# <markdowncell>

# Import basic Python Libraries

# <codecell>

import os.path
import ConfigParser
import csv
from IPython.display import Image

# <markdowncell>

# Import Gspread <br>
# *Be sure to first install the gspread library on your virtual machine using: 
# `sudo pip install gspread`

# <codecell>

import gspread

# <markdowncell>

# Define take(n, iterable) which is a convenience function to limit the amount of output that you print. 
# Useful when you have lots of data that will clutter up your screen!

# <codecell>

from itertools import islice
def take(n, iterable):
    "Return first n items of the iterable as a list"
    return list(islice(iterable, n))

# <markdowncell>

# Read the username and password from the [google] section of the stat157.cfg config file from your virtual machine home directory.

# <codecell>

home = os.path.expanduser("~")
configfile = os.path.join(home, 'stat157.cfg')
config = ConfigParser.SafeConfigParser()
config.read(configfile)
username = config.get('google', 'username')
password = config.get('google', 'password')
print username

# <markdowncell>

# Read the docid of the Google Spreadsheet from the config file.

# <codecell>

docid = config.get('questionnaire', 'docid')
client = gspread.login(username, password)
spreadsheet = client.open_by_key(docid)
worksheet = spreadsheet.get_worksheet(0)
print docid

# <markdowncell>

# Add field names to this list to include the columns of interest from the Google Spreadsheet in the filtered data output. 

# <codecell>

fieldnames = ['Timestamp','What is your learning style?', 'What is/are your career goal(s)?','What computer language(s) do you know?']
print fieldnames

# <markdowncell>

# Read in ALL rows of data from the Google Spreadsheet, but filter out columns that are not listed in `fieldnames`.

# <codecell>

filtered_data = []
for row in worksheet.get_all_records():
    filtered_data.append({k:v for k,v in row.iteritems() if k in fieldnames})
print "Number of rows: {}".format(len(filtered_data))

# <markdowncell>

# Use the convenience function `take()` to grab the data from filtered_data field and store in seperate list for data processes

# <codecell>

lan = []
learn = {}
for row in take(len(filtered_data), filtered_data):
    learn.update({row['Timestamp']:row['What is your learning style?']})
    lan.append(row['What computer language(s) do you know?'])

# <headingcell level=2>

# Data Parsing and "Cleaning" Process

# <markdowncell>

# Process languages by counting number of people that know the language. 

# <codecell>

lan_dict = {}

for l in lan:
    for a in l.split(','):
        a=re.sub(r'[\W]+', '', a)
        if len(a) > 7:
            continue
        if a in lan_dict:
            lan_dict[a] += 1
        else:
            lan_dict.update({a:1})

# <markdowncell>

# Clean out career goal and learning style

# <codecell>

final = []
for key in learn.keys():
    a=re.sub('\n', ' ', learn[key])
    m = re.search(r'Visual:(.*) \d', a)
    if m != None:
        lst = [int(s) for s in m.group().split() if s.isdigit()]
        final.append({'Timestamp' : key, 'Visual' : lst[0], 'Aural' : lst[1], 'Read_Write' : lst[2], 'Kinesthetic': lst[3]})
print final

# <markdowncell>

# Creates a .csv file called data.csv from cleaned data

# <codecell>

names = ['Timestamp', 'Visual', 'Aural','Read_Write','Kinesthetic']
print lan_dict.keys()

f = open('data.csv', 'wb')
dict_writer = csv.DictWriter(f, names, restval='NA')
dict_writer.writeheader()
dict_writer.writerows(final)

f.close()

# <codecell>

a = []
a.append(lan_dict)
g = open('data2.csv','wb')
dict_writer1 = csv.DictWriter(g, lan_dict.keys(), restval='NA')
dict_writer1.writeheader()
dict_writer1.writerows(a)

# <markdowncell>

# <h2>Visualizations</h2>
# <i><font size="4">Note: All visualizations created using R</font></i>

# <markdowncell>

# &nbsp;&nbsp;&nbsp;&nbsp;<font size="4"><b>Figure 1</b></font>
# <br>
# &nbsp;&nbsp;&nbsp;&nbsp;<font size="3">Distribution of scores for each learning style for the class. <br>
# &nbsp;&nbsp;&nbsp;&nbsp;Visual learning had the highest average score while Kinesthetic had the lowest average</font>
# <br><br>
# &nbsp;&nbsp;&nbsp;&nbsp;<img src='https://github.com/joyyqchen/Group-9-Questionnaire-Project/raw/master/LearningStyleHistograms.png'/>

# <markdowncell>

# &nbsp;&nbsp;&nbsp;&nbsp;<font size="4"><b>Figure 2</b></font>
# <br>
# &nbsp;&nbsp;&nbsp;&nbsp;<font size="3">Programming language proficiencies
# <br>
# &nbsp;&nbsp;&nbsp;&nbsp;From the word graph below, it appears that students are most familiar with R and C
# </font>
# <br><br>
# &nbsp;&nbsp;&nbsp;&nbsp;<img src='https://github.com/joyyqchen/Group-9-Questionnaire-Project/raw/master/ProgramProficiencies.png'/>

# <markdowncell>

# <br>
# <br>
# <br>
# <br>
# <P align=right> Statistics 157 Questionnaire Data Wrangling Project | October 7, 2013

