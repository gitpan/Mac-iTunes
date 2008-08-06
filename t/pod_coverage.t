# $Id: pod_coverage.t 1656 2005-07-15 05:12:12Z comdog $

use Test::More;
eval "use Test::Pod::Coverage";

if( $@ )
	{
	plan skip_all => "Test::Pod::Coverage required for testing POD";
	}
else
	{
	plan tests => 1;

	pod_coverage_ok( "Mac::iTunes" );      
	}
