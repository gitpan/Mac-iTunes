# $Id: prereq.t,v 1.2 2002/09/30 05:02:42 comdog Exp $

use Test::More tests => 1;
use Test::Prereq;

print "bail out! Makefile.PL needs help!"
	unless prereq_ok( undef, undef, [qw(Mac::iTunes::FileFormat)]);
