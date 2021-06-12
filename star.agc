
type star
	x as float
	y as float
	opacity as float
	starID
	spriteID
endtype

function createStar(x as float,y as float,sid)
	s as star
	
	s.x = x
	s.y = y
	s.starID = sid
	s.spriteID = sid+1
	
	CreateSprite(s.spriteID,starImgid)
	
endfunction s

function randpos( s as star)
	starArray[s.starID].x = random(0,300)
	starArray[s.starID].y = random(0,300)
	SetSpritePosition(starArray[s.starID].spriteID,starArray[s.starID].x,starArray[s.starID].y)
endfunction

function clickStar()
	if(GetPointerPressed())
		sid = GetSpriteHit(GetPointerX(),GetPointerY())
		if sid = sun_.spriteID then exitfunction
		
		i = sid -1
		
		if i<0 then exitfunction
		ydebug = str(starArray[i].opacity)
		if starArray[i].opacity = 0 then exitfunction
		
		inc points
		randpos(starArray[i])
		
	endif
	
endfunction

function fadeOutStar()
	
	for i = 0 to starArray.length
		sid = starArray[i].spriteID
		if(GetSpriteColorAlpha(sid)<2)
				SetSpriteColorAlpha(sid,0)
				starArray[i].opacity = 0
				continue
		endif
		SetSpriteColorAlpha(sid,GetSpriteColorAlpha(sid)-2)
		starArray[i].opacity = GetSpriteColorAlpha(sid)
	next i
	
	
endfunction
