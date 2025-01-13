-- 判断表是否为空
---*  t : table表
---*  @return : 空返回true，否则返回false
---@param t table
---@return boolean
function table.isempty(t)
    for k, v in pairs(t) do
        return false
    end
    return true
end

-- 获取表的长度
---*  t : table表
---*  @return : 表的长度
---@param t table
---@return integer
function table.nums(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end
    return count
end

-- 获取表的所有索引key的集合
---*  hashtable : table表
---*  @return : 新的数组表，存储hashtable中所有的key
---@param hashtable table
---@return table
function table.keys(hashtable)
    local keys = {}
    for k, v in pairs(hashtable) do
        keys[#keys + 1] = k
    end
    return keys
end

-- 获取表的所有值value的集合
---*  hashtable : table表
---*  @return : 新的数组表，存储hashtable中所有的value
---@param hashtable table
---@return table
function table.values(hashtable)
    local values = {}
    for k, v in pairs(hashtable) do
        values[#values + 1] = v
    end
    return values
end

-- 表合并表
---*  dest : 合并表
---*  src : 被合并表
---@param dest table
---@param src table
function table.merge(dest, src)
    for k, v in pairs(src) do
        dest[k] = v
    end
end

-- 表插入表
---*  dest : 插入表
---*  src : 被插入表
---*  begin : 插入位置，为空时默认插入在表dest的开头，小于零默认插入在结尾
---@param dest table
---@param src table
---@param begin integer
function table.insertto(dest, src, begin)
    begin = begin or 0
    if begin <= 0 then
        begin = #dest + 1
    end

    local len = #src
    for i = 0, len - 1 do
        dest[i + begin] = src[i + 1]
    end
end

-- 根据value值查找其在数组中的序列号
---*  array : 被查找表（数组结构、列表式）
---*  value : 查找的目标
---*  begin : 查找的起始位置，为空则默认从开头开始查找；
---*  @return : 查找成功返回序列号，int类型；失败返回false，bool类型
---@param array table
---@param value integer|string
---@param begin integer
---@return integer|boolean
function table.indexof(array, value, begin)
    for i = begin or 1, #array do
        if array[i] == value then return i end
    end
    return false
end

-- 根据value值查找其在表的key
---*  hashtable : 被查找表（记录式）
---*  value : 查找的目标
---*  @return : 查找成功返回key，string类型；失败返回nil
---@param hashtable table
---@param value integer|string
---@return string|nil
function table.keyof(hashtable, value)
    for k, v in pairs(hashtable) do
        if v == value then return k end
    end
    return nil
end

-- 根据value值，将其从数组中移除
---*  array : 目标表（数组结构、列表式）
---*  value : 需要移除的值
---*  removeall : true全部移除，false移除一个
---*  @return : 移除次数
---@param array table
---@param value integer|string
---@param removeall boolean
---@return integer
function table.removebyvalue(array, value, removeall)
    local c, i, max = 0, 1, #array
    while i <= max do
        if array[i] == value then
            table.remove(array, i)
            c = c + 1
            i = i - 1
            max = max - 1
            if not removeall then break end
        end
        i = i + 1
    end
    return c
end

-- 对表按条件进行重新赋值
---*  t : 目标表
---*  fn : 条件函数
---@param t table
---@param fn function
function table.map(t, fn)
    for k, v in pairs(t) do
        t[k] = fn(v, k)
    end
end

-- 对表遍历并将key,value代入函数中执行函数
---*  t : 目标表
---*  fn : 执行函数
---@param t table
---@param fn function
function table.walk(t, fn)
    for k,v in pairs(t) do
        fn(v, k)
    end
end

-- 过滤筛选表
---*  t : 目标表
---*  fn : 筛选条件，把不满足条件的kv从表中移除
---@param t table
---@param fn function
function table.filter(t, fn)
    for k, v in pairs(t) do
        if not fn(v, k) then t[k] = nil end
    end
end

-- 对表的value去重
---*  t : 目标表
---*  bArray : 去重后的新表索引是否按数组格式，true为按数组格式，false按原目标表中的key为索引
---*  @return : 对表的value去重后新的表
---@param t table
---@param bArray boolean
---@return table
function table.unique(t, bArray)
    local check = {}
    local n = {}
    local idx = 1
    for k, v in pairs(t) do
        if not check[v] then
            if bArray then
                n[idx] = v
                idx = idx + 1
            else
                n[k] = v
            end
            check[v] = true
        end
    end
    return n
end

-- 通过key,value找出对应的嵌套表
---*  t : 目标表
---*  key : key
---*  value : value
---*  @return : 对表的value去重后新的表
---@param t table
---@param key string|integer
---@param value any
---@return table|nil
function table.findtbykv(t, key, value)
    for _,v in pairs(t) do
        if v[key] == value then
            return v
        end
    end
    return nil
end

function table.findarrvalue(t, fn, reverse)
    local size = #t
    local begin = reverse and size or 1
    local toend = reverse and 1 or size
    local change = reverse and -1 or 1

    local result
    for i=begin,toend,change do
        result = fn(t[i], i)
        if result then return result end
    end
end


-- 判断表是否完全相等
---*  arr1 : 目标表1（数组结构、列表式）
---*  arr2 : 目标表2（数组结构、列表式）
---*  @return : 对目标表1和目标表2是否完全相等的判断，相等为true，否则为false
---@param arr1 table
---@param arr2 table
---@return boolean
function table.arrequal(arr1, arr2)
    local size1, size2 = #arr1, #arr2
    if size1 ~= size2 then return false end

    for k,v1 in ipairs(arr1) do
        local v2 = arr2[k]
        if v1 ~= v2 then return false end
    end

    return true
end