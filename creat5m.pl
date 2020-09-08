#!/opt/ActivePerl-5.10/bin/perl
use POSIX;
use GD::Simple;
#generate files of random size in txt and binary mode
#create a md5 file
use Digest::MD5 qw(md5 md5_hex md5_base64);
srand(time() ^ ($$ + ($$ << 15)));
do "./write_5m_config.pl";
check_dir($root);


generate_files();
#md5_check();


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
		open_gif_file();
		$num = rand 10 * 3200;
		$num_line = int(rand 80 * $num_line_multicant);
        	$line = "The quick brown fox jumped over the lazy dogs back";
        for ($i =0;$i < $num_line; $i++) 
		{
		$local_date = get_date();
		print TFILE "$local_date $line \n";
		#$db{"$i"} = "$line";
		print TFILE2 pack("A18 A51", $local_date, $line);
		gen_img($num,$num_line, $local_date,$line );
		print TFILE3 $img->gif;		
		}
		close(TFILE);
		close(TFILE2);
		close(TFILE3);
		#untie %db;
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
		$filenamebin = join '.',$foxfile,$filen,$bin_ext;
		open(TFILE2, ">>$filenamebin")  || die " cannot open file $!";
		binmode TFILE2;
		}
	
        #check if dir exist if not create and cd into it
	sub check_dir
		{

		if ( -d $_[0])
			{
		
			chdir($_[0]);
			}
		else
			{
			mkdir($_[0]);
			chdir($_[0]);
			}
		}	
    
        #open a  grapchics file.
        sub open_gif_file
                {
                $filenamepng = join '.',$foxfile,$filen,gif;

                open(TFILE3, ">>$filenamepng")  || die " cannot open file $!";
                binmode (TFILE3);
                }
	sub open_hash_file

		{
		$filenamedb = join '.',$foxfile,$filen,bdb;
		$db = "$filenamedb";
		tie(%db, 'DB_File', $db);
		}
		
       	
	
	sub md5_check()
	    {
	    check_dir($md5_dir);
 	    $timest = get_file_date();
	    my $md5_file = join '.',"md5file",$timest,"txt";
    	    open(MD5FILE, ">>$md5_file") || die "$!";  	
	    opendir(DIR, $root) || die $!;
	    chdir($root);
	    @dir_file_name = readdir(DIR);
	    foreach $DIR_HANDLE (@dir_file_name)
	    {   
	
	    if ( $DIR_HANDLE =~ m/\./) 
	    {}
	    else {
	
	    {
	    print MD5FILE "DIR NAME: $DIR_HANDLE\n";
	    print "DIR NAME: $DIR_HANDLE\n";
	    opendir(SUB_DIR, $DIR_HANDLE);
	    @sub_dir_files = readdir(SUB_DIR);
	    foreach $file_name (@sub_dir_files)
	    {
	 
	    print "$file_name = ", md5_hex("$file_name"), "\n";
	    print MD5FILE "$DIR_HANDLE $file_name  ", md5_hex("$file_name"), "\n";
	    }
            }

	    }
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

sub gen_img()
{
srand();
my $YPOS =int (rand(1280));
my $XPOS =int (rand(1280)); 
        $img = GD::Simple->new($XPOS,$YPOS);

        # draw a red rectangle with blue borders
        $img->bgcolor('red');
        $img->fgcolor('blue');
        $img->rectangle($XPOS,$XPOS,$YPOS,$YPOS);

        # draw an empty rectangle with green borders
        $img->bgcolor(undef);
        $img->fgcolor('green');
	my $RECPT = ($YPOS+3);
	my $RECPT2 = ($XPOS + 10);
        $img->rectangle($RECPT,$RECPT,$RECPT2,$RECPT2);

        # move to (80,80) and draw a green line to (100,190)
        $img->moveTo(80,80);
        $img->lineTo(100,190);

        # draw a solid orange ellipse
        $img->moveTo(110,100);
        $img->bgcolor('orange');
        $img->fgcolor('orange');
        $img->ellipse($XPOS,$YPOS);

        # draw a black filled arc
        $img->moveTo(150,150);
        $img->fgcolor('black');
        $img->arc(50,50,0,100,gdNoFill|gdEdged);

        # some turtle graphics
        $img->moveTo(300,100);
        $img->penSize(3,3);
        $img->angle(0);
        $img->line(20);   # 20 pixels going to the right
        $img->turn(30);   # set turning angle to 30 degrees
        $img->line(20);   # 20 pixel line
        $img->line(20);
        $img->line(20);
        $img->turn(-90); # set turning angle to -90 degrees
        $img->line(50);  # 50 pixel line

        # draw a cyan polygon edged in blue
         my $poly = new GD::Polygon;
        $poly->addPt(150,100);
        $poly->addPt(199,199);
        $poly->addPt(100,199);
        $img->bgcolor('cyan');
        $img->fgcolor('blue');

        $line = "The quick brown fox jumped over the lazy dogs back";
        for ($i =0;$i < $XPOS; $i++)
                {
                $local_date = get_date();
                $ypos=$i+80;
                $img->moveTo(0,$ypos);
                $img->fontsize(40);
                $img->string("$line $local_date");
                }
        }


