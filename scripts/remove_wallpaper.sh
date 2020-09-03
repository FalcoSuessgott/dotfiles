#!/bin/sh
rm $(cat ~/.fehbg | tail -n1 | cut -d "'" -f2)
