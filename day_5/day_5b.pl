use v5.36;
use warnings;

sub {

    my @cols = (
        [], # empty list to shift index
        ['D', 'B', 'J', 'V'],
        ['P', 'V', 'B', 'W', 'R', 'D', 'F'],
        ['R', 'G', 'F', 'L', 'D', 'C', 'W', 'Q'],
        ['W', 'J', 'P', 'M', 'L', 'N', 'D', 'B'],
        ['H', 'N', 'B', 'P', 'C', 'S', 'Q'],
        ['R', 'D', 'B', 'S', 'N', 'G'],
        ['Z', 'B', 'P', 'M', 'Q', 'F', 'S', 'H'],
        ['W', 'L', 'F'],
        ['S', 'V', 'F', 'M', 'R'],
    );

    open (my $INPUT, '<', 'input.txt');

    # skipping first ten lines
    for (1..10) {<$INPUT>};

    while (my $line = <$INPUT>) {
        chomp $line;

        my ($boxes) = $line =~ /^move (\d+) from/;
        my ($orgn) = $line =~ /from (\d+) to/;
        my ($dest) = $line =~ /\d to (\d+)$/;

        # changed only this block for part 2
        my @temp;
        for (1..$boxes) {
            push @temp, pop @{$cols[$orgn]}
        }
        push @{$cols[$dest]}, reverse @temp;

    }
    close $INPUT;

    my $answer;
    for (@cols) {
        my $char = pop @$_;
        $answer .= $char if $char;
    }

    # PGSQBFLDP
    say $answer;

}->();