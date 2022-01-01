# IKPremake

Quick start kit for cpp project based on premake5.

## Document

```lua
require ("premake/IKpmhead")

AddWorkspace("IKPremake")

GlobalInclude("include")
GlobalLibrary("lib")

IncludeRec("src")
```

Automaticaly search every `premake5.lua` and include them in `src` folder.

To create a target, just type:

```lua
AddTarget(TargetMode.EXE)
```