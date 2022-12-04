use v5.36;
use warnings;

sub {

    # sum var
    my $total = 0;

    open (my $INPUT, '<', 'input.txt');
    while (my $line = <$INPUT>) {
        chomp $line;

        # parsing out startpoints and endpoints for number lists
        my ($first, $second) = split ',', $line;
        my ($first_a, $first_b) = split '-', $first;
        my ($second_a, $second_b) = split '-', $second;

        # count pairs where one number list is contained in the other
        if ($first_a <= $second_a && $first_b >= $second_b) {
            $total++;
        } elsif ($first_a >= $second_a && $first_b <= $second_b) {
            $total++;
        } else {
            next;
        }
    }
    close $INPUT;

    # 532
    say $total;

}->()