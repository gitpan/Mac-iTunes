# $Id: load.t,v 1.3 2002/09/27 09:20:00 comdog Exp $

BEGIN {
	use File::Find::Rule;
	@classes = map { my $x = $_;
		$x =~ s|^blib/lib/||;
		$x =~ s|/|::|g;
		$x =~ s|\.pm$||;
		$x;
		} File::Find::Rule->file()->name( '*.pm' )->in( 'blib/lib' );
	}

use Test::More tests => scalar @classes;
	
foreach my $class ( @classes )
	{
	print "bail out! $class did not compile\n" unless use_ok( $class );
	}

