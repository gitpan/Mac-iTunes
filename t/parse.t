# $Id: parse.t,v 1.3 2004/02/05 12:18:19 comdog Exp $

use Test::More tests => 4;

use Mac::iTunes;
use Mac::iTunes::Library::Parse;

my $File = "mp3/iTunes Music Library";
my $fh;

ok( open( $fh, $File ), 'Open music library' );

my $itunes;
isa_ok( Mac::iTunes::Library::Parse->parse( $fh ), 'Mac::iTunes' );
isa_ok( $itunes = Mac::iTunes->read( $File ), 'Mac::iTunes' );

is( scalar $itunes->playlists, 4, 'Correct number of playlists' );
