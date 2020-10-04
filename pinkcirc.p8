pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
	music(0)
	player = {}
	player.x = 5
	player.y = 5
	player.face = 16
	player.points = 0
	player.speed = 1
	player.energy = 100
	banana = {}
	banana.x = 50
	banana.y = 50
end

function _update()
	if(btn(0)) then 
	player.x=player.x-player.speed 
	player.face = 1
	end

	if(btn(1)) then 
	player.x=player.x+player.speed 
	player.face = 0
	end

	if(btn(2)) then 
	player.y=player.y-player.speed
	player.face = 17
	end

	if(btn(3)) then 
	player.y=player.y+player.speed
	player.face = 16
	end

	if(btn(4) and player.energy > 1) then
	player.speed = 2
	player.energy = player.energy - 2
	else
	player.speed = 1
	end

	if(distance(player, banana) < 3) then 
	sfx(1)
	player.points = player.points + 1 
	banana.x = rnd(110)
	banana.y = rnd(110)
	if(player.energy < 70) then
		player.energy = player.energy + 30
		else
		player.energy = 100
	end
	end
end

function _draw()
	cls(2)
	map(0,0,0,0,16,8)
	map(0,0,0,64,16,8)
    spr(player.face,player.x,player.y)
    spr(4,banana.x,banana.y)
	-- print("player.x:"..player.x)
	-- print("player.y:"..player.y)
	rect(0, 119, 101, 126, 8)
	rectfill(1, 120, player.energy, 125, 14)
	print("distance:"..distance(player,banana))
	print("Points: "..player.points)
end

function distance(p0, p1)
 dx=p0.x-p1.x dy=p0.y-p1.y
 return sqrt(dx*dx+dy*dy)
end

function isInbounds()

end
__gfx__
009999000099990033333333333a3333000000900000000000010000000100000000000000000000000000000000000000000000000000000000000000000000
09aaa99009aaa990333333333a3b3ab300000aa00000000000999000009990000000000000000000000000000000000000000000000000000000000000000000
9aa999999aa99999333333333b33b333000007a00000000009191900091919000000000000000000000000000000000000000000000000000000000000000000
9999999999999999333333333bb3b3a30000aaa00000000009999900099999000000000000000000000000000000000000000000000000000000000000000000
9919991991999199333333333b3bbbb3000aaa000000000005999500059995000000000000000000000000000000000000000000000000000000000000000000
9999999499999994333333333b3b3b339aaaaa000000000009999900099999000000000000000000000000000000000000000000000000000000000000000000
09999940099999403333333333333b330aaaa0000000000009999900099994000000000000000000000000000000000000000000000000000000000000000000
00444400004444003333333333333333000000000000000009999400009940000000000000000000000000000000000000000000000000000000000000000000
00999900009999000000000000000000000000000000000000994000000900000000000000000000000000000000000000000000000000000000000000000000
09aaa99009aaa9900000000000000000000000000000000000090000009400000000000000000000000000000000000000000000000000000000000000000000
9aa999999aa999990000000000000000000000000000000000090000009000000000000000000000000000000000000000000000000000000000000000000000
99999999999999990000000000000000000000000000000000099000009990000000000000000000000000000000000000000000000000000000000000000000
99199199999999990000000000000000000000000000000000009000000090000000000000000000000000000000000000000000000000000000000000000000
99999994999999940000000000000000000000000000000000094000000090000000000000000000000000000000000000000000000000000000000000000000
09999940099999400000000000000000000000000000000000940000000940000000000000000000000000000000000000000000000000000000000000000000
00444400004444000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000099000000000000009900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009990000000000000999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000000000000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000000000000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000000000000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000000000990000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000009999959900900000000990000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009000099999999590900000000959990000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000990999999999590900000000999599000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000099999999999991999999999999599000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000009999999999000999999999999999100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000999999999000999999999999900000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000099999999900999999999999900000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000099440000400099499999999900000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000099994400000099940000000490000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999066666609070070900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666609070070966666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777066666609070070966666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666609070070966666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666609070070966666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777066666609070070966666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666609070070966666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999066666609070070900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020203020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202030202020203020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020302020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202030202020202020202020200000041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202030202020202020200000041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202030202020202020202020203020200000041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020302020202020200000041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011400200c0433321500003332150c0430c00033215000030c0430000300003000030c0430c00000003332150c0430000333215332150c0430c00000003000030c0430000333215332150c0430c0003321533215
000300002f0773106733067340673207733067370673a0672d0002f0002f000210002b0002d0002f0002f000210002b0002d0002f000000070000700007000070000700007000070000700007000070000700007
011400200f0110f0110f0111b0110f1110f0110f0111b0110f0110f0110f0111b0110f1110f0110f0111b0110f0110f0110f0111b0110f1110f0110f0111b0110f0110f0110f0111b0110f1110f0110f0111b011
011400002c0052a0052c005270052a0052c015270152a0152c015270052a0052c005270052a0152c015270152a0152c015270152a0052c005270052a005270152a0152c015270152a0152a0152c005270052a005
__music__
02 00034344

