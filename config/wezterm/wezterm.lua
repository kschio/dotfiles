local utils = require 'utils'

local modules = utils.map({
   'general',
   'hotkeys',
   'window',
   'font',
   'theme',
   'tab',
}, utils.req)

return utils.merge(table.unpack(modules))
