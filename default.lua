local password=".cbz";
local withShift={};
withShift["!"]="1";
withShift["@"]="2";
withShift["#"]="3";
withShift["$"]="4";
withShift["%"]="5";
withShift["^"]="6";
withShift["&"]="7";
withShift["*"]="8";
withShift["("]="9";
withShift[")"]="0";
withShift[">"]=0x34;
local toKey={};
toKey["."]=0x34;
function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %s\n", event, arg);
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true);
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==9) then
        inputPassword(password);
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==8) then
        PressKey("lctrl");
        Sleep(10);
        PressAndReleaseMouseButton(1);
        Sleep(10);
        ReleaseKey("lctrl");
        Sleep(500);
        PressKey("right");
        Sleep(50);
        ReleaseKey("right");
    end
end
function inputPassword(password)
    local max=string.len(password);
    local i=1;
    while (i<=max) do
        local temp=string.sub(password,i,i);
        if (withShift[temp]~=nil) then
            PressKey("lshift");
            Sleep(10);
            PressKey(withShift[temp]);
            Sleep(10);
            ReleaseKey(withShift[temp]);
            Sleep(10);
            ReleaseKey("lshift");
		elseif (string.lower(temp)~=temp) then
            PressKey("lshift");
            Sleep(10);
            PressKey(string.lower(temp));
            Sleep(10);
            ReleaseKey(string.lower(temp));
            Sleep(10);
            ReleaseKey("lshift");
		else
			temp=getRealKey(temp);
            PressKey(temp);
            Sleep(10);
            ReleaseKey(temp);
        end
        i=i+1;
    end
end
function getRealKey(temp)
	if (toKey[temp]==nil) then
		return(temp);
	else return(toKey[temp]);
	end
end