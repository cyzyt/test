ShangYeHuoDong7OBJ = {}

ShangYeHuoDong7OBJ.__cname = "ShangYeHuoDong7OBJ"

ShangYeHuoDong7OBJ.cfg_leichong_tsleic = ssrRequireCsvCfg("cfg_leichong_tsleic")
ShangYeHuoDong7OBJ.cfg_leichong_mr = ssrRequireCsvCfg("cfg_leichong_mr")

ShangYeHuoDong7OBJ._state = {
  no_receive  = 0, --不可领取
  yes_receive = 1, --可以领取
  has_receive = 2, --已领取
}

ShangYeHuoDong7OBJ.tab = {}

function ShangYeHuoDong7OBJ:main(objcfg, data, parent_ui)
  self.ui = parent_ui
  --将子页面加载进父页面nd_module容器中
  GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)
  self.objcfg = objcfg

  --居中
  local pos = GUI:getPosition(self.ui.nd_root)
  GUI:setPosition(self.ui.Layer, -pos.x, -pos.y)

  self.btn_txt_color = {
    [true] = ssrConstCfg.C3B_YELLOW2,
    [false] = ssrConstCfg.C3B_GRAY1,
  }
  self:initUI(data)
end

function ShangYeHuoDong7OBJ:initUI(data) --进入界面
  ssrListViewTemplate(self.ui.mr_ListView)
  ssrListViewTemplate(self.ui.lj_ListView)
  GUI:removeAllChildren(self.ui.mr_ListView)
  GUI:removeAllChildren(self.ui.lj_ListView)

  local jump = 0
  for i, v in ipairs(self.cfg_mr) do
    ssrPrint(i, v, "123")
    local btn1 = GUI:Clone(self.ui.template_2)
    GUI:setVisible(btn1, true)
    GUI:addChild(self.ui.mr_ListView, btn1)
    local ui_item = GUI:ListView_getItemByIndex(self.ui.mr_ListView, i - 1)
    GUI:setName(ui_item, "img_" .. i)
    for j, itemData in ipairs(v.reward) do
      local idx = itemData[ssrConstCfg.box_idx]
      local count = itemData[ssrConstCfg.box_num]
      local itemshowdata = { index = idx, count = count, look = true }
      local parent = GUI:getChildByName(ui_item, "item_bg_" .. j)
      local itemshow = GUI:ItemShow_Create(parent, "item", 0, 0, itemshowdata)
      GUI:setScale(itemshow, 0.81)
    end

    local title = "免费礼包"
    local money = v.money
    if money > 0 then
      title = "今日充值" .. money .. "元"
    end
    GUI:Text_setString(GUI:getChildByName(ui_item, "title"), title)

    local state = self.mr_list[money]
    local btn = GUI:getChildByName(ui_item, "btn_go")
    GUI:setVisible(GUI:getChildByName(btn, "img_red"), self._state.yes_receive == state)
    GUI:setEnabled(btn, self._state.has_receive ~= state)

    local tx_btn = GUI:getChildByName(btn, "tx_btn")
    if self._state.no_receive == state then
      GUI:Text_setString(tx_btn, "前往充值")
    elseif self._state.yes_receive == state then
      GUI:Text_setString(tx_btn, "立即领取")
    elseif self._state.has_receive == state then
      GUI:Text_setString(tx_btn, "已领取")
      if jump == i - 1 then
        jump = i
      end
    end

    GUI:addOnClickEvent(btn, function(sender)
      self:RequestGetMRGift(GUI:Win_GetParam(sender))
    end)

    GUI:Win_SetParam(btn, v.money)

    if i == #self.cfg_mr then
      GUI:ListView_jumpToItem(self.ui.mr_ListView, jump)
    end
  end
  local jump2 = 0

  for i, v in ipairs(self.cfg_lj) do
    local btn1 = GUI:Clone(self.ui.template_1)
    GUI:setVisible(btn1, true)
    GUI:addChild(self.ui.lj_ListView, btn1)
    local ui_item = GUI:ListView_getItemByIndex(self.ui.lj_ListView, i - 1)
    GUI:setName(ui_item, "img_" .. i)

    local itemData = v.reward[1]
    local idx = itemData[ssrConstCfg.box_idx]
    local count = itemData[ssrConstCfg.box_num]
    local itemshowdata = { index = idx, count = count, look = true }
    local parent = GUI:getChildByName(ui_item, "item_bg")
    local temp = GUI:ItemShow_Create(parent, "item", -3, -3, itemshowdata)
    GUI:setScale(temp, 0.81)

    local day = v.tianshu
    GUI:Text_setString(GUI:getChildByName(ui_item, "tx_title"), "累计" .. day .. "天")

    local state = self.lj_list[day]
    local btn = GUI:getChildByName(ui_item, "img_mask")
    btn:setTouchEnabled(self._state.yes_receive == state)
    GUI:setVisible(GUI:getChildByName(ui_item, "img_red"), self._state.yes_receive == state)
    GUI:setVisible(GUI:getChildByName(ui_item, "img_isget"), self._state.has_receive == state)
    if self._state.no_receive == state then
    elseif self._state.yes_receive == state then
    elseif self._state.has_receive == state then
      if jump2 == i - 1 then
        jump2 = i
      end
    end

    GUI:addOnClickEvent(btn, function(sender)
      self:RequestGetLJGift(GUI:Win_GetParam(sender))
    end)

    GUI:Win_SetParam(btn, day)

    if i == #self.cfg_lj then
      GUI:ListView_jumpToItem(self.ui.lj_ListView, jump2)
    end
  end

  self:updataUI()
end

--isAll,是否整体刷新
function ShangYeHuoDong7OBJ:updataUI(isAll)
  if not self.ui then return end
  local pro = self.lj_day / self.lj_max_day * 100
  if pro > 100 then
    pro = 100
  elseif pro < 0 then
    pro = 0
  end
  GUI:LoadingBar_setPercent(self.ui.LoadingBar, pro)

  local bill_day = 0
  GUI:Text_setString(self.ui.tx_today_billNum, "当日累充：" .. bill_day .. "元")
  if isAll then
    for i, v in ipairs(self.cfg_mr) do
      local ui_item = GUI:getChildByName(self.ui.mr_ListView, "img_" .. i)
      local money = v.money
      local state = self.mr_list[money]
      local btn = GUI:getChildByName(ui_item, "btn_go")
      GUI:setVisible(GUI:getChildByName(btn, "img_red"), self._state.yes_receive == state)
      GUI:setEnabled(btn, self._state.has_receive ~= state)
      SL:SetColorStyle(btn:getChildByName("tx_btn"), self.btn_txt_color[self._state.has_receive ~= state])
      local tx_btn = GUI:getChildByName(btn, "tx_btn")
      if self._state.no_receive == state then
        GUI:Text_setString(tx_btn, "前往充值")
      elseif self._state.yes_receive == state then
        GUI:Text_setString(tx_btn, "立即领取")
      elseif self._state.has_receive == state then
        GUI:Text_setString(tx_btn, "已领取")
      end
    end
    for i, v in ipairs(self.cfg_lj) do
      local ui_item = GUI:getChildByName(self.ui.lj_ListView, "img_" .. i)
      local day = v.tianshu
      local state = self.lj_list[day]
      local btn = GUI:getChildByName(ui_item, "img_mask")
      btn:setTouchEnabled(self._state.yes_receive == state)
      GUI:setVisible(GUI:getChildByName(ui_item, "img_red"), self._state.yes_receive == state)
      GUI:setVisible(GUI:getChildByName(ui_item, "img_isget"), self._state.has_receive == state)
    end
  end
end

-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
function ShangYeHuoDong7OBJ:string2num(data)
  self.isRed = false
  for _, tab in pairs(data) do
    for key, value in pairs(tab) do
      if type(key) == "string" then
        local key_num = tonumber(key)
        if key_num then
          tab[key_num] = value
          tab[key] = nil
          if value == self._state.yes_receive then
            self.isRed = true
          end
        end
      end
    end
  end
  self.lj_list = data.LJ_tab
  self.mr_list = data.MR_tab
end

-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--获取当前开服日期对应的每日奖励表
function ShangYeHuoDong7OBJ:getCfgByServerOpenDay()
  local cfg = {}
  -- local openDay = SL:GetMetaValue("KFDAY")
  local openDay = 1
  for i, v in ipairs(self.cfg_leichong_mr) do
    if openDay >= v.startTime and openDay <= v.overTime then
      table.insert(cfg, v)
    end
  end
  SL:dump(cfg, "cfg")
  return cfg
end

--获取当前组别对应的累计奖励表
function ShangYeHuoDong7OBJ:getCfgByZubie(zubie)
  local cfg = {}
  for i, v in ipairs(self.cfg_leichong_tsleic) do
    if v.zubie == zubie then
      table.insert(cfg, v)
    end
  end
  return cfg
end

-- function ShangYeHuoDong7OBJ:setRPShow() --设置红点显示
--   ssrGameEvent:push(ssrEventCfg.ShangYeHuoDong7, self.isRed, true)
-- end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步信息
function ShangYeHuoDong7OBJ:SyncResponse(arg1, arg2, arg3, data)
  self.lj_day = arg1
  self.lj_zubie = arg2
  self.lj_max_day = arg3
  self:string2num(data)
  -- self:setRPShow()
  self.cfg_lj = self:getCfgByZubie(self.lj_zubie)
  self.cfg_mr = self:getCfgByServerOpenDay()
  if not arg1 then return end
  self:updataUI(true)
end

--请求累计充值礼包领取
function ShangYeHuoDong7OBJ:RequestGetLJGift(idx)
  ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong7_RequestGetLJGift, idx)
end

--请求日充礼包领取
function ShangYeHuoDong7OBJ:RequestGetMRGift(idx)
  ssrMessage:sendmsg(ssrNetMsgCfg.ShangYeHuoDong7_RequestGetMRGift, idx)
end

-------------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
return ShangYeHuoDong7OBJ
