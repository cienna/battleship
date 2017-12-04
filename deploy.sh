#!/bin/bash
# taken from numart lecture notes with slight modifications

export PORT=8002
DIR=$1

if [ ! -d "$DIR" ]; then
    printf "Usage: ./deploy.sh <path>\n"
    exit
fi

echo "Deploy to [$DIR]"

mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
mix release --env=prod

$DIR/bin/battleship stop || true

#mix ecto.migrate

SRC=`pwd`
(cd $DIR && tar xzvf $SRC/_build/prod/rel/battleship/releases/0.0.1/battleship.tar.gz)

$DIR/bin/battleship start
