local page = "http://mta/login/html/index.html"

screenWidth, screenHeight = guiGetScreenSize()

local initBrowser = guiCreateBrowser(0, 0, screenWidth, screenHeight, true, false, false)
local theBrowser = guiGetBrowser(initBrowser)

addEventHandler("onClientBrowserCreated", theBrowser, 
	function()
		loadBrowserURL(source, page)
		showCursor(true)
	end
)

addEvent("onClientPlayerLogin", true)
addEventHandler("onClientPlayerLogin", root,
	function()
		destroyElement(initBrowser)
		showCursor(false)
	end
)

function cmsg(login, password, command)
	if (command == "login") then
		triggerServerEvent("login", resourceRoot, login, password)
	elseif (command == "register") then
		triggerServerEvent("register", resourceRoot, login, password)
	end
end
addEvent("cmsg", true)
addEventHandler("cmsg", root, cmsg)