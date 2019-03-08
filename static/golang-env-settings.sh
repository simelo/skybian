#!/bin/sh

# set golang path on the environment for the user, just for the user.

# if there is a /etc/default/skywire file load it from there
if [ -f "/etc/default/skywire" ] ; then
    # good, load from skywire file
    . "/etc/default/skywire"
else
    # nope, set it manual
    HOME=/root
    SKYWIRE_DATA=$HOME/.skycoin/skywire/
    GOROOT=/usr/local/go
    GOBIN=${GOROOT}/bin
    GOPATH=/usr/local/skycoin/go
    PATH=$PATH:$GOPATH/bin
fi

export GOROOT
export GOBIN
export GOPATH
export PATH
