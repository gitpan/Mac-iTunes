# $Id: get_playlists.t,v 1.1 2002/09/27 09:20:00 comdog Exp $
use strict;

use Test::More tests => 3;

use Mac::iTunes;

my $controller = Mac::iTunes->controller;
isa_ok( $controller, 'Mac::iTunes::AppleScript' );

my $lists = $controller->get_playlists;
isa_ok( $lists, 'ARRAY' );

pass();
