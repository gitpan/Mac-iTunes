# $Id: parse3.t,v 1.1 2002/08/30 08:21:47 comdog Exp $

use Test::More tests => 3;

use Mac::iTunes;
use Mac::iTunes::Library::Parse;

my $File = "mp3/iTunes_3_Music_Library";
my $fh;

ok( open( $fh, $File ), 'Open music library' );
isa_ok( Mac::iTunes::Library::Parse->parse( $fh ), 'Mac::iTunes' );
ias_ok( Mac::iTunes->read( $File ), 'Mac::iTunes' );
