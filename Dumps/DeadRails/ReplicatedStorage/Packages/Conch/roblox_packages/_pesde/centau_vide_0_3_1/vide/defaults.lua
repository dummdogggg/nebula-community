--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide.defaults
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:08
-- Luau version 6, Types version 3
-- Time taken: 0.003056 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local var1
local function INLINED() -- Internal function, doesn't exist in bytecode
	var1 = Enum
	return var1
end
if not game or not INLINED() then
	var1 = require("test/mock").Enum
end
if not game or not Color3 then
	local Color3 = require("test/mock").Color3
end
if not game or not Vector3 then
end
return {
	Part = {
		Material = var1.Material.SmoothPlastic;
		Size = require("test/mock").Vector3.new(1, 1, 1);
		Anchored = true;
	};
	BillboardGui = {
		ResetOnSpawn = false;
		ZIndexBehavior = var1.ZIndexBehavior.Sibling;
	};
	CanvasGroup = nil;
	Frame = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
	};
	ImageButton = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
		AutoButtonColor = false;
	};
	ImageLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
	};
	ScreenGui = {
		ResetOnSpawn = false;
		ZIndexBehavior = var1.ZIndexBehavior.Sibling;
	};
	ScrollingFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
		ScrollBarImageColor3 = Color3.new(0, 0, 0);
	};
	SurfaceGui = {
		ResetOnSpawn = false;
		ZIndexBehavior = var1.ZIndexBehavior.Sibling;
		PixelsPerStud = 50;
		SizingMode = var1.SurfaceGuiSizingMode.PixelsPerStud;
	};
	TextBox = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
		ClearTextOnFocus = false;
		Font = var1.Font.SourceSans;
		Text = "";
		TextColor3 = Color3.new(0, 0, 0);
	};
	TextButton = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
		AutoButtonColor = false;
		Font = var1.Font.SourceSans;
		Text = "";
		TextColor3 = Color3.new(0, 0, 0);
	};
	TextLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
		Font = var1.Font.SourceSans;
		Text = "";
		TextColor3 = Color3.new(0, 0, 0);
	};
	UIListLayout = {
		SortOrder = var1.SortOrder.LayoutOrder;
	};
	UIGridLayout = {
		SortOrder = var1.SortOrder.LayoutOrder;
	};
	UITableLayout = {
		SortOrder = var1.SortOrder.LayoutOrder;
	};
	UIPageLayout = {
		SortOrder = var1.SortOrder.LayoutOrder;
	};
	VideoFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
	};
	ViewportFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BorderColor3 = Color3.new(0, 0, 0);
		BorderSizePixel = 0;
	};
}