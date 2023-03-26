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
