#!/bin/bash

# Create directories called "tmp__images" and "tmp__images_with_bg" to store downloaded PNG images and images with background added
mkdir -p tmp__images tmp__images_with_bg

# Download background image
background_url="https://weather.tmd.go.th/composite/images/map_THA_province.png"
background_file="tmp__map_THA_province.png"
curl -o ${background_file} ${background_url}

# Download PNG images
for i in $(seq -w 1 24); do
    url="https://weather.tmd.go.th/composite/images/zr00${i}.png"
    output="tmp__images/zr00${i}.png"
    curl -o ${output} ${url}
done

# Add background to each image
for i in $(seq -w 1 24); do
    input="tmp__images/zr00${i}.png"
    output="tmp__images_with_bg/zr00${i}_with_bg.png"
    convert ${background_file} ${input} -composite ${output}
done

# Merge PNG images with background into a GIF image
convert -delay 10 -loop 0 -dispose Background tmp__images_with_bg/zr00*_with_bg.png output_with_bg.gif

# Completion message
echo "Download completed, PNG images with background have been merged into output_with_bg.gif."