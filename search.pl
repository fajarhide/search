#!/usr/bin/perl

eval 'exec perl -S $0 "$@"' if 0;
use Getopt::Std;
use vars qw/%opt @file_find @dir_find/;

&start;
#---------------------------------
sub start{
	Getopt::Std::getopts('hrd:',\%opt);
	my $str = $ARGV[0];

	system('clear');

	if($opt{h} || $str eq ''){
		&help;
		return;
	}

   my $dir='.';
	if($opt{d}){
		$dir = $opt{d};
		$dir =~ s/\\/\//g;
		$dir =~ s/\/$//;
		unless(-d $dir){
			print "\nCan't open directory: $dir";
			print "\nor Directory Not Found";
			print "\n\n";
			return;
		}
	}
	@file_find = ();
	@dir_find = ();

	print "\nSearch String REGEX: \"$str\" found at:\n",("-" x 50),"\n";

		$/=undef; &search($dir,$str);

	print "\n\n";
}

#---------------------------------

sub search{
	my ($dir,$str) = (shift,shift);

	unless(opendir (DIR,$dir)){
		print "\n\ncan't open directory: $dir\n\n";
		return;
	}

	my @file = sort(readdir(DIR));
	close(DIR);
	my $f_org,$f;
	foreach $f (@file){
		$f = "$dir/$f";

		next if($f=~ /\.$|\/\/\.\.$/);

		if (-d $f){
			$opt{'r'} && &search($f,$str) || next;
		}

		next unless (-T $f);

		open(FILE, $f);
			while(<FILE>){
				if ($_ =~ /$str/is){
					$f =~ s/^\.\///;
					print $f,"\n";
				}
			}
	   close(FILE)
	}
}


#---------------------------------

sub help{

		print qq~\
search v1.0
by: 2014, fajarhide
for search string on file
return: list file which content are "string"

Use:

 search [-h]
 search [-d "/dir/subdir"] [-r] "regex_string"

Help:

 "regex_string"    : string to search in the form of a regular expression
 -h                : Help - This list
 -d "/dir/subdir"  : search of spesification directory,
                     if not then the directory is assumed PWD or "."
 -r                : search file of recursive

Example:

  *search of "." files that contain the word "name"

        \$ search "name"

~;

}

