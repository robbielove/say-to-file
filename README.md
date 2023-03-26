Robbie! You can use the built-in say command in macOS, which is a command-line interface (CLI) tool for text-to-speech.
To convert the speech output into an MP3 file, you can use a tool like ffmpeg. Here's how to do it:

First, you'll need to install ffmpeg if you haven't already. You can use Homebrew (https://brew.sh) to install it easily. Open Terminal and run the following commands:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ffmpeg
```
Once you have ffmpeg installed, you can use the say command along with ffmpeg to convert the speech output into an MP3 file.
Open Terminal and run the following command:
```bash
say -o output.aiff "Your text goes here" && ffmpeg -i output.aiff -acodec libmp3lame output.mp3 && rm output.aiff
```
Replace "Your text goes here" with the text you want to convert to speech. 
This command will create an AIFF file using the say command, then convert it to an MP3 file using ffmpeg, and finally remove the intermediate AIFF file.

You should now have an MP3 file named output.mp3 in your current directory, containing the spoken version of your input text.
Feel free to modify the output filenames and input text to suit your needs. Enjoy your new MP3 file with the spoken text!

# Script
Here's a bash script that asks the user for input as either a text file or as an argument. The script will then use the say command to generate an MP3 file with the spoken version of the input text.

Create a new file named say_to_mp3.sh and add the following content:

```bash
#!/bin/bash

# Function to convert text file or argument to MP3
convert_to_mp3() {
  input="$1"
  output="${input%.*}.mp3"

  say -o output.aiff -f "$input" && ffmpeg -i output.aiff -acodec libmp3lame "$output" && rm output.aiff
  echo "MP3 file created: $output"
}

# Check if an argument is provided
if [ "$#" -eq 1 ]; then
  convert_to_mp3 "$1"
else
  echo "Enter the path to a text file or provide the input as an argument:"
  read input

  # Check if the input is a file
  if [ -f "$input" ]; then
    convert_to_mp3 "$input"
  else
    echo "Invalid input. Please provide a text file or an argument."
  fi
fi
```
To use the script, follow these steps:

Save the script and make it executable by running the following command in Terminal:
```bash
chmod +x say_to_mp3.sh
```
Run the script with or without an argument:
```bash
./say_to_mp3.sh input.txt
```
Or simply:
```bash
./say_to
```
