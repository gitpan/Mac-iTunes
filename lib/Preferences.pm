# $Id: Preferences.pm,v 1.5 2002/12/02 03:54:32 comdog Exp $
package Mac::iTunes::Preferences;
use strict;

use vars qw($VERSION);

$VERSION = sprintf "%d.%02d", q$Revision: 1.5 $ =~ m/ (\d+) \. (\d+) /gx;

=head1 NAME

Mac::iTunes::Preferences - interact with the iTunes Preferences

=head1 SYNOPSIS

use Mac::iTunes;

$prefs = Mac::iTunes->preferences;

=head1 DESCRIPTION

=cut

use Mac::PropertyList;

sub _default_prefs
	{
	return;
	}

=over 4

=item parse_file( FILENAME )

=cut

sub parse_file
	{
	my $class = shift;
	my $filename = shift || _default_prefs;

	open my $fh, $filename or return;
	my $string = do { local $/; <$fh> };
	close $fh;

	$class->parse( $string );
	}

=item parse( STRING )

=cut

sub parse
	{
	my $class  = shift;
	my $string = shift;

	my $plist = Mac::PropertyList::parse_plist( $string );

	bless $plist, $class;
	}

=back

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	https://sourceforge.net/projects/brian-d-foy/

If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 TO DO

* make it not read-only

=head1 AUTHOR

brian d foy, E<lt>bdfoy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2002, brian d foy, All rights reserved.

You may use this software under the same terms as Perl 
itself.

=cut

"See why 1984 won't be like 1984";
