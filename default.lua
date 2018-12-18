local password="";
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
        PressAndReleaseKey("right");
        Sleep(200);
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
        else
        if (string.lower(temp)~=temp) then
            PressKey("lshift");
            Sleep(10);
            PressKey(string.lower(temp));
            Sleep(10);
            ReleaseKey(string.lower(temp));
            Sleep(10);
            ReleaseKey("lshift");
        else
            PressKey(temp);
            Sleep(10);
            ReleaseKey(temp);
        end end
        i=i+1;
    end
end