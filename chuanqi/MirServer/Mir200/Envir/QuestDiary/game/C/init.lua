cfg_activity                        = require("Envir/QuestDiary/cfgcsv/cfg_activity.lua")
cfg_activity_leichong               = require("Envir/QuestDiary/cfgcsv/cfg_activity_leichong.lua")
cfg_mystery_store                   = require("Envir/QuestDiary/cfgcsv/cfg_mystery_store.lua")
cfg_rein                            = require("Envir/QuestDiary/cfgcsv/cfg_rein.lua")
cfg_shouchong                       = require("Envir/QuestDiary/cfgcsv/cfg_shouchong.lua")
cfg_map_npc                         = require("Envir/QuestDiary/cfgcsv/cfg_map_npc.lua")
cfg_deliver                         = require("Envir/QuestDiary/cfgcsv/cfg_deliver.lua")
cfg_hanghuijingji                   = require("Envir/QuestDiary/cfgcsv/cfg_hanghuijingji.lua")
cfg_sixiang                         = require("Envir/QuestDiary/cfgcsv/cfg_sixiang.lua")
cfg_kuangbao                        = require("Envir/QuestDiary/cfgcsv/cfg_kuangbao.lua")
cfg_vip                             = require("Envir/QuestDiary/cfgcsv/cfg_vip.lua")
cfg_sj                              = require("Envir/QuestDiary/cfgcsv/cfg_sj.lua")
cfg_huichengshi                     = require("Envir/QuestDiary/cfgcsv/cfg_huichengshi.lua")
cfg_zhanshi                         = require("Envir/QuestDiary/cfgcsv/cfg_zhanshi.lua")
cfg_sbk                             = require("Envir/QuestDiary/cfgcsv/cfg_sbk.lua")
cfg_map_xz                          = require("Envir/QuestDiary/cfgcsv/cfg_map_xz.lua")
cfg_libao                           = require("Envir/QuestDiary/cfgcsv/cfg_libao.lua")
cfg_Simplecompound                  = require("Envir/QuestDiary/cfgcsv/cfg_Simplecompound.lua")
cfg_shoubao                         = require("Envir/QuestDiary/cfgcsv/cfg_shoubao.lua")
cfg_quanfu_huishou                  = require("Envir/QuestDiary/cfgcsv/cfg_quanfu_huishou.lua")
cfg_gonglue                         = require("Envir/QuestDiary/cfgcsv/cfg_gonglue.lua")
cfg_leichong_mr                     = require("Envir/QuestDiary/cfgcsv/cfg_leichong_mr.lua")
cfg_leichong_tsleic                 = require("Envir/QuestDiary/cfgcsv/cfg_leichong_tsleic.lua")

require("Envir/QuestDiary/game/C/ZhuanSheng.lua")                       ---30000
require("Envir/QuestDiary/game/C/ShouChong.lua")                        ---30100
require("Envir/QuestDiary/game/C/ShangYeHuoDong1.lua")                  ---30200
require("Envir/QuestDiary/game/C/ShangYeHuoDong2.lua")                  ---30400
require("Envir/QuestDiary/game/C/MapMove.lua")                          ---30300
require("Envir/QuestDiary/game/C/Dalucs.lua")                           ---30500
require("Envir/QuestDiary/game/C/ShangYeHuoDong3.lua")                  ---30600
require("Envir/QuestDiary/game/C/ShangYeHuoDong4.lua")                  ---30700
require("Envir/QuestDiary/game/C/ShenShouZhiLi.lua")                    ---30800
require("Envir/QuestDiary/game/C/KuangBao.lua")                         ---30900
require("Envir/QuestDiary/game/C/VIP.lua")                              ---31000
require("Envir/QuestDiary/game/C/ShaJuan.lua")                          ---31100
require("Envir/QuestDiary/game/C/jichugongneng.lua")                    ---31200
require("Envir/QuestDiary/game/C/Fashion.lua")                          ---31300
require("Envir/QuestDiary/game/C/CastWar.lua")                          ---31400
require("Envir/QuestDiary/game/C/Shenlong.lua")                         ---31500
require("Envir/QuestDiary/game/C/Newranklist.lua")                      ---31600
require("Envir/QuestDiary/game/C/Jihuoma.lua")                          ---31700
require("Envir/QuestDiary/game/C/Hechengshenqi.lua")                    ---31800
require("Envir/QuestDiary/game/C/ShangYeHuoDong5.lua")                  ---32300
require("Envir/QuestDiary/game/C/ShangYeHuoDong6.lua")                  ---32400
require("Envir/QuestDiary/game/C/ShangYeHuoDong7.lua")                  ---32600

-- -------------------------------------------------------------------------------------
-- -------------------------------������ �ƺŲ��� ������----------------------------------
-- -------------------------------------------------------------------------------------

function QaQADDtite(actor,id,biao)  --����Զ���ƺ�
    local cfgch =  cfg_zhanshi
    id = tonumber(id)
    if id == nil or id == "" then
        LOGWrite("id=nil")
        return false
    end
    local chtab = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
	if tite_tab == nil then
		chtab = {[0]=0}
	else
		chtab = tite_tab
	end
    
    if chtab[id] ~= nil then
        if chtab[id] ~= id then
            LOGWrite("����id="..id.."chtab[id]="..chtab[id])
            return false
        end
        LOGWrite("�Ѵ��ڸóƺ�id="..id)
        return false
    end
	chtab[id] = id
    chtab = tbl2json(chtab)
    --LOGDump(json2tbl(chtab))
    setplayvar(actor, "HUMAN",biao,chtab,1)
    if cfgch[id]["leixing"] ~= 3 then   --1���ͳƺŵ������� 2����ʱװ����ƺŵ�������  3���Ͳ������� ����ֻΪչʾʹ��
        local att1 = {}
        local att2 = cfgch[id]["shuxing"]
        Player.updateSomeAddr(actor, att1, att2)
    end
    GameEvent.push(EventCfg.goADDFashion, actor,id,biao)
    return true
end

function QaQDeltite(actor,id,biao)  --ɾ���Զ���ƺ�
    id = tonumber(id)
    if id == nil or id == "" then
        LOGWrite("id=nil")
        return false
    end
    local chtab = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
	if tite_tab == nil then
        LOGWrite("�ƺ�tabΪnil")
        return false
    else
        chtab = tite_tab
	end
    if chtab[id] == nil then
        LOGWrite("δӵ�иóƺ�")
        return false
    end
	chtab[id] = nil
    chtab = tbl2json(chtab)
    --LOGDump(json2tbl(chtab))
    setplayvar(actor, "HUMAN",biao,chtab,1)
    if cfgch[id]["leixing"] ~= 3 then    --����3���Բ��ڴ˴�����
        local att1 = cfgch[id]["shuxing"]
        local att2 = {}
        Player.updateSomeAddr(actor, att1, att2)
    end
    return true
end

function QaQShowtite(actor,id,biao)  --��ʾ�Զ���ƺ�
    --LOGWrite("biao="..biao)

    local cfgch =  cfg_zhanshi
    local x = 0
    local y = 0
    local tx = 0
    id = tonumber(id)
    if id == nil or id == "" then
        LOGWrite("id=nil")
        return false
    end
    local chtab = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
	if tite_tab == nil then
        LOGWrite("biao:tabΪnil")
        return false
    else
        chtab = tite_tab
	end
    if chtab[id] == nil then
        LOGWrite("δӵ�иóƺ�")
        return false
    end
    
    if chtab[id] ~= id then
        return
    end
    if cfgch[id]["leixing"] == 1 then --�ƺ�λ��
        x = 30
        y = 80
        tx = cfgch[id]["id"]
    elseif cfgch[id]["leixing"] == 3 then --vipλ��
        x = 30
        y = 80
        tx = cfgch[id]["id"]
    elseif cfgch[id]["leixing"] == 2 then --vipλ��
        x = 30
        y = 80
        tx = cfgch[id]["moxing"]
    elseif cfgch[id]["leixing"] == 4 then --vipλ��
        x = 30
        y = 2
        tx = cfgch[id]["id"]
    end
    if chtab[0] ~= 0 then
        LOGWrite("��ֹ���Գ�������ж�µ�ǰ�ƺ�..�ӿڣ�QaQShuttite")
        return false
    end

    chtab[0] = id
    chtab = tbl2json(chtab)
    setplayvar(actor, "HUMAN",biao,chtab,1)
    local tite_tab = json2tbl(getplayvar(actor,biao))

	if cfgch[id]["leixing"] == 2 then    --����Ϊʱװʱ ���ϼ�����
        local xx = linkbodyitem(actor,17)
        if xx ~= "0" then
            changeitemshape(actor,xx,cfgch[id]["moxing"])
        end
    else 
        if cfgch[id]["leixing"] ~= 4 then --- �㼣���ƶ�����·�д���
            playeffect(actor,tx,x,y,0,0,0)
        end
    end
    GameEvent.push(EventCfg.goADDFashion, actor,id,biao)
    return true
end

function QaQShuttite(actor,biao)  --ж�µ�ǰ�Զ���ƺ�
    local cfgch =  cfg_zhanshi
    local chtab = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
	if tite_tab == nil then
        LOGWrite("�ƺ�tabΪnil")
        return false
    else
        chtab = tite_tab
	end

    if chtab[0] == 0 then
        LOGWrite("��ǰδ����ƺ�")
        return false
    end
    
	if cfgch[chtab[0]]["leixing"] == 2 then    --����Ϊʱװʱ 
        local xx = linkbodyitem(actor,17)
        if xx ~= "0" then
            changeitemshape(actor,xx,0)
        end
    else
        if biao ~= "C_QsQFashionfoot" then ---�㼣���ƶ�����·�д���
            clearplayeffect(actor,cfgch[chtab[0]]["id"])
        end 
    end

    chtab[0] = 0
    chtab = tbl2json(chtab)
    setplayvar(actor, "HUMAN",biao,chtab,1)
    GameEvent.push(EventCfg.goADDFashion, actor,chtab[0],biao)
    return true
end

function QaQIsPliaertite(actor,biao)  --��ȡ��ǰ�Զ���ƺ�
    local num = 0
    local chtab = {}
    local tite_tab = json2tbl(getplayvar(actor,biao))
	if tite_tab == nil then
        LOGWrite("�ƺ�tabΪnil")
        return false
    else
        chtab = tite_tab
	end

    if chtab[0] ~= 0 then
        num = chtab[0]
    end
    return num
end

function QaQRunWalk(actor,num) -- 0�ܲ� 1��·
    local tite_tab = json2tbl(getplayvar(actor,"C_QsQFashionfoot"))
    if tite_tab ~= nil then
        if tite_tab[0] ~= nil then
            if tite_tab[0] ~= 0 then
                if num == 0 then
                    delaygoto(actor,300,"qsqfootshow",1)
                else
                    delaygoto(actor,1500,"qsqfootshow",1)
                end
            end
        end
    end
end

function qsqfootshow(actor)
    local cfgch =  cfg_zhanshi
    local tite_tab = json2tbl(getplayvar(actor,"C_QsQFashionfoot"))

    local tx = cfgch[tite_tab[0]]["id"]
    local mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    local id = getbaseinfo(actor, ConstCfg.gbase.id)
    local px = getbaseinfo(actor, ConstCfg.gbase.x)
    local py = getbaseinfo(actor, ConstCfg.gbase.y)
    mapeffect(id,mapid,px,py,tx,1,0)
end

-- -------------------------------------------------------------------------------------
-- -------------------------------������ 31����Ʒ���� ������----------------------------------
-- -------------------------------------------------------------------------------------

function stdmodefunc8002(actor,item)  --Anicount = 8002  StdMode =31
    --LOGPrint("ʹ�õ���21")
    recharge(actor, 50, 7,7)
end

function stdmodefunc99(actor,item)  --�������ʯ
    local cfg = cfg_map_xz
    local mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    for i=1,#cfg do
        if mapid == cfg[i]["suiji"] then  --��ֹʹ�����
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ֹʹ�����</font>","Type":9}')
            stop(actor)
            return
        end
    end
    map(actor,mapid)
end

function stdmodefunc1(actor,item)  --�˳Ǵ���ʯ
    local cfg = cfg_map_xz
    local mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
    for i=1,#cfg do
        if mapid == cfg[i]["huicheng"] then  --��ֹʹ�����
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ֹʹ�ûس�</font>","Type":9}')
            stop(actor)
            return
        end
    end
    if cfg_huichengshi[mapid] ~= nil then
        mapmove(actor,cfg_huichengshi[mapid]["Id"],cfg_huichengshi[mapid]["npc"],cfg_huichengshi[mapid]["npcidx"])
    else
        mapmove(actor,"3",333,333)
    end
end

function stdmodefunc2231(actor,item)  --������ϴ��
    local item_num = getbaseinfo(actor, ConstCfg.gbase.pkvalue)
    if item_num <= 60 then
        setbaseinfo(actor, ConstCfg.sbase.pkvalue,0)
    else
        local num = item_num - 60
        setbaseinfo(actor, ConstCfg.sbase.pkvalue,num)
    end
end

function stdmodefunc1001(actor,item)  --�ƺŵ���
    
    local cfgch =  cfg_zhanshi
    local id = 0
    local type = 0
    local biao = ""

    local item_id = getiteminfo(actor, item, ConstCfg.iteminfo.idx)
    local name = getstditeminfo(item_id, ConstCfg.stditeminfo.name)
    for i=1,#cfgch do
        if name == cfgch[i]["mingzi"] then
            id = i
            type = cfgch[i]["leixing"]
            break
        end
    end
    if id == 0 then
        stop(actor)
        return
    end

    if type == 1 then
        biao = "C_QsQFashiontite"
    elseif type == 2 then
        biao = "C_QsQFashionweapon"
    elseif type == 3 then
        biao = "C_QsQFashiontite"
    elseif type == 4 then
        biao = "C_QsQFashionfoot"
    end

    local tite_tab = json2tbl(getplayvar(actor,biao))
    if tite_tab ~= nil then
        if tite_tab[id] ~= nil then
            sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>ʹ��ʧ��</font>","Type":9}')
            stop(actor)
            return
        end
    end

    QaQADDtite(actor,id,biao)
    if QaQIsPliaertite(actor,biao) == 0 then
        QaQShowtite(actor,id,biao)
    else
        QaQShuttite(actor,biao)
        QaQShowtite(actor,id,biao)
    end 
    
end