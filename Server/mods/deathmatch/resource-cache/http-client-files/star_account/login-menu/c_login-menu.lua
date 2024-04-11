local browser = guiGetBrowser(guiCreateBrowser(200, 200, 400, 200, true, false, false))

addEventHandler("onClientBrowserCreated", browser,
    function ()
        loadBrowserURL(source, "http://mta/local/html/index.html") --Containing <span id="nick"></span> somewhere in the file
    end)

--The page has to load first
addEventHandler("onClientBrowserDocumentReady", browser,
    function ()
        executeBrowserJavascript(source, "document.getElementById('nick').innerHTML = '" .. getPlayerName(localPlayer) .. "';")
    end)