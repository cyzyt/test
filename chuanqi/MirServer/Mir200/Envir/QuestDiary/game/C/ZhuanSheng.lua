ZhuanSheng = {}
ZhuanSheng.ID = 30000


local _cfgrein = cfg_rein

-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ������
local _login_data = {ssrNetMsgCfg.ZhuanSheng_SyncResponse, 0}
function ZhuanSheng.SyncResponse(actor, logindatas)
   
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)  --ת���ȼ�(����)
    --LOGPrint("�����=="..type(zslevel))
    --LOGPrint("�����=="..zslevel)
    if logindatas then
        _login_data[2] = zslevel
        table.insert(logindatas, _login_data)
    else
        Message.sendmsg(actor, ssrNetMsgCfg.ZhuanSheng_SyncResponse, zslevel)
    end
end


function ZhuanSheng.RequestZS(actor)
    --LOGPrint("11")
    local orhuobi = 0
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)  --��ȡת���ȼ�(����) 
    local next_zslevel = zslevel + 1   --��ǰת���ȼ�+1��Ϊ��һת���ȼ�  �����ж�
    local cfg = _cfgrein[zslevel]           --��ȡ��ǰת���ȼ��ı�
    local next_cfg = _cfgrein[next_zslevel] --��ȡ��һת���ȼ��ı�

---------------���������жϽ׶�

    --�����ת
    if not next_cfg then    --��û����һת���ȼ���ʱ  ��ʾ������
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�޷�����ת��</font>","Type":9}')
        return
    end

    --���ȼ�
    local level = getbaseinfo(actor, ConstCfg.gbase.level)  --��ȡ����ȼ�
    if level < cfg.Level then       --�ж�����ȼ��Ƿ���������
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ǰ�ȼ�����</font>","Type":9}')
        return
    end

    -- ������
    local name = Player.checkItemNumByTable(actor, cfg.Consume)   --���ز������ name 
    if name then ---���Ԫ������ʱ  ���а�Ԫ���ж�
        sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>���ϲ���</font>","Type":9}')
        return
    end
---------------���붯��ִ�н׶�
    Player.takeItemByTable(actor, cfg.Consume)  --���� ��������
    changelevel(actor, "-", cfg.DelLv)          --�ȼ�
    setbaseinfo(actor, ConstCfg.gbase.renew_level, next_zslevel)  --ת������
    Player.updateSomeAddr(actor, cfg.Attribute0, next_cfg.Attribute0)   --�������� ��ǰ���� ������
    --���㷽ʽΪ  ͳ�Ʊ�1 ��ȥ��1�е�����ֵ  �ټ��ϱ�2�е�ֵ

---------------������Ϸչʾ�׶�
    ---֪ͨ�ͻ��˸�������

    Message.sendmsg(actor, ssrNetMsgCfg.ZhuanSheng_ZSResponse, next_zslevel)

    --�ɷ�ת������
    GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
    
    --LOGPrint("mainend")
end

Message.RegisterNetMsg(ssrNetMsgCfg.ZhuanSheng, ZhuanSheng)  --ע��

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--��¼��������  �����������Ը���  --��¼ʱ�Ὣ���Ա�������Ը��±��� Ȼ��ִ�����Ը��²���
GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local zslevel = getbaseinfo(actor, ConstCfg.gbase.renew_level)
    --LOGWrite(zslevel, type(zslevel))
    if zslevel <= 0 then return end    --ûת��
    local cfg = _cfgrein[zslevel]
    if not cfg then return end  --��ǰת��������  ��ֹ 

    table.insert(loginattrs, cfg.Attribute0)
end, ZhuanSheng)



--��¼���
GameEvent.add(EventCfg.onLoginEnd, function (actor, logindatas)
    ZhuanSheng.SyncResponse(actor, logindatas)
end, ZhuanSheng)

---------------------------���߸�������



return ZhuanSheng

