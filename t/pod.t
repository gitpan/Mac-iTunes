# $Id: pod.t,v 1.2 2002/09/27 09:20:00 comdog Exp $
use strict;

use vars qw(@files @scripts);

BEGIN {
	use File::Find::Rule;
	@files = File::Find::Rule->file()->name( '*.pm' )->in( 'blib/lib' );
	@scripts = qw(tk/tk-itunes.pl cgi/iTunes.cgi);
	}

use Test::Pod tests => scalar @files + scalar @scripts;

foreach my $file ( @files, @scripts )
	{
	pod_ok($file);
	}
