#!/usr/bin/perl -w

# http://search.cpan.org/~muir/Time-ParseDate-2015.103/lib/Time/ParseDate.pm
use Time::ParseDate;

# specify the log lines to process, see doc for Time::ParseDate 
# can say: last week, last month, last year, 
$since = parsedate("now - 10 days");
        
# 2017/01/12 08:45:32:227  DETAIL [thread 6207] uploading e1eda9b92f44942aa47435e8137730e686d45d64 /Users/x/x/E0084.ics offset=0 length=759

$LOGFILE = $ARGV[0];
open(LOGFILE) or die("Could not open log file.");
foreach $line (<LOGFILE>) {
  if ($line =~ m/^([0-9\/]+) [0-9:]+  DETAIL \[thread .+?\] skipping file excluded by user\: (.+)\/(.+?)$/) {
    $date = $1;
    $dt = parsedate($date);
    $file = "$2/$3";
    $name = $3;
    
    if ($dt >= $since) {
      print "$name,$file\n";
    }
  }
}
close(LOGFILE);
