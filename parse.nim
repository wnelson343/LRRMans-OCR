import strutils, strformat

let input = readAll(stdin)
let parts = input.split("\n\n")

echo parts

var fuel = parseFloat(parts[0].strip)
var lap = parts[1].strip
var pos = parts[2].strip
var speed = parseInt(parts[4].strip)
var storm = parseInt(parts[5].strip)
var time = parts[6].strip

echo &"Fuel: {fuel}"
echo &"Lap: {lap}"
echo &"Position: {pos}"
echo &"Speed: {speed} km/h"
echo &"Storm Count: {storm} subs"
echo &"Time: {time}"
