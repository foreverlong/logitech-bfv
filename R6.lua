local quickClick=false;
local mousePush=false;
local autoRecovery=false;
local recoilTable={};
local fireKey="f7";         --
local weapon="l85a2";        --武器名称设定
local scope="2.5x";              --镜子倍率设定
--突击兵武器数据
recoilTable["l85a2"]={       
    basic={26};
    scope={
        ["2.5x"]=1,
        ["iron"]=0.52
    };
    speed=670;
    ctrlRadio=1
}
local recoilofTime;
local startTime;
local time;
local lefttime=startTime;
local totalRecoil=0;
local totalShoot;
local rightPress=false;
local sleepTime=20;
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg);
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true);
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==9) then
        quickClick=not quickClick;
        if (quickClick) then
            sleepTime=5;
        else sleepTime=20;
        end
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==8 ) then
        autoRecovery=not autoRecovery;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==2 ) then
        rightPress=true;
    end
    if (event=="MOUSE_BUTTON_RELEASED" and arg==2 ) then
        rightPress=false;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==1) then
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
            PressKey(fireKey);
            Sleep(15); 
            ReleaseKey(fireKey);
        end
        if (autoRecovery and rightPress) then 
            AutoRecovery(weapon);
        end
        if (quickClick or autoRecovery) then
            Sleep(sleepTime);
            SetMKeyState(3);
        end
    end
end

function CalcTime(weapon)
    return(math.floor(60000.0/recoilTable[weapon].speed)+1);
end
function CalcRecovery(weapon,totalShoot)       --计算下一次射击需要下移的量
    local recoilNow;
    recoilNow=recoilTable[weapon].basic[totalShoot];
    recoilNow=recoilNow*recoilTable[weapon].scope[scope];
    if (IsModifierPressed("lctrl")) then
        recoilNow=recoilNow*recoilTable[weapon].ctrlRadio;
    end
    return(recoilNow);
end

function AutoRecovery(weapon)   --自动压枪模块，用于自动压枪
    time=GetRunningTime();
    if (time>lefttime) then
        lefttime=lefttime+CalcTime(weapon);                 --在时间池中加入本次射击的时间
        totalRecoil=totalRecoil+CalcRecovery(weapon,totalShoot);     --在反冲池中加入本次反冲
        if (recoilTable[weapon].basic~=nil and recoilTable[weapon].basic[totalShoot+1]~=nil) then   
            totalShoot=totalShoot+1;
        end
    end
    recoilofTime=math.floor(10.0*totalRecoil*(time-startTime)/(lefttime-startTime))/10; --计算一次time应该反冲的量
    if (recoilofTime>0 and rightPress) then
        totalRecoil=totalRecoil-recoilofTime                   --反冲池中减去本次反冲量
        startTime=time;
        MoveMouseRelative(0,recoilofTime);
    end
    OutputLogMessage("%f\n", recoilofTime);
end