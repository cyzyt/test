GameEvent = {}

local _listeners = {}

-- 事件添加
---*  eventName : 事件的名称，用于标识不同的事件
---*  func : 要添加的事件处理函数，当事件触发时将调用该函数。
---*  tag : 监听器的标签，用于唯一标识一个监听器，确保不会添加重复的监听器
---*  priority : 监听器的优先级，可选参数，决定了监听器在列表中的位置，优先级越高的监听器会越先被调用。
---@param eventName string
---@param func function
---@param tag string
---@param priority number
function GameEvent.add(eventName, func, tag, priority)
	assert(tag, "Tag must not be nil")
	assert(type(func) == "function", "Func must be a function")
	if priority ~= nil then
	  	assert(type(priority) == "number", "Priority must be a number")
	end

	if not _listeners[eventName] then
		_listeners[eventName] = {}
	end

	local eventListeners = _listeners[eventName]
	local eventListenerSize = #eventListeners
	for i = 1, eventListenerSize do
		if tag == eventListeners[i][2] then
			return
		end
	end

	if priority and eventListenerSize >= priority then
		table.insert(eventListeners, priority, {func, tag})
	else
		table.insert(eventListeners, {func, tag})
	end
end

function GameEvent.remove(func)
	for eventName, eventListeners in pairs(_listeners) do
		for i = 1, #eventListeners do
			if eventListeners[i][1] == func then
				table.remove(eventListeners, i)
				if 0 == #listeners[eventName] then
					listeners[eventName] = nil
				end
				return
			end
		end
	end
end

function GameEvent.removeByNameAndTag(eventName, tag)
	assert(tag, "Tag must not be nil")
	local eventListeners = _listeners[eventName]
	if not eventListeners then return end

	for i = #eventListeners, 1, -1 do
		if eventListeners[i][2] == tag then
			table.remove(eventListeners, i)
			break
		end
	end

	if 0 == #eventListeners then
		listeners[eventName] = nil
	end
end

function GameEvent.removeByTag(tag)
	assert(tag, "Tag must not be nil")
	for eventName, eventListeners in pairs(_listeners) do
		self.removeListenerByNameAndTag(eventName, tag)
	end
end

function GameEvent.removeAll()
	_listeners = {}
end

function GameEvent.push(eventName, ...)
	local eventListeners = _listeners[eventName]
	if not eventListeners then
		return
	end

	for index, listeners in ipairs(eventListeners) do
		local result, stop = pcall(listeners[1], ...)
		if result then
			if stop then break end
		else
			local tag = listeners[2]
			local tarid = tag.ID or 0
			local err = "派发事件发生错误：事件名="..eventName.."  模块ID="..tarid.."   "
			release_print(err, stop)
		end
	end
end

return GameEvent