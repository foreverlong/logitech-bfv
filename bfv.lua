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
0.597005348,0.571428571}
local scopeTable={};
scopeTable[3]=1;
scopeTable[1]=0.423;
local tempRecoil={};
local sensitivity=10;       --士兵灵敏度,最低1，最高20，必须是整数
local uniform=true;        --是否开启统一瞄准（控制-高级内开启）
local coefficient=133;      --统一瞄准倍率（默认133%)
local weapon="bren";        --武器名称设定
local scope=3;              --镜子倍率设定
--突击兵武器数据
recoilTable["1-5"]={     --Gewher1-5
    basic={};
    speed=670;
    max=0;
}
recoilTable["43"]={      --Gewher 43
    basic={};
    speed=300;
    max=0;
}
recoilTable["M1A1"]={      --M1A1
    basic={};
    speed=450;
    max=0;
}
recoilTable["1907"]={      --MF1907
    basic={};
    speed=770;
    max=0;
}
recoilTable["SMLE"]={      --SMLE特纳
    basic={};
    speed=360;
    max=0;
}
recoilTable["stg44"]={      --STG44
    basic={};
    speed=600;
    max=0;
}
recoilTable["1916"]={      --1916半自动
    basic={};
    speed=257;
    max=0;
}
recoilTable["1-5b"]={       --Gewher1-5半自动
    basic={};
    speed=360;
    max=0;
}

--医疗兵

recoilTable["sten"]={
    basic={};
    speed=540;
    max=0;
}
recoilTable["Suomi"]={
    basic={};
    speed=770;
    max=0;
}
recoilTable["MP40"]={ 
    basic={};
    speed=540;
    max=0;
}
recoilTable["MP28"]={
    basic={};
    speed=670;
    max=0;
}
recoilTable["EMP"]={     
    basic={};
    speed=568;
    max=0;
}
recoilTable["MP34"]={   
    basic={};
    speed=514;
    max=0;
}
recoilTable["M1928A1"]={      --汤姆逊
    basic={};
    speed=720;
    max=0;
}
--支援兵
recoilTable["KE7"]={     
    basic={};
    speed=638;
    max=0;
}
recoilTable["bren"]={   --布伦轻机枪
    basic={55,50,42,38.8};             --压枪系数
    speed=514;              --射速
    max=4;                  --压枪系数数量
}
recoilTable["Lewis"]={     
    basic={};
    speed=540;
    max=0;
}
recoilTable["FG42"]={
    basic={};
    speed=670;
    max=0;
}
--侦察兵：无
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
    local startTime=GetRunningTime();
    local time;
    local lefttime=startTime;
    local totalRecoil=0
    local totalShoot=1;
    local i;
    if (tempRecoil[0]==nil) then 
        for i=1,recoilTable[weapon].max,1 do
            tempRecoil[i]=CalcRecovery(weapon,i)
        end
    end
    repeat
        Sleep(20);
        time=GetRunningTime();
        if (time>lefttime) then
            lefttime=lefttime+CalcTime(weapon);                 --在时间池中加入本次射击的时间
            totalRecoil=totalRecoil+tempRecoil[totalShoot];     --在反冲池中加入本次反冲
            if (totalShoot<recoilTable[weapon].max) then   
                totalShoot=totalShoot+1;
            end
        end
        recoilofTime=math.floor(10.0*totalRecoil*(time-startTime)/(lefttime-startTime))/10; --计算一次time应该反冲的量
        totalRecoil=totalRecoil-recoilofTime                   --反冲池中减去本次反冲量
        startTime=time;
        OutputLogMessage("%f\n", recoilofTime);
        if (IsMouseButtonPressed(3)) then 
            MoveMouseRelative(0,recoilofTime);
        end
    until not IsMouseButtonPressed(1)
end