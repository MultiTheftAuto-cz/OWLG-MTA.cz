dxQuickSlots = inherit(Class)

function dxQuickSlots:constructor(x, y, w, h, parent, relative)

	self.screenWidth, self.screenHeight = guiGetScreenSize()
	
	self.defaultX = x or 0
	self.defaultY = y or 0
	self.defaultWidth = w or 0
	self.defaultHeight = h or 0
	self.parent = parent or nil
	self.isRelative = relative or true
	
	self.x = 0
	self.y = 0
	self.width = 0
	self.height = 0
	
	self.color = {r = 0, g = 0, b = 0}
	self.borderColor = {r = 90, g = 220, b = 90}
	self.fontColor = {r = 255, g = 255, b = 255}
	self.disabledColor = {r = 180, g = 180, b = 180}
	
	self.borderOffset = 2
	self.borderSize = 2
	self.alpha = 255
	
	self.scale = 1
	
	self.postGUI = false
	self.subPixelPositioning = true
	
	self.slotCount = 10
	
	self.mouseX = 0
	self.mouseY = 0
	
	self.currentTick = 0
	
	self.slots = {}
	
	self:init()
	
	if (Settings.showClassDebugInfo == true) then
		sendMessage("dxQuickSlots was loaded.")
	end
end


function dxQuickSlots:init()
	self.m_onClientClick = bind(self.onClientClick, self)
	addEventHandler("onClientClick", root, self.m_onClientClick)
	
	self:calcValues()
	
	for i = 1, self.slotCount, 1 do
		if (not self.slots[i]) then
			self.slots[i] = {}
			self.slots[i].width = self.width / self.slotCount
			self.slots[i].height = self.height
			self.slots[i].x = self.x + (self.slots[i].width * (i - 1))
			self.slots[i].y = self.y
			self.slots[i].slotFunction = nil
			self.slots[i].icon = nil
			self.slots[i].isActive = true
			self.slots[i].delay = 0
			self.slots[i].startTick = 0
			self.slots[i].value = 0
			
			local key = i
			if (key > 9) then key = 0 end
			
			self.slots[i].key = key
		end
	end
end


function dxQuickSlots:update(deltaTime)
	self.currentTick = getTickCount()
	
	self:calcValues()
	self:calcSlotValues()
	
	-- draw bg
	dxDrawRectangle(self.x, self.y, self.width, self.height, tocolor(self.color.r, self.color.g, self.color.b, self.alpha), self.postGUI, self.subPixelPositioning)
	
	-- draw slot content
	for index, slot in ipairs(self.slots) do
		if (slot) then
			-- draw icon
			if (slot.isActive == true) then
				-- draw icon
				if (slot.icon) then
					dxDrawImage(slot.x + self.borderOffset, slot.y + self.borderOffset, slot.width - self.borderOffset * 2, slot.height - self.borderOffset * 2, slot.icon, 0, 0, 0, tocolor(self.fontColor.r, self.fontColor.g, self.fontColor.b, self.alpha), self.postGUI)
				end
				
				-- draw borders
				dxDrawLine(slot.x + self.borderOffset, slot.y + self.borderOffset, slot.x + slot.width - self.borderOffset, slot.y + self.borderOffset, tocolor(self.borderColor.r, self.borderColor.g, self.borderColor.b, self.alpha), self.borderSize, self.postGUI)
				dxDrawLine(slot.x + slot.width - self.borderOffset, slot.y + self.borderOffset, slot.x + slot.width - self.borderOffset, slot.y + slot.height - self.borderOffset, tocolor(self.borderColor.r, self.borderColor.g, self.borderColor.b, self.alpha), self.borderSize, self.postGUI)
				dxDrawLine(slot.x + slot.width - self.borderOffset, slot.y + slot.height - self.borderOffset, slot.x + self.borderOffset, slot.y + slot.height - self.borderOffset, tocolor(self.borderColor.r, self.borderColor.g, self.borderColor.b, self.alpha), self.borderSize, self.postGUI)
				dxDrawLine(slot.x + self.borderOffset, slot.y + slot.height - self.borderOffset, slot.x + self.borderOffset, slot.y + self.borderOffset, tocolor(self.borderColor.r, self.borderColor.g, self.borderColor.b, self.alpha), self.borderSize, self.postGUI)
				
				-- draw key
				dxDrawText(slot.key, slot.x + self.borderOffset * 2, slot.y + self.borderOffset * 2, slot.x + slot.width - self.borderOffset * 4, slot.y + slot.height - self.borderOffset * 4, tocolor(self.fontColor.r, self.fontColor.g, self.fontColor.b, self.alpha), self.scale, "default-bold", "right", "top", false, false, self.postGUI, true, self.subPixelPositioning)
			else
				-- draw icon
				if (slot.icon) then
					dxDrawImage(slot.x + self.borderOffset, slot.y + self.borderOffset, slot.width - self.borderOffset * 2, slot.height - self.borderOffset * 2, slot.icon, 0, 0, 0, tocolor(self.disabledColor.r, self.disabledColor.g, self.disabledColor.b, self.alpha), self.postGUI)
				end
				
				local value = (1 / slot.value) * ((slot.startTick + slot.delay) - self.currentTick)
				
				dxDrawRectangle(slot.x + self.borderOffset, (slot.y + self.borderOffset + slot.height) - (slot.height * value), slot.width - self.borderOffset * 2, (slot.height - self.borderOffset * 2) * value, tocolor(self.color.r, self.color.g, self.color.b, self.alpha), self.postGUI, self.subPixelPositioning)
				
				-- draw borders
				dxDrawLine(slot.x + self.borderOffset, slot.y + self.borderOffset, slot.x + slot.width - self.borderOffset, slot.y + self.borderOffset, tocolor(self.disabledColor.r, self.disabledColor.g, self.disabledColor.b, self.alpha), self.borderSize, self.postGUI)
				dxDrawLine(slot.x + slot.width - self.borderOffset, slot.y + self.borderOffset, slot.x + slot.width - self.borderOffset, slot.y + slot.height - self.borderOffset, tocolor(self.disabledColor.r, self.disabledColor.g, self.disabledColor.b, self.alpha), self.borderSize, self.postGUI)
				dxDrawLine(slot.x + slot.width - self.borderOffset, slot.y + slot.height - self.borderOffset, slot.x + self.borderOffset, slot.y + slot.height - self.borderOffset, tocolor(self.disabledColor.r, self.disabledColor.g, self.disabledColor.b, self.alpha), self.borderSize, self.postGUI)
				dxDrawLine(slot.x + self.borderOffset, slot.y + slot.height - self.borderOffset, slot.x + self.borderOffset, slot.y + self.borderOffset, tocolor(self.disabledColor.r, self.disabledColor.g, self.disabledColor.b, self.alpha), self.borderSize, self.postGUI)
				
				-- draw key
				dxDrawText(slot.key, slot.x + self.borderOffset * 2, slot.y + self.borderOffset * 2, slot.x + slot.width - self.borderOffset * 4, slot.y + slot.height - self.borderOffset * 4, tocolor(self.disabledColor.r, self.disabledColor.g, self.disabledColor.b, self.alpha), self.scale, "default-bold", "right", "top", false, false, self.postGUI, true, self.subPixelPositioning)
				
				-- wait for delay
				if (self.currentTick > slot.startTick + slot.delay) then
					slot.isActive = true
				end
			end
		end
	end
end


function dxQuickSlots:calcValues()
	if (self.parent) then
		if (self.isRelative == true) then
			self.x = self.parent.x + self.parent.width * self.defaultX
			self.y = self.parent.y + self.parent.height * self.defaultY
			self.width = self.parent.width * self.defaultWidth
			self.height = self.parent.height * self.defaultHeight
		else
			self.x = self.defaultX
			self.y = self.defaultY
			self.width = self.defaultWidth
			self.height = self.defaultHeight
		end
		
		self.alpha = self.parent.alpha
		self.postGUI = self.parent.postGUI
	else
		if (self.isRelative == true) then
			self.x = self.screenWidth * self.defaultX
			self.y = self.screenHeight * self.defaultY
			self.width = self.screenWidth * self.defaultWidth
			self.height = self.screenHeight * self.defaultHeight
		else
			self.x = self.defaultX
			self.y = self.defaultY
			self.width = self.defaultWidth
			self.height = self.defaultHeight
		end
	end
	
	self.mouseX, self.mouseY = ClickSystem_C:getSingleton():getPosition()
end


function dxQuickSlots:calcSlotValues()
	for i = 1, self.slotCount, 1 do
		if (self.slots[i]) then
			self.slots[i].width = self.width / self.slotCount
			self.slots[i].height = self.height
			self.slots[i].x = self.x + (self.slots[i].width * (i - 1))
			self.slots[i].y = self.y
		end
	end
end


function dxQuickSlots:isCursorInside()
	if (self.mouseX > self.x) and (self.mouseX < self.x + self.width) then
		if (self.mouseY > self.y) and (self.mouseY < self.y + self.height) then
			return true
		end
	end

	return false
end


function dxQuickSlots:onClientClick(button, state)
	if (button == Bindings["ACTION"]) and (state == "down") then
		if (self:isCursorInside() == true) then
			for index, slot in ipairs(self.slots) do
				if (slot) then
					if (self.mouseX > slot.x) and (self.mouseX < slot.x + slot.width) then
						if (self.mouseY > slot.y) and (self.mouseY < slot.y + slot.height) then
							if (slot.slotFunction) then
								slot.slotFunction()
								break
							end
						end
					end
				end
			end
		end
	end
end


function dxQuickSlots:setPosition(x, y)
	if (x) and (y) then
		self.defaultX = x
		self.defaultY = y
	end
end


function dxQuickSlots:getPosition()
	return self.defaultX, self.defaultY
end


function dxQuickSlots:setSize(w, h)
	if (w) and (h) then
		self.defaultWidth = w
		self.defaultHeight = h
	end
end


function dxQuickSlots:getSize()
	return self.defaultWidth, self.defaultHeight
end


function dxQuickSlots:setParent(parent)
	if (parent) then
		self.parent = parent
	end
end


function dxQuickSlots:getParent()
	return self.parent
end


function dxQuickSlots:setSlotCount(slotCount)
	if (slotCount) then
		self.slotCount = slotCount
	end
end


function dxQuickSlots:getSlotCount()
	return self.slotCount
end


function dxQuickSlots:setSlotFunction(slot, slotFunction)
	if (slot) and (slotFunction) then
		if (self.slots[tonumber(slot)]) then
			self.slots[tonumber(slot)].slotFunction = slotFunction
		end
	end
end


function dxQuickSlots:getSlotFunction(slot)
	if (slot) then
		if (self.slots[tonumber(slot)]) then
			if (self.slots[tonumber(slot)].slotFunction) then
				return self.slots[tonumber(slot)].slotFunction
			end
		end
	end
	
	return nil
end


function dxQuickSlots:setSlotDelay(slot, delay)
	if (slot) and (delay) then
		if (self.slots[tonumber(slot)]) then
			self.slots[tonumber(slot)].delay = delay
		end
	end
end


function dxQuickSlots:getSlotDelay(slot)
	if (slot) then
		if (self.slots[tonumber(slot)]) then
			if (self.slots[tonumber(slot)].delay) then
				return self.slots[tonumber(slot)].delay
			end
		end
	end
	
	return 0
end


function dxQuickSlots:setSlotIcon(slot, icon)
	if (slot) and (icon) then
		if (self.slots[tonumber(slot)]) then
			self.slots[tonumber(slot)].icon = icon
		end
	end
end


function dxQuickSlots:getSlotIcon(slot)
	if (slot) then
		if (self.slots[tonumber(slot)]) then
			if (self.slots[tonumber(slot)].icon) then
				return self.slots[tonumber(slot)].icon
			end
		end
	end
	
	return nil
end


function dxQuickSlots:setSlotActive(slot, bool, freeze)
	if (slot) then
		if (self.slots[tonumber(slot)]) then
			self.slots[tonumber(slot)].isActive = bool
			
			if (bool == false) then
				if (freeze == false) then
					self.slots[tonumber(slot)].startTick = getTickCount()
					
					self.slots[tonumber(slot)].value = (self.slots[tonumber(slot)].startTick + self.slots[tonumber(slot)].delay) - self.currentTick
				end
			end
		end
	end
end


function dxQuickSlots:isSlotActive(slot)
	if (slot) then
		if (self.slots[tonumber(slot)]) then
			if (self.slots[tonumber(slot)].isActive) then
				return self.slots[tonumber(slot)].isActive
			end
		end
	end
	
	return false
end


function dxQuickSlots:setBackgroundColor(r, g, b)
	if (r) and (g) and (b) then
		self.color.r = r
		self.color.g = g
		self.color.b = b
	end
end


function dxQuickSlots:getBackgroundColor()
	return self.color
end


function dxQuickSlots:setBorderColor(r, g, b)
	if (r) and (g) and (b) then
		self.borderColor.r = r
		self.borderColor.g = g
		self.borderColor.b = b
	end
end


function dxQuickSlots:getBorderColor()
	return self.borderColor
end


function dxQuickSlots:setBorderSize(size)
	if (size) then
		self.borderSize = size
	end
end


function dxQuickSlots:getBorderSize()
	return self.borderSize
end


function dxQuickSlots:setAlpha(alpha)
	if (alpha) then
		self.alpha = alpha
	end
end


function dxQuickSlots:getAlpha()
	return self.alpha
end


function dxQuickSlots:setScale(scale)
	if (scale) then
		self.scale = scale
	end
end


function dxQuickSlots:getScale()
	return self.scale
end


function dxQuickSlots:setPostGUI(postGUI)
	self.postGUI = postGUI
end


function dxQuickSlots:getPostGUI()
	return self.postGUI
end


function dxQuickSlots:setSubPixelPositioning(subPixelPositioning)
	self.subPixelPositioning = subPixelPositioning
end


function dxQuickSlots:getSubPixelPositioning()
	return self.subPixelPositioning
end


function dxQuickSlots:clear()
	removeEventHandler("onClientClick", root, self.m_onClientClick)
end


function dxQuickSlots:destructor()
	self:clear()
	
	if (Settings.showClassDebugInfo == true) then
		sendMessage("dxQuickSlots was deleted.")
	end
end