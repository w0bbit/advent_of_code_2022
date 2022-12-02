use v5.36;
use warnings;

sub {

    my %point = (
        A => 1,
        B => 2,
        C => 3,
    );

    my $total = 0;

    open(my $INPUT, '<', 'input.txt');
    while (my $line = <$INPUT>) {
        chomp $line;

        my ($elf) = $line =~ /^(\w)\s\w/;
        my ($strat) = $line =~ /\w\s(\w)$/;

        if ($strat eq 'Z') {
            $total += 6;
            if ($elf eq 'A') {
                # add 2 points to beat rock with paper
                $total += 2;
            } elsif ($elf eq 'B') {
                # add 3 points to beat paper with scissors
                $total += 3;
            } else {
                # add 1 point to beat scissors with rock
                $total += 1;
            }
        } elsif ($strat eq 'Y') {
            $total += 3;
            $total += $point{$elf};
        } else {
            if ($elf eq 'A') {
                # add 3 points to lose rock with scissors
                $total += 3;
            } elsif ($elf eq 'B') {
                # add 1 point to lose to paper with rock
                $total += 1;
            } else {
                # add 2 points to lose to scissors with paper
                $total += 2;
            }
        }
    }
    close($INPUT);

    # 9541
    say "My new total score is $total";

}->()