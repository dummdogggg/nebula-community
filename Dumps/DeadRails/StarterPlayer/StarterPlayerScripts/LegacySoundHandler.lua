--[[
    Script: StarterPlayer.StarterPlayerScripts.LegacySoundHandler
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_char_0 = string.char;
local l_byte_0 = string.byte;
local l_sub_0 = string.sub;
local l_bxor_0 = (bit32 or bit).bxor;
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local function v10(v6, v7) --[[ Line: 27 ]] --[[ Name: v7 ]]
    -- upvalues: l_bxor_0 (copy), l_sub_0 (copy), l_byte_0 (copy), l_char_0 (copy), l_insert_0 (copy), l_concat_0 (copy)
    local v8 = {};
    for v9 = 1, #v6 do
        l_insert_0(v8, (l_char_0(l_bxor_0(l_byte_0((l_sub_0(v6, v9, v9 + 1))), l_byte_0((l_sub_0(v7, 1 + v9 % #v7, 1 + v9 % #v7 + 1)))) % 256)));
    end;
    return l_concat_0(v8);
end;
local l_game_Service_0 = game:GetService(v10("\227\198\203)\239\184\198\n\212\199\2321\233\169\198\025\212", "~\177\163\187E\134\219\167"));
local l_game_Service_1 = game:GetService(v10("\015\194-\246\2491\219#\198\249", "\156C\173J\165"));
local v13 = l_game_Service_0:WaitForChild(v10("\006\178D\025\168#U", "&T\215)v\220F")):WaitForChild(v10("`\026#\v\221\\\031'\028\234c\0257\028\250", "\1580vBr"));
local v14 = {
    v10("\1326\0259}\229\215\162&\0027a\188", "\155\203DpV\019\197"), 
    v10("t\220/\250I}\233\252\006\193v\210Ol\165\235C\216?\242G8\252\247S\207v\253Cl\236\247H\206v\245N8\235\247R\2120\245Cy\241\241I\211%\163", "\152&\189V\156 \024\133"), 
    v10("\223_\162E\247\023\163I\255D\233U\245E\174S\239\025\170C\242B\231@\243E\231N\249[\183\006\235^\179N\188e\166_\250^\162J\248\023\180V\249T\174@\245T\231B\249A\162J\243G\170C\242C\233", "&\1567\199")
};
l_game_Service_1.MessageOut:Connect(function(v15) --[[ Line: 27 ]] --[[ Name: v12 ]]
    -- upvalues: v14 (copy), v13 (copy)
    for _, v17 in v14 do
        if string.match(v15, v17) then
            v13:FireServer();
        end;
    end;
end);