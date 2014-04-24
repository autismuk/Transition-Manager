-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


local transitions = require("transitions")

function createScene(n)
	local grp = display.newGroup()
	local square = display.newRect(160,n*100+100,130+n*70,200)
	square:setFillColor(0,0,(n+1)/4)
	square.strokeWidth = n*4
	local text = display.newText("Scene # "..n,160,n*100+100,native.systemFont,32)
	text:setFillColor( n,1-n,0 )
	grp:insert(square)
	grp:insert(text)
	return grp
end

scene1 = createScene(1)
scene2 = createScene(2)

local recipient = {}

function recipient:transitionCompleted()
	scene1.isVisible = false
	print("Done !")
end

tt = "flip"
transitions:execute(tt,recipient,scene1,scene2,1000)
