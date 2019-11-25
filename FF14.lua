state=false;
open=false;
mode=1;
--mode=1 抢房mode
--mode=2 疯狂按Insert的mode
--mode=3 演奏mode 
--mode=4 制作mode，无限
--mode=5 制作mode，指定次数
--mode=6 转圈mode，防止被t
--mode=7 收藏品
times=1;
maker_name="60_level_pipa_hq"
is_collect=false
maker_list={
	["hong"]={{alt,"1",3700}};
	["semi"]={"nj","ws2","jy","zw2","xd","xd","xd","mm","ws2","xy","yj","xd","kb","zf","mf3"};
	["semi_too_fast"]={"nj","ws2","jy","zw2","xd","xd","xd","ws2","xd","kb","zf","mm","yj","mf3"};
	["semi_only_push"]={"mf3","mf3"};
	["50_level_hq"]={"ws2","xd","jm"};
	["50_level_3star_rr_hq"]={"ss","ws2","xd","xd","zly","mf2"};
	["50_level_3star_hq"]={"ss","ws2","xd","jm"};
	["46level_hq"]={"ss","jm"};
	["60_level_semi_3star_rr"]={"nj","jm","ws2","xd","xd","zf","zly","mf3"};
	["60_level_3star_rr_hq"]={"nj","jm","ws2","jy","xd","xd","xd","zf","zly","mf3"};
	["easy_with_hq"]={"nj","ws2","jyjg","xd","xd","zf","ws","xy","mm","yj","yj","mf3"};
	["full_75"]={"nj","ws2","jy","xd","xd","xd","xd","kb","ws","xy","zf","mm","yj","yj","mf3"};
	["sha_lun_ji"]={"nj","jy","xy","jm","jm","jm","jm","jm","ws2","xy","xd","kb","zf","jm"};
	["mojiang"]={"nj","jm","jm","jm","jm","jm","ws2","jyjg","kb","zf","jm"};
	["qiang_pao_jian_all_hq"]={"jm","jm","jm"};
	["70_level_3star_hq"]={"ss","nj","jm","jm","jm","jm","ws","kb","zf","mf3"};
	["60_level_pipa_hq"]={"ss","jm","ws2","xd","xd","jm"};
}
maker_table=maker_list[maker_name];
--{alt,"1",3700}
st=1500
lt=2500
ctrl="lctrl"
alt="lalt"
shift="lshift"
alt="lalt"
skill_table={
	["yj"]={nil,"1",lt};	--美名
	["ws"]={nil,"2",st};	--稳手
	["mf3"]={nil,"3",lt};	--模范3
	["xd"]={nil,"4",lt};	--下地加工
	["zs"]={nil,"5",lt};	--注视制作
	["nj"]={nil,"q",st};	--内静
	["zf"]={nil,"e",lt};	--祝福
	["zly"]={nil,"r",st};	--再利用
	["gc"]={nil,"f",lt};	--观察
	["xy"]={nil,"z",st};	--新颖
	["zw"]={nil,"x",lt};	--掌握
	["jx"]={nil,"c",lt};	--坚信
	["mm"]={ctrl,"1",st};	--美名
	["ws2"]={ctrl,"2",st};	--稳手2
	["mf2"]={ctrl,"3",lt};	--模范2
	["jm"]={ctrl,"4",lt};	--精密制作
	["jy"]={ctrl,"5",st};	--俭约
	["ay"]={ctrl,"q",st};	--内静
	["kb"]={ctrl,"e",st};	--阔步
	["jyjg"]={ctrl,"r",lt};	--简约加工
	["qs"]={ctrl,"f",st};	--起始
	["xy2"]={ctrl,"z",st};	--新颖2
	["zw2"]={ctrl,"x",st};	--掌握2

	["jx2"]={shift,"2",st};	--精修2

	["ss"]={alt,"c",lt}; 	--工匠的神速技巧
	["kx"]={alt,"x",lt};	--工匠的苦行
}
keytable={
	insert=0x52;
	down=0x50;
	up=0x48;
	left=0x4b;
	right=0x4d;
	number_lock=0x45;
	menu=0x51;
}
music_table={
	mutong={
		note={3,0,2,3,5,2,3,5,3,2,1,6,5,6,1,5,0   ,3,0,2,3,5,2,3,5,3,2,1,6,5,6,1,5,0,
		6,5,1,6,5,3,6,5,0,3,5,1,6,5,3,6,5, 0,3,5,6,5,3,2,3,5,6,5,3,2,1,0,3,2,3,2,1,6,1,5
		};
		time={2,1,1,2,2,2,1,1,1,1,2,2,2,2,2,4,2   ,2,1,1,2,2,2,1,1,1,1,2,2,2,2,2,4,2,
		1,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2, 1,1,1,1,1,1,1,1,2,1,1,1,1,2,1,1,1,1,1,1,2,2,4
		};
		level={1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,0  ,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,0,
		1,1,2,1,1,1,1,1,1,1,1,2,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0
		};
		time_piece=200;
	}
}
ms=music_table.mutong;
up_eight="lshift"
down_eight="lctrl"

note_key={
	[1]="q";
	[2]="w";
	[3]="e";
	[4]="r";
	[5]="t";
	[6]="y";
	[7]="u";
	["1#"]="2";
	["3b"]="3";
	["4#"]="5";
	["5#"]="6";
	["7b"]="7";
}
number=1;
function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %s\n", event, arg)
	if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true);
	end
    if (event=="MOUSE_BUTTON_PRESSED" and arg==11) then
        if (state==false) then
            PressMouseButton(3)
            state=true
        else
            ReleaseMouseButton(3)
            state=false
        end
    end
	if (event=="MOUSE_BUTTON_PRESSED" and arg==9) then
		open=not open;
		if (not open) then
			return;
		end
		flag=1;
		if (open and (mode<=2 or mode==4 or mode==6 or mode==7)) then
			SetMKeyState(3);
		elseif (mode==3) then
			music()
		elseif (mode==5) then
			number=times;
			SetMKeyState(3);
		end
	end
	if (event=="M_PRESSED" and arg==3 and open) then
		if (mode==1) then
			BuyHouse();
		elseif (mode==2) then
			GroundEmissary()
		elseif (mode==4 or mode==5) then
			maker()
		elseif (mode==6) then
			walk()
		elseif (mode==7) then
			sold()
		end
		SetMKeyState(3);
    end
end
function sold() 
	Insert()
	Sleep(200)
	Menu()
	Sleep(200)
	Insert()
	Sleep(200)
	Insert()
	Sleep(500)
end
function GroundEmissary() 	--mode2
	Insert()
	Sleep(100);
end
function walk()
	PressKey("w");
	Sleep(500);
	ReleaseKey("w");
	Sleep(200);
	PressKey("s");
	Sleep(500);
	ReleaseKey("s");
	Sleep(200);
end
function BuyHouse() 	--mode1
	PressAndReleaseKey(0x52); --选中
	Sleep(50);
	PressAndReleaseKey(0x52); --房屋详情
	Sleep(600);
	PressAndReleaseKey(0x52); --购买
	Sleep(300);
	PressAndReleaseKey(0x52); --个人用
	Sleep(300);
	PressAndReleaseKey(0x4b); --左选
	Sleep(50);
	PressAndReleaseKey(0x52); --购买
	Sleep(300);
end

function Up()
	PressAndReleaseKey(keytable.up);
end
function Down()
	PressAndReleaseKey(keytable.down);
end
function Right()
	PressAndReleaseKey(keytable.right);
end
function Left()
	PressAndReleaseKey(keytable.left);
end
function Insert()
	PressAndReleaseKey(keytable.insert);
end
function Menu()
	PressAndReleaseKey(keytable.menu);
end

function music()
	n=table.getn(ms.note)
	for i=1,n,1 do
		if (ms.level[i]==2) then
			PressKey(up_eight);
		elseif (ms.level[i]==0) then
			PressKey(down_eight);
		end
		if (ms.note[i]~=0) then
			PressKey(note_key[ms.note[i]]);
		end
		Sleep(ms.time_piece*ms.time[i]);
		if (ms.note[i]~=0) then
			ReleaseKey(note_key[ms.note[i]]);
		end
		if (ms.level[i]==2) then
			ReleaseKey(up_eight);
		elseif (ms.level[i]==0) then
			ReleaseKey(down_eight);
		end
	end
	ReleaseKey(up_eight);
	ReleaseKey(down_eight);
end

function maker()
	if (number==0) then
		open=false;
		return
	end
	if (flag==1) then
		PressMouseButton(1);
		Sleep(50);
		ReleaseMouseButton(1);
		Sleep(1500);
		flag=2
	elseif (flag==2) then
		n=table.getn(maker_table)
		i=1
		flag=3
	elseif (flag==3) then
		temp=skill_table[maker_table[i]]
		if (temp==nil) then
			temp=maker_table[i];
		end
		PressWithKey(temp[1],temp[2],100)
		Sleep(temp[3]);
		if (i==n) then
			flag=4;
			i=0;
		else
			i=i+1
		end
	elseif (flag==4) then
		if (is_collect) then
			Sleep(500)
			Insert();
			Sleep(200);
			Insert();
		end
		Sleep(2500);
		flag=1;
		if (mode==5) then
			number=number-1
		end
	end

end

function PressWithKey(fKey,key,delay)
	if (fKey~=nil) then
		PressKey(fKey);
	end
	Sleep(delay);
	PressAndReleaseKey(key)
	Sleep(delay);
	if (fKey~=nil) then
		ReleaseKey(fKey);
	end
end

