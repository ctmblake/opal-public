#!/opt/ActivePerl-5.10/bin/perl
use POSIX;
use GD::Simple;
#generate files of random size in txt and binary mode
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
		open_gif_file();
		$num = rand 10 * 2;
		$num_line = int(rand 80 * $num_line_multicant);
        	$line = "The quick brown fox jumped over the lazy dogs back";
        for ($i =0;$i < $num_line; $i++) 
		{
		my $local_date = get_date();
		$db{"$i"} = "$line";
		gen_img($num,$num_line, $local_date,$line );
		print TFILE3 $img->gif;		
		}
		close(TFILE3);
		untie %db;
}
	
	    }	
    }
}

	
        #check if dir exist if not create and cd into it
	sub check_dir
		{

		if ( -d $_[0])
			{
		
			chdir($_[0]) or die;
			}
		else
			{
			mkdir($_[0]) or die;
			chdir($_[0]) or die;
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

	sub get_color()
		{
		my @colors = qw(black orange yellow green white blue red magenta cyan);
		my $color = $colors[ rand @colors  ];
		return $color
		}	
	sub get_hor()
		{
		my @ypos =qw(1440 1280 1024 800 720);
		my $hpos = $ypos[rand @ypos ];
		return $hpos
		}
	sub get_vert()
	{
	my @xpos = qw(1080 768 600);
	my $vert = $xpos[rand @xpos];
	return $vert 
	}

sub gen_img()
	{
	$XPOS = int(rand(1280));
	$XPOS =int(rand(1080));
        $img = GD::Simple->new(get_hor(),get_vert());
        # draw a red rectangle with blue borders
        $img->bgcolor(get_color());
        $img->fgcolor(get_color());
        $img->rectangle($XPOS,$XPOS,$YPOS,$YPOS);

        # draw an empty rectangle with green borders
        $img->bgcolor(undef);
        $img->fgcolor(get_color());
	my $RECPT = ($YPOS+3);
	my $RECPT2 = ($XPOS + 10);
        $img->rectangle($RECPT,$RECPT,$RECPT2,$RECPT2);

        # move to (80,80) and draw a line to (100,190)
        $img->moveTo(80,80);
        $img->lineTo(100,190);

        # draw an ellipse
        $img->moveTo(110,100);
        $img->bgcolor(get_color());
        $img->fgcolor(get_color());
        $img->ellipse($XPOS,$YPOS);

        # draw a filled arc
        $img->moveTo(150,150);
        $img->fgcolor(get_color());
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


        # draw a polygon edged in blue
         my $poly = new GD::Polygon;
        $poly->addPt(150,100);
        $poly->addPt(199,199);
        $poly->addPt(100,199);
        $img->bgcolor(get_color());
        $img->fgcolor(get_color());
        $line = "The quick brown fox jumped over the lazy dogs back";
        $local_date = get_date();
        $ypos=$YPOS;
        $img->moveTo(0,$ypos);
        $img->fontsize($XPOS);
        $img->string("$line $local_date");
}
