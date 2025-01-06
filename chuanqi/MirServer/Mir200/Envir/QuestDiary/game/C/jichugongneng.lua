jichugongneng = {}
jichugongneng.ID = 31200

function JCGN_yijianhuixue(actor)
    local maxmp = getbaseinfo(actor, ConstCfg.gbase.maxmp)
    local maxhp = getbaseinfo(actor, ConstCfg.gbase.maxhp)
    humanhp(actor,"=",maxhp)
    --humanmp(actor,"=",maxmp)
    --setbaseinfo(actor, ConstCfg.sbase.curmp,maxmp)
    healthspellchanged(actor)
end

function JCGN_denaturation(actor)
    local saystr = parsetext([[
                        <Img|x=0|y=0|show=0|bg=1|move=0|img=public/bg_npc_01.png|reset=1|loadDelay=1>
                         <Layout|x=545|y=0|width=80|height=80|link=@exit>
                         <Button|x=546|y=0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
                         <Text|x=50.0|y=20.0|color=151|size=18|text=变性>
                         <Text|x=50|y=70.0|color=255|size=18|text=只要四十八!鸡儿带回家! (小退 重进才能生效哟)>
                         <Text|x=375.0|y=120.0|color=151|size=18|text=【变性】|link=@JCGN_bx>
                         <Text|x=285.0|y=120.0|color=151|size=18|text=23888灵符>
                         <Img|x=250|y=120.0|img=item/item_0/000270.png|esc=0>
    ]], actor)
    say(actor, saystr)
end



function JCGN_bx(actor)
    local tuo_tab = {0,1}
    local tuo = 0
    local huibi = querymoney(actor,7)
    if huibi < 23888 then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>灵符不足</font>","Type":9}')
        return
    end
    for i=1,#tuo_tab do
        local xx = linkbodyitem(actor,tuo_tab[i])
        if xx ~= "0" then
            tuo = 1
            break
        end
    end
    if tuo == 1 then
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>请脱下武器，衣服，时装装备</font>","Type":9}')
        return
    end
    changemoney(actor,7,"-",23888,"变性",true)
    local sex = getbaseinfo(actor, ConstCfg.gbase.sex)
    if sex == 0 then
        setbaseinfo(actor, ConstCfg.gbase.sex,1)
    else
        setbaseinfo(actor, ConstCfg.gbase.sex,0)
    end
    Message.sendmsg(actor, ssrNetMsgCfg.ShouChong_LOGOUTplayr)
end


local function _gonpcmain(actor, npcidx)
    
    if npcidx == 252 then
        JCGN_yijianhuixue(actor)
    end
    if npcidx == 253 then
        JCGN_denaturation(actor)
    end
end

GameEvent.add(EventCfg.onClicknpc ,_gonpcmain,jichugongneng)


return jichugongneng