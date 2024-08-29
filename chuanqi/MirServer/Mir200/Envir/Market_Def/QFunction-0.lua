-- QF入口文件 当m2启动时候就会加载
math.randomseed(tostring(os.time()):reverse():sub(1, 7))

local _, errinfo = pcall(function()
  require("Envir/3rd/log/Logger.lua")
  require("Envir/Extension/LuaLibrary/string.lua")
  require("Envir/Extension/LuaLibrary/table.lua")

  --扩展
  require("Envir/Extension/Function/Function.lua")
  require("Envir/Extension/Utilserver/Bag.lua")
  require("Envir/Extension/Utilserver/Player.lua")
  require("Envir/Extension/Utilserver/Item.lua")

  --配置
  require("Envir/QuestDiary/config/VarCfg.lua")
  require("Envir/QuestDiary/config/EventCfg.lua")
  require("Envir/QuestDiary/config/ConstCfg.lua")
  require("Envir/QuestDiary/config/ModuleCfg.lua")
  ssrResponseCfg = require("Envir/QuestDiary/config/ResponseCfg.lua")
  cfg_Fuhuo      = require("Envir/QuestDiary/cfgcsv/cfg_Fuhuo.lua")

  --网络
  ssrNetMsgCfg   = require("Envir/QuestDiary/net/NetMsgCfg.lua")
  require("Envir/QuestDiary/net/Message.lua")

  --通用模块
  require("Envir/QuestDiary/util/util.lua")
  require("Envir/QuestDiary/util/GameEvent.lua")
  require("Envir/QuestDiary/game/Global.lua")
  require("Envir/QuestDiary/game/Die.lua")

  --初始化个人模块
  require("Envir/QuestDiary/game/A/init.lua")
  require("Envir/QuestDiary/game/B/init.lua")
  require("Envir/QuestDiary/game/C/init.lua")
  require("Envir/QuestDiary/game/D/init.lua")

  -- require("Envir/QuestDiary/game/GM.lua")
  require("Envir/QuestDiary/game/GMBox.lua")
end)

if errinfo then release_print("初始化QFunction-0.lua", errinfo) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--引擎启动
function startup()
  math.randomseed(tostring(os.time()):reverse():sub(1, 7))
  GameEvent.push(EventCfg.onStartUp)
end

release_print("login,加载 ")
--登录
function login(actor)
  --登陆传送到土城安全区
  mapmove(actor, 3, 333, 333, 5)
  release_print("login,mapmove ")

  local level = getbaseinfo(actor, ConstCfg.gbase.level)
  setplaydef(actor, VarCfg.N_cur_level, level)
  --个人变量声明
  GameEvent.push(EventCfg.goPlayerVar, actor)
  --第一次登录
  local isnewhuman = getbaseinfo(actor, ConstCfg.gbase.isnewhuman)
  if isnewhuman then
    GameEvent.push(EventCfg.onNewHuman, actor)
    --开启首饰盒
    setsndaitembox(actor, 1)
    --角色创建时间
    setplaydef(actor, VarCfg.U_create_actor_time, os.time())
    --角色创建时已开服的天数
    local openday = grobalinfo(ConstCfg.global.openday)
    setplaydef(actor, VarCfg.U_create_actor_openday, openday)
    --仓库格子
    changestorage(actor, ConstCfg.warehousecellnum)
    --背包格子
    setbagcount(actor, ConstCfg.bagcellnum)
    local job = getbaseinfo(actor, ConstCfg.gbase.job)
    --初次登陆添加技能
    for _, skill_id in ipairs(ConstCfg.first_login_addskill[job] or {}) do
      addskill(actor, skill_id, 0)
    end
  end
  --登录
  GameEvent.push(EventCfg.onLogin, actor)
  --登录附加属性
  local loginattrs = {}
  GameEvent.push(EventCfg.onLoginAttr, actor, loginattrs)
  Player.updateAddr(actor, loginattrs)
  --登录完成
  local logindatas = {}
  GameEvent.push(EventCfg.onLoginEnd, actor, logindatas)
  Message.sendmsg(actor, ssrNetMsgCfg.sync, nil, nil, nil, logindatas)
end

--行会初始化
function loadguild(actor, guildobj)
  guildobj = guildobj or getmyguild(actor)
  if guildobj == "0" then return end
  GameEvent.push(EventCfg.onLoadGuild, actor, guildobj)
end

--所有发送给服务端的网络消息触发
function handlerequest(actor, msgid, arg1, arg2, arg3, sMsg)
  if msgid == ssrNetMsgCfg.sync then
    login(actor)
    return
  end
  local result, errinfo = pcall(Message.dispatch, actor, msgid, arg1, arg2, arg3, sMsg)
  if not result then
    local name = getbaseinfo(actor, ConstCfg.gbase.name)
    local msgName = ssrNetMsgCfg[msgid]
    local err = "网络消息派发错误：消息ID=" .. msgid .. "  消息Name=" .. msgName .. "   "
    release_print(name, err, errinfo, arg1, arg2, arg3, sMsg)
  end
end

--任意地图杀死怪物
function killmon(actor, monobj)
  local monidx = getbaseinfo(monobj, ConstCfg.gbase.idx)
  GameEvent.push(EventCfg.onKillMon, actor, monobj, monidx)
  reddot(actor, 102, "btn_icon_2", 15, 15, 0, "res/public/btn_npcfh_04.png")
  release_print("123")
end

--杀死人物时触发
--actor		触发对象
--play		被杀玩家
function killplay(actor, play)
  GameEvent.push(EventCfg.onkillplay, actor, play)
end

--角色穿装备
function takeonex(actor, itemobj, where, itemname, makeid)
  GameEvent.push(EventCfg.onTakeOnEx, actor, itemobj, where, itemname, makeid)
end

--角色穿装备前
function takeonbeforeex(actor, itemobj)
  return true
end

--角色脱装备前
function takeoffbeforeex(actor, itemobj)
end

--捡取任意物品后触发
function pickupitemex(actor, itemobj)
  GameEvent.push(EventCfg.goPickUpItemEx, actor, itemobj)
end

--NPC点击触发
function clicknpc(actor, npcid)
  local npcobj = getnpcbyindex(npcid)
  GameEvent.push(EventCfg.onClicknpc, actor, npcid, npcobj)
end

--升级
function playlevelup(actor)
  local before_level = getplaydef(actor, VarCfg.N_cur_level)
  local cur_level = getbaseinfo(actor, ConstCfg.gbase.level)
  setplaydef(actor, VarCfg.N_cur_level, cur_level)
  GameEvent.push(EventCfg.onPlayLevelUp, actor, cur_level, before_level)
end

--小退触发
function playreconnection(actor)
  GameEvent.push(EventCfg.onExitGame, actor)
end

--大退与关闭客户端触发
function playoffline(actor)
  GameEvent.push(EventCfg.onExitGame, actor)
end

--充值
function recharge(actor, gold, productid, moneyid)
  GameEvent.push(EventCfg.onRecharge, actor, gold, productid, moneyid)
end

--人物脱装备---
function takeoffex(actor, itemobj, where, itemname, makeid)
  if getplaydef(actor, VarCfg.Die_Flag) == 1 then --死亡爆装备
    local dropinfo = getplaydef(actor, VarCfg.Die_Drop_item)
    if dropinfo == "" then
      dropinfo = itemname
    else
      dropinfo = dropinfo .. "，" .. itemname
    end
    setplaydef(actor, VarCfg.Die_Drop_item, dropinfo)
  end
  GameEvent.push(EventCfg.onTakeOffEx, actor, itemobj, where, itemname, makeid)
end

--人物穿装备----
function takeonex(actor, itemobj, where, itemname, makeid)
  GameEvent.push(EventCfg.onTakeOnEx, actor, itemobj, where, itemname, makeid)
end

--玩家物理攻击后
--Target	    受击对象
--Hiter			攻击对象
--MagicId		技能ID
function attack(actor, Target, Hiter, MagicId)
end

--暴击触发
function crittrigger(actor, attack, damage, MagicId)
  return damage
end

function beginmagic(actor, maigicID, magicName, hiter, x, y)
end

---攻击前触发
--actor	object	受击对象
--Target	object	受击对象
--Hiter	    object	攻击对象
--MagicId	int	    技能ID
--Damage	int	    伤害
--model	    int	    0-正常，1-暴击，2-格挡
--result	int	    返回值，修改后的伤害
function attackdamage(actor, Target, Hiter, MagicId, Damage, model)
  return Damage
end

--物品进背包
function addbag(actor, itemobj)
  if not actor then return end
  GameEvent.push(EventCfg.onAddBag, actor, itemobj)
end

--切换地图
function entermap(actor)
  local former_mapid = getplaydef(actor, VarCfg.S_cur_mapid)
  local cur_mapid = getbaseinfo(actor, ConstCfg.gbase.mapid)
  if cur_mapid ~= former_mapid then --切换了地图
    setplaydef(actor, VarCfg.S_cur_mapid, cur_mapid)
    GameEvent.push(EventCfg.goSwitchMap, actor, cur_mapid, former_mapid)
  else
    GameEvent.push(EventCfg.goEnterMap, actor, cur_mapid)
  end
end

--死亡之前触发
function nextdie(actor)
  local isrevive = Die.setFlag(actor)
  setplaydef(actor, VarCfg.Die_Flag, isrevive and 0 or 1)
  return false
end

--死亡触发
function playdie(actor, hiter)
  Die.OpenUI(actor, hiter)
  --邮件提示
  local uid = getbaseinfo(actor, ConstCfg.gbase.id)
  local time = os.date("%Y-%m-%d %H:%M:%S", os.time())
  local map_title = getbaseinfo(actor, ConstCfg.gbase.map_title)
  local x, y = getbaseinfo(actor, ConstCfg.gbase.x), getbaseinfo(actor, ConstCfg.gbase.y)
  local hitername = getbaseinfo(hiter, ConstCfg.gbase.name)
  local dropinfo = getplaydef(actor, VarCfg.Die_Drop_item)
  setplaydef(actor, VarCfg.Die_Drop_item, "")
  setplaydef(actor, VarCfg.Die_Flag, 0)
  if dropinfo == "" then --没爆物品
    FSendmail(uid, cfg_Fuhuo[1].Mail[2], time, map_title, x, y, hitername)
  else
    FSendmail(uid, cfg_Fuhuo[1].Mail[1], time, map_title, x, y, hitername, dropinfo)
  end
end

function changehumnameok(actor)
  local name = getbaseinfo(actor, ConstCfg.gbase.name)
  setplayvar(actor, "HUMAN", "C_QsQkeyname", name, 1)
end

--输入
function triggerchat(actor, sMsg, chat)
  GameEvent.push(EventCfg.onTriggerChat, actor, sMsg, chat)
end

--沙巴克进皇宫走步触发
function mapeventwalk(actor) --攻城开启 在攻城区域内移动触发
  GameEvent.push(EventCfg.gomapeventwalk, actor)
end

--异域大战
function ontimerex21()
  Playyydz.countdown()
end

--大乱斗
function ontimerex22()
  Playdld.countdown()
end

--排行榜刷新
function ontimerex23()
end

--攻城结束延时触发
function ontimerex24()
  GameEvent.push(EventCfg.goCastlewarend)
  setofftimerex(24)
end

--复活戒指
function ontimer20001(actor)
  Die.countdown(actor)
end

--攻城开始触发
function castlewarstart()
  sendmsg(nil, 2,
    '{"Msg":"沙城争霸活动已开启！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
  sendmsg(nil, 2,
    '{"Msg":"沙城争霸活动已开启！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
  sendmsg(nil, 2,
    '{"Msg":"沙城争霸活动已开启！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
  GameEvent.push(EventCfg.gocastlewarstart)
end

--攻城结束触发
function castlewarend()
  setontimerex(24, 2)
end

--占领沙巴克触发
function getcastle0()
end
