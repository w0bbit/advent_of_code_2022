use v5.36;
use warnings;

sub {
    my $src = 'input.txt';
    
    my @totals = ();
    my $curr_total = 0;

    open(my $INPUT, '<', $src);
    while (my $line = <$INPUT>) {
        chomp $line;
        if ($line =~ /\d+/) {
            $curr_total += $line;
        } else {
            push @totals, $curr_total;
            $curr_total = 0;
            next;
        }
    }
    close($INPUT);

    @totals = reverse sort {$a<=>$b} @totals;

    my $top_3_total = 0;
    for (@totals[0,1,2]) {
        $top_3_total += $_;
    }

    # 213159
    say "The top three Elves are carrying a combined $top_3_total calories."

}->()