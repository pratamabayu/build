--
-- Copyright (c) 2017 Milos Tosic. All rights reserved.
-- License: http://www.opensource.org/licenses/BSD-2-Clause
--

function addProject_lib_sample(_name, _sampleName, _toolLibSample)
	
	group ("samples")
	project (_name .. "_sample_" ..  _sampleName)

		_toolLibSample = _toolLibSample or false

		language	"C++"
		kind		"ConsoleApp"
		uuid		( os.uuid(project().name) )

		local libsPath = getProjectPath(_name, ProjectPath.Root)

		project().path = libsPath .. _name .. "/"

		local srcFilesPath = project().path .. "samples/" .. _sampleName .. "/"
		local incFilesPath = project().path .. "samples/" .. _sampleName .. "/"

		local	sourceFiles = mergeTables(	{ srcFilesPath .. "**.cpp" },
											{ incFilesPath .. "**.h" } )
		files  { sourceFiles }
		
		local name = _sampleName
		if string.find(_sampleName, "_") ~= nil then
			name = string.sub(_sampleName, string.find(_sampleName, "_") + 1, string.len(_sampleName))
		end
	
		addPCH( srcFilesPath, name )

		includedirs
		{ 
			project().path .. "samples/",
			incFilesPath,
		}
		
		flags { Flags_nameraries }

		assert(loadfile(RTM_SCRIPTS_DIR .. "configurations.lua"))(	sourceFiles,
																	false,	-- IS_nameRARY
																	false,	-- IS_SHARED_nameRARY
																	false,	-- COPY_QT_DLLS
																	false,	-- WITH_QT
																	true	-- EXECUTABLE
																	)
		addDependencies(_sampleName, { "rapp", _name })
end

