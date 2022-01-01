require ("premake/IKpmhead")

AddWorkspace("IKPremake")

GlobalInclude("include")
GlobalLibrary("lib")

IncludeRec("src")