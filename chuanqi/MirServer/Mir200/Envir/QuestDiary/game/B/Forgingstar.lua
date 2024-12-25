Forgingstar = {}
Forgingstar.ID = 21500

Forgingstar._var_name_star = "NB_forgingstar_"           --星级变量前缀

Forgingstar._var_name_attr = "NB_forgingattr_"          --属性变量前缀

local _equipstarattr = {[1]=0, [3]=0, [4]=0, [9]=0, [10]=0}         --[基础属性]cfg_att_score表内配置的属性Idx:   [1]生命;[3],[4]攻击;[9],[10]防御;

local _var_name_tab = {}                    --星级变量名表

local _var_lv_tab = {}                      --星级变量值表

local _cfg = {}

local site_tab = {1,0,3,4,5,6,7,8,10,11} --装备位置表

for i, weizhi in ipairs(site_tab) do
    _var_name_tab[i] = Forgingstar._var_name_star..weizhi
    _var_lv_tab[i] = 0
end

local ratio = 10000 --表内配置比例

for k,v in ipairs(cfg_qianghua) do
    _cfg[v.weizhi] = _cfg[v.weizhi] or {}
    _cfg[v.weizhi][v.level] = _cfg[v.weizhi][v.level] or {}
    _cfg[v.weizhi][v.level] = {
        weizhi=v.weizhi,shuxingjiacheng=v.shuxingjiacheng,xiaohao=v.xiaohao,chenggonglv=v.chenggonglv,
        shuxing = v.shuxing,jianji = v.jianji,item = v.item,
    }
end

local _var_name_tab2 = {}                   --基础属性变量名表
for attridx,_ in pairs(_equipstarattr) do
    _var_name_tab2[attridx] = Forgingstar._var_name_attr..attridx
end

local function isTabEquip(where)
    local idx = 0
    for i, _weizhi in ipairs(site_tab) do
        if _weizhi == where then
            idx = i
            break
        end
    end
    return idx
end
-- -------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {ssrNetMsgCfg.Forgingstar_SyncResponse, 0,0,0,_var_lv_tab}
function Forgingstar.SyncResponse(actor,logindatas)
    for i = 1 ,#_var_name_tab do
        _var_lv_tab[i] = getplayvar(actor, _var_name_tab[i])
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_SyncResponse, 0,0,0,_var_lv_tab)
    end
end

--强星
function Forgingstar.RequestUpgradeStar(actor, weizhi, isLuck)
    if not _cfg[weizhi] then return end

    local idx = isTabEquip(weizhi)

    local lv = getplayvar(actor, _var_name_tab[idx])

    local next_lv = lv + 1

    local cfg = _cfg[weizhi]
    if not cfg[next_lv] then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>该位置已满星!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, lv)
        return
    end
    local name,num = Player.checkItemNumByTable(actor, cfg[next_lv].xiaohao)
    if name then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>材料不足!</font>","Type":9}')
        Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, lv)
        return
    end
    if isLuck == 1 then
        --幸运保底判断消耗
        --LOGDump(cfg[next_lv],"cfg[next_lv].item;")
        name,num = Player.checkItemNumByTable(actor, cfg[next_lv].item)
        if name then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>幸运保底材料不足!</font>","Type":9}')
            Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, lv)
            return
        end
    end
    if isLuck == 1 then
        --幸运保底判断消耗
        Player.takeItemByTable(actor, cfg[next_lv].item)
    end

    Player.takeItemByTable(actor, cfg[next_lv].xiaohao)

    if FProbabilityHit( cfg[next_lv].chenggonglv, ratio) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>强星失败!</font>","Type":9}')
        if isLuck ~= 1 then
            next_lv = lv - _cfg[weizhi][next_lv].jianji
        else
            next_lv =  lv
        end
    else
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#FFFF00\'>强星成功!</font>","Type":9}')
    end
    --写数据库
    FSetPlayVar(actor, _var_name_tab[idx], next_lv)
    if next_lv ~= lv then
        --刷新基础属性
        Forgingstar.updateEquipStarAttr(actor,weizhi)
        --刷新星级
        local cur_attr = cfg[lv] and cfg[lv].shuxing or nil
        local next_attr = cfg[next_lv] and cfg[next_lv].shuxing or nil
        Player.updateSomeAddr(actor, cur_attr, next_attr)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.Forgingstar_UpgradeStarResponse, weizhi, next_lv)
end
-- -------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--更新星级对于基础属性的加成
function Forgingstar.updateEquipStarAttr(actor,site)
    for attridx,_ in pairs(_equipstarattr) do
        _equipstarattr[attridx] = 0
    end
    for i,weizhi in ipairs(site_tab) do
        local itemobj = linkbodyitem(actor, weizhi)          --穿戴物品对象
        local level = getplayvar(actor, _var_name_tab[i])           --升星等级
        if itemobj ~= "0" and level > 0 then
            for attridx,_ in pairs(_equipstarattr) do
                local itemidx = getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
                local attrvalue = getstditematt(itemidx, attridx)
                if attrvalue > 0 then
                    local pro = _cfg[weizhi][level].shuxingjiacheng/ratio        --附加属性万分比
                    local addattrvalue = math.floor(attrvalue * pro)
                    if addattrvalue > 0 then
                        _equipstarattr[attridx] = _equipstarattr[attridx] + addattrvalue
                    end
                end
            end
        end
    end
    local cur_attr,next_attr = {},{}
    for attridx,addvalue in pairs(_equipstarattr) do
        table.insert(next_attr,{attridx,addvalue})
        if site then
             --穿脱装备/星级发生变化时调整属性
             local db_addvalue = getplayvar(actor,_var_name_tab2[attridx])
             table.insert(cur_attr,{attridx,db_addvalue})
        else
           --登陆赋予属性
           cur_attr = nil
        end
        FSetPlayVar(actor, _var_name_tab2[attridx], addvalue)
    end
    Player.updateSomeAddr(actor, cur_attr, next_attr)
end
-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--登陆触发
local function _onLoginEnd(actor,logindatas)
    local temp = {}
    for i ,var in ipairs(_var_name_tab) do
        table.insert(temp,var)
    end
    for attridx ,var in pairs(_var_name_tab2) do
        table.insert(temp,var)
    end
    temp = table.concat(temp, "|")
    FIniPlayVar(actor, temp)

    Forgingstar.SyncResponse(actor, logindatas)
    Forgingstar.updateEquipStarAttr(actor)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Forgingstar)

--穿装备
function _onTakeOnEx(actor, itemobj, where, itemname, makeid)
    local idx = isTabEquip(where)
    if idx ~= 0 then
        Forgingstar.updateEquipStarAttr(actor,where)
    end
end
GameEvent.add(EventCfg.onTakeOnEx, _onTakeOnEx, Forgingstar)

--脱装备
function _onTakeOffEx(actor, itemobj, where, itemname, makeid)
    local idx = isTabEquip(where)
    if idx ~= 0 then
        Forgingstar.updateEquipStarAttr(actor,where)
    end
end
GameEvent.add(EventCfg.onTakeOffEx, _onTakeOffEx, Forgingstar)

--登陆获取星级属性
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local level = 0
    for i = 1,#site_tab do
        level = getplayvar(actor, _var_name_tab[i])
        local weizhi = site_tab[i]
        if _cfg[weizhi][level] then
            --LOGDump(_cfg[weizhi][level].shuxing,site_tab[i])
            table.insert(loginattrs, _cfg[weizhi][level].shuxing)
        end
    end
end, Forgingstar)

Message.RegisterNetMsg(ssrNetMsgCfg.Forgingstar, Forgingstar)

return Forgingstar