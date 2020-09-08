#!/usr/bin/perl
use POSIX;
#generate files of random size in txt and binary mode
use Digest::MD5 qw(md5 md5_hex md5_base64);
srand(time() ^ ($$ + ($$ << 15)));
do "./create_file_config.pl";
check_dir($root);


generate_files();

    sub generate_files()
    {
	foreach $dirname(@dirhandles)
	{
	$TESTDIR =join '/',$root,$dirname;	
	check_dir($TESTDIR);
	foreach $foxfile (@files)
	{
	
        for ($filen=0; $filen< $num_files; $filen++)
		{
		open_txt_file();
		open_binary_file();
		$num = rand 10 * 3200;
		$num_line = int(rand 80 * $num_line_multicant);
        	$line = "The quick brown fox jumped over the lazy dogs back";
        for ($i =0;$i < $num_line; $i++) 
		{
		$local_date = get_date();
		print TFILE "$local_date $line \n";
		print TFILE2 pack("A18 A51", $local_date, $line);
		}
		close(TFILE);
		close(TFILE2);
		}
	
	 }	
    	}
	}

	#open_txt_file
	sub open_txt_file 
		{
		$filename = join '.',$foxfile,$filen,$text_ext;
		open (TFILE, ">>$filename") || die "cannot open file $!";
		}

		

	#open a binary file.
	sub open_binary_file
		{
		$filenamedb = join '.',$foxfile,$filen,$bin_ext;
		open(TFILE2, ">>$filenamedb")  || die " cannot open file $!";
		binmode TFILE2;
		}
	
        #check if dir exist if not create and cd into it
	sub check_dir
		{

		if ( -d $_[0])
			{
		
			chdir($_[0]) or die ;
			}
		else
			{
			
			mkdir($_[0]) or die;
			chdir($_[0]) or die;
			}
		}	
    
	sub get_date()
		{
		my $date = POSIX::strftime("%m/%d/%Y %H:%M:%S", localtime);
		return $date
		}
	sub get_file_date()
		{
		my $date = POSIX::strftime("%m%d%Y%H%M%S", localtime);
		return $date
		}
