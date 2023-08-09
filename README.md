# weather-th

[![](radar.gif)](radar_orig.gif)

This script `download_and_convert.sh` downloads 24 radar composite PNG images from the Thai Meteorological Department (TMD) website (https://weather.tmd.go.th/composite/index_composite.html), adds a background to each, and merges them into a looping GIF with a 10ms delay between frames.

Extract images from : https://weather.tmd.go.th/composite/index_composite.html

- https://weather.tmd.go.th/composite/images/zr00${i}.png

Other images:

- https://weather.tmd.go.th/composite/images/map_THA_province.png (background)
- https://weather.tmd.go.th/composite/images/map_THA_district.png
- https://weather.tmd.go.th/composite/images/map_THA_basin.png
- https://weather.tmd.go.th/composite/images/map_THA_stream.png
