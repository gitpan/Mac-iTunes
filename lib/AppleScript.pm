package Mac::iTunes::AppleScript;
use strict;

use vars qw($AUTOLOAD);

use Carp qw(carp);
use Mac::AppleScript qw(RunAppleScript);

my $Singleton = undef;

=head1 NAME

Mac::iTunes::AppleScript - control iTunes from Perl

=head1 SYNOPSIS

use Mac::iTunes;

my $itunes = Mac::iTunes->controller;

$itunes->activate;
$itunes->play;
$itunes->quit;

=head1 DESCRIPTION

=head2 Methods

=over 4

=cut

# %Tell holds simple methods for AUTOLOAD
my %Tell = ( 
	map( { $_, $_ } 
		qw(activate run play pause quit playpause resume rewind stop) ),
	map( { my $x = $_; $x =~ tr/_/ /; ( $_, $x ) } 
		qw(fast_forward back_track next_track previous_track) )
		);
@Tell{ qw(next previous redo) } = 
	@Tell{ qw(next_track previous_track back_track) };
	
sub AUTOLOAD
	{
	my $self   = shift;
	my $method = $AUTOLOAD;
	
	$method =~ s/.*:://g;
	
	if( exists $Tell{ $method } )
		{
		$self->tell( $Tell{ $method } );
		}
	else
		{
		carp "I didn't know what to do with [$method]";
		}	
		
	}

=item new()

Returns a singleton object that can control iTunes.

=cut

sub new
	{
	my $class = shift;
	
	unless( defined $Singleton )
		{
		$Singleton = bless {}, $class;
		}
		
	return $Singleton;
	}	

=item play

Start playing the current selection

=item pause

Pause playback.

=item playpause

Toggle the play-pause button.  If it's on play, it will pause, and
if it's on pause, it will play.

=item next, next_track

Skip to the next track

=item previous, previous_track

Skip to the previous track

=item redo, back_track

Go back to the start of the current track

=item stop

Stop playback.

=item fast_forward

Fast forward through the current selection.

=item rewind

Rewind through the current selection.

=item resume

Start playing after fast forward or rewind

=item quit

Quit iTunes

=item open_url( URL )

=cut

sub open_url
	{
	my $self = shift;
	my $url  = shift;
	
	$self->tell("open location $url");
	}
	
=item tell( COMMAND )

The tell() method runs a simple 

=cut

sub tell
	{
	my $self    = shift;
	my $command = shift;
	
	RunAppleScript( qq(tell application "iTunes"\n$command\nend tell) );
	}

sub DESTROY { 1 };

=back

=head1 SEE ALSO

=head1 AUTHOR

=cut

"See why 1984 won't be like 1984";
