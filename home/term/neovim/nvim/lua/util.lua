local util = {}

util.gh = function(repo) return 'https://github.com/' .. repo end
util.require = function(module_name)
    local ok, module = pcall(require, module_name)
    if not ok then
        print("Failed to load " .. module_name)
    end
    return ok, module
end

return util
