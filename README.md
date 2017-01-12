# Arq Upload Statistics

Reads you [Arq Backup](https://www.arqbackup.com) upload logs and outputs

* The most frequently uploaded files
* The largest individual uploaded file
* The largest cumulative uploaded file

# Sample Output

```
Top 5 Largest Single Upload Size
-------------------------------------
   4 MB /Users/zzz/Music/iTunes/iTunes Library.itl
   4 MB /Users/zzz/Library/Containers/com.apple.siri.media-indexer/Data/mediatitlesedgeTable.tdb
   4 MB /Users/zzz/Library/Containers/com.apple.siri.media-indexer/Data/artistnamesedgeTable.tdb
   4 MB /Users/zzz/Library/Application Support/Slack/Cache/data_3
   4 MB /Users/zzz/Library/Application Support/Slack/Cache/data_2

Top 5 Largest Total Upload Size
------------------------------------
   2 GB /Users/zzz/Music/iTunes/iTunes Library.itl
   1 GB /Users/zzz/Win/er-next/.idea/workspace.xml
  78 MB /Users/zzz/Documents/Personal/moneydance/zzz.moneydance/safe/tiksync/trunk
  22 MB /Users/zzz/Pictures/Photos.photoslibrary/r/r/RKVersionAnalysisState/00.lij
  11 MB /Users/zzz/Library/Keychains/180961EB-330/ocspcache.sqlite3-wal

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
    * Default is to analyze data from the last 10 days
* Adjust the ```count``` and ```path``` in ```upload-stats.sh``` as needed
    * Default count is top 25 items
    * Default path is ```~/Library/Logs/arqcommitter/*.log```
* Open a Terminal, cd to the cloned directory, run ```upload-stats.sh```

