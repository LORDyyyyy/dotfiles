#!/usr/bin/perl
#
# Source: https://askubuntu.com/questions/353932/equivalent-of-url-file-on-ubuntu
#
# Script to make Microsoft Windows Internet Shortcuts (*.url) work on Linux.

my $browser = $ENV{'BROWSER'} // '/usr/bin/firefox';

while (<>) {
    # match any line of the form "URL = something-without-spaces"
    if (/^\s*URL\s*=\s*(\S+)\s*$/) {
        exec $browser, $1;         # successful exec never returns
        die "$0: could not launch $browser: $!\n";
    }
}
