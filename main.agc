
// Project: clicking stars 
// Created: 2021-05-13

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "clicking stars" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts


#insert "star.agc"
#insert "sun.agc"

global starImgid = 1
global sunImgid = 2

global points = 0


LoadImage(starImgid,"star.png")
LoadImage(sunImgid,"sun.png")

global starArray as star[]
//create stars
s as star
for i=0 to 4
	s = createStar(15,15,i)
	s.opacity = 255
	starArray.insert(s)
	randpos(s)
next i

global sun_ as sun

sun_ = createSun(50,50)
randpos2(sun_)

global ydebug as string

do
    
	//print(ydebug)
	print(points)
	
	clickStar()
	clickSun()
	fadeOutStar()
        
    Sync()
loop
