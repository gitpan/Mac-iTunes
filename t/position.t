# $Id: position.t,v 1.2 2002/09/27 09:40:08 comdog Exp $
use strict;

use Test::More tests => 6;
use Test::Data qw(Scalar);

use Mac::iTunes;
use Mac::iTunes::AppleScript qw(:state);

my $controller = Mac::iTunes->controller;
isa_ok( $controller, 'Mac::iTunes::AppleScript' );

$controller->stop;
is( $controller->player_state, STOPPED );
is( $controller->position, 0 );

$controller->play;
is( $controller->player_state, PLAYING );
defined_ok( $controller->position );
sleep 3;
greater_than( $controller->position, 2 );
