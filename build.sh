#!/usr/bin/env bash

# exit on error
set -o errexit

mix deps.get --only prod
MIX_ENV=prod mix compile

# compiles the js
npm install --prefix ./assets
npm deploy --prefix ./assets
mix phx.digest

# remove the build
rm -rf "_build"

MIX_ENV=prod mix release --overwrite