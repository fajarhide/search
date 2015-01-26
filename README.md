Search 
======

For search string on file and return list file which content are "string"

Versions
--------

search v1.0 by: 2014, fajarhide


Github Installation
-------------------

::

    git clone https://github.com/fajarhide/search.git
    sh search/install.sh


Just download (Like the way it used to be)
------------------------------------------

::

    wget -O search https://raw.github.com/fajarhide/search/master/search.pl
    chmod +x search


Usage
-----

::

    $ search -h
    $ search "string"
    $ search -d "/dir/subdir" -r "string"
    usage: search [-h] ["regex_string"] [-d "/dir/subdir"] [-r]
    
    optional arguments:
      "regex_string"    string to search in the form of a regular expression
      -d "/dir/subdir"  search of spesification directory, if not then the directory is assumed PWD or "."
      -r                search file of recursive
      -h	       	show this help message and exit
     

Exit
----

CTRL + Z

