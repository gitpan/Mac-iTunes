# $Id: load.t,v 1.1 2002/08/30 08:21:47 comdog Exp $

use Test::More tests => 7;

my @classes = ( "Mac::iTunes", map { "Mac::iTunes::$_" } qw( AppleScript FileFormat
	Playlist Item Library::Parse Library::Write ) );
	
foreach my $class ( @classes )
	{
	use_ok( $class );
	}
