
box_speed=100:45:1660:730
box_time=86:23:869:980
box_lap=100:50:780:980
box_position=170:45:780:917
box_laptime=170:37:960:918
box_storm=100:60:1750:60
box_fuel=80:40:1680:680

ls $1*.png | more > currentframes
for frame in `cat currentframes`
do
echo "Processing $frame"

#rm $1-*
#spedometer
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=100:45:1660:730" $frame-speed.png

#race timer
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=86:24:869:980" $frame-time.png

#lap counter
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=100:50:780:980" $frame-lap.png

#position
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=170:45:780:917" $frame-position.png

#lap timer
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=170:45:960:917" $frame-laptime.png

#storm count
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=100:60:1750:60" $frame-storm.png

#fuel gauge
#ffmpeg -loglevel 16 -i $frame.png -vf "crop=80:40:1680:680" $frame-fuel.png

ffmpeg -loglevel 16 -i $frame -filter_complex "[0:v]split=7[in1][in2][in3][in4][in5][in6][in7];[in1]crop=$box_speed[out1];[in2]crop=$box_time[out2];[in3]crop=$box_lap[out3];[in4]crop=$box_position[out4];[in5]crop=$box_laptime[out5];[in6]crop=$box_storm[out6];[in7]crop=$box_fuel[out7]" \
	-map '[out1]' speed-$frame \
	-map '[out2]' time-$frame \
	-map '[out3]' lap-$frame \
	-map '[out4]' position-$frame \
	-map '[out5]' laptime-$frame \
	-map '[out6]' storm-$frame \
	-map '[out7]' fuel-$frame

ls *-$frame | more > allcropped
tesseract allcropped $frame
rm *-$frame
done
