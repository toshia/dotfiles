#!/bin/sh

reflector --age 24 --protocol rsync -f 5 --sort rate --save mirrorlistr
