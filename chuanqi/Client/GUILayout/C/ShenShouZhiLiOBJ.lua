ShenShouZhiLiOBJ = {}

ShenShouZhiLiOBJ.__cname = "ShenShouZhiLiOBJ"

local site_tab = {
    {--青龙12球坐标
    {111,132},
    {182,178},
    {114,230},
    {177,289},
    {114,345},
    {219,339},
    {308,296},
    {364,339},
    {407,280},
    {389,204},
    {332,159},
    {280,219},
            },
    {--白虎12球坐标
    {194,220},
    {155,134},
    {100,195},
    {126,265},
    {104,336},
    {205,326},
    {273,292},
    {323,237},
    {363,291},
    {397,218},
    {341,155},
    {265,199},
            },
    {--朱雀12球坐标
    {175,205},
    {97, 156},
    {87, 234},
    {103,313},
    {174,346},
    {247,318},
    {318,286},
    {371,345},
    {413,268},
    {390,183},
    {318,143},
    {277,212},
            },
    {--玄武12球坐标
    {203,222},
    {221,141},
    {126,152},
    {101,223},
    {147,292},
    {221,336},
    {294,292},
    {371,318},
    {392,245},
    {315,224},
    {301,156},
    {395,153},
            },
}


ShenShouZhiLiOBJ.site = site_tab
ShenShouZhiLiOBJ.cfg = {}
ShenShouZhiLiOBJ.btn = 0

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenShouZhiLiOBJ:main(objcfg)


    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    local cfg_sixiang = ssrRequireCsvCfg("cfg_sixiang") --读表


    for k,v in ipairs(cfg_sixiang) do
        self.cfg[v.type] = self.cfg[v.type] or {}
        self.cfg[v.type][v.level] = self.cfg[v.type][v.level] or {}
        self.cfg[v.type][v.level] = {name=v.name,cost=v.cost,up=v.up,attribute=v.attribute,cgjl=v.cgjl,desc=v.desc}
    end



    GUI:addOnClickEvent(self.ui.img_bg1, function()
    end)

    GUI:addOnClickEvent(self.ui.img_bg2, function()
    end)

    --关闭背景
    GUI:addOnClickEvent(self.ui.bg_close, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.btn_close, function()
        GUI:Win_Close(self._parent)
    end)

    --元宝按钮
    GUI:addOnClickEvent(self.ui.P_btn_1, function()
        self:SJRequestZS(11)
    end)

    --灵符按钮
    GUI:addOnClickEvent(self.ui.P_btn_1, function()
        self:SJRequestZS(12)
    end)

    --页面按钮
    for i=1,4 do
        GUI:addOnClickEvent(self.ui["btn_ss_"..i], function()
            self:FakeZSResponse(i)
        end)
    end

    self:updateUI()
end


function ShenShouZhiLiOBJ:updateUI()
    local tab = self.tab
    local parenta = self.ui.P_btn_1
    local parentb = self.ui.P_btn_2
    GUI:removeAllChildren(parenta)
    GUI:removeAllChildren(parentb)
    GUI:Effect_Create(parenta, "qiulongxx1", -5,45, 0, 8093, 0, 0, 0, 1)
    GUI:Effect_Create(parentb, "qiulongxx2", -5,45, 0, 8093, 0, 0, 0, 1)
    for i=1,4 do
        if tab[i][1] > 0 then
            local bgzz1hanld = self.ui["Image_sszlz_"..i] 
            local bgzz2hanld = self.ui["btn_ss_"..i] 
            GUI:Image_loadTexture(bgzz1hanld, "res/custom/shenshouzhili/sszl_"..(i+5)..".png")

            GUI:Button_loadTextureNormal(bgzz2hanld, "res/custom/shenshouzhili/sszl_"..((i*2)+16)..".png")
            GUI:Button_loadTexturePressed(bgzz2hanld, "res/custom/shenshouzhili/sszl_"..((i*2)+17)..".png")
        end
    end
end

function ShenShouZhiLiOBJ:settable(tab)  --设置当前等级与下层等级关系
    self.tab = tab
end

function ShenShouZhiLiOBJ:PshuaxingUI(param)

    self.btn = param
    local tab = self.tab
    local site_tab = self.site
    local parent = self.ui.p_qiu
    GUI:removeAllChildren(parent)

    local bg1hanld = self.ui.img_bg1
    local bg2hanld = self.ui.img_bg2

    local txsshanld = self.ui.tx_title_ss
    
    GUI:setVisible(bg1hanld, false)
    GUI:setVisible(bg2hanld, true)

    local txqiu = 0
    local ntxqiu = 0
    local imgid = "res/custom/shenshouzhili/sszl_2.png"
    local text = ""
    
    
    local cengshu = tab[param][1]
    local shibai = tab[param][2]
    local desc = 0
    local dq_tab = self.cfg[param]
    

    -- for j=1,#self.cfg do
    --     if self.cfg[j]["type"] == param then
    --         local x = self.cfg[j]["level"]
    --         dq_tab[x] = self.cfg[j]
    --     end
    -- end

    local txhanldjilv = self.ui.tx_btn_jilv
    if cengshu >= #dq_tab then  
        GUI:Text_setString(txhanldjilv,"成功率:已满阶")
        GUI:Text_setString(self.ui.tx_btn_cailiao1,"已满阶")
        GUI:Text_setString(self.ui.tx_btn_cailiao2,"已满阶")
    else
        local jilv = dq_tab[cengshu+1]["cgjl"] * 0.01 + (shibai*5)
        GUI:Text_setString(txhanldjilv,"成功率:"..jilv.."%")
        for l=1,#dq_tab[cengshu+1]["cost"] do
            local idx = dq_tab[cengshu+1]["cost"][l][1]
            local num = dq_tab[cengshu+1]["cost"][l][2]
            local itemname = SL:GetMetaValue("ITEM_NAME", idx)
            if num >= 10000 and  num < 100000000 then
                num = math.floor(num*0.001)*0.1
                num = tostring(num).."万"
            elseif num >= 100000000 then
                num = math.floor(num*0.0000001)*0.1
                num = tostring(num).."亿"
            end

            GUI:Text_setString(self.ui["tx_btn_cailiao"..l],itemname..":"..num)
        end
    end

    if 1 <= cengshu and cengshu < 13 then
        txqiu = 8089
    end
    if 13 <= cengshu and cengshu < 25 then
        cengshu = cengshu -12
        txqiu = 8090
        ntxqiu = txqiu-1
        desc = desc + 12
    end
    if 25 <= cengshu and cengshu < 37 then
        cengshu = cengshu -24
        txqiu = 8091
        ntxqiu = txqiu-1
        desc = desc + 24
    end
    if 37 <= cengshu and cengshu < 49 then
        cengshu = cengshu -36
        txqiu = 8092
        ntxqiu = txqiu-1
        desc = desc + 36
    end
    if param == 1 then
        text = "青    龙"
        imgid = "res/custom/shenshouzhili/sszl_2.png"
    elseif param == 2 then
        text = "白    虎"
        imgid = "res/custom/shenshouzhili/sszl_3.png"
    elseif param == 3 then
        text = "朱    雀"
        imgid = "res/custom/shenshouzhili/sszl_4.png"
    elseif param == 4 then
        text = "玄    武"
        imgid = "res/custom/shenshouzhili/sszl_5.png"
    end

    GUI:Text_setString(txsshanld, text)
    GUI:Image_loadTexture(bg2hanld, imgid)
    for i=1,#site_tab[param] do
        if i <= cengshu then
            local hanld = GUI:Effect_Create(parent, "qiulong"..i, site_tab[param][i][1], site_tab[param][i][2], 0, txqiu, 0, 0, 0, 1)
            GUI:setScale(hanld, 0.8)
        else
            if ntxqiu ~= 0 then
                local hanld = GUI:Effect_Create(parent, "qiulong"..i, site_tab[param][i][1], site_tab[param][i][2], 0, ntxqiu, 0, 0, 0, 1)
                GUI:setScale(hanld, 0.8)
            end
        end
        local Imagehanld = GUI:Image_Create(parent, "Image_"..i,site_tab[param][i][1], site_tab[param][i][2], "res/custom/shenshouzhili/00225.png")
        GUI:setOpacity(Imagehanld, 0)
        GUI:setTouchEnabled(Imagehanld, true)
        GUI:addOnClickEvent(Imagehanld, function()
            local posM = GUI:getWorldPosition(Imagehanld)
            local data = {width = 1136, str = cfg_Desc[dq_tab[desc+i]["desc"]].desc, worldPos = {x = posM.x, y = posM.y}, anchorPoint = {x = 0, y = 1},formatWay = 1}
            SL:OpenCommonDescTipsPop(data)
        end)
    end
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
function ShenShouZhiLiOBJ:SyncResponse(int1,int2,int3,tab)
    self:settable(tab)
    self.xz = int1
end

function ShenShouZhiLiOBJ:SJRequestZS(param)----1.消耗 11=元宝 12=灵符 2. 第几个页面
    ssrMessage:sendmsg(ssrNetMsgCfg.ShenShouZhiLi_RequestZS,param,self.btn)
end

function ShenShouZhiLiOBJ:ZSResponse(int1,int2,param,tab)  --tab= 数据表 param=刷新几号页面
    self:settable(tab)
    if not self.param then return end
    self.param:FakeZSResponse(param)
end


function ShenShouZhiLiOBJ:FakeZSResponse(param) --刷新页面  param=刷新 几号页面
    local xz = self.xz
    local mapxz = 0
    if param == 3 or param == 4 then
        if xz == 10 then
            mapxz = 1
            SL:ShowSystemTips('<font color=\'#ff0000\'>三大陆开启</font>')
        end
    end
    if mapxz == 0 then
        self:PshuaxingUI(param)
    end
end

return ShenShouZhiLiOBJ