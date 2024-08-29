Dalucs = {}

Dalucs.ID = 30500

local tx_dalutab = { --1npc����  2��ͼid 3 x 4 y 5 ����
    [243] = {"�ڶ���½",      "edl",      108,    106,    "�װ�����ң�����ȥ���"},
    [275] = {"������½",      "sdl",      76,     58,     "�װ�����ң�����ȥ���"},
    [289] = {"����֮��",      "sdl",      39,     106,    "�װ�����ң�����ȥ���"},
    [291] = {"��֮��",        "gzg",      62,     60,     "��������֮�������ӡ�ż���Σ��֮ͽ���ɱ�ʱװ������"},
    [292] = {"�ռ��ѷ�",      "taohua",   21,     19,     "�����ˣ������ӡ����ֻǿ���ħ�ޣ�������\\��Ҫ�����10000          �ɱ��㼣������"},
    [215] = {"����ʡ",        "3",        333,    333,    "������������"},
}

function Dalucs.main(actor,npcidx)
    local cfg = tx_dalutab[npcidx]
    if not cfg then return end
    local saystr = parsetext([[
        <Img|x=0|y=0|show=0|bg=1|move=0|img=public/bg_npc_01.png|reset=1|loadDelay=1>
        <Layout|x=545|y=0|width=80|height=80|link=@exit>
        <Button|x=546|y=0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
        <Text|x=50.0|y=20.0|color=151|size=18|text=]]..cfg[1]..[[>
        <Text|x=50|y=70.0|color=255|size=18|text=]]..cfg[5]..[[>
        <Text|x=75.0|y=120.0|color=151|size=18|text=ǰ����]]..cfg[1]..[[��|link=@Dalucs_dlmove,]]..npcidx..[[>
        <Img|x=50|y=125.0|img=official/npc/1900012911.png|esc=0>
    ]], actor)
    say(actor, saystr)
end

function Dalucs_dlmove(actor, npcidx)
    npcidx = tonumber(npcidx)

    UCheckNPCRange(actor, "", npcidx)

    local cfg = tx_dalutab[npcidx]
    if not cfg then return end
    
    if npcidx == 275 then
        local day = grobalinfo(1)
        if day < 10 then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>'..(10-day)..'��֮�󿪷�</font>","Type":9}')
            return
        end
        local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)  --��ȡת���ȼ�(����) 
        if zslevel < 15 then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��Ҫת����ʮ��ת</font>","Type":9}')
            return
        end
    end
    if npcidx == 292 then
        local huibi = querymoney(actor,7)
        if huibi < 10000 then
            sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�õ�ͼ��Ҫ1�����</font>","Type":9}')
            return
        end
        changemoney(actor,7,"-",10000,"�ռ��ѷ�",true)
    end
    mapmove(actor,cfg[2],cfg[3],cfg[4])
end

local function _gonpcmain(actor, npcidx)
    if cfg and cfg[1] ~= nil then
        Dalucs.main(actor,npcidx)
    end
end

GameEvent.add(EventCfg.onClicknpc ,_gonpcmain,Dalucs)

return Dalucs