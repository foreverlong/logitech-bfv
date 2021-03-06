local quickClick=false;
local mousePush=false;
local autoRecovery=false;
local recoilTable={};
local fireKey="f9";         --
local weapon="ke7";        --武器名称设定
local scope="AA";              --镜子倍率设定
--突击兵武器数据
recoilTable["1-5"]={     --Gewher1-5
    basic={};
    speed=670; 
    max=0;
}
recoilTable["43"]={      --Gewher 43
    basic={};
    scope={125,125,128};
    speed=300;  
} 
recoilTable["m1a1"]={      --M1A1
    basic={91.2};
    scope={
        ["3x"]=1,
        ["iron"]=0.52
    };
    ctrlRadio=0.75;
    speed=450;
}
recoilTable["1907"]={      --MF1907
    basic={27,30.54}; 
    speed=770;
}
recoilTable["smle"]={      --SMLE特纳
    basic={140};
    scope={
        ["3x"]=1,
        ["iron"]=0.52
    };
    ctrlRadio=0.75;
    speed=360;
}
recoilTable["stg44"]={      --STG44
    basic={23.05};
    speed=600;
}
recoilTable["1916"]={      --1916半自动
    basic={};
    scope={100,100,130};
    speed=257; 
}
recoilTable["1-5b"]={       --Gewher1-5半自动
    basic={127.5};
    scope={
        ["3x"]=1,
        ["iron"]=0.52
    };
    ctrlRadio=0.75;
    speed=360;
}
recoilTable["m42"]={
    scope={41};
    speed=450;
}
recoilTable["mas44"]={
    scope={90,90,90,98};
    speed=360;
}
--医疗兵

recoilTable["sten"]={
    basic={};
    speed=540;
}
recoilTable["suomi"]={
    basic={25,32};
    speed=770;
}
recoilTable["MP40"]={ 
    basic={30,30,30,30,36};
    speed=540;
}
recoilTable["MP28"]={
    basic={};
    speed=670;
}
recoilTable["EMP"]={     
    basic={32,34.56};
    speed=568;
}
recoilTable["MP34"]={   
    basic={};
    speed=514;
} 
recoilTable["Tom"]={      --汤姆逊
    basic={27.8};
    speed=720;
}
--支援兵
recoilTable["ke7"]={     
    basic={70,65,65,48};
    scope={
        ["3x"]=1,
        ["iron"]=0.52,
        ["AA"]=0.468
    };
    speed=638;
    ctrlRadio=0.75;
}
recoilTable["bren"]={   --布伦轻机枪
    basic={27.3,27.3,20.58,18.95};             --压枪系数
    scope={65,65,49,45.4};  
    speed=514;              --射速
}
recoilTable["lewis"]={     
    basic={25,22.95,20.868,20.868,17.517};
    scope={50,50,37.18};
    speed=540;
}
recoilTable["FG42"]={
    basic={32,32,32,29};
    speed=670;
}
recoilTable["mg42"]={
    basic={10};
    speed=981;
}
--侦察兵：
recoilTable["1906"]={
    scope={160,200};
    speed=164;
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
        OutputLogMessage("Press button 3\n");
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