#!/bin/sh

# set golang path on the environment for the user, just for the user.

# if there is a /etc/default/skywire file load it from there
if [ -f "/etc/default/skywire" ] ; then
    # good, load from skywire file
    . "/etc/default/skywire"
else
    # nope, set it manual
    HOME=/root
    GOROOT=/usr/local/go
    SKYCOIN_DIR=/usr/local/skycoin
    GOPATH=${SKYCOIN_DIR}/go
    SKYWIRE_DIR=${SKYCOIN_DIR}/skywire
    SKYWIRE_DATA=${HOME}/.skycoin/skywire/
    PATH=$PATH:$GOPATH/bin/:$GOROOT/bin/
    export HOME
    export GOROOT
    export GOPATH
    export SKYCOIN_DIR
    export SKYWIRE_DIR
    export SKYWIRE_DATA
    export PATH
fi
