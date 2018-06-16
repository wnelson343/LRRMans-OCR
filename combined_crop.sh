#!/bin/bash
export CROP_SPEED=100:45:1660:730
export CROP_TIME=86:24:869:980
export CROP_LAP=100:50:780:980
export CROP_POSITION=170:45:780:917
export CROP_LAPTIME=170:45:960:917

ffprobe -loglevel 16 -i <file> --complex-filter="[in]select=split=5[in_speed][in_time][in_lap][in_position][in_laptime];
[in_speed]crop=$CROP_SPEED,ocr=whitelist=1234567890[cropped_speed];
[in_time]crop=$CROP_TIME,ocr=whitelist=1234567890\:[cropped_time];
[in_lap]crop=$CROP_LAP,ocr=whitelist=1234567890\:[cropped_lap];
[in_position]crop=$CROP_POSITION,ocr=whitelist=1234567890[cropped_position];
[in_laptime]crop=$CROP_LAPTIME,ocr=whitelist=1234567890\:[cropped_laptime];
" json
