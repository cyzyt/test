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

-- 获取哈希表中所有的键，并存储在一个新的表中
---*  hashtable : 哈希表
---*  @return : 存储了所有键的 keys 表作为结果返回
---@param hashtable table
---@return table
function table.keys(hashtable)
    local keys = {}
    for k, v in pairs(hashtable) do
        keys[#keys + 1] = k
    end
    return keys
end

-- 获取哈希表中所有的值，并存储在一个新的表中
---*  hashtable : 哈希表
---*  @return : 存储了所有值的 values 表作为结果返回
---@param hashtable table
---@return table
function table.values(hashtable)
    local values = {}
    for k, v in pairs(hashtable) do
        values[#values + 1] = v
    end
    return values
end

-- 将 src 表中的元素合并到 dest 表中（在合并过程中，可能会修改 dest 表的内容）
-- 如果 dest 表中已经存在该键，则该键的值将被 src 表中对应的值覆盖；如果不存在，则会新增这个键值对。
---*  dest : 合并表
---*  src : 被合并表
---@param dest table
---@param src table
function table.merge(dest, src)
    for k, v in pairs(src) do
        dest[k] = v
    end
end

-- 将一个源表 src 的元素插入到目标表 dest 中，从指定的起始位置 begin 开始插入。
---*  dest : 目标表源表
---*  src : 源表
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

-- 根据value值查找其在数组中的索引位置
---*  array : 被查找表（数组结构、列表式）
---*  value : 需要查找的元素值
---*  begin : 开始查找的起始位置，默认为 1
---*  @return : 查找成功返回索引位置，int类型；失败返回false
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

-- 根据value值查找其在哈希表中对应的键key
---*  hashtable : 要查找元素的哈希表
---*  value : 需要查找的元素的值
---*  @return : 如果遍历完整个哈希表都没有找到满足条件的元素，函数将返回 nil
---@param hashtable table
---@param value integer|string
---@return string|nil
function table.keyof(hashtable, value)
    for k, v in pairs(hashtable) do
        if v == value then return k end
    end
    return nil
end

-- 从 array 表中移除指定的 value
---*  array : 要操作的表（数组结构、列表式）
---*  value : 要从表中移除的值
---*  removeall : 是一个布尔值，用于控制是否移除表中所有等于 value 的元素；true全部移除，false移除一个
---*  @return : 移除元素的数量
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

-- 对表格 t 中的每个元素进行映射操作
---*  t : 目标表
---*  fn : 条件函数
---@param t table
---@param fn function
function table.map(t, fn)
    for k, v in pairs(t) do
        t[k] = fn(v, k)
    end
end

-- 对表遍历并对表格中的每个元素执行指定的操作
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
---*  bArray : 用于控制存储去重元素的方式，true为按数组格式，false按原表中的键 k 作为键
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

-- 通过key,value查找符合条件的元素
---*  t : 目标表
---*  key : 是一个键，用于指定要查找的元素的某个属性
---*  value : 是一个值，用于指定要查找的元素的某个属性的值
---*  @return : 符合条件的元素或者nil
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

-- 自定义的表格查找(用于在表格 t 中查找满足某个条件的值)
---*  t : 目标表
---*  fn : 查找条件（该函数接收表格元素 t[i] 和索引 i 作为参数，需要根据元素和索引来判断是否满足查找条件。）
---*  reverse : 用于决定查找的方向，true 表示从后往前查找，false 表示从前往后查找
---@param t table
---@param fn function
---@param reverse boolean
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