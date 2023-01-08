#!/bin/lua

--[[
   Make sure the library is called say,
   TEMPORARYNAME.so or TEMPORARYNAME.dll
   This is required due to an inconsistency 
   in the SWIG binding generator. Sorry!
--]] require "TEMPORARYNAME"

function main()
    print("Running TEMPORARYNAME!")
    app = TEMPORARYNAME.VulkanApplication()
    app.run(app)
end

main()