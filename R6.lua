local quickClick=false;
local mousePush=false;
local autoRecovery=false;
local recoilTable={};
local scopeTable={};
local fireKey="f9";         
local ctrlRadio=0.75;
scopeTable[1]=1;
scopeTable[3]=1;
local weapon="M1A1";        --武器名称设定
local scope=3;              --镜子倍率设定
local recoilofTime;
local startTime;
local time;
local lefttime=startTime;
local totalRecoil=0;
local totalShoot;
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg);
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true);
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==9) then
        quickClick=not quickClick;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==8 ) then
        autoRecovery=not autoRecovery;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==1 and not IsModifierPressed("lalt")) then
        mousePush=true;
        if (not quickClick) then
            PressKey(fireKey);
        end
        if (autoRecovery) then
            startTime=GetRunningTime();
            lefttime=startTime;
            totalRecoil=0;
            totalShoot=1;
        end
        SetMKeyState(3);
    end

    if (event=="MOUSE_BUTTON_RELEASED" and arg==1) then
        ReleaseKey(fireKey);
        mousePush=false;
    end
    if (event=="M_PRESSED" and arg==3 and mousePush) then
        if (quickClick) then
            --PressMouseButton(1);
            PressKey(fireKey);
            Sleep(15);
            ReleaseKey(fireKey);
            --ReleaseMouseButton(1);
        end
        if (weapon~="" and autoRecovery and IsMouseButtonPressed(3)) then 
            AutoRecovery(weapon);
        end
        if (quickClick or weapon~="" and autoRecovery) then
            Sleep(5);
            SetMKeyState(3);
        end
    end
end

function CalcTime(weapon)
    return(math.floor(60000.0/recoilTable[weapon].speed)+1);
end
function CalcRecovery(weapon,totalShoot)       --计算下一次射击需要下移的量
    local recoilNow;
    if (scope==1 or scope==0) then
        recoilNow=recoilTable[weapon].basic[totalShoot];
    else
        recoilNow=recoilTable[weapon].scope[totalShoot];
    end
    recoilNow=recoilNow*scopeTable[scope];
    if (IsModifierPressed("lctrl")) then
        recoilNow=recoilNow*ctrlRadio;
    end
    return(recoilNow);
end

function AutoRecovery(weapon)   --自动压枪模块，用于自动压枪
    time=GetRunningTime();
    if (time>lefttime) then
        lefttime=lefttime+CalcTime(weapon);                 --在时间池中加入本次射击的时间
        totalRecoil=totalRecoil+CalcRecovery(weapon,totalShoot);     --在反冲池中加入本次反冲
        if (totalShoot<recoilTable[weapon].max) then   
            totalShoot=totalShoot+1;
        end
    end
    recoilofTime=math.floor(10.0*totalRecoil*(time-startTime)/(lefttime-startTime))/10; --计算一次time应该反冲的量
    if (recoilofTime>0) then
        totalRecoil=totalRecoil-recoilofTime                   --反冲池中减去本次反冲量
        startTime=time;
        if (IsMouseButtonPressed(3)) then 
            MoveMouseRelative(0,recoilofTime);
        end
    end
    OutputLogMessage("%f\n", recoilofTime);
end