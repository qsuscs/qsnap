#!/bin/sh
#
# Copyright © 2015 Thomas Schneider <thosch97@gmail.com>
# Distributed under the terms of the ISC license, see LICENSE for details.
#

TIMEU=$(date +%s)
ROOT=/mnt/root
SVN="$1"

TIMEY=$(date -d@"${TIMEU}" +%Y)
TIMEM=$(date -d@"${TIMEU}" +%m)
TIMES=$(date -d@"${TIMEU}" -Im)

cd "${ROOT}"
mkdir -p "${SVN}.snapshots/${TIMEY}/${TIMEM}"
btrfs subvolume snapshot "${SVN}" "${SVN}.snapshots/${TIMEY}/${TIMEM}/${TIMES}"
