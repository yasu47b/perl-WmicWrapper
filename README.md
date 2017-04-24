# NAME

WmicWrapper - It's simple wrapper for wmic command

# SYNOPSIS

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
			

# DESCRIPTION

WmicWrapper is simple wrapper for wmic command

# INSTALLATION

    cpanm https://github.com/yasu47b/perl-WmicWrapper/archive/master.tar.gz

# LICENSE

Copyright (C) yasu47b.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

yasu47b &lt;yasu47b@gmail.com>
