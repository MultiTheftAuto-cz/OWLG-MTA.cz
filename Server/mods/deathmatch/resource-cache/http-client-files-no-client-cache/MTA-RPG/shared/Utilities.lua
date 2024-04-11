-- ############# sendMessage ############## --
function sendMessage(text)
	if (string.find(text, "CLIENT", 1, true)) then
		outputChatBox("#CCFF00 INFO >> #FFFF99" .. text, 255, 255, 255, true)
	elseif (string.find(text, "SERVER", 1, true)) then
		outputChatBox("#CCFF00 INFO >> #FFCC99" .. text, root, 255, 255, 255, true)
	elseif (string.find(text, "FAIL", 1, true)) then
		outputChatBox("#FF2222 INFO >> #FF0000" .. text, root, 255, 255, 255, true)
	else
		outputDebugString(text, 3)
	end
end

----------------------------------------------------------------
-- String helper functions
----------------------------------------------------------------
-- ############# string.split ############## -- 
function string.split(inputString, seperator)
	if (inputString) and (seperator) then
		local result = {}
		local i = 1
		
		for str in string.gmatch(inputString, "([^".. seperator .."]+)") do
			result[i] = str
			i = i + 1
		end
		
		return result
	end
	
	return nil
end

----------------------------------------------------------------
-- Math helper functions
----------------------------------------------------------------
-- ############# math.lerp ############## -- 
function math.lerp(from, alpha, to)
    return from + (to - from) * alpha
end

-- ############# math.unlerp ############## -- 
function math.unlerp(from, pos, to)
	if ( to == from ) then
		return 1
	end
	return ( pos - from ) / ( to - from )
end

-- ############# math.clamp############## -- 
function math.clamp(low, value, high)
    return math.max(low, math.min(value, high))
end

-- ############# math.unlerpclamped ############## -- 
function math.unlerpclamped(from, pos, to)
	return math.clamp(0, math.unlerp(from, pos, to), 1)
end

----------------------------------------------------------------
-- String helper functions
----------------------------------------------------------------

-- ############# string.split ############## -- 
function string.split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end


function string.random(length)
    local charset = {}
	local randomString = ""

	-- qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890
	for i = 48,  57 do table.insert(charset, string.char(i)) end
	for i = 65,  90 do table.insert(charset, string.char(i)) end
	for i = 97, 122 do table.insert(charset, string.char(i)) end

	for i = 1, length, 1 do
		randomString = randomString .. charset[math.random(1, #charset)]
	end

	return randomString
end

----------------------------------------------------------------
-- Misc helper functions
----------------------------------------------------------------
-- ############# isElementInRange ############## -- 
function isElementInRange(ele, x, y, z, range)
   if isElement(ele) and type(x) == "number" and type(y) == "number" and type(z) == "number" and type(range) == "number" then
      return getDistanceBetweenPoints3D(x, y, z, getElementPosition(ele)) <= range -- returns true if it the range of the element to the main point is smaller than (or as big as) the maximum range.
   end
   return false
end

-- ############# getAttachedPosition ############## -- 
function getAttachedPosition(x, y, z, rx, ry, rz, distance, angleAttached, height)
 
    local nrx = math.rad(rx);
    local nry = math.rad(ry);
    local nrz = math.rad(angleAttached - rz);
    
    local dx = math.sin(nrz) * distance;
    local dy = math.cos(nrz) * distance;
    local dz = math.sin(nrx) * distance;
    
    local newX = x + dx;
    local newY = y + dy;
    local newZ = (z + height) - dz;
    
    return newX, newY, newZ;
end


-- ############# dxDrawImage3D ############## -- 
function dxDrawImage3D(x, y, z, w, h, m, c, r,...)
    local lx, ly, lz = x + w, y + h, (z + tonumber(r or 0)) or z
	return dxDrawMaterialLine3D(x, y, z, lx, ly, lz, m, h, c or tocolor(255,255,255,255), ...)
end


-- ############# findRotation ############## -- 
function findRotation(x1, y1, x2, y2)
  local t = -math.deg(math.atan2(x2 - x1, y2 - y1))
  if t < 0 then t = t + 360 end;
  return t;
end


-- ############# getDistanceRotation ############## -- 
function getDistanceRotation(x, y, dist, angle)
  local a = math.rad(90 - angle)
  local dx = math.cos(a) * dist
  local dy = math.sin(a) * dist
  
  return x + dx, y + dy
end


-- ############# removeHEXColorCode ############## -- 
function removeHEXColorCode(text)
    return text:gsub('#%x%x%x%x%x%x', '')
end

-- ############# RGBToHex ############## -- 
function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end


-- ############# isElementMoving ############## -- 
function isElementMoving(theElement)
    if (isElement(theElement)) then
        local x, y, z = getElementVelocity(theElement)
        return x ~= 0 or y ~= 0 or z ~= 0
    end
 
    return nil
end


-- ############# tableSort ############## -- 
function tableSort(myTable, myColumn, sortUp)
    if (not myColumn) then
        myColumn = 1
    end
	
    if (myTable) and (#myTable > 1) then
        for i = 1, #myTable, 1 do
            for j = 2, #myTable, 1 do
                if (sortUp == true) then
                    if(myTable[j][myColumn] > myTable[j-1][myColumn]) then
                        temp = myTable[j-1]
                        myTable[j-1] = myTable[j]
                        myTable[j] = temp
                   end
               else
                   if(myTable[j][myColumn] < myTable[j-1][myColumn]) then
                        temp = myTable[j-1]
                        myTable[j-1] = myTable[j]
                        myTable[j] = temp
                    end
                end
            end
        end
    end
	
    return myTable
end


-- ############# math.round ############## -- 
function math.round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end


-- ############# getCameraRotation ############## -- 
function getCameraRotation ()
	local px, py, pz, lx, ly, lz = getCameraMatrix()
	local rotz = 6.2831853071796 - math.atan2 ( ( lx - px ), ( ly - py ) ) % 6.2831853071796
 	local rotx = math.atan2 ( lz - pz, getDistanceBetweenPoints2D ( lx, ly, px, py ) )
	--Convert to degrees
	rotx = math.deg(rotx)
	rotz = -math.deg(rotz)
	
 	return rotx, 180, rotz
end


-- ############# dxDrawCircle3D ############## -- 
function dxDrawCircle3D(x, y, z, radius, segments, color, width)
    segments = segments or 16
    color = color or tocolor(255, 255, 0, 255)
    width = width or 1
    local segAngle = 360 / segments
    local fX, fY, tX, tY
    for i = 1, segments do
        fX = x + math.cos(math.rad(segAngle * i)) * radius
        fY = y + math.sin(math.rad(segAngle * i)) * radius
        tX = x + math.cos(math.rad(segAngle * (i+1))) * radius
        tY = y + math.sin(math.rad(segAngle * (i+1))) * radius
        dxDrawLine3D(fX, fY, z, tX, tY, z, color, width)
		dxDrawLine3D(x, y, z, tX, tY, z, color, width)
    end
end


-- ############# getFPS ############## -- 
local clientFpsVar = 0
local clientFpsStartTick = false
local clientFpsCurrentTick = 0

function getFPS()
    
    if not (clientFpsStartTick) then
        clientFpsStartTick = getTickCount()
    end
        
    clientFpsVar = clientFpsVar + 1
    clientFpsCurrentTick = getTickCount()
        
    if ((clientFpsCurrentTick - clientFpsStartTick) >= 1000) then
        clientFps = clientFpsVar
        
        clientFpsVar = 0
        clientFpsStartTick = false
    end
    
    if (clientFps) then
		return clientFps
    else
        return 0
    end
end


-- ############# getElementSpeed ############## --
function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    assert(getElementType(theElement) == "player" or getElementType(theElement) == "ped" or getElementType(theElement) == "object" or getElementType(theElement) == "vehicle", "Invalid element type @ getElementSpeed (player/ped/object/vehicle expected, got " .. getElementType(theElement) .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end


-- ############# fileBytes ############## --
function fileBytes(downloadPath)
	if (downloadPath) then
		local file = fileOpen(downloadPath, false)
		
		if (file) then
			local bytes = fileGetSize(file);
			fileClose(file);
			
			return bytes;
		end
	end
	
	return nil
end


-- ############# fileAttributes ############## --
function fileAttributes(downloadPath, bytes)
	if (downloadPath) and (bytes) then
		local file = fileOpen(downloadPath, false)
		
		if (file) then
			local attrs = fileRead(file, bytes);
			fileClose(file);
			
			return attrs;
		end
	end
	
	return nil
end


-- ############# getScriptsInResource ############## --
function getScriptsInResource(resource)
	assert(resource, "Resource not found!");
	
	local filesList = {}
	
	if (fileExists(":"..getResourceName(resource).."/meta.xml")) then
		--table.insert(filesList, "meta.xml");
		
		local xml = xmlLoadFile(":" ..getResourceName(resource).."/meta.xml");
		local childrens = xmlNodeGetChildren(xml);
		
		if (childrens) then
			for k, v in pairs(childrens) do
				local node = xmlNodeGetName(v);
				local type = xmlNodeGetAttribute(v, "type");
				local data = xmlNodeGetAttribute(v, "src");
				
				if (data) and (type) then
					if (type == "client") then
						table.insert(filesList, data);
					end
				end
			end
		end
	end
	
	return filesList;
end


-- ############# sizeFormat ############## --
function sizeFormat(size)
    local size = tostring(size)
    
	if size:len() >= 4 then    
        if size:len() >= 7 then
            if size:len() >= 9 then
                local returning = size:sub(1, size:len()-9)
                
				if returning:len() <= 1 then
                    returning = returning.."."..size:sub(2, size:len()-7)
                end
				
                return returning.." GB";
            else               
                local returning = size:sub(1, size:len()-6)
                
				if returning:len() <= 1 then
                    returning = returning.."."..size:sub(2, size:len()-4)
                end
				
                return returning.." MB";
            end
        else       
            local returning = size:sub(1, size:len()-3)
            
			if returning:len() <= 1 then
                returning = returning.."."..size:sub(2, size:len()-1)
            end
			
            return returning.." KB";
        end
    else
        return size.." B";
    end
end