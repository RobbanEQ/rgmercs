local mq = require 'mq'

---@class RGMercsModuleType
---@field name string

---@type DataType
local rgMercsModuleType = mq.DataType.new('RGMercsModule', {
    Members = {
        Name = function(_, self)
            return 'string', string.format("RGMercs [Module: %s/%s] by: %s", self.name, self._version, self.author)
        end,

        State = function(_, self)
            return 'string', self:DoGetState()
        end,
    },

    Methods = {
    },

    ToString = function(self)
        return self.name
    end,
})

---@return MQType, RGMercsModuleType
local function RGMercsTLOHandler(param)
    return rgMercsModuleType, RGMercModules:getModule(param)
end
-- Register our TLO functions
mq.AddTopLevelObject('RGMercs', RGMercsTLOHandler)
