-- local test = {}

-- function test.Request(actor,arg1)
--     arg1 = tonumber(arg1) + 1
--     release_print("���ͷ��˷���101����Ϣ", arg1)
--     -- sendluamsg(actor, 101, arg1)
--     Message.sendmsg(actor, ssrNetMsgCfg.test_Response, arg1)
-- end

-- Message.RegisterNetMsg(ssrNetMsgCfg.test, test)

-- --��½����
-- local function _onLogin(actor)
--     -- addbutton(actor, 101, 6, "<Img|y=275|x=35|id=kfgcdetail|img=private/main/Button_3/1900012059.png|a=4|link=@test_main>")
--     -- addbutton(actor, 101, 7, "<Img|y=330|x=35|id=kfgcdetail|img=private/main/Button_3/1900012059.png|a=4|link=@test_main2>")
-- end
-- GameEvent.add(EventCfg.onLogin, _onLogin, test)

-- function test_main2(actor)
--     callscript(actor, 'ϵͳ����Ա', '@GM')
-- end

-- function test_main(actor)
--     local itemobj = linkbodyitem(actor,1)
--     local itemjson = getitemjsonex(itemobj)
--     release_print("========================")
--     release_print(itemjson)
--     release_print("========================")
--     local ui = ""
--     ui = ui ..[[
--         <Img|a=0|x=0.0|y=0.0|width=600|height=400|scale9t=100|scale9r=220|img=public/bg_npc_11.jpg|scale9l=10|scale9b=100|bg=1|layerid=1000>
--         <Button|a=0|x=596.0|y=1.0|size=18|color=255|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
--         <Text|a=0|x=385.0|y=50.0|size=16|color=251|text=�Զ�����ľ����OK��|link=@takeonfunc1>
--         <Text|a=0|x=385.0|y=100.0|size=16|color=251|text=����OK������Ʒ������|link=@backbagfunc>
--         <Text|a=0|x=385.0|y=150.0|size=16|color=251|text=ɾ��OK������Ʒ|link=@delitemfunc>
--         <Text|a=0|x=385.0|y=200.0|size=16|color=251|text=��ȡok���ڵĶ�<$USERNAME>��|link=@getfunc>
--         <ITEMBOX|x=50.0|y=50.0|width=70|height=70|tips=<ֻ�ܷ���\����/FCOLOR=249>|boxindex=1|stdmode=*|tipsx=4|tipsy=100|img=public/1900000651_3.png>
--         <ItemShow|x=50.0|y=150.0|width=70|height=70|itemdata=]]..itemjson..[[|showtips=1|bgtype=1|color=250>
--         <Text|x=25.0|y=305.0|color=255|size=16|text=�Զ���װ����ΨһID<$USEITEM[1]>\װ����IDX<$USEITEMID[10]>,\װ��������<$USEITEMNAME[11]>\˵��:XX��ʾM2���õ��Զ���װ��λ��  ���� 71 72>
--         <Input|x=385.0|y=250.0|width=145|height=25|type=0|errortips=1|isNameInput=0|isChatInput=0|inputid=1|mincount=4|place=��������|maxcount=16|size=18|color=250|placecolor=255>
--         <Input|x=385.0|y=300.0|width=210|height=25|type=0|errortips=1|isNameInput=0|isChatInput=0|inputid=8|mincount=2|place=��������|maxcount=40|size=18|color=250|placecolor=255>
--         <MenuItem|id=hg1000012|x=385|y=350|width=200|outlinecolor=0|outline=1|menuid=S0|itemname=11#2#3#4#5|select=2|direction=0|fontcolor=243|selectcolor=210|fontsize=18|itemhei=30|link=@test_jump>
--     ]]
--     ui = parsetext(ui,actor)
--     say(actor,ui)
-- end

-- -- �Զ�����ľ����OK��
-- function takeonfunc1(actor)
--     bagitemintobox(actor,"ľ��",1)
-- end

-- -- ��ȡok���ڵĶ���
-- function getfunc(actor)
--     local itemobj = getboxitem(actor,1)
--     release_print("ok��1",itemobj)
--     local itemidx = getiteminfo(actor,itemobj,2)
--     local itemName = getstditeminfo(itemidx,1) or "nil"
--     local itemMakeIndex = getiteminfo(actor,itemobj,1)
--     release_print("��Ʒ���ڵ���",itemName,itemMakeIndex)
--     -- local tbl = {
--     --     ["abil"] = {
--     --         {
--     --             ["i"] = 0,
--     --             ["t"] = "[�Ǽ�����]\\<IMG:3>\\�Ǽ�:555",
--     --             ["c"] = 251,
--     --             ["v"] = {
--     --                 {0,3,1,0,1,0,1},
--     --                 {0,4,1,0,1,0,2},
--     --                 {0,5,1,0,9,2,3},
--     --                 {0,6,1,0,9,2,4},
--     --                 {0,6,1,0,9,2,4},
--     --                 {0,7,1,0,10,3,5},
--     --                 {0,8,1,0,10,3,6},
--     --                 {0,25,0,1,2,4,7},
--     --             },
--     --         },
--     --     },
--     --     ["name"] = itemName .. "[���� + 1]",
--     -- }
--     -- setitemcustomabil(actor,itemobj,tbl2json(tbl))
--     -- refreshitem(actor,itemobj)

--     index = index and index + 1 or 1
--     changeitemname(actor,-2,"����Ч" .. index,itemobj)

--     setitemeffect(actor,-2,6307,6063,nil,nil,itemobj)

--     -- updateboxitem(actor,1)
--     -- callscriptex(actor,"UpDateBoxItem",1)
-- end

-- -- �˵�������
-- function test_jump(actor, ...)
--     release_print("test_jump,npc", getbaseinfo(actor, 1), ...,getplaydef(actor,"S0"))
-- end


-- -- ����OK������Ʒ������
-- function backbagfunc(actor)
--     returnboxitem(actor,1)
-- end

-- GameEvent.add(EventCfg.onTriggerChat, function (actor, sMsg, chat)

-- end,test)

-- return test