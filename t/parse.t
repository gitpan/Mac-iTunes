# $Id: parse.t,v 1.2 2002/08/31 22:28:17 comdog Exp $

use Test::More tests => 3;

use Mac::iTunes;
use Mac::iTunes::Library::Parse;

my $File = "mp3/iTunes Music Library";
my $fh;

ok( open( $fh, $File ), 'Open music library' );
isa_ok( Mac::iTunes::Library::Parse->parse( $fh ), 'Mac::iTunes' );
isa_ok( Mac::iTunes->read( $File ), 'Mac::iTunes' );
