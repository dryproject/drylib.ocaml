#!/bin/sh
err=0
for arg; do
  ./$arg || err=$?
done
exit $err
