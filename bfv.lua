local quickClick=false;
local mousePush=false;
local autoRecovery=false;
local recoilTable={};
local sensitivityTable={3.076913675,2.499984721,
2.105271199,1.818181818,
1.6,1.428571429,
1.290328495,1.176470588,
1.081069519,1,
0.930236822,0.869549274,
0.8163178,0.769228419,
0.727272727,0.689656226,
0.655737204,0.62499618,
0.597005348,0.571428571
}
local scopeTable={};
scopeTable[3]=2.3;
scopeTable[1]=1;
local tempRecoil={};
local sensitivity=10;       --士兵灵敏度,最低1，最高20，必须是整数
local uniform=true;        --是否开启统一瞄准（控制-高级内开启）
local coefficient=133;      --统一瞄准倍率（默认133%)
recoilTable["bren"]={   --布伦轻机枪
basic={22,22,16.9};             --压枪系数
speed=514;              --射速
max=3;                  --压枪系数数量
}
local weapon="bren";
local scope=3;
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg);
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true);
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==9) then
        quickClick=not quickClick;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==8) then
        autoRecovery=not autoRecovery;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==1) then
        mousePush=true;
        SetMKeyState(3);
        if (weapon~="" and autoRecovery) then 
            AutoRecovery(weapon);
        end
    end

    if (event=="MOUSE_BUTTON_RELEASED" and arg==1) then
        mousePush=false;
    end
    if (event=="M_PRESSED" and arg==3) then
        if (quickClick and mousePush) then 
            AutoClick();
        end
    end
end

function AutoClick()
    Sleep(10);
    PressMouseButton(1);
    Sleep(10);
    ReleaseMouseButton(1);
    SetMKeyState(3);
end
function CalcTime(weapon)
    return(math.floor(60000.0/recoilTable[weapon].speed)+1);
end
function CalcRecovery(weapon,totalShoot)       --计算下一次射击需要下移的量
    local recoilNow;
    recoilNow=recoilTable[weapon].basic[totalShoot];
    recoilNow=recoilNow*sensitivityTable[sensitivity];
    recoilNow=recoilNow*scopeTable[scope]
    return(recoilNow);
end

function AutoRecovery(weapon)   --自动压枪模块，用于自动压枪
    local recoilofTime;
    local time=20;
    local lefttime=0;
    local totalRecoil=0
    local totalShoot=1;
    local i;
    if (tempRecoil[0]==nil) then 
        for i=1,recoilTable[weapon].max,1 do
            tempRecoil[i]=CalcRecovery(weapon,i)
        end
    end
    repeat
        if (time>lefttime) then
            lefttime=lefttime+CalcTime(weapon);                 --在是时间池中加入本次射击的时间
            --totalRecoil=totalRecoil+CalcRecovery(weapon,totalShoot);          --在反冲池中加入本次反冲的时间
            totalRecoil=totalRecoil+tempRecoil[totalShoot];
            if (totalShoot<recoilTable[weapon].max) then   
                totalShoot=totalShoot+1;
            end
        end
        recoilofTime=math.floor(10.0*totalRecoil*time/lefttime)/10; --计算一次time应该反冲的量
        totalRecoil=totalRecoil-recoilofTime                   --反冲池中减去本次反冲量
        lefttime=lefttime-20;
        OutputLogMessage("%f\n", recoilofTime);
        if (IsMouseButtonPressed(3)) then 
            MoveMouseRelative(0,recoilofTime);
        end
        Sleep(20);
    until not IsMouseButtonPressed(1)
end