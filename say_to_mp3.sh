#!/bin/bash

# Function to convert text file or argument to MP3
convert_to_mp3() {
  input="$1"
  uuid=$(uuidgen)
  output="${input%.*}_${uuid}.mp3"

  say -v "Lee (Enhanced)" -r 200 -o output.aiff -f "$input" && ffmpeg -i output.aiff -acodec libmp3lame -q:a 0 "$output" && rm output.aiff
  echo "MP3 file created: $output"
}

# Check if an argument is provided
if [ "$#" -eq 1 ]; then
  convert_to_mp3 "$1"
else
  echo "Enter the path to a text file or provide the input text:"
  read input

  # Check if the input is a file
  if [ -f "$input" ]; then
    convert_to_mp3 "$input"
  else
    # Create a temporary file for the input text
    tmpfile=$(mktemp)
    echo "$input" > "$tmpfile"

    # Generate a random output filename
    uuid=$(uuidgen)
    output="output_${uuid}.mp3"

    say -o output.aiff -f "$tmpfile" && ffmpeg -i output.aiff -acodec libmp3lame "$output" && rm output.aiff
    rm "$tmpfile"
    echo "MP3 file created: $output"
  fi
fi
