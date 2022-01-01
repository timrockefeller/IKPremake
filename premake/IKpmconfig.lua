_G.Includes = {}
_G.Libraries = {}
function GlobalInclude( paths )
    if type(paths) == "string" then paths = {paths} end
    for _,v in ipairs(paths) do
        table.insert(_G.Includes, path.getabsolute(v))
    end
    sysincludedirs(_G.Includes)
end

function GlobalLibrary( paths )
    if type(paths) == "string" then paths = {paths} end
    for _,v in ipairs(paths) do
        table.insert(_G.Libraries, path.getabsolute(v))
    end
    syslibdirs(_G.Libraries)
end