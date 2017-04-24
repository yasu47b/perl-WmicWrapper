use strict;
use Test::More 0.98;

use_ok $_ for qw(
    WmicWrapper
);

is(system("wmic -V"), 0, "wmic existing check");

done_testing;

