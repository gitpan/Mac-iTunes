# $Id: check_mp3.t,v 1.2 2002/11/14 08:04:20 comdog Exp $
use strict;

use Test::More tests => 3;
use MP3::Info;

use lib  qw(./t/lib ./lib);

require "test_data.pl";

ok( -e $iTunesTest::Test_mp3, 'Test mp3 file exists' );

my $tag  = get_mp3tag( $iTunesTest::Test_mp3 ); 
isa_ok( $tag, 'HASH' );

unless( is( $tag->{TITLE}, $iTunesTest::Title, 'Test mp3 has right title' ) )
	{
	require Data::Dumper;
	print STDERR Data::Dumper::Dumper( $tag );

	print "bail out! Test MP3 file is not what I expected!"
	}
