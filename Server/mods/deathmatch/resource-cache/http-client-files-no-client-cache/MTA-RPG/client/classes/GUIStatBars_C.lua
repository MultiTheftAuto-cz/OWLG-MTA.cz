GUIStatBars_C = inherit(Class)

function GUIStatBars_C:constructor(id)

	self.postGUI = false

	self:init()
	
	if (Settings.showClassDebugInfo == true) then
		sendMessage("GUIStatBars_C was loaded.")
	end
end


function GUIStatBars_C:init()
	self.playerClass = Player_C:getSingleton()
	
	if (not self.xpBar) then
		self.xpBar = dxProgessBar:new(0.25, 0.895, 0.5, 0.02, nil, true)
		self.xpBar:setPostGUI(self.postGUI)
		self.xpBar:setColor(90, 220, 90)
		self.xpBar:setAlpha(Settings.guiAlpha)
		self.xpBar:setScale(0.9)
	end
	
	if (not self.lifeBar) then
		self.lifeBar = dxProgessBar:new(0.25, 0.87, 0.22, 0.02, nil, true)
		self.lifeBar:setPostGUI(self.postGUI)
		self.lifeBar:setColor(220, 90, 90)
		self.lifeBar:setAlpha(Settings.guiAlpha)
		self.lifeBar:setScale(0.9)
	end
	
	if (not self.manaBar) then
		self.manaBar = dxProgessBar:new(0.53, 0.87, 0.22, 0.02, nil, true)
		self.manaBar:setPostGUI(self.postGUI)
		self.manaBar:setColor(90, 90, 220)
		self.manaBar:setAlpha(Settings.guiAlpha)
		self.manaBar:setScale(0.9)
	end
	
	if (not self.levelText) then
		self.levelText = dxText:new("", 0.47, 0.87, 0.06, 0.02, nil, true)
		self.levelText:setPostGUI(self.postGUI)
		self.levelText:setAlpha(Settings.guiAlpha)
		self.levelText:setScale(1.2)
	end
end


function GUIStatBars_C:update(deltaTime)
	if (self.playerClass) then
		if (self.xpBar) then
			local value = ((1 / self.playerClass:getMaxXP()) * self.playerClass:getCurrentXP()) or 0
			self.xpBar:setValue(value)
			self.xpBar:setText(math.floor(self.playerClass:getCurrentXP() + 0.5) .. " / " .. math.floor(self.playerClass:getMaxXP() + 0.5))
			
			self.xpBar:update()
			
			if (self.xpBar:isCursorInside() == true) then
				GUIManager_C:getSingleton():setCursorOnGUIElement(true)
			end
		end
		
		if (self.lifeBar) then
			local value = ((1 / self.playerClass:getMaxLife()) * self.playerClass:getCurrentLife())or 0
			self.lifeBar:setValue(value)
			self.lifeBar:setText(math.floor(self.playerClass:getCurrentLife() + 0.5) .. " / " .. math.floor(self.playerClass:getMaxLife() + 0.5))
			
			self.lifeBar:update()
			
			if (self.lifeBar:isCursorInside() == true) then
				GUIManager_C:getSingleton():setCursorOnGUIElement(true)
			end
		end
		
		if (self.manaBar) then
			local value = ((1 / self.playerClass:getMaxMana()) * self.playerClass:getCurrentMana()) or 0
			self.manaBar:setValue(value)
			self.manaBar:setText(math.floor(self.playerClass:getCurrentMana() + 0.5) .. " / " .. math.floor(self.playerClass:getMaxMana() + 0.5))
			
			self.manaBar:update()
			
			if (self.manaBar:isCursorInside() == true) then
				GUIManager_C:getSingleton():setCursorOnGUIElement(true)
			end
		end
		
		if (self.levelText) then
			self.levelText:update()

			self.levelText:setText("#FFFFFFLvl. #FFDD77" .. self.playerClass:getLevel())
		end
	end
end


function GUIStatBars_C:clear()
	if (self.xpBar) then
		self.xpBar:delete()
		self.xpBar = nil
	end
	
	if (self.lifeBar) then
		self.lifeBar:delete()
		self.lifeBar = nil
	end
	
	if (self.manaBar) then
		self.manaBar:delete()
		self.manaBar = nil
	end
	
	if (self.levelText) then
		self.levelText:delete()
		self.levelText = nil
	end
end


function GUIStatBars_C:destructor()
	self:clear()
	
	if (Settings.showClassDebugInfo == true) then
		sendMessage("GUIStatBars_C was deleted.")
	end
end