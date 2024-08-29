local ssrUIManager = {}

local _layers

local function _get_objcfg_by_id(objid)
  for _, objcfg in pairs(ssrObjCfg) do
    if objcfg.ID == objid then
      return objcfg
    end
  end
end

function ssrUIManager:INIT()
  _layers = {}
  for objname, objcfg in pairs(ssrObjCfg) do
    if objcfg.OBJ_PATH and objcfg.ID then
      local obj = SL:Require(objcfg.OBJ_PATH, true)
      _layers[objcfg.ID] = obj

      if objcfg.NET_MESSAGE then
        ssrMessage:RegisterNetMsg(objcfg.NET_MESSAGE, obj)
      end
    end

    if objcfg.OBJ_ORDER then
      for _, page_objcfg in ipairs(objcfg.OBJ_ORDER) do
        page_objcfg.PAGING_OBJ = objcfg
      end
    end
  end

  SL:ScheduleOnce(function()
    ssrUIManager:createTopIcon()
  end, 0.5)

  SL:ScheduleOnce(function()
    ssrUIManager:createSkillBtn()
  end, 0.5)

  return self
end

function ssrUIManager:OPEN(objcfg, data)
  if type(objcfg) == "table" and _layers[objcfg.ID] then
    --有分页的情况
    local pageobj = objcfg.PAGING_OBJ
    if pageobj then
      --判断父窗口是否打开
      local pageui = GUI:GetWindow(nil, _layers[pageobj.ID].__cname)
      if pageui then
        --父窗口快速化
        local parent_ui = GUI:ui_delegate(pageui)
        --创建子页签
        _layers[objcfg.ID]:main(objcfg, data, parent_ui)
      else
        SL:Print("未打开则去创建")
        --未打开则去创建
        _layers[pageobj.ID]:main(pageobj, data, _layers[objcfg.ID], objcfg)
        return
      end
    else
      --没有分页的情况
      _layers[objcfg.ID]:main(objcfg, data)
    end
  else
    --未在OBJCfg中注册,尝试作为系统窗口打开
    SL:JumpTo(objcfg)
  end
end

function ssrUIManager:CLOSE(objcfg, data)
  if _layers[objcfg.ID] then
    if GUI:GetWindow(nil, _layers[objcfg.ID].__cname) then
      GUI:Win_CloseByID(_layers[objcfg.ID].__cname)
    end
  end
  return _layers[objcfg.ID]
end

function ssrUIManager:GET(objcfg)
  return _layers[objcfg.ID]
end

function ssrUIManager:GETBYID(objid)
  local objcfg = _get_objcfg_by_id(objid)
  return _layers[objid], objcfg
end

-----------------------------------------------------------------
-----------------------↓↓↓ 顶部功能按钮 ↓↓↓-----------------------
-----------------------------------------------------------------
local handle
local top_icon_cfg = {
  ["btn_icon_1"] = { 1, x = 525, y = 80, icon = "xianshihuodong", wnd = ssrObjCfg.ShangYeHuoDong7 }, --限时活动
  ["btn_icon_2"] = { 2, x = 450, y = 80, icon = "VIP", wnd = ssrObjCfg.VIP },                        --VIP
  ["btn_icon_3"] = { 3, x = 375, y = 80, icon = "huodong", wnd = ssrObjCfg.ActivitySystem },         --活动
  ["btn_icon_4"] = { 4, x = 300, y = 80, icon = "gonglue", wnd = ssrObjCfg.Gonglue },                --游戏攻略
  ["btn_icon_5"] = { 5, x = 225, y = 80, icon = "shouchong", wnd = ssrObjCfg.ShouChong },            --首充
  ["btn_icon_7"] = { 6, x = 525, y = 7, effect = 5109, wnd = ssrConstCfg.Box996 },                   --996盒子
  -- ["btn_icon_6"]  =   {6,  x = 450, y = 0, icon = "xianwei", wnd = ssrObjCfg.JiangHuMingWang},            --仙位
}

function ssrUIManager:setShowCopyBtn(bool)
  local function visible()
    GUI:setVisible(ssrUIManager.top_layout, not ssrUIManager.icon_is_show)
  end
  if bool then
    if ssrUIManager.icon_is_show then
      GUI:Timeline_RotateTo(ssrUIManager.top_btn, 180, 0.1, visible)
    else
      GUI:Timeline_RotateTo(ssrUIManager.top_btn, 0, 0.1, visible)
    end
  else
    visible()
  end
end

function ssrUIManager:createTopIcon()
  local parent = GUI:Win_FindParent(102)
  if parent then
    GUI:removeAllChildren(parent)

    --箭头
    ssrUIManager.top_btn = GUI:Button_Create(parent, "btn_switch", -198, -45, "res/tlcq0/0/305.png")
    GUI:setAnchorPoint(ssrUIManager.top_btn, 0.5, 0.5)
    GUI:addOnClickEvent(ssrUIManager.top_btn, function()
      ssrUIManager.icon_is_show = not ssrUIManager.icon_is_show
      self:setShowCopyBtn(true)
    end)

    ssrUIManager.top_layout = GUI:Layout_Create(parent, "layout_topIcon", -210, -25, 600, 160, false)
    GUI:setAnchorPoint(ssrUIManager.top_layout, 1, 1)
    for key, val in pairs(top_icon_cfg) do
      if val.icon then
        handle = GUI:Button_Create(ssrUIManager.top_layout, key, val.x, val.y,
          "res/custom/icon/huodong/" .. val.icon .. ".png")
        GUI:addOnClickEvent(handle, function()
          ssrUIManager:OPEN(val.wnd)
        end)
        creatRedDot(handle, key)
      end

      if val.effect then
        handle = GUI:Layout_Create(ssrUIManager.top_layout, key, val.x, val.y, 60, 60, false)
        GUI:setTouchEnabled(handle, true)
        GUI:addOnClickEvent(handle, function()
          ssrUIManager:OPEN(val.wnd)
        end)

        handle = GUI:Effect_Create(handle, "effect", 35, 0, 0, val.effect)
        GUI:setScale(handle, 1)
        creatRedDot(handle, val[1])
      end
    end
  end
end

-----------------------------------------------------------------
-----------------------↓↓↓ 右侧功能按钮 ↓↓↓-----------------------
-----------------------------------------------------------------
local right_icon_cfg = {
  ["btn_icon_1"] = { 1, x = 0, y = 160, icon = "1900012596", wnd = ssrObjCfg.Hecheng },       --合成
  ["btn_icon_2"] = { 2, x = 70, y = 160, icon = "1900012598", wnd = ssrObjCfg.Ronglu },       --熔炉
  ["btn_icon_3"] = { 3, x = 140, y = 160, icon = "1900013020", wnd = ssrObjCfg.Forgingstar }, --强星
  ["btn_icon_4"] = { 4, x = 0, y = 80, icon = "1900013019", wnd = ssrConstCfg.Auction },      --拍卖
  ["btn_icon_5"] = { 5, x = 70, y = 80, icon = "1900012592", wnd = ssrObjCfg.ZhuanSheng },    --转生
  ["btn_icon_6"] = { 6, x = 140, y = 80, icon = "1900013013", wnd = ssrConstCfg.Guild },      --行会
  ["btn_icon_7"] = { 7, x = 0, y = 0, icon = "1900013012", wnd = ssrConstCfg.SkillSetting },  --技能
  ["btn_icon_8"] = { 8, x = 70, y = 0, icon = "1900013017", wnd = ssrConstCfg.Setting },      --设置
  ["btn_icon_9"] = { 9, x = 140, y = 0, icon = "1900013018", wnd = ssrConstCfg.ExitToRole },  --退出
}

function ssrUIManager:createSkillBtn()
  local parent = GUI:Win_FindParent(109)
  if parent then
    GUI:removeAllChildren(parent)
    for key, val in pairs(right_icon_cfg) do
      handle = GUI:Button_Create(parent, key, val.x, val.y, "res/custom/Main/" .. val.icon .. ".png")
      GUI:addOnClickEvent(handle, function()
        ssrUIManager:OPEN(val.wnd)
      end)
    end
  end

  parent = GUI:Win_FindParent(107)
  if parent then
    GUI:removeAllChildren(parent)
    --角色
    handle = GUI:Button_Create(parent, "role", -65, 60, "res/private/main/bottom/1900013010.png")
    GUI:addOnClickEvent(handle, function()
      ssrUIManager:OPEN(ssrConstCfg.Equip)
    end)

    --背包
    handle = GUI:Button_Create(parent, "bag", -135, 60, "res/private/main/bottom/1900013011.png")
    GUI:addOnClickEvent(handle, function()
      ssrUIManager:OPEN(ssrConstCfg.Bag)
    end)

    --交易行
    handle = GUI:Button_Create(parent, "transaction", -205, 60, "res/private/main/bottom/jiaoyihang.png")
    GUI:addOnClickEvent(handle, function()
      ssrUIManager:OPEN(ssrConstCfg.TradingBank)
    end)

    --排行榜
    handle = GUI:Button_Create(parent, "rank", -275, 60, "res/private/main/bottom/1900012587.png")
    GUI:addOnClickEvent(handle, function()
      ssrUIManager:OPEN(ssrConstCfg.Rank)
    end)

    --GMBOX--
    local gmBtn = GUI:Button_Create(parent, "gmbox", -445, 60 + 75, "res/public/1900000652.png")
    GUI:Button_setTitleText(gmBtn, "GM操作")
    GUI:Button_setTitleFontSize(gmBtn, 15)
    GUI:addOnClickEvent(gmBtn, function()
      GUI:Win_Open("A/GMBoxOBJ")
    end)
  end
end

return ssrUIManager
