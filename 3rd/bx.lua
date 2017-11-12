--
-- Copyright (c) 2017 Milos Tosic. All rights reserved.
-- License: http://www.opensource.org/licenses/BSD-2-Clause
--

local params		= { ... }
local BX_ROOT		= params[1]

local BX_INCLUDE	= {
	BX_ROOT .. "include",
	BX_ROOT .. "3rdparty",
	BX_ROOT .. "include/compat"
}

local BX_FILES = {
	BX_ROOT .. "include/bx/*.*",
	BX_ROOT .. "src/amalgamated.cpp",
}

function projectAdd_bx()
	addProject_3rdParty_lib("bx", BX_FILES, false, BX_INCLUDE)
end
