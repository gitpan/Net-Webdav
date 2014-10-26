
############################################################################
#
# Net::Webdav - Perl interface to Neon HTTP and WebDAV client library
#
# Copyright (c) 2001 Gerald Richter / ecos gmbh (www.ecos.de)
# 
# You may distribute under the terms of either the GNU General Public 
# License or the Artistic License, as specified in the Perl README file.
# 
# THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
# WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
# MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
# $Id: copy.pl,v 1.2 2001/05/23 08:37:35 richter Exp $
#
############################################################################

#
# This this an example how to copy a resource
#

use Net::Webdav ;

sub auth
    {
    my ($userdata, $realm) = @_ ;

    print "auth called userdata = $userdata  realm = $realm\n" ;

    # return username, password
    return ("richter", "x") ;
    }



$sess = Net::Webdav -> new ;

## The hostname must match your real hostname/virtual host, 
## otherwise you may get "Bad Gateway" when copying (i.e. localhost does not work)

$sess -> server ("www.gr.ecos.de", 8765) ;
$sess -> set_server_auth (\&auth) ;

$sess -> dav_copy (1, "/dav/foo.htm", "/dav/bar.htm") ;

print "Status: ", $sess -> get_error , "\n" ;

