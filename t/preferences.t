# $Id: preferences.t,v 1.2 2002/09/20 22:55:51 comdog Exp $

use Test::More tests => 2;

use Mac::iTunes;
use Mac::iTunes::Preferences;
use Time::HiRes;

my $file = "plists/com.apple.iTunes.plist";
my $prefs;

isa_ok( $prefs = Mac::iTunes::Preferences->parse_file( $file ), 
	'Mac::iTunes::Preferences' );

isa_ok( $prefs = Mac::iTunes->preferences( $file ), 
	'Mac::iTunes::Preferences' );
