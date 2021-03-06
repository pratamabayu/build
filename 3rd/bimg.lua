--
-- Copyright (c) 2018 Milos Tosic. All rights reserved.
-- License: http://www.opensource.org/licenses/BSD-2-Clause
--

-- https://github.com/bkaradzic/bimg

local params		= { ... }
local BIMG_ROOT		= params[1]

local BIMG_INCLUDE	= {
	BIMG_ROOT .. "include",
	BIMG_ROOT .. "3rdparty",
	BIMG_ROOT .. "3rdparty/iqa/include",
	find3rdPartyProject("bx") .. "include"
}

local BIMG_FILES = {
	BIMG_ROOT .. "include/**.h",
	BIMG_ROOT .. "src/**.h",
	BIMG_ROOT .. "src/**.cpp",
}

function projectDependencies_bimg()
	return { "bx" }
end 

function projectExtraConfig_bimg()
	includedirs { BIMG_INCLUDE }
end

function projectAdd_bimg()
	addProject_3rdParty_lib("bimg", BIMG_FILES)
end

