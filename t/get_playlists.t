# $Id: get_playlists.t,v 1.2 2002/11/14 08:04:20 comdog Exp $
use strict;

use Test::More tests => 2;

use Mac::iTunes;

my $controller = Mac::iTunes->controller;
isa_ok( $controller, 'Mac::iTunes::AppleScript' );

my $lists = $controller->get_playlists;
isa_ok( $lists, 'ARRAY' );
