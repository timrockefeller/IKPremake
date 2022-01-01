_G.TargetMode = {}
TargetMode.EXE = 1
TargetMode.STATIC = 2
TargetMode.DYNAMIC = 3

function AddTarget(mode, inc, lib, ...)
    local _project = path.getbasename(os.getcwd())
    print("┌────────────────────────────────────────────────┐")
    print("","Target:", _project)

    local _kind = "ConsoleApp"
    if mode == TargetMode.EXE then
        _kind = "ConsoleApp"
    elseif mode == TargetMode.STATIC then
        _kind = "StaticLib"
    elseif mode == TargetMode.DYNAMIC then
        _kind = "SharedLib"
    else
        print ("Error: Unsupported type. ".. os.getcwd())
        return
    end

    local _includedirs = inc or {}
    for _,v in ipairs(_G.Includes) do
        table.insert(_includedirs, v)
    end


    print("", "Type: ", _kind)
    --Create project
    project (_project)
        kind (_kind)
        files {
            "./*.h",
            "./*.c",
            "./*.hpp",
            "./*.cpp",
            "./*.inl"
        }
        includedirs (_includedirs)
    print ("└────────────────────────────────────────────────┘")
end

function IncludeRec(path)
    if string.sub(path, 1, 1) ~= "/" then path = "/"..path end
    if string.sub(path, -1) ~= "/" then path = path .. "/" end
    local allpaths = os.matchdirs(os.getcwd()..path.."**")
    for _,v in ipairs(allpaths) do
        if #os.matchfiles(v .. "/premake5.lua") ~= 0 then include(v) end
    end
end

