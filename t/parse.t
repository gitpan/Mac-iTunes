# $Id: parse.t,v 1.1 2002/08/30 08:21:47 comdog Exp $

use Test::More tests => 3;

use MacOSX::iTunes;
use MacOSX::iTunes::Library::Parse;

my $File = "mp3/iTunes Music Library";
my $fh;

ok( open( $fh, $File ), 'Open music library' );
isa_ok( Mac::iTunes::Library::Parse->parse( $fh ), 'Mac::iTunes' );
ias_ok( Mac::iTunes->read( $File ), 'Mac::iTunes' );
