
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
# $Id: Webdav.pm,v 1.6 2001/05/23 08:37:35 richter Exp $
#
############################################################################


package Net::Webdav ;

use strict;
use vars qw($VERSION @ISA $initdone);


require Exporter;

$VERSION = "0.14.0-0.1.7";

require DynaLoader;

@ISA = qw(DynaLoader);

bootstrap Net::Webdav $VERSION;

sub new 
    {
    my $class = shift;
    my %options = @_;

    if (!$initdone)
        {
        Net::Webdav::Util::sock_init () ;
        $initdone++ ;
        }


    my $sess = Net::Webdav::Util::http_session_create () ;

    return $sess;
    }

1;

