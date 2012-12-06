pyAggr3g470r
============

#### A simple Python news aggregator.

Presentation
------------
[pyAggr3g470r](https://bitbucket.org/cedricbonhomme/pyaggr3g470r/) is a news aggregator with a web interface
based on [CherryPy](http://cherrypy.org/). Articles are stored in a [MongoDB](http://api.mongodb.org/python/current/) base.



Features
------------
* articles are stored in a [MongoDB](http://www.mongodb.org/) database (local or remote);
* search articles;
* e-mail notification;
* export articles to HTML, EPUB, PDF or raw text;
* favorite articles;
* share articles with Diaspora, Google Buzz, Pinboard, Identi.ca, Digg, reddit, Scoopeo, Blogmarks and Twitter;
* generation of QR codes with URLs of articles.



Requierements
-------------

Software required

* [Python](http://python.org/) >= 3.2.3;
* [MongoDB](http://www.mongodb.org/) and [PyMongo](http://api.mongodb.org/python/current/) >= 1.9;
* [feedparser](http://code.google.com/p/feedparser/) >= 5.1.2 (for **feedgetter.py**, the RSS feed parser);
* [CherryPy](http://cherrypy.org/) >= 3.2.2 and [Mako](http://www.makotemplates.org/) (for **pyAggr3g470r.py**, the Web interface);
* [BeautifulSoup](http://www.crummy.com/software/BeautifulSoup/) >= 4.1.3 (automatically find a feed in a HTML page).


Optional module

These modules are not required but enables more features:
* lxml and Genshi;
* Python Imaging Library for the generation of QR codes.

Not yet tested with Python 3.2. If you want to install these modules:

    $ sudo aptitude install  python-lxml python-genshi


Backup
------

If you want to backup your database:

    $ su
    $ /etc/init.d/mongodb stop
    $ cp /var/lib/mongodb/pyaggr3g470r.* ~


Donnation
---------
If you wish and if you like pyAggr3g470r, you can donate via bitcoin. My bitcoin address: 1GVmhR9fbBeEh7rP1qNq76jWArDdDQ3otZ
Thank you!



License
------------
[pyAggr3g470r](https://bitbucket.org/cedricbonhomme/pyaggr3g470r/) is under [GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt) license.
