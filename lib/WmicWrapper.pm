package WmicWrapper;
use 5.008001;
use strict;
use warnings;
use Carp;

our $VERSION = "0.01";

sub new {
    my $class = shift;
    my $args = {@_};
    croak("You must provide host") unless defined $args->{host};
    croak("You must provide password") unless defined $args->{password};
    croak("You must provide username") unless defined $args->{user};
    my $href = {
		domain => 'localhost',
		@_
	       };
    bless $href, $class;
}

sub execute {
    my $self = shift;
    my $wql = shift;
    my $domain = $self->{domain} || 'localhost';
    my $user = $self->{user};
    my $password = $self->{password};
    my $host = $self->{host};
    my $command = "wmic -U $domain/$user%$password //$host ".'"'.$wql.'"';
    $command = $command.' --delimiter='.$self->{delimiter};
    return `$command`;
}

1;
__END__

=encoding utf-8

=head1 NAME

WmicWrapper - It's simple wrapper for wmic command

=head1 SYNOPSIS

    use WmicWrapper;

    my $wmic = WmicWrapper->new(
			host => <host_addres>,  # required
			user => <username>,     # required
			password => <password>, # required

			# optional
			domain => <your domain>  # default 'localhost'
			delimiter => <delimiter> # default '|'
			);
    my $wql = "select * from Win32_OperatingSystem"
    my $output = $wmic->execute($wql);

=head1 DESCRIPTION

WmicWrapper is simple wrapper module for wmic command;

=head1 LICENSE

Copyright (C) yasu47b.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

yasu47b E<lt>yasu47b@gmail.com<gt>

=cut

