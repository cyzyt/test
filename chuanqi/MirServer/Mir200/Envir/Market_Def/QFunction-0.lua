-- QF����ļ� ��m2����ʱ��ͻ����
math.randomseed(tostring(os.time()):reverse():sub(1, 7))

local _, errinfo = pcall(function()
  require("Envir/3rd/log/Logger.lua")
  require("Envir/Extension/LuaLibrary/string.lua")
  require("Envir/Extension/LuaLibrary/table.lua")

  --��չ
  require("Envir/Extension/Function/Function.lua")
  require("Envir/Extension/Utilserver/Bag.lua")
  require("Envir/Extension/Utilserver/Player.lua")
  require("Envir/Extension/Utilserver/Item.lua")

  --����
  require("Envir/QuestDiary/config/VarCfg.lua")
  require("Envir/QuestDiary/config/EventCfg.lua")
  require("Envir/QuestDiary/config/ConstCfg.lua")
  require("Envir/QuestDiary/config/ModuleCfg.lua")
  ssrResponseCfg = require("Envir/QuestDiary/config/ResponseCfg.lua")
  cfg_Fuhuo      = require("Envir/QuestDiary/cfgcsv/cfg_Fuhuo.lua")

  --����
  ssrNetMsgCfg   = require("Envir/QuestDiary/net/NetMsgCfg.lua")
  require("Envir/QuestDiary/net/Message.lua")

  --ͨ��ģ��
  require("Envir/QuestDiary/util/util.lua")
  require("Envir/QuestDiary/util/GameEvent.lua")
  require("Envir/QuestDiary/game/Global.lua")
  require("Envir/QuestDiary/game/Die.lua")

  --��ʼ������ģ��
  require("Envir/QuestDiary/game/A/init.lua")
  require("Envir/QuestDiary/game/B/init.lua")
  require("Envir/QuestDiary/game/C/init.lua")
  require("Envir/QuestDiary/game/D/init.lua")

  -- require("Envir/QuestDiary/game/GM.lua")
  require("Envir/QuestDiary/game/GMBox.lua")
end)

if errinfo then release_print("��ʼ��QFunction-0.lua", errinfo) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--��������
function startup()
  math.randomseed(tostring(os.time()):reverse():sub(1, 7))
  GameEvent.push(EventCfg.onStartUp)
end

release_print("login,���� ")
--��¼
function login(actor)
  --��½���͵����ǰ�ȫ��
  mapmove(actor, 3, 333, 333, 5)
  release_print("login,mapmove ")

  local level = getbaseinfo(actor, ConstCfg.gbase.level)
  setplaydef(actor, VarCfg.N_cur_level, level)
  --���˱�������
  GameEvent.push(EventCfg.goPlayerVar, actor)
  --��һ�ε�¼
  local isnewhuman = getbaseinfo(actor, ConstCfg.gbase.isnewhuman)
  if isnewhuman then
    GameEvent.push(EventCfg.onNewHuman, actor)
    --�������κ�
    setsndaitembox(actor, 1)
    --��ɫ����ʱ��
    setplaydef(actor, VarCfg.U_create_actor_time, os.time())
    --��ɫ����ʱ�ѿ���������
    local openday = grobalinfo(ConstCfg.global.openday)
    setplaydef(actor, VarCfg.U_create_actor_openday, openday)
    --�ֿ����
    changestorage(actor, ConstCfg.warehousecellnum)
    --��������
    setbagcount(actor, ConstCfg.bagcellnum)
    local job = getbaseinfo(actor, ConstCfg.gbase.job)
    --���ε�½��Ӽ���
    for _, skill_id in ipairs(ConstCfg.first_login_addskill[job] or {}) do
      addskill(actor, skill_id, 0)
    end
  end
  --��¼
  GameEvent.push(EventCfg.onLogin, actor)
  --��¼��������
  local loginattrs = {}
  GameEvent.push(EventCfg.onLoginAttr, actor, loginattrs)
  Player.updateAddr(actor, loginattrs)
  --��¼���
  local logindatas = {}
  GameEvent.push(EventCfg.onLoginEnd, actor, logindatas)
  Message.sendmsg(actor, ssrNetMsgCfg.sync, nil, nil, nil, logindatas)
end

--�л��ʼ��
function loadguild(actor, guildobj)
  guildobj = guildobj or getmyguild(actor)
  if guildobj == "0" then return end
  GameEvent.push(EventCfg.onLoadGuild, actor, guildobj)
end

--���з��͸�����˵�������Ϣ����
function handlerequest(actor, msgid, arg1, arg2, arg3, sMsg)
  if msgid == ssrNetMsgCfg.sync then
    login(actor)
    return
  end
  local result, errinfo = pcall(Message.dispatch, actor, msgid, arg1, arg2, arg3, sMsg)
  if not result then
    local name = getbaseinfo(actor, ConstCfg.gbase.name)
    local msgName = ssrNetMsgCfg[msgid]
    local err = "������Ϣ�ɷ�������ϢID=" .. msgid .. "  ��ϢName=" .. msgName .. "   "
    release_print(name, err, errinfo, arg1, arg2, arg3, sMsg)
  end
end

--�����ͼɱ������
function killmon(actor, monobj)
  local monidx = getbaseinfo(monobj, ConstCfg.gbase.idx)
  GameEvent.push(EventCfg.onKillMon, actor, monobj, monidx)
  reddot(actor, 102, "btn_icon_2", 15, 15, 0, "res/public/btn_npcfh_04.png")
  release_print("123")
end

--ɱ������ʱ����
--actor		��������
--play		��ɱ���
function killplay(actor, play)
  GameEvent.push(EventCfg.onkillplay, actor, play)
end

--��ɫ��װ��
function takeonex(actor, itemobj, where, itemname, makeid)
  GameEvent.push(EventCfg.onTakeOnEx, actor, itemobj, where, itemname, makeid)
end

--��ɫ��װ��ǰ
function takeonbeforeex(actor, itemobj)
  return true
end

--��ɫ��װ��ǰ
function takeoffbeforeex(actor, itemobj)
end

--��ȡ������Ʒ�󴥷�
function pickupitemex(actor, itemobj)
  GameEvent.push(EventCfg.goPickUpItemEx, actor, itemobj)
end

--NPC�������
function clicknpc(actor, npcid)
  local npcobj = getnpcbyindex(npcid)
  GameEvent.push(EventCfg.onClicknpc, actor, npcid, npcobj)
end

--����
function playlevelup(actor)
  local before_level = getplaydef(actor, VarCfg.N_cur_level)
  local cur_level = getbaseinfo(actor, ConstCfg.gbase.level)
  setplaydef(actor, VarCfg.N_cur_level, cur_level)
  GameEvent.push(EventCfg.onPlayLevelUp, actor, cur_level, before_level)
end

--С�˴���
function playreconnection(actor)
  GameEvent.push(EventCfg.onExitGame, actor)
end

--������رտͻ��˴���
function playoffline(actor)
  GameEvent.push(EventCfg.onExitGame, actor)
end

--��ֵ
function recharge(actor, gold, productid, moneyid)
  GameEvent.push(EventCfg.onRecharge, actor, gold, productid, moneyid)
end

--������װ��---
function takeoffex(actor, itemobj, where, itemname, makeid)
  if getplaydef(actor, VarCfg.Die_Flag) == 1 then --������װ��
    local dropinfo = getplaydef(actor, VarCfg.Die_Drop_item)
    if dropinfo == "" then
      dropinfo = itemname
    else
      dropinfo = dropinfo .. "��" .. itemname
    end
    setplaydef(actor, VarCfg.Die_Drop_item, dropinfo)
  end
  GameEvent.push(EventCfg.onTakeOffEx, actor, itemobj, where, itemname, makeid)
end

--���ﴩװ��----
function takeonex(actor, itemobj, where, itemname, makeid)
  GameEvent.push(EventCfg.onTakeOnEx, actor, itemobj, where, itemname, makeid)
end

--�����������
--Target	    �ܻ�����
--Hiter			��������
--MagicId		����ID
function attack(actor, Target, Hiter, MagicId)
end

--��������
function crittrigger(actor, attack, damage, MagicId)
  return damage
end

function beginmagic(actor, maigicID, magicName, hiter, x, y)
end

---����ǰ����
--actor	object	�ܻ�����
--Target	object	�ܻ�����
--Hiter	    object	��������
--MagicId	int	    ����ID
--Damage	int	    �˺�
--model	    int	    0-������1-������2-��
--result	int	    ����ֵ���޸ĺ���˺�
function attackdamage(actor, Target, Hiter, MagicId, Damage, model)
  return Damage
end

--��Ʒ������
function addbag(actor, itemobj)
  if not actor then return end
  GameEvent.push(EventCfg.onAddBag, actor, itemobj)
end

--�л���ͼ
function entermap(actor)
  local former_mapid = getplaydef(actor, VarCfg.S_cur_mapid)
  local cur_mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
  if cur_mapid ~= former_mapid then --�л��˵�ͼ
    setplaydef(actor, VarCfg.S_cur_mapid, cur_mapid)
    GameEvent.push(EventCfg.goSwitchMap, actor, cur_mapid, former_mapid)
  else
    GameEvent.push(EventCfg.goEnterMap, actor, cur_mapid)
  end
end

--����֮ǰ����
function nextdie(actor)
  local isrevive = Die.setFlag(actor)
  setplaydef(actor, VarCfg.Die_Flag, isrevive and 0 or 1)
  return false
end

--��������
function playdie(actor, hiter)
  Die.OpenUI(actor, hiter)
  --�ʼ���ʾ
  local uid = getbaseinfo(actor, ConstCfg.gbase.id)
  local time = os.date("%Y-%m-%d %H:%M:%S", os.time())
  local map_title = getbaseinfo(actor, ConstCfg.gbase.map_title)
  local x, y = getbaseinfo(actor, ConstCfg.gbase.x), getbaseinfo(actor, ConstCfg.gbase.y)
  local hitername = getbaseinfo(hiter, ConstCfg.gbase.name)
  local dropinfo = getplaydef(actor, VarCfg.Die_Drop_item)
  setplaydef(actor, VarCfg.Die_Drop_item, "")
  setplaydef(actor, VarCfg.Die_Flag, 0)
  if dropinfo == "" then --û����Ʒ
    FSendmail(uid, cfg_Fuhuo[1].Mail[2], time, map_title, x, y, hitername)
  else
    FSendmail(uid, cfg_Fuhuo[1].Mail[1], time, map_title, x, y, hitername, dropinfo)
  end
end

function changehumnameok(actor)
  local name = getbaseinfo(actor, ConstCfg.gbase.name)
  setplayvar(actor, "HUMAN", "C_QsQkeyname", name, 1)
end

--����
function triggerchat(actor, sMsg, chat)
  GameEvent.push(EventCfg.onTriggerChat, actor, sMsg, chat)
end

--ɳ�Ϳ˽��ʹ��߲�����
function mapeventwalk(actor) --���ǿ��� �ڹ����������ƶ�����
  GameEvent.push(EventCfg.gomapeventwalk, actor)
end

--�����ս
function ontimerex21()
  Playyydz.countdown()
end

--���Ҷ�
function ontimerex22()
  Playdld.countdown()
end

--���а�ˢ��
function ontimerex23()
end

--���ǽ�����ʱ����
function ontimerex24()
  GameEvent.push(EventCfg.goCastlewarend)
  setofftimerex(24)
end

--�����ָ
function ontimer20001(actor)
  Die.countdown(actor)
end

--���ǿ�ʼ����
function castlewarstart()
  sendmsg(nil, 2,
    '{"Msg":"ɳ�����Ի�ѿ���������","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
  sendmsg(nil, 2,
    '{"Msg":"ɳ�����Ի�ѿ���������","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
  sendmsg(nil, 2,
    '{"Msg":"ɳ�����Ի�ѿ���������","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
  GameEvent.push(EventCfg.gocastlewarstart)
end

--���ǽ�������
function castlewarend()
  setontimerex(24, 2)
end

--ռ��ɳ�Ϳ˴���
function getcastle0()
end
