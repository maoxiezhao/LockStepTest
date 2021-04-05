dofile("../tools/premake/options.lua")
dofile("../tools/premake/globals.lua")
dofile("../tools/premake/plugins.lua")
dofile("../tools/premake/example_app.lua")

app_name = "lockStepTest"
start_project = app_name

-- total solution
solution ("LockStepTest")
    location ("build/" .. platform_dir ) 
    cppdialect "C++17"
    language "C++"
    startproject "test"
    configurations { "Debug", "Release" }
    setup_project_env()

    -- Debug config
    filter {"configurations:Debug"}
        flags { "MultiProcessorCompile"}
        symbols "On"

    -- Release config
    filter {"configurations:Release"}
        flags { "MultiProcessorCompile"}
        optimize "On"

    -- Reset the filter for other settings
    filter { }

-- example projects
print("-------------------------------------------------------------")
print("[APPS]")
print("-------------------------------------------------------------")
create_example_app(
    app_name, 
    "../src", 
    get_current_script_path(), 
    "ConsoleApp",
    nil,    -- plugins
    nil,    -- extra_dependencies
    function()
        -- includes
        includedirs {
            -- asio
            "../3rdparty/asio/include", 
            -- 3rdParty
            "../3rdparty", 
        }
    end
)
print("-------------------------------------------------------------")