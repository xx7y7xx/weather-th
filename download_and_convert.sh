#!/bin/bash

# Create directories called "images" and "images_with_bg" to store downloaded PNG images and images with background added
mkdir -p images images_with_bg

# Download background image
background_url="https://weather.tmd.go.th/composite/images/map_THA_province.png"
background_file="map_THA_province.png"
curl -o ${background_file} ${background_url}

# Download PNG images
for i in $(seq -w 1 24); do
    url="https://weather.tmd.go.th/composite/images/zr00${i}.png"
    output="images/zr00${i}.png"
    curl -o ${output} ${url}
done

# Add background to each image
for i in $(seq -w 1 24); do
    input="images/zr00${i}.png"
    output="images_with_bg/zr00${i}_with_bg.png"
    convert ${background_file} ${input} -composite ${output}
done

# Merge PNG images with background into a GIF image
convert -delay 10 -loop 0 -dispose Background images_with_bg/zr00*_with_bg.png output_with_bg.gif

# Completion message
echo "Download completed, PNG images with background have been merged into output_with_bg.gif."