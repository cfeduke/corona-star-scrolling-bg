display.setStatusBar( display.HiddenStatusBar ) 

_W = display.contentWidth; --Returns Screen Width
_H = display.contentHeight; --Returns Screen Height
local starTable = {} -- Set up star table

function initStar()
	local star1 = {}
	star1.imgpath = "star1.png"; --Set Image Path for Star
	star1.movementSpeed = 10000; --Determines the movement speed of star
	table.insert(starTable, star1); --Insert Star into starTable
	
	local star2 = {}
	star2.imgpath = "star2.png";
	star2.movementSpeed = 12000;
	table.insert(starTable, star2);				
	
	local star3 = {}
	star3.imgpath = "star3.png";
	star3.movementSpeed = 14000;
	table.insert(starTable, star3);
end --END initStar()	

function getRandomStar()
	local temp = starTable[math.random(1, #starTable)] -- Get a random star from starTable
	local randomStar = display.newImage(temp.imgpath) -- Set image path for object
	randomStar.myName = "star" -- Set the name of the object to star
	randomStar.movementSpeed = temp.movementSpeed; -- Set how fast the object will move
	randomStar.x = math.random(0,_W) -- Set starting point of star at a random X position
	randomStar.y = _H + 50 -- Start the star off screen
	randomStar.rotation = math.random(0,360) -- Rotate the object
	starMove = transition.to(randomStar, {
		time=randomStar.movementSpeed, 
		y=-45,
		onComplete = function(self) self.parent:remove(self); self = nil; end
		}) -- Move the star
end--END getRandomStar()

function startGame()
	starTimer1 = timer.performWithDelay(1700,getRandomStar, 0)
	starTimer2 = timer.performWithDelay(2300,getRandomStar, 0)
	starTimer3 = timer.performWithDelay(2700,getRandomStar, 0)		
end--END startGame()

initStar()
startGame()
	