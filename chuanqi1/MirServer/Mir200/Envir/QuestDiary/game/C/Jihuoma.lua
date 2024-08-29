Jihuoma = {}
Jihuoma.ID = 31700

local var = "C_QsQ"

local libao = cfg_libao
local cfg = {}
local num = 1
for k,v in ipairs(libao) do
    if v.leixing == 2 then
        cfg[num] = v
        num = num + 1 
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

function Jihuoma.RequestZS(actor,int,int2,int3,str_tb)
    local str = str_tb[1]
    local hd = 0

    if str == "" then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>请输入激活码</font>","Type":9}')
        return
    end
    
    for i=1,#cfg do
        if str == cfg[i].mima then
            hd = i
            break
        end
    end

    if hd == 0 then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>激活码输入错误或者不存在！！！</font>","Type":9}')
        return
    end

    local my = getplayvar(actor,var..str)
    if my == 1 then 
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>您已领取过该礼包</font>","Type":9}')
        return
    end

    local tab = cfg[hd]["items"]
    for i=1,#tab do  
        if Item.isCurrency(tab[i][1]) then
            changemoney(actor,tab[i][1],"+",tab[i][2],"激活码礼包",true)
        else
            giveitem(actor, Item.getNameByIdx(tab[i][1]),tab[i][2],ConstCfg.binding)
        end
    end
    setplayvar(actor, "HUMAN",var..str,1,1) 
    sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>领取成功</font>","Type":9}')
end

Message.RegisterNetMsg(ssrNetMsgCfg.Jihuoma, Jihuoma)  --注册

-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------

local function _playerVar(actor)
    for i=1,#cfg do
        local pvar = cfg[i].mima
        iniplayvar(actor, "integer", "HUMAN", var..pvar)
    end
end

GameEvent.add(EventCfg.goPlayerVar, _playerVar, Jihuoma)

return Jihuoma