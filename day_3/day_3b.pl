use v5.36;
use warnings;

sub {

    my $total = 0;

    # vars to track elf-group items
    my $count = 0;
    my @item_set = ();

    open(my $INPUT, '<', 'input.txt');
    while (my $line = <$INPUT>) {
        chomp $line;

        # populate item_set, representing items for three-elf group
        if ($count < 3) {
            push @item_set, $line;
            $count++;
        } else {
            push @item_set, $line;
        }

        # find common char in item_set
        if (@item_set == 3) {
            my $char = '';
            for my $c (split '', $item_set[0]) {
                if (my ($match) = grep /\Q$c/, (split '', $item_set[1])) {
                    if (my ($match) = grep /\Q$c/, (split '', $item_set[2])) {
                        $char = $match;
                    }
                }
            }

            # add calc'd value of char to total
            if ($char ge 'a') {
                $total += ord($char)-96;
            } elsif ($char ge 'A') {
                $total += ord($char)-38;
            }

            # reset vars
            $count = 0;
            @item_set = ();

        }
    }
    close($INPUT);

    # 2525
    say $total;

}->()