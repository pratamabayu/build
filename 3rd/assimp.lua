--
-- Copyright (c) 2018 Milos Tosic. All rights reserved.
-- License: http://www.opensource.org/licenses/BSD-2-Clause
--

-- https://github.com/assimp/assimp

local params		= { ... }
local ASSIMP_ROOT	= params[1]

local ASSIMP_FILES = {
	ASSIMP_ROOT .. "code/**.cpp",
	ASSIMP_ROOT .. "code/**.h",
	ASSIMP_ROOT .. "include/**.h",
	ASSIMP_ROOT .. "include/**.inl",
	ASSIMP_ROOT .. "include/**.hpp",
	ASSIMP_ROOT .. "contrib/clipper/**.h",
	ASSIMP_ROOT .. "contrib/clipper/**.cpp",
	ASSIMP_ROOT .. "contrib/ConvertUTF/**.h",
	ASSIMP_ROOT .. "contrib/ConvertUTF/**.c",
	ASSIMP_ROOT .. "contrib/irrXML/**.h",
	ASSIMP_ROOT .. "contrib/irrXML/**.cpp",
	ASSIMP_ROOT .. "contrib/poly2tri/poly2tri/**.h",
	ASSIMP_ROOT .. "contrib/poly2tri/poly2tri/**.cc",
	ASSIMP_ROOT .. "contrib/unzip/**.h",
	ASSIMP_ROOT .. "contrib/unzip/**.c",
	ASSIMP_ROOT .. "contrib/zlib/**.h",
	ASSIMP_ROOT .. "contrib/zlib/**.c",	
}

local ASSIMP_INCLUDES = {
	ASSIMP_ROOT,
	ASSIMP_ROOT .. "include/",	
	ASSIMP_ROOT .. "contrib/rapidjson/include/",
	ASSIMP_ROOT .. "contrib/irrXML/",
	ASSIMP_ROOT .. "contrib/openddlparser/include/",
	ASSIMP_ROOT .. "contrib/zlib/",
	ASSIMP_ROOT .. "code/BoostWorkaround/"
}

local sedCommand = getToolForHost("sed")

function projectExtraConfig_assimp()
	if os.is("windows") then
		prebuildcommands(string.gsub("copy " .. ASSIMP_ROOT .. "include/assimp/config.h.in " .. ASSIMP_ROOT .. "include/assimp/config.h", "/", "\\"))
		prebuildcommands(string.gsub(sedCommand, "/", "\\") .. " -i s/" .. '"cmakedefine ASSIMP_DOUBLE_PRECISION"' .. "/" .. '"define ASSIMP_FUCK_DOUBLE_PRECISION"' .. "/g " .. string.gsub(ASSIMP_ROOT .. "include/assimp/config.h", "/", "\\"))

		prebuildcommands(string.gsub("copy " .. ASSIMP_ROOT .. "revision.h.in " .. ASSIMP_ROOT .. "code/revision.h", "/", "\\"))
		prebuildcommands(string.gsub(sedCommand, "/", "\\") .. " -i s/0x@GIT_COMMIT_HASH@/0/g " .. string.gsub(ASSIMP_ROOT .. "code/revision.h", "/", "\\"))

		prebuildcommands(string.gsub("copy " .. ASSIMP_ROOT .. "contrib/zlib/zconf.h.included " .. ASSIMP_ROOT .. "contrib/zlib/zconf.h", "/", "\\"))
	else
		prebuildcommands("cp " .. ASSIMP_ROOT .. "include/assimp/config.h.in " ..  ASSIMP_ROOT .. "include/assimp/config.h")
		prebuildcommands("sed -i s/" .. '"cmakedefine ASSIMP_DOUBLE_PRECISION"' .. "/" .. '"define ASSIMP_FUCK_DOUBLE_PRECISION"' .. "/g " .. ASSIMP_ROOT .. "include/assimp/config.h")

		prebuildcommands("cp " .. ASSIMP_ROOT .. "revision.h.in " .. ASSIMP_ROOT .. "code/revision.h")
		prebuildcommands("sed -i s/0x@GIT_COMMIT_HASH@/0/g " .. ASSIMP_ROOT .. "code/revision.h")

		prebuildcommands("cp " .. ASSIMP_ROOT .. "contrib/zlib/zconf.h.included " .. ASSIMP_ROOT .. "contrib/zlib/zconf.h")
	end

	includedirs { ASSIMP_INCLUDES }
	defines {"ASSIMP_BUILD_NO_IFC_IMPORTER", "ASSIMP_BUILD_NO_C4D_IMPORTER" }

	configuration {}
end 

-- disable IFC importer as it fails to compile with TDM-GCC 4.8.1
function projectAdd_assimp()
	addProject_3rdParty_lib("assimp", ASSIMP_FILES, true)
end

