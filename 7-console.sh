#!/bin/sh

bundle update
bundle install
rbenv rehash

TMP_DEVICE="ipad"

if [ ! -z $1 ]; then
  TMP_DEVICE=$1
fi

PLAYBACK_DIR="features/playback" \
DEVICE=$TMP_DEVICE \
SDK_VERSION=7.0 \
CALABASH_FULL_CONSOLE_OUTPUT=1 \
DEBUG=1 \
RESET_BETWEEN_SCENARIOS=0 \
DEVICE_TARGET=simulator \
IRBRC=.irbrc \
bundle exec irb

