Playdld = {}

Playdld.ID = 20900

local _activityid = 1                                   --活动副本id

local _taskid = 4                                       --任务栏展示id

local _timerid = 22                                     --全局定时器id

local _time = cfg_duplicate[_activityid].totalTime      --活动时长

local _mapId = cfg_duplicate[_activityid].mapId         --活动地图

local _varg_starttime       = "G202"                    --活动开始时间戳
local _varg_endtime         = "G203"                    --活动结束时间戳

local _var_rank_jifen       = "NB_dld_jifen"            --活动积分数
local _var_rank_killNum     = "NB_dld_killNum"          --活动杀人数
local _var_rank_killTime    = "NB_dld_killTime"         --活动杀人计时

local _data_list = "NB_dld_data_list"

local cfg_SG = {}

local shijian   --间隔(秒)

--活动状态
local _activity_satse = {
    open = 1,
    close = 0
}

for i,v in ipairs(cfg_fuben_gen) do
    if v.id == _activityid then
        table.insert(cfg_SG,v)
        if not shijian then
            shijian = v.shijian * 60
        end
    end
end

local cfg_jifen_gift = {}

local cfg_killer_gift = {}

for i,v in ipairs(cfg_dld_rewards) do
    if v.type == 1 then
        table.insert(cfg_jifen_gift,v)
    elseif v.type == 2 then
        table.insert(cfg_killer_gift,v)
    end
end
-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------

--活动是否结束
local function _isEnded()
    local curtime = os.time()
    local endtime = getsysvar(_varg_endtime)
    if endtime == 0 then return true end
    return curtime > endtime
end

--是否不在活动地图
local function _isNotInMap(actor)
    local cur_mapId = getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end

local function campare(a, b)
    if a[2] == b[2] then
        if a[3] and b[3] then
            return a[3] < b[3]
        else
            return true
        end
    else
        return a[2] > b[2]
    end
end

--获取数据表
local function getRankList(var_name,count,var2_name)
    count = count or 0
    local var = sorthumvar(var_name, 0, 1, count) or {}
    local rank = 1
    local rank_list = {}

    for i=1,#var,2 do
        rank_list[rank] = {var[i], var[i+1]}
        rank = rank + 1
    end

    if var2_name then
        local temp = sorthumvar(var2_name, 0, 1, 0) or {}
        local temp_list = {}
        for i=1,#temp,2 do
            temp_list[i] = temp[i+1]
        end
        for i, v in ipairs(rank_list) do
            v[3] = temp_list[ v[1] ] or 0
        end

        table.sort(rank_list, campare)
    end

    return rank_list
end

local function _KillRankBySort()
    local var = sorthumvar(_var_rank_killNum, 0, 1, 0) or {}
    local rank = 1
    local rank_list = {}
    for i=1,#var,2 do
        rank_list[rank] = {var[i], var[i+1]}
        rank = rank + 1
    end

    local var2 = sorthumvar(_var_rank_killTime, 0, 1, 0) or {}

    for i=1,#var2,2 do
        for j, v in ipairs(rank_list) do
            if v[1] == var2[i] then
                v[3] = var2[i+1]
                v[4] = os.date("%Y-%m-%d %H:%M:%S", v[3])   --测试观测
                break
            end
        end
    end

    table.sort(rank_list, campare)

    local max = 10
    while #rank_list > max do
        table.remove(rank_list,#rank_list)
    end

    setsysvarex(_data_list, tbl2json(rank_list), 1)
end

--任务栏展示信息每秒刷新(倒计时/名次/积分)
local function _changetask(actor)
    if _isEnded() then newdeletetask(actor,_taskid) return end

    local data = json2tbl(getsysvarex(_data_list))

    local ownrank = 0
    local roleName = getbaseinfo(actor,1)
    for i, v in ipairs(data) do
        if v[1] == roleName then
            ownrank = i
            break
        end
    end
    --local ownrank = humvarrank(actor, _var_rank_killNum, 0, 1) or 0
    local down_time = getsysvar(_varg_endtime) - os.time()
    local down_time_str = ssrSecToHMS(down_time)
    newchangetask(actor,_taskid,getplayvar(actor, _var_rank_jifen),getplayvar(actor, _var_rank_killNum),ownrank,down_time_str)
end

local function _Fsendmail(name,mail,reward)
    local stritem
    --邮件物品
    if reward then
        if type(reward) == "table" then
            local items
            for _,item in ipairs(reward) do
                if type(item) == "table" then
                    items = items or {}
                    if item[3] == 1 then item[3] = ConstCfg.binding end
                    table.insert(items, table.concat(item, "#"))
                else
                    stritem = table.concat(reward, "&")
                    break
                end
            end

            if items then stritem = table.concat(items, "&") end
        else
            stritem = reward.."#1"
        end
    end
    sendmail("#"..name, 1, mail.title, mail.content, stritem)
end

--刷怪
local function _selectMonsters()
    for i,var in pairs(cfg_SG) do
        local monname = getmonbaseinfo(var.mid, ConstCfg.stdmoninfo.name)

        local count = checkrangemoncount(_mapId, monname, 0, 0, 10000)

        local num = var.count - count

        if num > 0 then
            genmon(_mapId,var.position[1],var.position[2], monname, var.fanwei, num)
        end
    end
end
-------------------------------↓↓↓ 逻辑处理 ↓↓↓---------------------------------------
--活动开启
function Playdld.open()
    setsysvar(_varg_starttime, os.time())
    local endtime = os.time() + _time
    setsysvar(_varg_endtime, endtime)
    setontimerex(_timerid, 1)

    local now = os.time()
    --公告
    local isSendNotice = false
    for i,v in ipairs(cfg_gameactive) do
        if v.id == _activityid then
            if v.Begin and cfg_announce[v.Begin] then
                isSendNotice = v.Begin
            end

            --红点
            local BTime = string.split(v.BTime,"$")
            local OTime = string.split(v.OTime,"$")
            if now >= getTodayTimeStamp(BTime[1],BTime[2],0) and now <= getTodayTimeStamp(OTime[1],OTime[2],0) then
                GameEvent.push(EventCfg.goActivityState,i,ConstCfg.activitystate.opening)
                break
            end
        end
    end
    if isSendNotice then
        --FSendNotice(nil, isSendNotice)
        local _msg = cfg_announce[isSendNotice].Announce
        sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
        sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
        sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
    end

    --清空数据
    clearhumcustvar(nil, _var_rank_killTime)
    clearhumcustvar(nil, _var_rank_killNum)
    clearhumcustvar(nil, _var_rank_jifen)
    setsysvarex(_data_list, tbl2json({}), 1)

    _selectMonsters()
end

--活动定时器
function Playdld.countdown()
    --修改活动倒计时
    local curtime = os.time()
    local starttime = getsysvar(_varg_starttime)
    local endtime = getsysvar(_varg_endtime)
    --活动结束
    if curtime >= endtime then
        Playdld.close()
        return
    else
        local _time = curtime - starttime
        if _time % shijian == 0 then
            _selectMonsters()
        end

        --刷新地图内玩家的任务栏
        local map_actors = getobjectinmap(_mapId, 0, 0, 1000, 1)
        if map_actors then
            for _,actor in ipairs(map_actors) do
                _changetask(actor)
            end 
        end
    end
end

--活动结束
function Playdld.close()
    setofftimerex(_timerid)             --关闭活动定时器
    setsysvar(_varg_endtime, 0)         --清理活动结束时间

    --地图内玩家回城
    local map_actors = getobjectinmap(_mapId, 0, 0, 1000, 1)
    if map_actors then
        for _,actor in ipairs(map_actors) do
            if getbaseinfo(actor, ConstCfg.gbase.isdie) then
                realive(actor)              --复活
            end
            FBackZone(actor)
        end
    end

    --清理地图怪物
    killmonsters(_mapId, "*", 0)

    --公告
    for i,v in ipairs(cfg_gameactive) do
        if v.id == _activityid then
            if v.End and cfg_announce[v.End] then
                --FSendNotice(nil, v.End)
                local _msg = cfg_announce[v.End].Announce
                sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
                sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
                sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
                break
            end
        end
    end

    --发送奖励
    local killer_rank = json2tbl(getsysvarex(_data_list))

    --local killer_rank = getRankList(_var_rank_killNum,cfg_killer_gift[#cfg_killer_gift].ranking[1][2],_var_rank_killTime)
    for i,v in ipairs(killer_rank) do
        local name,killNum = v[1],v[2]
        local gift
        for j,var in ipairs(cfg_killer_gift) do
            if i >= var.ranking[1][1] and i <= var.ranking[1][2] then
                gift = var
                break
            end
        end
        if gift and cfg_mail[gift.mailId] then
            _Fsendmail(name,cfg_mail[gift.mailId],gift.reward)
        end
    end
    local jifen_rank = getRankList(_var_rank_jifen)
    for i,v in ipairs(jifen_rank) do
        local name,jifen = v[1],v[2]
        local gift
        for j,var in ipairs(cfg_jifen_gift) do
            if jifen >= var.needPoints then
                gift = var
            end
        end
        if gift and cfg_mail[gift.mailId] then
            _Fsendmail(name,cfg_mail[gift.mailId],gift.reward)
        end
    end
end

-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--请求进入地图
function Playdld.RequestEnter(actor)
    --活动未开启
    if _isEnded() then return end
    --在地图中
    if not _isNotInMap(actor) then return end
    FMapMove(actor, _mapId)
end

--请求打开积分/排行面板
local _sync_data_memory = {}
function Playdld.RequestOpenRankWnd(actor,page)
    --同步信息
    local myNum,myRank = 0,0
    if page == 1 then   --积分奖励面板
        myNum = getplayvar(actor, _var_rank_jifen) or 0
        _sync_data_memory = {}
    elseif page == 2 then   --排名奖励面板
        myNum = getplayvar(actor, _var_rank_killNum) or 0
        myRank = humvarrank(actor, _var_rank_killNum, 0, 1) or 0
        _sync_data_memory = {}
    elseif page == 3 then   --击杀排名面板
        local killer_rank = json2tbl(getsysvarex(_data_list))
        local roleName = getbaseinfo(actor,1)
        for i, v in ipairs(killer_rank) do
            if v[1] == roleName then
                myRank = i
                break
            end
        end
        myNum = getplayvar(actor, _var_rank_killNum) or 0
        _sync_data_memory = killer_rank
    elseif page == 100 then   --沙城争霸面板
        myNum = 100
    end
    Message.sendmsg(actor, ssrNetMsgCfg.Playdld_OpenRankWndResponse, page,myNum,myRank,_sync_data_memory)
end

--请求回城
function Playdld.RequestBack(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
Message.RegisterNetMsg(ssrNetMsgCfg.Playdld, Playdld)
-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--请求复活
function Playdld.revive(actor)
    if _isNotInMap(actor) then return end
    -- map(actor,_mapId)
    realive(actor)
end
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--退出游戏
local function _onExitGame(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
GameEvent.add(EventCfg.onExitGame, _onExitGame, Playdld)

--进入/切换地图
local function _goSwitchMap(actor,cur_mapid, former_mapid)
    if cur_mapid == _mapId then
        GameEvent.push(EventCfg.goActivityMap, actor)
        Message.sendmsg(actor, ssrNetMsgCfg.Playdld_CreatRankBtn)
    end
    if former_mapid == _mapId then
        GameEvent.push(EventCfg.goBackMap, actor)
        newdeletetask(actor,_taskid)
        Message.sendmsg(actor, ssrNetMsgCfg.Playdld_DeletRankBtn)
    end
end
GameEvent.add(EventCfg.goSwitchMap, _goSwitchMap, Playdld)

--击杀怪物触发
local function _onKillMon(actor, monster,monsteridx)
    if _isEnded() then return end
    if _isNotInMap(actor) then return end
    if not getbaseinfo(actor, ConstCfg.gbase.isplayer) then return end

    local iskillrole = getbaseinfo(monster, ConstCfg.gbase.isplayer)
    local addJifen = 0
    if not iskillrole then
        for i,v in ipairs(cfg_dld_jifen) do
            if v.guaiwu == monsteridx then
                addJifen = v.count
                break
            end
        end
    end
    if addJifen ~= 0 then
        FSetPlayVar(actor, _var_rank_jifen, getplayvar(actor, _var_rank_jifen) + addJifen)
        _changetask(actor)
    end
end
GameEvent.add(EventCfg.onKillMon, _onKillMon, Playdld)

--击杀玩家触发
local function _onkillplay(actor, role)
    if _isEnded() then return end
    if _isNotInMap(actor) then return end

    local addJifen = cfg_dld_jifen[1].count
    FSetPlayVar(actor, _var_rank_jifen, getplayvar(actor, _var_rank_jifen) + addJifen)

    FSetPlayVar(actor, _var_rank_killNum, getplayvar(actor, _var_rank_killNum) + 1)

    FSetPlayVar(actor, _var_rank_killTime, os.time())

    _KillRankBySort()   --重新排序

    _changetask(actor)
end
GameEvent.add(EventCfg.onkillplay, _onkillplay, Playdld)
--登陆触发
local function _onLoginEnd(actor,logindatas)
    FIniPlayVar(actor, {_var_rank_jifen,_var_rank_killNum,_var_rank_killTime})
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, Playdld)

--声明全局变量
local function _onStartUp()
    inisysvar("string", _data_list)
end
GameEvent.add(EventCfg.onStartUp, _onStartUp, Playdld)
-- -------------------------------↓↓↓ 自定义命令控制活动 ↓↓↓---------------------------------------
function Playdld.custom_open(actor)
    if not _isEnded() then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.usercmdinfo1))
        return
    end
    Playdld.open()
end

function Playdld.custom_close(actor)
    if _isEnded() then
        sendmsg(actor, ConstCfg.notice.own, ssrResponseCfg.get(ssrResponseCfg.usercmdinfo2))
        return
    end
    Playdld.close()
end

return Playdld