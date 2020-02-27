state=false;
open=false;
mode=4;
--mode=1 抢房mode
--mode=2 疯狂按Insert的mode
--mode=3 演奏mode 
--mode=4 制作mode，无限
--mode=5 制作mode，指定次数
--mode=6 转圈mode，防止被t
--mode=7 控制指令
--mode=8 控制指令-限制次数
--mode=10 连点器
--mode=13 以太指环自动生产-分解系统
--mode=14 巧手之主指环自动兑换-分解系统
times=5;
maker_name="80_yixiujiade"
repair=true;
is_collect=false
eat_food=false
food_time=1800000
food_end_time=0
ctrl="lctrl"
alt="lalt"
shift="lshift"
alt="lalt"
maker_list={
	["hong"]={{"lalt","1",37000},{"lalt","2",37000}};
	["hong_2"]={{"lalt","q",35000},{"lalt","e",32000}};
	["50_zly"]={"ss","zly","mf"};
	["50_hq"]={"ss","mf"};
	["60_zly"]={"ss","zly","mf","mf"};
	["76_collect"]={"xj","jy","gg","jm","xd","xd","jm"};
	["76_collect_with_allhq"]={"gg","jm","jm"};
	["77_collect"]={"xj","jm","jm","jm","jm","xd","jm"};
	["77_collect_2hqMeat"]={"jx","nj","xd","xd","xd","jm"};
	["77_hq"]={"xj","jm","jm","jm","jm","jyjg","xd","jm"};
	["80_collect"]={"xj","xy","jm","jm","jm","jm","kb","xy","zf","mf"};
	["80_coolect_zly"]={"xj","xy","jm","jm","jm","jm","jyjg","xy","kb","zf","zly","mf"};
	["80_collect_zly_Food"]={"xj","xy","jm","jm","jm","xd","kb","xy","zf","zly","mf"};
	["80_collect_from_8k"]={"xj","xy","jm","jm","jm","jm","jm"};
	["80_zly"]={"xj","xy","jm","jm","jm","jm","kb","xy","zf","zly","mf"};
	["80_2star_semi_nq"]={"jx","xy","mf","mf","mf"};
	["80_2star_semi_hq_zly"]={"xj","zw","xy","gg","jm","jm","jm","jm","kb","jy","xy","xd","kb","zf","zly","zz"};
	["80_2star_hq_zly"]={"xj","zw","jm","xy","jm","jm","jm","jm","jm","kb","xy","xd","kb","zf","zly","mf"};
	["80_2star_hq_from4k7_zly"]={"xj","zw","jm","xy","jm","jm","jm","jm","jm","xy","xd","kb","zf","zly","mf"};
	["80_2star_460hq_zly_620CP"]={"xj","zw","xy","mm","yj","yj","jyjg","jyjg","xy","gg","jyjg","jm","kb","xd","kb","xy","xd","kb","zf","zly","mf"};
	["80_2star_460hq_609cp"]={"xj","xy","gg","mm","yj","jm","jyjg","zw","xy","gg","jm","jm","kb","xd","kb","gg","xy","xd","kb","zf","gc","zszz"};
	["80_yixiujiade"]={"xj","zw","xy","jm","jm","jm","kb","xy","xd","xd","kb","zf","mf"};
}
maker_table=maker_list[maker_name];
controller_name="hejian_uper";
controller_list={
	["AutoJingXuan"]={{"insert",300},{"left",200},{"insert",3200},{"insert",300}};
	["AutoBuy_easy"]={{"insert",200},{"left",200},{"insert",500}};
	["AutoBuy_rare"]={{"insert",200},{"insert",200},{"menu",200},{"insert",200},{"insert",800}};
	["Destroy_yellow"]={{"insert",200},{"up",200},{"insert",200},{"down",200},{"insert",3200},{"insert",300}};
	["collect_uper"]={{"insert",200},{"menu",200},{"insert",200},{"insert",500}};
	["hejian_uper"]={{"insert",200},{"menu",200},{"insert",200},{"insert",200},{"insert",1000}};
	["Buy_ring_from_npc_first"]={{"insert",500},{"insert",800},{"down",200},{"down",200},{"down",200},{"insert",500},{"down",200},{"down",200},{"down",200},{"down",500}};
	["Buy_ring_from_npc"]={{"insert",500},{"insert",800},{"down",200},{"down",200},{"insert",500},{"down",200},{"down",200},{"down",200},{"down",500}};
	["repair_equipment"]={{"insert",500},{"insert",500},{"right",300},{"insert",300},{"left",300},{"insert",300}};
}

controller_table=controller_list[controller_name];
fisher_name="lingsha-5.0"
fisher_list={
	["lingsha-5.0"]={"pj","pg","w1s","Insert","Insert","w1s","zy","w10.7s","t+p","w5s","w5s","pj","w280ms","tg","w5s","w5s"};
}

fisher_table=fisher_list[fisher_name];
--{alt,"1",3700}
st=1500
lt=2500

skill_table={
	["mf"]={nil,"1",lt};	--模范
	["jm"]={nil,"2",lt};	--精密
	["zf"]={nil,"3",lt};	--祝福
	["xd"]={nil,"4",lt};	--下地加工
	["jyjg"]={nil,"5",lt};	--俭约加工
	["kb"]={nil,"q",st};	--阔步
	["xj"]={nil,"e",lt};	--闲静
	["zw"]={nil,"r",st};	--掌握
	["jy"]={nil,"f",st};	--俭约
	["xy"]={nil,"z",st};	--新颖
	["gc"]={nil,"x",lt};	--观察

	["mm"]={ctrl,"1",st};	--美名
	["yj"]={ctrl,"2",lt};	--印记
	["jx"]={ctrl,"3",lt};	--坚信
	["gg"]={ctrl,"4",st};	--改革
	["mj"]={ctrl,"5",lt};	--秘诀
	["ss"]={ctrl,"q",lt};	--神速
	["nj"]={ctrl,"e",st};	--内静
	["jinx"]={ctrl,"r",lt};	--精修
	["jy2"]={ctrl,"f",st};	--俭约2
	["zszz"]={ctrl,"z",lt};	--注视制作
	["zsjg"]={ctrl,"x",lt};	--注视加工
	["zly"]={ctrl,"c",st};	--再利用

	["jg"]={shift,"1",lt};	--加工
	["jg2"]={shift,"2",lt}; --加工2
	["cc"]={shift,"3",lt}; --仓促
	["zxjg"]={shift,"4",lt}; --专心加工
	["gs"]={shift,"5",lt}; --高速制作
	["zz"]={shift,"q",lt}; --制作
	["qr"]={shift,"e",lt}; --最终确认
	["jzzz"]={shift,"z",lt}; --集中制作
	["jzjg"]={shift,"x",lt}; --集中加工

}
keytable={
	["insert"]=0x52;
	["down"]=0x50;
	["up"]=0x48;
	["left"]=0x4b;
	["right"]=0x4d;
	["number_lock"]=0x45;
	["menu"]=0x51;
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
number=-1;
function OnEvent(event, arg)
	--OutputLogMessage("event = %s, arg = %s\n", event, arg)
	if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true);
	end
	if (event=="MOUSE_BUTTON_PRESSED" and arg==11) then
		if (mode==4) then
			mode=7;
		elseif (mode==7) then
			mode=4;
        elseif (state==false) then
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
		if (mode==3) then
			music()
		elseif (mode==5 or mode==8 or mode==13) then
			number=times;
			destroy_flag=1;
			SetMKeyState(3);
		elseif (mode==14) then
			controller_name="Buy_ring_from_npc_first";
			controller_table=controller_list[controller_name];
			number=1;
			destroy_flag=1;
			SetMKeyState(3);
		else
			number=-1;
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
		elseif (mode==7 or mode==8) then
			controller();
		elseif (mode==10) then
			push_mouse();
		elseif (mode==13) then
			AutoMakeAndDestroy()
		elseif (mode==14) then
			AutoBuyAndDestroy();
		end
		SetMKeyState(3);
    end
end
function push_mouse()
	PressAndReleaseMouseButton(1);
	Sleep(150);
end
function AutoMakeAndDestroy()
	if (destroy_flag==1) then
		maker();
		if (open==false) then
			destroy_flag=2
			open=true
		end
	elseif (destroy_flag==2) then
		Sleep(1000);
		PressAndReleaseKey("N");
		Sleep(2000);
		PressWithKey(shift,"f",100);
		Sleep(1000);
		Down();
		Sleep(500);
		number=times;
		destroy_flag=3;
		controller_name="AutoJingXuan";
		controller_table=controller_list[controller_name];
	elseif (destroy_flag==3) then
		controller();
		if (open==false) then
			PressWithKey(shift,"f",100);
			Sleep(500);
			open=true;
			number=1;
			controller_name="repair_equipment";
			controller_table=controller_list[controller_name];
			if (repair==true) then
				destroy_flag=4;
			else
				PressAndReleaseKey("N");
				Sleep(500);
				number=times;
				destroy_flag=1;
			end
		end
	elseif (destroy_flag==4) then
			controller();
		if (open==false) then
			PressAndReleaseKey("escape");
			Sleep(500);
			PressAndReleaseKey("N");
			Sleep(500);
			open=true;
			number=times;
			destroy_flag=1;
		end
	end
end

function AutoBuyAndDestroy()
	if (destroy_flag==1) then
		controller();
		if (open==false) then
			destroy_flag=2
			number=times;
			controller_name="AutoBuy_rare";
			controller_table=controller_list[controller_name];
			open=true
			Sleep(500)
		end
	elseif (destroy_flag==2) then
		controller();
		if (open==false) then
			destroy_flag=3
			number=times;
			controller_name="Destroy_yellow";
			controller_table=controller_list[controller_name];
			open=true
		end
	elseif (destroy_flag==3) then
		Sleep(500);
		PressAndReleaseKey("escape")
		Sleep(1000);
		PressWithKey(shift,"f",100);
		Sleep(1000);
		Down();
		Sleep(500);
		number=times;
		destroy_flag=4;
	elseif (destroy_flag==4) then
		controller();
		if (open==false) then
			PressWithKey(shift,"f",100);
			Sleep(500);
			open=true;
			controller_name="Buy_ring_from_npc"
			controller_table=controller_list[controller_name];
			number=1;
			destroy_flag=1;
		end
	end
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
		if (eat_food) then
			check_food();
		end
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
		if (mode==5 or mode==13) then
			number=number-1
		end
	end

end

function controller()
	
	if (flag==1) then
		n=table.getn(controller_table)
		i=1
		flag=2
	elseif (flag==2) then
		temp=controller_table[i]
		PressWithKey(nil,keytable[temp[1]],0)
		Sleep(temp[2]);
		if (i==n) then
			flag=1;
			if (number>0) then
				number=number-1;
			end
			i=0;
			if (number==0) then
				open=false;
				return
			end
		else
			i=i+1
		end
	end
end

function fisher()
	if (flag==1) then
		n=table.getn(fisher_table)
		i=1
		flag=2
	elseif (flag==2) then
		OutputLogMessage("number %d skill , %s\n",i, fisher_table[i])
		temp=skill_table[fisher_table[i]]
		if (temp==nil) then
			temp=fisher_table[i];
		end
		if (temp[2]~=nil) then
			PressWithKey(temp[1],temp[2],100)
		end
		Sleep(temp[3]);
		if (i==n) then
			flag=1
			i=0;
		else
			i=i+1
		end
	end
end
function check_food()
	time_now=GetRunningTime();
	if (food_end_time-time_now<=300000) then
		if (food_end_time<time_now) then
			food_end_time=time_now+food_time;
		else
			food_end_time=food_end_time+food_time;
		end
		OutputLogMessage("Check Food Time %d \n", time_now)
		Sleep(2500);
		PressAndReleaseKey("N");
		Sleep(2000);
		PressAndReleaseKey("N");
		Sleep(1000);
		PressWithKey(alt,"3",100);
		Sleep(2500);
	end
end
function PressWithKey(fKey,key,delay)
	if (fKey~=nil) then
		PressKey(fKey);
	end
	Sleep(delay);
	PressAndReleaseKey(key);
	Sleep(delay);
	if (fKey~=nil) then
		ReleaseKey(fKey);
	end
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

