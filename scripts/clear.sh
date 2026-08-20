#!/bin/bash

#Colors
RED="\x1b[0;31m"
GREEN="\x1b[0;32m"
BLUE="\x1b[0;34m"
YELLOW="\x1b[0;33m"
WHITE="\x1b[0;37m"
NC="\x1b[0m"

print_info() { echo -e "${YELLOW}[INFO]${NC}: $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC}: $1"; }
print_error() { echo -e "${RED}[ERROR]${NC}: $1"; }

dir="."
if [ -n "$1" ]; then
    dir=$1
fi

IFS=$'\n'
outputdir="output"
shopt -s nullglob
files=("$dir"/*.mp3)
numberofmusic=${#files[@]}

if [ "$numberofmusic" -eq 0 ]; then
    print_error "In directory ""$dir"" doesnt found .mp3 files."
    exit 1
fi

print_info "Number of music: $numberofmusic"
mkdir -p "$outputdir"
for file in ${files[*]}; do
    #'3umph - Jessica (bazamp3.com).mp3'
    input=$(basename "$file")

    output=$(echo "$input" | sed -E 's/ \((.*)\)//')
    title=$(echo "$output" | sed -E 's/ \((.*)\)//' | awk -F' *(-|—) *' '{print $2}' | awk -F'.mp3' '{print $1}')
    author=$(echo "$input" | awk -F' -|— ' '{print $1}')

    if [ -z "$title" ] || [ -z "$author" ]; then
        print_error "Cannot parse author and title. Skip the file: "$input""
        continue
    fi

    if ! ffmpeg -loglevel error -i "$file" -metadata artist="$author" -metadata title="$title" -c copy "$outputdir/$output" 1>/dev/null; then
        print_error "Failed edit metadata :("
        exit 1
    else
        print_success "$output saved successfully into $outputdir/$output"
    fi
done


