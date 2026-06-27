#!/bin/bash

set -e

fallocate -l 500M fs.iso
mkfs.ext4 fs.iso