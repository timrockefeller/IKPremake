function AddWorkspace(name)
    print("Project Generating:" , name)
    workspace (name) 
        location "build"
        language "C++"
        configurations {"Debug", "Release"}
        filter {"configurations:Debug"}
            symbols "On"
        filter {"configurations:Release"}
            optimize "On"
        filter {}
        targetdir ("build/target/%{prj.name}/%{cfg.longname}")
        objdir ("build/obj/%{prj.name}/%{cfg.longname}")
        postbuildcommands {
            ("{COPY} %{cfg.buildtarget.relpath} \"../bin/\"")
        }
    WorkspaceDir = os.getcwd()
end

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