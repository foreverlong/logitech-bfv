local quickClick=false;
local mousePush=false;
local autoRecovery=false;
local recoilTable={};
local scopeTable={};
scopeTable[0]=0.673;
scopeTable[1]=1;
scopeTable[3]=1;
local weapon="EMP";        --武器名称设定
local scope=1;              --镜子倍率设定
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
    basic={39.232};
    scope={94};
    speed=360;
    max=1;
}

--医疗兵

recoilTable["sten"]={
    basic={};
    speed=540;
    max=0;
}
recoilTable["suomi"]={
    basic={35,36,37,38.18};
    speed=770;
    max=4;
}
recoilTable["MP40"]={ 
    basic={30,30,30,30,36};
    speed=540;
    max=5;
}
recoilTable["MP28"]={
    basic={};
    speed=670;
    max=0;
}
recoilTable["EMP"]={     
    basic={32,34.56};
    speed=568;
    max=2;
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
    basic={27.3,27.3,20.58,18.95};             --压枪系数
    scope={65,65,49,45.4};  
    speed=514;              --射速
    max=4;                  --压枪系数数量
}
recoilTable["Lewis"]={     
    basic={25,22.95,20.868,20.868,17.517};
    scope={60,55,50,50,37.18};
    speed=540;
    max=5;
}
recoilTable["FG42"]={
    basic={32,32,32,32,29.35};
    speed=670;
    max=5;
}
--侦察兵：无
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
    if (event=="MOUSE_BUTTON_PRESSED" and arg==8) then
        autoRecovery=not autoRecovery;
    end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==1) then
        mousePush=true;
        if (autoRecovery) then
            startTime=GetRunningTime();
            lefttime=startTime;
            totalRecoil=0;
            totalShoot=1;
        end
        SetMKeyState(3);
    end

    if (event=="MOUSE_BUTTON_RELEASED" and arg==1) then
        mousePush=false;
    end
    if (event=="M_PRESSED" and arg==3 and mousePush) then
        if (quickClick) then
            PressMouseButton(1);
            Sleep(15);
            ReleaseMouseButton(1);
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