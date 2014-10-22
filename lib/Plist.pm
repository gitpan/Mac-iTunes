package Mac::iTunes::Library::Plist;
use strict;
use warnings;

use vars qw($VERSION);

$VERSION = 1.22;

=head1 NAME

Mac::iTunes::Library::Plist - interact with the music library plist file

=head1 SYNOPSIS

UNIMPLEMENTED

=head1 DESCRIPTION

Someday this will parse the iTunes XML format

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	http://sourceforge.net/projects/brian-d-foy/

If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2002-2007 brian d foy.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

use Mac::PropertyList;

sub parse_file($)
	{
	my $filename = shift;

	open $fh, $filename or return;
	my $string = do { local $/; <$fh> };
	close $fh;

	parse( \$string );
	}

sub parse($)
	{
	my $string = shift;

	my $plist = Mac::PropertyList::parse_plist($string);
	}


"See why 1984 won't be like 1984";
