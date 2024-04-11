function setScreenFlash()
    fadeCamera(false, 0.2, 255, 255, 255)
    setTimer(function()
        fadeCamera(true)
    end, 100, 1)
end

addCommandHandler("test", function()
    setScreenFlash()
end, false, false)

addCommandHandler("test2", function()
    outputChatBox("test", getLocalPlayer())
end, false, false)