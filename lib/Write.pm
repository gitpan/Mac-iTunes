# $Id: Write.pm,v 1.5 2002/11/27 03:35:05 comdog Exp $
package Mac::iTunes::Library::Write;
use strict;

use base qw(Mac::iTunes);
use vars qw($VERSION $XML_HEAD $XML_FOOT);

$VERSION = sprintf "%d.%02d", q$Revision: 1.5 $ =~ m/ (\d+) \. (\d+) /gx;

=head1 NAME

Mac::iTunes::Library::Write - create an iTunes Music Library file

=head1 SYNOPSIS

	see the Mac::iTunes documentation
	
=head1 DESCRIPTION

This module turns a Mac::iTunes object into an C<iTunes Music Library>
file.

=head1 METHODS

=over 4 

=item as_xml


=cut

BEGIN {
	$XML_HEAD =<<"XML";
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Major Version</key>
	<integer>1</integer>
	<key>Minor Version</key>
	<integer>1</integer>
	<key>Application Version</key>
	<string>3.0</string>
	<key>Tracks</key>
	<dict>
XML

	$XML_FOOT =<<"XML";
</dict>
</plist>
XML
}

sub as_xml
	{
	my $self = shift;
	
	my $str  = $XML_HEAD;
	
	
	$str .= $XML_FOOT;
	
	return $str;
	}
	
sub item_xml
	{
	my $self = shift;
	my $item = shift;
	
	my $str =<<"XML";
		<key>67</key>
		<dict>
			<key>Track ID</key>
			<integer>$$item{id}</integer>
			<key>Name</key>
			<string>$$item{title}</string>
			<key>Artist</key>
			<string>$$item{artist}</string>
			<key>Album</key>
			<string>$$item{album}</string>
			<key>Genre</key>
			<string>$$item{genre}</string>
			<key>Kind</key>
			<string>MPEG audio file</string>
			<key>Size</key>
			<integer>$$item{size}</integer>
			<key>Total Time</key>
			<integer>$$item{seconds}</integer>
			<key>Track Number</key>
			<integer>$$item{track}</integer>
			<key>Track Count</key>
			<integer>$$item{total_tracks}</integer>
			<key>Date Modified</key>
			<date>$$item{modified}</date>
			<key>Date Added</key>
			<date>$$item{added}</date>
			<key>Bit Rate</key>
			<integer>$$item{bit_rate}</integer>
			<key>Sample Rate</key>
			<integer>$$item{sample_rate}</integer>
			<key>File Type</key>
			<integer>$$item{file_type}</integer>
			<key>File Creator</key>
			<integer>$$item{file_creator}</integer>
			<key>Location</key>
			<string>$$item{url}</string>
			<key>File Folder Count</key>
			<integer>$$item{file_count}</integer>
			<key>Library Folder Count</key>
			<integer>$$item{library_count}</integer>
		</dict>
XML

	return $str;
	}
	
=cut

=back

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	https://sourceforge.net/projects/brian-d-foy/
	
If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 SEE ALSO

L<Mac::iTunes>

=head1 BUGS

* just wait.

=head1 AUTHOR

brian d foy,  E<lt>bdfoy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2002, brian d foy, All rights reserved

You may redistribute this under the same terms as Perl.

=cut

"See why 1984 won't be like 1984";

