# $Id: pod_coverage.t,v 1.1 2005/07/15 05:12:12 comdog Exp $

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
