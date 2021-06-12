

type sun
	x as float
	y as float
	spriteID
endtype

function createSun(x as float,y as float)
	s as sun
	
	s.x = x
	s.y = y
	s.spriteID = 51
	
	CreateSprite(s.spriteID,sunImgid)
	
endfunction s

function randpos2(s as sun)
	
	s.x = random(0,300)
	s.y = random(0,300)
	SetSpritePosition(s.spriteID,s.x,s.y)
endfunction

function clickSun()
	
	if(GetPointerPressed())
		sid = GetSpriteHit(GetPointerX(),GetPointerY())
		if sid <50 then exitfunction
		for i = 0 to starArray.length
			SetSpriteColorAlpha(starArray[i].spriteID,255)
		next i
		randpos2(sun_)
	endif
	
endfunction
