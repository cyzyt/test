Ronglu = {}
Ronglu.ID = 21200

local _cfg_items = {}

local ratio = 100 --百分比

local _var_flag_auto_equip       = 201       --自动熔炼装备标识

local _vip_level = 0

local _var_name = "NB_ronglu_checkItem"                             --回收勾选变量名前缀

local _var_name_tab = {}                                            --回收勾选变量名表

local _var_check_info = {}                                          --回收勾选表

local _all_var_name = {}                                            --所有需要登陆初始化的自定义变量名

for i,v in ipairs(cfg_fenjie) do
    if v.type == 2 then
        _cfg_items[v.equipid] = {
            type = v.type,equipid = v.equipid,itemid = v.itemid,harvest = v.harvest,
            beizhu = v.beizhu,condition = v.condition,txt = v.txt,leixing = v.leixing
        }
        if not _var_name_tab[v.leixing] then
            _var_name_tab[v.leixing] = {ischoice = _var_name .."_ischoice_"..v.leixing}
            _var_check_info[v.leixing] = {ischoice = 0}
            table.insert(_all_var_name,_var_name_tab[v.leixing].ischoice)
        end
        _var_name_tab[v.leixing][v.equipid] = _var_name .."_"..v.equipid
        _var_check_info[v.leixing][v.equipid] = 0
        table.insert(_all_var_name,_var_name_tab[v.leixing][v.equipid])
    end
end

local _setDataType = {
    ["mainCheck"] = 0,              --主面板勾选
    ["secondaryCheck"] = 1,         --副面版勾选
    ["allCheck"] = 3,               --副面版全选/全不选
}
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {ssrNetMsgCfg.Ronglu_SyncResponse,0,0,0,_var_check_info}
function Ronglu.SyncResponse(actor, logindatas)
    _vip_level = getplayvar(actor,VarCfg.C_QsQVIP)
    _login_data[2] = getflagstatus(actor, _var_flag_auto_equip)
    _login_data[3] = cfg_vip[_vip_level] and cfg_vip[_vip_level].ronglian or 0

    for i, v in ipairs(_var_name_tab) do
        for key, var_name in pairs(v) do
            _var_check_info[i][key] = getplayvar(actor, var_name)
        end
    end
    if logindatas then
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.Ronglu_SyncResponse, _login_data[2],_login_data[3],0,_var_check_info)
    end
end

--勾选自动回收装备
function Ronglu.RequestAuto(actor, auto_state)
    setflagstatus(actor, _var_flag_auto_equip,auto_state)
    Message.sendmsg(actor, ssrNetMsgCfg.Ronglu_AutoResponse, auto_state)
end

local function Ronglu_deleitem(actor,makeindex)
    if not tonumber(makeindex) then return true end
    local isHas = hasitem(actor,makeindex)
    if isHas ~= 1 then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>回收物品失败,请将物品放置于背包!'..isHas..'</font>","Type":9}')
        return
    end

    local itemObj = getitembymakeindex(actor,makeindex)

    local itemIdx = getiteminfo(actor,itemObj, ConstCfg.iteminfo.idx) or 0

    local cfg = _cfg_items[itemIdx]
    if not cfg or cfg.type ~= 2 then return end

    local harvest = cfg.harvest[1][1]

    local _cfg_box

    for i,v in ipairs(cfg_baoxiang) do
        if v.id == harvest then
            _cfg_box = v
        end
    end
    if not _cfg_box then return end

    local giftTab = {}

    local temp_giftTab = {}

    for i,v in ipairs(_cfg_box.items) do
        if v[3] then
            if v[4] then
                table.insert(temp_giftTab,v)
            else
                if not FProbabilityHit(v[3], ratio) then
                    table.insert(giftTab,{v[1],v[2]})
                end
            end
        else
            table.insert(giftTab,{v[1],v[2]})
        end
    end
    if #temp_giftTab > 0 then
        local weights = {}
        for i,v in ipairs(_cfg_box.items) do
            weights[i] = v[3]
        end
        local temp = getRanomByWeight(temp_giftTab, weights)
        table.insert(giftTab,{temp[1],temp[2]})
    end

    if not Bag.checkBagEmptyItems(actor, giftTab) then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
        return
    end

    -- 扣道具
    if not delitembymakeindex(actor, makeindex) then return end

    Player.giveItemByTable(actor, giftTab, "熔炉")

    return true
end

--熔炼
function Ronglu.RequestRonglu(actor,arg1,arg2,arg3,items)
    items = string.split(items, "#")
    for i,makeIndex in ipairs(items or {}) do
        if not Ronglu_deleitem(actor,makeIndex) then
            break
        end
    end
    Message.sendmsg(actor, ssrNetMsgCfg.Ronglu_RongluResponse)
end

--存入勾选缓存
function Ronglu.SetUserData(actor,_type,arg2,arg3,tab)
    LOGPrint(_type,tab)
    if _setDataType.mainCheck == _type then
        local page1,ischoice = tab[1],tab[2]
        if not _var_name_tab[page1] then return end
        FSetPlayVar(actor,_var_name_tab[page1].ischoice,ischoice)
    elseif _setDataType.secondaryCheck == _type then
        local page1,page2,ischoice = tab[1],tab[2],tab[3]
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] then return end
        FSetPlayVar(actor,_var_name_tab[page1][page2],ischoice)
    elseif _setDataType.allCheck == _type then
        local page1,ischoice = tab[1],tab[2]
        if not _var_name_tab[page1] then return end
        for _, v in pairs(_var_name_tab[page1]) do
            if v ~= "ischoice" then
                FSetPlayVar(actor,v,ischoice)
            end
        end
    end
end

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
Message.RegisterNetMsg(ssrNetMsgCfg.Ronglu, Ronglu)

--登陆触发
local function _onLoginEnd(actor,logindatas)
    Ronglu.SyncResponse(actor, logindatas)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Ronglu)

--初始化个人变量
local function _goPlayerVar(actor)
    FIniPlayVar(actor,_all_var_name)
end
GameEvent.add(EventCfg.goPlayerVar, _goPlayerVar, Ronglu)

return Ronglu