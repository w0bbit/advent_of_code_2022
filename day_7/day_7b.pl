use v5.36;
use warnings;

say sub {

  my %dir_sizes;
  my @dir_branch = ('/');

  open(my $INPUT, '<', 'input.txt');
  while (my $line = <$INPUT>) {
    chomp $line;
    my $pwd = $dir_branch[-1];
    if ($line =~ /^\$\scd\s(\w+)/) {
      my $dir_name = "$dir_branch[-1]/$1/";
      $dir_name =~ s/\/{2,}/\//g;
      push @dir_branch, $dir_name;
      ($pwd, $dir_sizes{$dir_name}) = ($dir_name, 0);
    } 
    if ($line =~ /\.\./) {pop @dir_branch}
    if ($line =~ /^(\d+).+/) {
      for my $branch (@dir_branch) {$dir_sizes{$branch} += $1}
    }
  }
  close $INPUT;

  ##########
  # PART 2 #
  ##########

  # total size of file system
  my $root_total = $dir_sizes{'/'};

  # size of target dir to delete should be le this
  my $tgt_size = 30000000 - (70000000 - $root_total);

  # track dir name/size as better candidates are found
  my ($best_file, $best_size) = ('', $dir_sizes{'/'});

  # checks hash keys/vals to determine eligible candidates for deletion
  # sets $best_file and $best_size
  for my $dir (keys %dir_sizes) {
    if ($dir_sizes{$dir} >= $tgt_size && $dir_sizes{$dir} < $best_size) {
        ($best_size, $best_file) = ($dir_sizes{$dir}, $dir);
    }
  }

  # /pjsd/wtwhzzwz/wglhbp/ (size: 4443914)
  "Best dir to delete is $best_file (size: $best_size)";

}->()