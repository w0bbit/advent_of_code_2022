use v5.36;
use warnings;

sub {

    my $total = 0;

    open(my $INPUT, '<', 'input.txt');
    while (my $line = <$INPUT>) {
        chomp $line;

        # setting up vars
        my $len = length $line;
        my $mid = $len / 2;
        my @half_1 = split '', (substr $line, 0, $mid);
        my @half_2 = split '', (substr $line, $mid, $len);
 
        # find target char
        my $char = '';
        for my $c (@half_1) {
            if (my ($match) = grep /\Q$c/, @half_2) {
                $char = $match;
            }
        }

        # add calc'd value of char to total
        if ($char ge 'a') {
            $total += ord($char)-96;
        } elsif ($char ge 'A') {
            $total += ord($char)-38;
        }
    }
    close($INPUT);

    # 7581
    say $total;

}->()