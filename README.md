# digraphs

A simple program that waits for two characters from STDIN, looks them up in a
digraph table and outputs a utf-8 char on STDOUT.

It is meant to be used with screen or any editor that can insert output of
external programs into a buffer.

The rational to have it is that screens build-in digraph table is rather short
and not well grouped to suite the needs of the distinguished Perl 6 adept.
Updating both irssis and vims digraph table is kind of cumbersome. If you are
running screen anyway, this will save quite some time.

To install run the following and restart screen.

ln -s bin/digraphs.pl ~/bin/digraphs
echo 'bindkey ^K exec .! digraphs' >> ~/.screenrc 

© 2016 Wenzel P. P. Peppmeyer
