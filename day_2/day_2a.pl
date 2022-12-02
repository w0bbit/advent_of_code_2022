use v5.36;
use warnings;

sub {

    my @win = (
        'A B',
        'B C',
        'C A',
    );

    my %point = (
        X => 1,
        Y => 2,
        Z => 3,
    );

    my %code = (
        X => 'A',
        Y => 'B',
        Z => 'C',
    );

    my $total = 0;

    open(my $INPUT, '<', 'input.txt');
    while (my $line = <$INPUT>) {
        chomp $line;

        my ($elf) = $line =~ /^(\w)/;
        my ($me) = $line =~ /(\w)$/;

        # add points for played hand
        $total += $point{$me};

        $line = "$elf $code{$me}";

        if (grep /$line/, @win) {
            # add 6 points for win
            $total += 6;
        } elsif ($line =~ /(\w)\s\1/) {
            # add 3 points for draw
            $total += 3;
        }
    }
    close($INPUT);

    # 10595
    say "My total score is $total";

}->()