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
	
	
		# generate the mp4 output from avi input using ffmpeg
		echo "making mp4 file for $without_path..."
		ffmpeg -i "$file"  "$without_extension".mp4
	
	else
		echo "skipped $without_path - not an avi file!"
	fi
	
done