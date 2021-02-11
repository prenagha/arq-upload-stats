# Arq Upload Statistics

Updated Feb 2021 to support Arq 7

Reads you [Arq Backup](https://www.arqbackup.com) upload logs and outputs
the most frequently uploaded files

In Arq Backup Plan, Edit, Options, Enable `Include list of uploaded files...`

# Sample Output

```
Top 5 Most Frequent Uploads
---------------------------------
9544 /Users/zzz/dev/next/.idea/workspace.xml
4486 /Users/zzz/Library/Calendars/FBF01D115.calendar/Info.plist
1355 /Users/zzz/Library/SyncedPreferences/com.apple.syncedpreferences.plist
1216 /Users/zzz/Music/iTunes/iTunes Library.itl
 780 /Users/zzz/Library/SyncedPreferences/com.apple.security.cloudkeychainproxy3.plist
```

# Installation

* Clone this repository
* Install the Perl CPAN [Time::ParseDate](http://search.cpan.org/~muir/Time-ParseDate-2015.103/lib/Time/ParseDate.pm) module: ```cpan Time::ParseDate```
* In Arq application Preferences, Advanced, set Log Level to *Detail*
    * Note: If you didn't have Detail level before you will need to let Arq backup for a while to get data to analyze
* Adjust the ```$since``` variable in ```upload-parse.pl``` to your liking
    * Default is to analyze data from the last 30 days
* Adjust the ```count``` and ```path``` in ```upload-stats.sh``` as needed
    * Default count is top 50 items
    * Default path is ```/Library/Logs/ArqAgent/*.log```
* Open a Terminal, cd to the cloned directory, run ```upload-stats.sh```

