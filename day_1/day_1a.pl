use v5.36;
use warnings;

sub {
    my $src = 'input.txt';
    
    my $max_cals = 0;
    my $curr_cals = 0;

    open(my $INPUT, '<', $src);
    while (my $line = <$INPUT>) {
        chomp $line;
        if ($line =~ /\d+/) {
            $curr_cals += $line;
            if ($curr_cals > $max_cals) {
                $max_cals = $curr_cals;
            }
        } else {
            $curr_cals = 0;
        }
    }
    close($INPUT);

    # 75622
    say "The Elf carrying the most calories is carrying $max_cals calories.";

}->()