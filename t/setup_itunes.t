# $Id: setup_itunes.t,v 1.1 2002/09/27 09:20:00 comdog Exp $
use strict;

use Test::More tests => 3;

use Mac::iTunes;

use lib  qw(./t/lib ./lib);

require "test_data.pl";

my $controller = Mac::iTunes->new()->controller;
isa_ok( $controller, 'Mac::iTunes::AppleScript' );

# delete everything there so we start fresh
$controller->delete_playlist( $iTunesTest::Test_playlist );

my $result = not $controller->playlist_exists( $iTunesTest::Test_playlist );
ok( $result, 'Playlist was deleted' );

# now add the playlist.  it should now be the only playlist
# with that name.
$controller->add_playlist( $iTunesTest::Test_playlist );
my $result = $controller->playlist_exists( $iTunesTest::Test_playlist );
ok( $result. 'Playlist exists' );

# add a track to the playlist.  it will be the only track in
# the playlist.
$controller->add_track( $iTunesTest::Test_mp3,
	$iTunesTest::Test_playlist );


