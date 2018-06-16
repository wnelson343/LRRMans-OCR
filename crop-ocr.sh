if [ $# -eq 1 ]; then
	frame=$1
else
	frame=lrrmans.png
fi

box_speed=100:45:1660:730
box_time=86:23:869:980
box_lap=100:50:780:980
box_position=170:45:780:917
box_laptime=170:37:960:918
box_storm=100:60:1750:60
box_fuel=80:40:1680:680

if [ -d "out" ]; then
	rm -r out/
fi

mkdir out
ffmpeg -loglevel 16 -i $frame -filter_complex "[0:v]split=7[in1][in2][in3][in4][in5][in6][in7];[in1]crop=$box_speed[out1];[in2]crop=$box_time[out2];[in3]crop=$box_lap[out3];[in4]crop=$box_position[out4];[in5]crop=$box_laptime[out5];[in6]crop=$box_storm[out6];[in7]crop=$box_fuel[out7]" \
	-map '[out1]' out/speed.png \
	-map '[out2]' out/time.png \
	-map '[out3]' out/lap.png \
	-map '[out4]' out/position.png \
	-map '[out5]' out/laptime.png \
	-map '[out6]' out/storm.png \
	-map '[out7]' out/fuel.png


ls out/* | more > allcropped
tesseract allcropped stdout -c tessedit_char_whitelist="0123456789:P/.L" 2>/dev/null | ./parse
