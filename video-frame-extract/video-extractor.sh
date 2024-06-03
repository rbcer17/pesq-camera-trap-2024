#!/bin/bash

# Copyright (c) 2020, lowkey digital studio
# Author: Nathan Wolek
# Usage of this file and its contents is governed by the MIT License

# BEGUN - 16 April 2020
# GOAL - generate spectrogram image of entire .WAV file
# expected input .wav files (upper or lower case extension) produced by the AudioMoth
# expected output .png files visualizing entire .WAV file

# iterate through all arguments
for file in $@
do

	# strip out the filename without path
	without_path="${file##*/}"
	
	# use conditionals to make wav extension case insensitive
	if [[ $without_path == *.avi ]] || [[ $without_path == *.AVI ]]; then
	
		# strip the extension
		without_extension="${without_path%.*}"
	

		# generate the initial .png spectrogram output from sox
		# dimension here are for spectrogram only, extra padding will result in 1280 x 720 image
		echo "making frame extraction for $without_path..."

                ffmpeg -i "$file" -vf fps=1/1 "$without_extension"%08d.jpg

	
	else
		echo "skipped $without_path - not an avi file!"
	fi
	
done