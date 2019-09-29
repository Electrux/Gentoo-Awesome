#!/bin/bash

free | grep Mem | awk '{printf "%-3.0f", $3/$2 * 100.0}'
