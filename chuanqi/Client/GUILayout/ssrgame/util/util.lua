
--[[
    @desc: 配置表属性转客户端显示数据
    --@attr: table 配置表属性
    --@state: number =0:正常显示   >0:满级   <0:0级
    --@state: chnum 属性名中间的空格数
    @return: table 客户端显示数据
]]
local cfg_att_score = ssrRequireGameCfg("cfg_att_score")
local _attrgroup = {{3,4},{5,6},{7,8},{9,10},{11,12}}        --属性组：攻击 魔法 道术 防御 魔御 的下上限idx
local _attrname = {[3]="攻%s击", [5]="魔%s法", [7]="道%s术", [9]="防%s御", [11]="魔%s御"}
function ssrAttrToClient(attr, state, chnum)
    state = state or 0
    
    --深拷贝表
    local newattr = SL:CopyData(attr)
    local attridxs = {}
    for i,v in ipairs(newattr) do
        attridxs[i] = tonumber(v[1])
    end

    --重组属性
    for _,v in ipairs(_attrgroup) do
        local loweridx, upperidx =  v[1], v[2]
        local lower, upper = table.indexof(attridxs, loweridx), table.indexof(attridxs, upperidx)
        if lower and upper then                 --同时有某上下限属性
            table.remove(attridxs, upper)
            local upper_attr = table.remove(newattr, upper)
            table.insertto(newattr[lower], upper_attr)
        elseif lower and not upper then         --有下限属性
            table.insertto(newattr[lower], {loweridx+1, 0})
        elseif not lower and upper then         --有上限属性
            table.insert(newattr[upper], 0, 1)
            table.insert(newattr[upper], upperidx-1, 1)
        end
    end

    --转显示属性
    local showattr = {}
    for i,v in ipairs(newattr) do
        local idx = v[1]
        local name = _attrname[idx] or ( cfg_att_score[idx] and cfg_att_score[idx].name or "属性idx-"..idx)

        local value = ""
        --下限 上限 值
        local attrvalue1, attrvalue2 = v[2], v[4]

        if state == 0 then
            if not attrvalue2 then
                local type = cfg_att_score[idx] and cfg_att_score[idx].type or 1
                if type == 1 then
                    value = attrvalue1..""
                elseif type == 2 then--万分比
                    if idx == 67 then
                        value = (attrvalue1*0.0001) .. "倍"
                    else
                        value = (attrvalue1 / 100) .. "%"
                    end
                elseif type == 3 then --百分比
                    value = attrvalue1.."%"
                end
            end
        else
            value = state < 0 and "0" or "已满级"
        end

        if attrvalue2 then
            local ch = ""
            if chnum and chnum > 0 then
                for i=1,chnum do ch = ch.."　" end
            end
            name = string.format(name, ch)
            if state == 0 then
                value = attrvalue1.."-"..attrvalue2
            else
                value = state < 0 and "0-0" or "已满级"
            end
        end
        name = name .. "："
        showattr[i] = {name=name, value=value}
    end

    return showattr
end

--[[
    @desc: 配置表属性转客户端显示数据
    --@cfg: table 配置表数据
    --@index: number cfg表的下标索引            cfg[index]
    --@field: string cfg表的下标索引中属性字段  cfg[index][field]
    --@state: chnum 属性名中间的空格数
    @return: table 客户端显示数据
]]
function ssrAttrToClientEx(cfg, index, field, chnum)
    local newindex,state = index, 0
    if index == 0 then
        state = -1
        newindex = 1
    elseif index > #cfg then
        state = 1
        newindex = #cfg
    end
    local attr = cfg[index] and cfg[index][field] or cfg[newindex][field]
    return ssrAttrToClient(attr, state, chnum)
end

-- 保留n位小数
function ssrKeepDecimalTest(num, n)
    --整数直接返回
    if num == math.floor(num) then return num end
    --如果是负数转整数
    local change = num < 0 and -1 or 1
    if change==-1 then num = num * change end
    --取整数与小数部分
    local int = math.floor(num)
    local decimal = num - int 
    --默认保留2位小数
    n = n or 2
    --获取小数放大倍数
    local multiple = 1
    for i=1, n do multiple = multiple * 10 end
    --保留小数部分转整数并去除多余的小数部分 +0.1是为了解决lua中的bug
    decimal = math.floor(decimal*multiple+0.1)
    --整数部分+保留小数部分
    num = int + (decimal/multiple)
    --完美返回
    return num * change
end
--type = 1：地面 2：背包 3：内观
function ssrGetLooksPath(looks, type)
    type = type or 3

    local index = string.format("%06d", looks)
    local pathindex = math.floor(looks/10000)
    local pathname
    if type == 1 then
        pathname = "item_ground"
    elseif type == 2 then
        pathname = "item"
    else
        pathname = "player_show"
    end
    return "res/"..pathname.."/" .. pathname.. "_" .. pathindex .. "/" .. index ..".png"
end
function ssrAttributeToArray(attribute)
    local attrarr = {}

    local arr_arr = SL:Split(attribute, "|")
    for _,str in ipairs(arr_arr) do
        local arr = SL:Split(str, "#")
        if #arr == 3 then
            table.remove(arr,1)
            table.insert(attrarr, arr)
        end
    end

    return attrarr
end