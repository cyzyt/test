KuangBao = {}
KuangBao.ID = 30900

local _cfgkb =  cfg_kuangbao
    
function KuangBao.RequestZS(actor)
    --LOGPrint("�����==KuangBao=="..id)
    
    local kbbiaoji = getplayvar(actor,"C_QsQkuangbao")
    if kbbiaoji == 1 then
        sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>���ѿ�����֮��</font>","Type":9}')
        return
    end
        
    local cfgxiaohao = _cfgkb[1]
    if cfgxiaohao.cost == nil then
        return
    end

    local name = Player.checkItemNumByTable(actor, cfgxiaohao.cost)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'..name..'����</font>","Type":9}')
        return
    end
    Player.takeItemByTable(actor, cfgxiaohao.cost)
    local att1 = {}
    local att2 = cfgxiaohao.shuxing
    Player.updateSomeAddr(actor, att1, att2)
    playeffect(actor,35013,20,-15,0,0,0)
    setplayvar(actor, "HUMAN","C_QsQkuangbao",1,1) 
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>�����ɹ�</font>","Type":9}')

    GameEvent.push(EventCfg.goKuangBao, actor)
end

Message.RegisterNetMsg(ssrNetMsgCfg.KuangBao, KuangBao)  --ע��

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------


local function _playerVar(actor)
    iniplayvar(actor, "integer", "HUMAN", "C_QsQkuangbao")
end

--1��ɱ�� 2������
local function _playerkillplay(actor, play)
    local mapguid = 0
    
    if not getbaseinfo(actor,-1) then return end
    if not getbaseinfo(play,-1) then return end
    local map = getbaseinfo(actor,3)
    local hournow = os.date("%H")        --��ȡ��ǰʱ�� 0-23
    hournow = tonumber(hournow)
    if hournow == 0 then --�����������
        hournow = 24
    end

    if hournow >= _cfgkb[1]["shijian"][1][1] or hournow <= _cfgkb[1]["shijian"][1][2] then
        return    --�ڹ涨ʱ����ֱ�ӷ���
    end
    
    for i=1,#_cfgkb[1]["mapid"][1] do
        if map == _cfgkb[1]["mapid"][1][i] then
            mapguid = 1
            break
        end
    end
    if getplayvar(play,"C_QsQkuangbao") == 1 then
        if mapguid == 0 then
            changemoney(actor,_cfgkb[1]["diaoluo"][1][1],"+",_cfgkb[1]["diaoluo"][1][2],"��ɱӵ�п�֮�����",true) --�������
            setplayvar(play, "HUMAN","C_QsQkuangbao",0,1)  --���� ȡ���񱩱��
            local cfgxiaohao = _cfgkb[1]
            local att1 = cfgxiaohao.shuxing
            local att2 = {}
            Player.updateSomeAddr(play, att1, att2)  --�۳�����
            clearplayeffect(play,35013)
        end
    end
end


GameEvent.add(EventCfg.goPlayerVar, _playerVar, KuangBao)
GameEvent.add(EventCfg.onkillplay, _playerkillplay, KuangBao)


--��¼��������  �����������Ը���  --��¼ʱ�Ὣ���Ա�������Ը��±��� Ȼ��ִ�����Ը��²���
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local kbbiaoji = getplayvar(actor,"C_QsQkuangbao")
    if kbbiaoji ~= 1 then return end
    local cfg = _cfgkb[1]["shuxing"]
    if not cfg then return end 
    playeffect(actor,35013,20,-15,0,0,0)
    table.insert(loginattrs, cfg)
end, KuangBao)

-- ----------------------------������ �ⲿ���� ������---------------------------------------
--��ȡ��ǰ�Ƿ�����
function KuangBao.isOpenKB(actor)
    local kbbiaoji = getplayvar(actor,"C_QsQkuangbao")
    return kbbiaoji == 1
end

return KuangBao