--- ************************************************************************************************************************************************************************
---
---				Name : 		main.lua
---				Purpose :	Demo for transaction library.
---				Created:	30 April 2014
---				Author:		Paul Robson (paul@robsons.org.uk)
---				License:	MIT
---
--- ************************************************************************************************************************************************************************


local transitions = require("system.transitions")

--
--	Function creates a "scene" (a displayGroup) which is slightly different so I've something to work with
--
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

scene1 = createScene(1)																			-- create two scenes
scene2 = createScene(2)

local recipient = {} 																			-- create an object to receive the message

function recipient:transitionCompleted()
	scene1.isVisible = false 																	-- hide the from scene. The system doesn't (deliberate)
	print("Done !")
end

tt = "flip"																						-- name a transition
transitions:execute(tt,recipient,scene1,scene2,1000) 											-- and do it.
