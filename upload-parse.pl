#!/usr/bin/perl -w

# http://search.cpan.org/~muir/Time-ParseDate-2015.103/lib/Time/ParseDate.pm
use Time::ParseDate;

# specify the log lines to process, see doc for Time::ParseDate 
# can say: last week, last month, last year, 
$since = parsedate("now - 30 days");

# 2021/02/11 13:11:42:546  INFO [thread 307] 11-Feb-2021 13:11:42 EST Uploading /Users/prenagha/Documents/Personal/moneydance/renaghan.moneydance/safe/settings

while (my $line = <>) {
  if ($line =~ m/^([0-9\/]+) [0-9:]+  INFO \[thread .+?\] .+? .+? Uploading (.+)/) {
    $date = $1;
    $dt = parsedate($date);
    $file = $2;
  
    if ($dt >= $since) {
      print "$date,$file\n";
    }
  }
}
