GUIManager_C = inherit(Singleton)

function GUIManager_C:constructor()

	self.screenWidth, self.screenHeight = guiGetScreenSize()
	
	self.isGUIShown = true
	self.isInventoryShown = false
	self.isCursorOnAnyGUI = false

	self:init()
	
	if (Settings.showManagerDebugInfo == true) then
		sendMessage("GUIManager_C was loaded.")
	end
end


function GUIManager_C:init()
	
	if (not self.renderTarget) then
		self.renderTarget = dxCreateRenderTarget(self.screenWidth, self.screenHeight, true)
	end
	
	if (not self.guiWorld) then
		self.guiWorld = GUIWorld_C:new()
	end
	
	if (not self.guiIngame) then
		self.guiIngame = GUIIngame_C:new()
	end
	
	DragAndDrop_C:new()
	GUISlotDetails_C:new()
end


function GUIManager_C:update(deltaTime)
	if (self.renderTarget) then
		self.isCursorOnAnyGUI = false
		
		dxSetRenderTarget(self.renderTarget, true)
		dxSetBlendMode("modulate_add")
		
		if (self.isGUIShown == true) then
			if (self.guiWorld) then
				self.guiWorld:update(deltaTime)
			end
			
			if (self.guiIngame) then
				self.guiIngame:update(deltaTime)
			end
			
			GUISlotDetails_C:getSingleton():setItem(nil)
			Camera_C:getSingleton():setLockedOnPlayerFront(false)
			Renderer_C:getSingleton():fadeScreen(false)
		elseif (self.isInventoryShown == true) then
			GUIInventory_C:getSingleton():update(self.delta)
			Camera_C:getSingleton():setLockedOnPlayerFront(true)
			Renderer_C:getSingleton():fadeScreen(true)
			
			DragAndDrop_C:getSingleton():update(self.delta)
			GUISlotDetails_C:getSingleton():update(self.delta)
		end
	
		
		dxSetBlendMode("blend") 
		dxSetRenderTarget()
	end
end


function GUIManager_C:showGUI(bool)
	self.isGUIShown = bool
end


function GUIManager_C:isShowGUI()
	return self.isGUIShown
end


function GUIManager_C:showInventory(bool)
	self.isInventoryShown = bool
end


function GUIManager_C:isShowInventory()
	return self.isInventoryShown
end


function GUIManager_C:setCursorOnGUIElement(bool)
	self.isCursorOnAnyGUI = bool
end


function GUIManager_C:isCursorOnGUIElement()
	return self.isCursorOnAnyGUI
end


function GUIManager_C:getRenderedGUI()
	return self.renderTarget
end


function GUIManager_C:clear()
	delete(DragAndDrop_C:getSingleton())
	delete(GUISlotDetails_C:getSingleton())
	
	if (self.guiIngame) then
		self.guiIngame:delete()
		self.guiIngame = nil
	end
	
	if (self.guiWorld) then
		self.guiWorld:delete()
		self.guiWorld = nil
	end
	
	if (self.renderTarget) then
		self.renderTarget:destroy()
		self.renderTarget = nil
	end
	
	delete(GUIInventory_C:getSingleton())
end


function GUIManager_C:destructor()
	self:clear()
	
	if (Settings.showManagerDebugInfo == true) then
		sendMessage("GUIManager_C was deleted.")
	end
end