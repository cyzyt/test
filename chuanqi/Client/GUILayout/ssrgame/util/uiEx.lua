function ssrRequireCsvCfg(path)  --加载策划表格
    return SL:Require("GUILayout/ssrgame/csvcfg/" .. path)
end

function ssrRequireGameCfg(path)  --加载官方表格
    return SL:Require("scripts/game_config/" .. path)
end

function ssrSeekWidgetByName(root, name)
    if GUI:getName(root) == name then
        return root
    end

    local children = GUI:getChildren(root)
    for k,v in pairs(children) do
        local res = ssrSeekWidgetByName(v, name)
        if res ~= nil then
            return res
        end
    end

    return nil
end

function ssrLabelString(root, name, str, color)
    local label = ssrSeekWidgetByName(root, name)
    if str then GUI:Text_setString(label,str) end
    if color then GUI:Text_setTextColor(label,GUI:GetColorHexFromRGB(color)) end
    return label
end

--后续取消该函数 ,当前只是防止报错
function ssrAddChildCentrePos(parent, node)
    GUI:addChild(parent, node)
end

--列表容器模板
--后续取消该函数 ,当前只是防止报错
function ssrListViewTemplate(ui_list, tempname, isbounce)
end



--更新属性显示
function ssrUpdateAttrShow(cfg, index, field, root, num, nodename, attrname, valuename, chnum)
    local cattr = ssrAttrToClientEx(cfg, index, field, chnum)
    for i=1,num do
        local attr = cattr[i]
        local nd_attr = ssrSeekWidgetByName(root, nodename..i)
        GUI:setVisible(nd_attr,attr and true or false)
        if attr then
            ssrLabelString(nd_attr, attrname..i, attr.name)
            ssrLabelString(nd_attr, valuename..i, attr.value)
        end
    end
end

--itemshow 添加箭头
function ssrAddItemShowArrow(itemshow, x, y)
    x = x or 52
    y = y or 30
    return GUI:Effect_Create(itemshow, "effect", x, y, 0, 5004)
end