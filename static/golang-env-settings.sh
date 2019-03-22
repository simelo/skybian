#!/bin/sh

# set golang path on the environment for the user, just for the user.

# if there is a /etc/default/skywire file load it from there
if [ ! -f "/etc/default/skywire" ] ; then
    # not there, set it manual
    #### ! Warning the content in the echo statement need to be explicit
    ####   with no var expansion
    echo "
HOME=/root
GOROOT=/usr/local/go
SKYCOIN_DIR=/usr/local/skycoin
GOPATH=/usr/local/skycoin/go
SKYWIRE_DIR=/usr/local/skycoin/skywire
SKYWIRE_DATA=/root/.skycoin/skywire/
PATH=${PATH}:/usr/local/skycoin/go/bin/:/usr/local/go/bin/
export HOME
export GOROOT
export GOPATH
export SKYCOIN_DIR
export SKYWIRE_DIR
export SKYWIRE_DATA
export PATH" > /etc/default/skywire

fi

# load skywire default paths onto the environment
. "/etc/default/skywire"
