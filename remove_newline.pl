#!/usr/bin/env perl

# filter to remove newlines from an editor session (initiated with Ctrl-^)

use lib ($ENV{RLWRAP_FILTERDIR} or ".");
use RlwrapFilter;
use strict;

my $filter = new RlwrapFilter;
my $name = $filter -> name;

$filter -> help_text("Usage: rlwrap --multi-line --filter='$name' --no-warnings\n".
                     "Removes newlines from editor session text\n"
);



$filter -> input_handler(\&scrub);
$filter -> run;

sub scrub {
    my ($dirty) = @_;
    my $clean = $dirty;
    $clean =~ s/^$/;/gm;
    $clean =~ s/^\s+//gm;
    $clean =~ s/\n//g;
    return $clean;
}
