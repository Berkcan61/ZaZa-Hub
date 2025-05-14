-- [[ GENERATED WITH InfernoHub/Scriptify STUDIO PLUGIN ]] --
-- Scriptify Version: 1.0

--

-- Create objects
local parent = nil;
local objects = {
	["Instance0"] = Instance.new("ScreenGui"); -- OctoSpy
	["Instance1"] = Instance.new("LocalScript"); -- Main
	["Instance2"] = Instance.new("ModuleScript"); -- CodeBox
	["Instance3"] = Instance.new("TextButton"); -- Window
	["Instance4"] = Instance.new("TextLabel"); -- Title
	["Instance5"] = Instance.new("TextButton"); -- Close
	["Instance6"] = Instance.new("TextButton"); -- Toggle
	["Instance7"] = Instance.new("ImageLabel"); -- State
	["Instance8"] = Instance.new("Frame"); -- WindowView
	["Instance9"] = Instance.new("Frame"); -- Shadow
	["Instance10"] = Instance.new("Folder"); -- Stroke
	["Instance11"] = Instance.new("Frame"); -- Left
	["Instance12"] = Instance.new("Frame"); -- Right
	["Instance13"] = Instance.new("Frame"); -- Bottom
	["Instance14"] = Instance.new("Frame"); -- Logs
	["Instance15"] = Instance.new("ScrollingFrame"); -- To
	["Instance16"] = Instance.new("UIListLayout"); -- UIListLayout
	["Instance17"] = Instance.new("ScrollingFrame"); -- From
	["Instance18"] = Instance.new("UIListLayout"); -- UIListLayout
	["Instance19"] = Instance.new("TextButton"); -- Log
	["Instance20"] = Instance.new("Frame"); -- Display
	["Instance21"] = Instance.new("Frame"); -- Type
	["Instance22"] = Instance.new("UIStroke"); -- UIStroke
	["Instance23"] = Instance.new("TextLabel"); -- RName
	["Instance24"] = Instance.new("Frame"); -- Selection
	["Instance25"] = Instance.new("Frame"); -- FromServer
	["Instance26"] = Instance.new("TextButton"); -- Scale
	["Instance27"] = Instance.new("Frame"); -- ContentView
	["Instance28"] = Instance.new("ScrollingFrame"); -- ScrollingFrame
	["Instance29"] = Instance.new("UIGridLayout"); -- UIGridLayout
	["Instance30"] = Instance.new("Frame"); -- ButtonRow
	["Instance31"] = Instance.new("Frame"); -- Display
	["Instance32"] = Instance.new("UIStroke"); -- UIStroke
	["Instance33"] = Instance.new("Frame"); -- Type_BUTTON
	["Instance34"] = Instance.new("TextLabel"); -- RName
	["Instance35"] = Instance.new("TextButton"); -- Button
	["Instance36"] = Instance.new("Frame"); -- Shadow
	["Instance37"] = Instance.new("TextBox"); -- CodeBox
	["Instance38"] = Instance.new("UIStroke"); -- UIStroke
	["Instance39"] = Instance.new("TextButton"); -- Toggle2
	["Instance40"] = Instance.new("ImageLabel"); -- Picture
	["Instance41"] = Instance.new("ImageLabel"); -- State
	["Instance42"] = Instance.new("TextButton"); -- Help
	["Instance43"] = Instance.new("ImageLabel"); -- Picture
	["Instance44"] = Instance.new("Frame"); -- Notifications
	["Instance45"] = Instance.new("Frame"); -- NotificationBase
	["Instance46"] = Instance.new("Frame"); -- Display
	["Instance47"] = Instance.new("UIStroke"); -- UIStroke
	["Instance48"] = Instance.new("Frame"); -- Bar
	["Instance49"] = Instance.new("Frame"); -- Frame
	["Instance50"] = Instance.new("TextLabel"); -- Title
	["Instance51"] = Instance.new("UIPadding"); -- UIPadding
	["Instance52"] = Instance.new("TextLabel"); -- Content
	["Instance53"] = Instance.new("UIListLayout"); -- UIListLayout
	["Instance54"] = Instance.new("Frame"); -- PCNotification
	["Instance55"] = Instance.new("UIStroke"); -- UIStroke
	["Instance56"] = Instance.new("TextLabel"); -- Title
	["Instance57"] = Instance.new("Frame"); -- Exit
	["Instance58"] = Instance.new("Frame"); -- Display
	["Instance59"] = Instance.new("UIStroke"); -- UIStroke
	["Instance60"] = Instance.new("Frame"); -- Type_BUTTON
	["Instance61"] = Instance.new("TextLabel"); -- RName
	["Instance62"] = Instance.new("TextButton"); -- Button
	["Instance63"] = Instance.new("TextLabel"); -- Text
	["Instance64"] = Instance.new("Frame"); -- Next
	["Instance65"] = Instance.new("Frame"); -- Display
	["Instance66"] = Instance.new("UIStroke"); -- UIStroke
	["Instance67"] = Instance.new("Frame"); -- Type_BUTTON
	["Instance68"] = Instance.new("TextLabel"); -- RName
	["Instance69"] = Instance.new("TextButton"); -- Button
	["Instance70"] = Instance.new("Frame"); -- Previous
	["Instance71"] = Instance.new("Frame"); -- Display
	["Instance72"] = Instance.new("UIStroke"); -- UIStroke
	["Instance73"] = Instance.new("Frame"); -- Type_BUTTON
	["Instance74"] = Instance.new("TextLabel"); -- RName
	["Instance75"] = Instance.new("TextButton"); -- Button
	["Instance76"] = Instance.new("Frame"); -- Load
	["Instance77"] = Instance.new("Frame"); -- Display
	["Instance78"] = Instance.new("UIStroke"); -- UIStroke
	["Instance79"] = Instance.new("Frame"); -- Type_BUTTON
	["Instance80"] = Instance.new("TextLabel"); -- RName
	["Instance81"] = Instance.new("TextButton"); -- Button
};

do -- Set properties
	objects["Instance0"]["Enabled"] = true;
	objects["Instance0"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
	objects["Instance0"]["SafeAreaCompatibility"] = Enum.SafeAreaCompatibility.FullscreenExtension;
	objects["Instance0"]["ClipToDeviceSafeArea"] = true;
	objects["Instance0"]["Parent"] = parent;
	objects["Instance0"]["IgnoreGuiInset"] = true;
	objects["Instance0"]["Name"] = "OctoSpy";
	objects["Instance0"]["DisplayOrder"] = 999999999;

	objects["Instance1"]["Parent"] = objects["Instance0"];
	objects["Instance1"]["Name"] = "Main";
	objects["Instance1"]["Enabled"] = true;

	objects["Instance2"]["Parent"] = objects["Instance1"];
	objects["Instance2"]["Name"] = "CodeBox";

	objects["Instance3"]["Visible"] = false;
	objects["Instance3"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance3"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance3"]["Active"] = true;
	objects["Instance3"]["TextStrokeTransparency"] = 1;
	objects["Instance3"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance3"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance3"]["ZIndex"] = -9;
	objects["Instance3"]["BorderSizePixel"] = 0;
	objects["Instance3"]["Draggable"] = false;
	objects["Instance3"]["RichText"] = false;
	objects["Instance3"]["Modal"] = false;
	objects["Instance3"]["AutoButtonColor"] = false;
	objects["Instance3"]["Transparency"] = 0;
	objects["Instance3"]["SelectionOrder"] = 0;
	objects["Instance3"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance3"]["TextScaled"] = false;
	objects["Instance3"]["TextWrap"] = false;
	objects["Instance3"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance3"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance3"]["Parent"] = objects["Instance0"];
	objects["Instance3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance3"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance3"]["Position"] = UDim2.new(0.5, 0, 0.5, -113);
	objects["Instance3"]["BackgroundColor3"] = Color3.new(0.176471, 0.176471, 0.254902);
	objects["Instance3"]["Selected"] = false;
	objects["Instance3"]["TextSize"] = 14;
	objects["Instance3"]["Size"] = UDim2.new(0, 500, 0, 23);
	objects["Instance3"]["BackgroundTransparency"] = 0;
	objects["Instance3"]["TextWrapped"] = false;
	objects["Instance3"]["ClipsDescendants"] = false;
	objects["Instance3"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance3"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance3"]["Text"] = "";
	objects["Instance3"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance3"]["LayoutOrder"] = 0;
	objects["Instance3"]["Rotation"] = 0;
	objects["Instance3"]["LineHeight"] = 1;
	objects["Instance3"]["Name"] = "Window";
	objects["Instance3"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance3"]["Selectable"] = true;
	objects["Instance3"]["MaxVisibleGraphemes"] = -1;
	objects["Instance3"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance3"]["TextTransparency"] = 0;

	objects["Instance4"]["Visible"] = true;
	objects["Instance4"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance4"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance4"]["Active"] = false;
	objects["Instance4"]["TextStrokeTransparency"] = 0;
	objects["Instance4"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance4"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance4"]["ZIndex"] = -8;
	objects["Instance4"]["BorderSizePixel"] = 0;
	objects["Instance4"]["Draggable"] = false;
	objects["Instance4"]["RichText"] = false;
	objects["Instance4"]["Transparency"] = 1;
	objects["Instance4"]["SelectionOrder"] = 0;
	objects["Instance4"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance4"]["TextScaled"] = true;
	objects["Instance4"]["TextWrap"] = true;
	objects["Instance4"]["FontFace"] = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance4"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance4"]["Parent"] = objects["Instance3"];
	objects["Instance4"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance4"]["TextSize"] = 14;
	objects["Instance4"]["Position"] = UDim2.new(0.019999999552965164, 0, 0.5, 0);
	objects["Instance4"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance4"]["Size"] = UDim2.new(0.30000001192092896, 0, 0.699999988079071, 0);
	objects["Instance4"]["BackgroundTransparency"] = 1;
	objects["Instance4"]["LineHeight"] = 1;
	objects["Instance4"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance4"]["TextColor3"] = Color3.new(1, 0.333333, 0.498039);
	objects["Instance4"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance4"]["Text"] = "Octo~Spy | v1.0.5";
	objects["Instance4"]["LayoutOrder"] = 0;
	objects["Instance4"]["TextWrapped"] = true;
	objects["Instance4"]["Rotation"] = 0;
	objects["Instance4"]["TextTransparency"] = 0;
	objects["Instance4"]["Name"] = "Title";
	objects["Instance4"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	objects["Instance4"]["ClipsDescendants"] = false;
	objects["Instance4"]["MaxVisibleGraphemes"] = -1;
	objects["Instance4"]["TextStrokeColor3"] = Color3.new(0.215686, 0.215686, 0.254902);
	objects["Instance4"]["Selectable"] = false;

	objects["Instance5"]["Visible"] = true;
	objects["Instance5"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance5"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance5"]["Active"] = true;
	objects["Instance5"]["TextStrokeTransparency"] = 1;
	objects["Instance5"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance5"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance5"]["ZIndex"] = -8;
	objects["Instance5"]["BorderSizePixel"] = 0;
	objects["Instance5"]["Draggable"] = false;
	objects["Instance5"]["RichText"] = false;
	objects["Instance5"]["Modal"] = false;
	objects["Instance5"]["AutoButtonColor"] = true;
	objects["Instance5"]["Transparency"] = 0;
	objects["Instance5"]["SelectionOrder"] = 0;
	objects["Instance5"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance5"]["TextScaled"] = false;
	objects["Instance5"]["TextWrap"] = false;
	objects["Instance5"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance5"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance5"]["Parent"] = objects["Instance3"];
	objects["Instance5"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance5"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance5"]["Position"] = UDim2.new(1, -23, 0, 0);
	objects["Instance5"]["BackgroundColor3"] = Color3.new(0.176471, 0.176471, 0.254902);
	objects["Instance5"]["Selected"] = false;
	objects["Instance5"]["TextSize"] = 14;
	objects["Instance5"]["Size"] = UDim2.new(0, 23, 0, 23);
	objects["Instance5"]["BackgroundTransparency"] = 0;
	objects["Instance5"]["TextWrapped"] = false;
	objects["Instance5"]["ClipsDescendants"] = false;
	objects["Instance5"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance5"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance5"]["Text"] = "X";
	objects["Instance5"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance5"]["LayoutOrder"] = 0;
	objects["Instance5"]["Rotation"] = 0;
	objects["Instance5"]["LineHeight"] = 1;
	objects["Instance5"]["Name"] = "Close";
	objects["Instance5"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance5"]["Selectable"] = true;
	objects["Instance5"]["MaxVisibleGraphemes"] = -1;
	objects["Instance5"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance5"]["TextTransparency"] = 0;

	objects["Instance6"]["Visible"] = true;
	objects["Instance6"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance6"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance6"]["Active"] = true;
	objects["Instance6"]["TextStrokeTransparency"] = 1;
	objects["Instance6"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance6"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance6"]["ZIndex"] = -8;
	objects["Instance6"]["BorderSizePixel"] = 0;
	objects["Instance6"]["Draggable"] = false;
	objects["Instance6"]["RichText"] = false;
	objects["Instance6"]["Modal"] = false;
	objects["Instance6"]["AutoButtonColor"] = true;
	objects["Instance6"]["Transparency"] = 0;
	objects["Instance6"]["SelectionOrder"] = 0;
	objects["Instance6"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance6"]["TextScaled"] = false;
	objects["Instance6"]["TextWrap"] = false;
	objects["Instance6"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance6"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance6"]["Parent"] = objects["Instance3"];
	objects["Instance6"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance6"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance6"]["Position"] = UDim2.new(1, -46, 0, 0);
	objects["Instance6"]["BackgroundColor3"] = Color3.new(0.176471, 0.176471, 0.254902);
	objects["Instance6"]["Selected"] = false;
	objects["Instance6"]["TextSize"] = 14;
	objects["Instance6"]["Size"] = UDim2.new(0, 23, 0, 23);
	objects["Instance6"]["BackgroundTransparency"] = 0;
	objects["Instance6"]["TextWrapped"] = false;
	objects["Instance6"]["ClipsDescendants"] = false;
	objects["Instance6"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance6"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance6"]["Text"] = "";
	objects["Instance6"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance6"]["LayoutOrder"] = 0;
	objects["Instance6"]["Rotation"] = 0;
	objects["Instance6"]["LineHeight"] = 1;
	objects["Instance6"]["Name"] = "Toggle";
	objects["Instance6"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance6"]["Selectable"] = true;
	objects["Instance6"]["MaxVisibleGraphemes"] = -1;
	objects["Instance6"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance6"]["TextTransparency"] = 0;

	objects["Instance7"]["Visible"] = true;
	objects["Instance7"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance7"]["Size"] = UDim2.new(0.800000011920929, 0, 0.800000011920929, 0);
	objects["Instance7"]["ImageTransparency"] = 0;
	objects["Instance7"]["Parent"] = objects["Instance6"];
	objects["Instance7"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance7"]["BackgroundTransparency"] = 1;
	objects["Instance7"]["ImageRectOffset"] = Vector2.new(112, 0);
	objects["Instance7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance7"]["Image"] = "rbxassetid://6511490623";
	objects["Instance7"]["TileSize"] = UDim2.new(1, 0, 1, 0);
	objects["Instance7"]["ImageRectSize"] = Vector2.new(16, 16);
	objects["Instance7"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance7"]["ZIndex"] = -7;
	objects["Instance7"]["BorderSizePixel"] = 0;
	objects["Instance7"]["SliceCenter"] = Rect.new(0, 0, 0, 0);
	objects["Instance7"]["Draggable"] = false;
	objects["Instance7"]["ScaleType"] = Enum.ScaleType.Stretch;
	objects["Instance7"]["ResampleMode"] = Enum.ResamplerMode.Default;
	objects["Instance7"]["ClipsDescendants"] = false;
	objects["Instance7"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance7"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance7"]["LayoutOrder"] = 0;
	objects["Instance7"]["ImageColor3"] = Color3.new(1, 1, 1);
	objects["Instance7"]["Rotation"] = 0;
	objects["Instance7"]["Transparency"] = 1;
	objects["Instance7"]["Name"] = "State";
	objects["Instance7"]["SelectionOrder"] = 0;
	objects["Instance7"]["SliceScale"] = 1;
	objects["Instance7"]["Selectable"] = false;
	objects["Instance7"]["Active"] = false;
	objects["Instance7"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance8"]["LayoutOrder"] = 0;
	objects["Instance8"]["Active"] = false;
	objects["Instance8"]["Parent"] = objects["Instance3"];
	objects["Instance8"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance8"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance8"]["ZIndex"] = -8;
	objects["Instance8"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance8"]["Size"] = UDim2.new(1, 0, 0, 227);
	objects["Instance8"]["Draggable"] = false;
	objects["Instance8"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance8"]["ClipsDescendants"] = false;
	objects["Instance8"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance8"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance8"]["BackgroundTransparency"] = 0;
	objects["Instance8"]["BorderSizePixel"] = 0;
	objects["Instance8"]["Rotation"] = 0;
	objects["Instance8"]["Transparency"] = 0;
	objects["Instance8"]["Name"] = "WindowView";
	objects["Instance8"]["SelectionOrder"] = 0;
	objects["Instance8"]["Visible"] = true;
	objects["Instance8"]["Selectable"] = false;
	objects["Instance8"]["Position"] = UDim2.new(0, 0, 1, 0);
	objects["Instance8"]["BackgroundColor3"] = Color3.new(0.137255, 0.137255, 0.196078);

	objects["Instance9"]["LayoutOrder"] = 0;
	objects["Instance9"]["Active"] = false;
	objects["Instance9"]["Parent"] = objects["Instance8"];
	objects["Instance9"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance9"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance9"]["ZIndex"] = -7;
	objects["Instance9"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance9"]["Size"] = UDim2.new(1, 0, 0, 3);
	objects["Instance9"]["Draggable"] = false;
	objects["Instance9"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance9"]["ClipsDescendants"] = false;
	objects["Instance9"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance9"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance9"]["BackgroundTransparency"] = 0;
	objects["Instance9"]["BorderSizePixel"] = 0;
	objects["Instance9"]["Rotation"] = 0;
	objects["Instance9"]["Transparency"] = 0;
	objects["Instance9"]["Name"] = "Shadow";
	objects["Instance9"]["SelectionOrder"] = 0;
	objects["Instance9"]["Visible"] = true;
	objects["Instance9"]["Selectable"] = false;
	objects["Instance9"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance9"]["BackgroundColor3"] = Color3.new(0.0941176, 0.0941176, 0.133333);

	objects["Instance10"]["Name"] = "Stroke";
	objects["Instance10"]["Parent"] = objects["Instance8"];

	objects["Instance11"]["LayoutOrder"] = 0;
	objects["Instance11"]["Active"] = false;
	objects["Instance11"]["Parent"] = objects["Instance10"];
	objects["Instance11"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance11"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance11"]["ZIndex"] = 240;
	objects["Instance11"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance11"]["Size"] = UDim2.new(0, 2, 1, 2);
	objects["Instance11"]["Draggable"] = false;
	objects["Instance11"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance11"]["ClipsDescendants"] = false;
	objects["Instance11"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance11"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance11"]["BackgroundTransparency"] = 0;
	objects["Instance11"]["BorderSizePixel"] = 0;
	objects["Instance11"]["Rotation"] = 0;
	objects["Instance11"]["Transparency"] = 0;
	objects["Instance11"]["Name"] = "Left";
	objects["Instance11"]["SelectionOrder"] = 0;
	objects["Instance11"]["Visible"] = true;
	objects["Instance11"]["Selectable"] = false;
	objects["Instance11"]["Position"] = UDim2.new(0, -2, 0, 0);
	objects["Instance11"]["BackgroundColor3"] = Color3.new(0, 0, 0);

	objects["Instance12"]["LayoutOrder"] = 0;
	objects["Instance12"]["Active"] = false;
	objects["Instance12"]["Parent"] = objects["Instance10"];
	objects["Instance12"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance12"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance12"]["ZIndex"] = 240;
	objects["Instance12"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance12"]["Size"] = UDim2.new(0, 2, 1, 2);
	objects["Instance12"]["Draggable"] = false;
	objects["Instance12"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance12"]["ClipsDescendants"] = false;
	objects["Instance12"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance12"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance12"]["BackgroundTransparency"] = 0;
	objects["Instance12"]["BorderSizePixel"] = 0;
	objects["Instance12"]["Rotation"] = 0;
	objects["Instance12"]["Transparency"] = 0;
	objects["Instance12"]["Name"] = "Right";
	objects["Instance12"]["SelectionOrder"] = 0;
	objects["Instance12"]["Visible"] = true;
	objects["Instance12"]["Selectable"] = false;
	objects["Instance12"]["Position"] = UDim2.new(1, 0, 0, 0);
	objects["Instance12"]["BackgroundColor3"] = Color3.new(0, 0, 0);

	objects["Instance13"]["LayoutOrder"] = 0;
	objects["Instance13"]["Active"] = false;
	objects["Instance13"]["Parent"] = objects["Instance10"];
	objects["Instance13"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance13"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance13"]["ZIndex"] = 240;
	objects["Instance13"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance13"]["Size"] = UDim2.new(1, 0, 0, 2);
	objects["Instance13"]["Draggable"] = false;
	objects["Instance13"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance13"]["ClipsDescendants"] = false;
	objects["Instance13"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance13"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance13"]["BackgroundTransparency"] = 0;
	objects["Instance13"]["BorderSizePixel"] = 0;
	objects["Instance13"]["Rotation"] = 0;
	objects["Instance13"]["Transparency"] = 0;
	objects["Instance13"]["Name"] = "Bottom";
	objects["Instance13"]["SelectionOrder"] = 0;
	objects["Instance13"]["Visible"] = true;
	objects["Instance13"]["Selectable"] = false;
	objects["Instance13"]["Position"] = UDim2.new(0, 0, 1, 0);
	objects["Instance13"]["BackgroundColor3"] = Color3.new(0, 0, 0);

	objects["Instance14"]["LayoutOrder"] = 0;
	objects["Instance14"]["Active"] = false;
	objects["Instance14"]["Parent"] = objects["Instance8"];
	objects["Instance14"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance14"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance14"]["ZIndex"] = -7;
	objects["Instance14"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance14"]["Size"] = UDim2.new(0, 120, 1, -3);
	objects["Instance14"]["Draggable"] = false;
	objects["Instance14"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance14"]["ClipsDescendants"] = true;
	objects["Instance14"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance14"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance14"]["BackgroundTransparency"] = 0;
	objects["Instance14"]["BorderSizePixel"] = 0;
	objects["Instance14"]["Rotation"] = 0;
	objects["Instance14"]["Transparency"] = 0;
	objects["Instance14"]["Name"] = "Logs";
	objects["Instance14"]["SelectionOrder"] = 0;
	objects["Instance14"]["Visible"] = true;
	objects["Instance14"]["Selectable"] = false;
	objects["Instance14"]["Position"] = UDim2.new(0, 0, 0, 3);
	objects["Instance14"]["BackgroundColor3"] = Color3.new(0.113725, 0.113725, 0.160784);

	objects["Instance15"]["Visible"] = true;
	objects["Instance15"]["Active"] = true;
	objects["Instance15"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
	objects["Instance15"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance15"]["ZIndex"] = -5;
	objects["Instance15"]["BorderSizePixel"] = 0;
	objects["Instance15"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	objects["Instance15"]["Draggable"] = false;
	objects["Instance15"]["MidImage"] = "rbxasset://textures/ui/Scroll/scroll-middle.png";
	objects["Instance15"]["CanvasPosition"] = Vector2.new(0, 0);
	objects["Instance15"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.None;
	objects["Instance15"]["Transparency"] = 0;
	objects["Instance15"]["TopImage"] = "rbxasset://textures/ui/Scroll/scroll-top.png";
	objects["Instance15"]["SelectionOrder"] = 0;
	objects["Instance15"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.None;
	objects["Instance15"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance15"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	objects["Instance15"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left;
	objects["Instance15"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance15"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance15"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance15"]["ScrollBarImageColor3"] = Color3.new(0, 0, 0);
	objects["Instance15"]["BackgroundColor3"] = Color3.new(0.113725, 0.113725, 0.160784);
	objects["Instance15"]["Selectable"] = true;
	objects["Instance15"]["ClipsDescendants"] = true;
	objects["Instance15"]["ScrollBarImageTransparency"] = 0;
	objects["Instance15"]["ScrollBarThickness"] = 3;
	objects["Instance15"]["Parent"] = objects["Instance14"];
	objects["Instance15"]["BackgroundTransparency"] = 0;
	objects["Instance15"]["Rotation"] = 0;
	objects["Instance15"]["LayoutOrder"] = 0;
	objects["Instance15"]["Name"] = "To";
	objects["Instance15"]["Position"] = UDim2.new(-1, -3, 0, 0);
	objects["Instance15"]["ScrollingEnabled"] = true;
	objects["Instance15"]["BottomImage"] = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
	objects["Instance15"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance15"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;

	objects["Instance16"]["FillDirection"] = Enum.FillDirection.Vertical;
	objects["Instance16"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Left;
	objects["Instance16"]["VerticalFlex"] = Enum.UIFlexAlignment.None;
	objects["Instance16"]["Parent"] = objects["Instance15"];
	objects["Instance16"]["VerticalAlignment"] = Enum.VerticalAlignment.Top;
	objects["Instance16"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	objects["Instance16"]["Name"] = "UIListLayout";
	objects["Instance16"]["Padding"] = UDim.new(0, 0);
	objects["Instance16"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Automatic;
	objects["Instance16"]["HorizontalFlex"] = Enum.UIFlexAlignment.None;

	objects["Instance17"]["Visible"] = true;
	objects["Instance17"]["Active"] = true;
	objects["Instance17"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
	objects["Instance17"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance17"]["ZIndex"] = -5;
	objects["Instance17"]["BorderSizePixel"] = 0;
	objects["Instance17"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	objects["Instance17"]["Draggable"] = false;
	objects["Instance17"]["MidImage"] = "rbxasset://textures/ui/Scroll/scroll-middle.png";
	objects["Instance17"]["CanvasPosition"] = Vector2.new(0, 0);
	objects["Instance17"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.None;
	objects["Instance17"]["Transparency"] = 0;
	objects["Instance17"]["TopImage"] = "rbxasset://textures/ui/Scroll/scroll-top.png";
	objects["Instance17"]["SelectionOrder"] = 0;
	objects["Instance17"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.None;
	objects["Instance17"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance17"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	objects["Instance17"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left;
	objects["Instance17"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance17"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance17"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance17"]["ScrollBarImageColor3"] = Color3.new(0, 0, 0);
	objects["Instance17"]["BackgroundColor3"] = Color3.new(0.113725, 0.113725, 0.160784);
	objects["Instance17"]["Selectable"] = true;
	objects["Instance17"]["ClipsDescendants"] = true;
	objects["Instance17"]["ScrollBarImageTransparency"] = 0;
	objects["Instance17"]["ScrollBarThickness"] = 3;
	objects["Instance17"]["Parent"] = objects["Instance14"];
	objects["Instance17"]["BackgroundTransparency"] = 0;
	objects["Instance17"]["Rotation"] = 0;
	objects["Instance17"]["LayoutOrder"] = 0;
	objects["Instance17"]["Name"] = "From";
	objects["Instance17"]["Position"] = UDim2.new(-1, -3, 0, 0);
	objects["Instance17"]["ScrollingEnabled"] = true;
	objects["Instance17"]["BottomImage"] = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
	objects["Instance17"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance17"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;

	objects["Instance18"]["FillDirection"] = Enum.FillDirection.Vertical;
	objects["Instance18"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Left;
	objects["Instance18"]["VerticalFlex"] = Enum.UIFlexAlignment.None;
	objects["Instance18"]["Parent"] = objects["Instance17"];
	objects["Instance18"]["VerticalAlignment"] = Enum.VerticalAlignment.Top;
	objects["Instance18"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	objects["Instance18"]["Name"] = "UIListLayout";
	objects["Instance18"]["Padding"] = UDim.new(0, 0);
	objects["Instance18"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Automatic;
	objects["Instance18"]["HorizontalFlex"] = Enum.UIFlexAlignment.None;

	objects["Instance19"]["Visible"] = false;
	objects["Instance19"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance19"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance19"]["Active"] = true;
	objects["Instance19"]["TextStrokeTransparency"] = 1;
	objects["Instance19"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance19"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance19"]["ZIndex"] = -4;
	objects["Instance19"]["BorderSizePixel"] = 0;
	objects["Instance19"]["Draggable"] = false;
	objects["Instance19"]["RichText"] = false;
	objects["Instance19"]["Modal"] = false;
	objects["Instance19"]["AutoButtonColor"] = true;
	objects["Instance19"]["Transparency"] = 1;
	objects["Instance19"]["SelectionOrder"] = 0;
	objects["Instance19"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance19"]["TextScaled"] = false;
	objects["Instance19"]["TextWrap"] = false;
	objects["Instance19"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance19"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance19"]["Parent"] = objects["Instance14"];
	objects["Instance19"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance19"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance19"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance19"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance19"]["Selected"] = false;
	objects["Instance19"]["TextSize"] = 14;
	objects["Instance19"]["Size"] = UDim2.new(1, 0, 0, 30);
	objects["Instance19"]["BackgroundTransparency"] = 1;
	objects["Instance19"]["TextWrapped"] = false;
	objects["Instance19"]["ClipsDescendants"] = false;
	objects["Instance19"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance19"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance19"]["Text"] = "";
	objects["Instance19"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance19"]["LayoutOrder"] = 0;
	objects["Instance19"]["Rotation"] = 0;
	objects["Instance19"]["LineHeight"] = 1;
	objects["Instance19"]["Name"] = "Log";
	objects["Instance19"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance19"]["Selectable"] = true;
	objects["Instance19"]["MaxVisibleGraphemes"] = -1;
	objects["Instance19"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance19"]["TextTransparency"] = 0;

	objects["Instance20"]["LayoutOrder"] = 0;
	objects["Instance20"]["Active"] = false;
	objects["Instance20"]["Parent"] = objects["Instance19"];
	objects["Instance20"]["AnchorPoint"] = Vector2.new(0.5, 0);
	objects["Instance20"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance20"]["ZIndex"] = -3;
	objects["Instance20"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance20"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.6499999761581421, 0);
	objects["Instance20"]["Draggable"] = false;
	objects["Instance20"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance20"]["ClipsDescendants"] = false;
	objects["Instance20"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance20"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance20"]["BackgroundTransparency"] = 0;
	objects["Instance20"]["BorderSizePixel"] = 0;
	objects["Instance20"]["Rotation"] = 0;
	objects["Instance20"]["Transparency"] = 0;
	objects["Instance20"]["Name"] = "Display";
	objects["Instance20"]["SelectionOrder"] = 0;
	objects["Instance20"]["Visible"] = true;
	objects["Instance20"]["Selectable"] = false;
	objects["Instance20"]["Position"] = UDim2.new(0.5, 0, 0.3499999940395355, 0);
	objects["Instance20"]["BackgroundColor3"] = Color3.new(0.156863, 0.156863, 0.254902);

	objects["Instance21"]["LayoutOrder"] = 0;
	objects["Instance21"]["Active"] = false;
	objects["Instance21"]["Parent"] = objects["Instance20"];
	objects["Instance21"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance21"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance21"]["ZIndex"] = -2;
	objects["Instance21"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance21"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance21"]["Draggable"] = false;
	objects["Instance21"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance21"]["ClipsDescendants"] = false;
	objects["Instance21"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance21"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance21"]["BackgroundTransparency"] = 0;
	objects["Instance21"]["BorderSizePixel"] = 0;
	objects["Instance21"]["Rotation"] = 0;
	objects["Instance21"]["Transparency"] = 0;
	objects["Instance21"]["Name"] = "Type";
	objects["Instance21"]["SelectionOrder"] = 0;
	objects["Instance21"]["Visible"] = true;
	objects["Instance21"]["Selectable"] = false;
	objects["Instance21"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance21"]["BackgroundColor3"] = Color3.new(1, 0.666667, 0);

	objects["Instance22"]["Enabled"] = true;
	objects["Instance22"]["Transparency"] = 0;
	objects["Instance22"]["Name"] = "UIStroke";
	objects["Instance22"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance22"]["Parent"] = objects["Instance20"];
	objects["Instance22"]["Thickness"] = 1;
	objects["Instance22"]["Color"] = Color3.new(0.294118, 0.294118, 0.352941);
	objects["Instance22"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance23"]["Visible"] = true;
	objects["Instance23"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance23"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance23"]["Active"] = false;
	objects["Instance23"]["TextStrokeTransparency"] = 1;
	objects["Instance23"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance23"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance23"]["ZIndex"] = -2;
	objects["Instance23"]["BorderSizePixel"] = 0;
	objects["Instance23"]["Draggable"] = false;
	objects["Instance23"]["RichText"] = false;
	objects["Instance23"]["Transparency"] = 1;
	objects["Instance23"]["SelectionOrder"] = 0;
	objects["Instance23"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance23"]["TextScaled"] = true;
	objects["Instance23"]["TextWrap"] = true;
	objects["Instance23"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance23"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance23"]["Parent"] = objects["Instance20"];
	objects["Instance23"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance23"]["TextSize"] = 14;
	objects["Instance23"]["Position"] = UDim2.new(0.05000000074505806, 5, 0.5, 0);
	objects["Instance23"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance23"]["Size"] = UDim2.new(0.8999999761581421, -5, 0.6000000238418579, 0);
	objects["Instance23"]["BackgroundTransparency"] = 1;
	objects["Instance23"]["LineHeight"] = 1;
	objects["Instance23"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance23"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance23"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance23"]["Text"] = "RemoteName";
	objects["Instance23"]["LayoutOrder"] = 0;
	objects["Instance23"]["TextWrapped"] = true;
	objects["Instance23"]["Rotation"] = 0;
	objects["Instance23"]["TextTransparency"] = 0;
	objects["Instance23"]["Name"] = "RName";
	objects["Instance23"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance23"]["ClipsDescendants"] = false;
	objects["Instance23"]["MaxVisibleGraphemes"] = -1;
	objects["Instance23"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance23"]["Selectable"] = false;

	objects["Instance24"]["LayoutOrder"] = 0;
	objects["Instance24"]["Active"] = false;
	objects["Instance24"]["Parent"] = objects["Instance20"];
	objects["Instance24"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance24"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance24"]["ZIndex"] = -2;
	objects["Instance24"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance24"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance24"]["Draggable"] = false;
	objects["Instance24"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance24"]["ClipsDescendants"] = false;
	objects["Instance24"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance24"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance24"]["BackgroundTransparency"] = 0;
	objects["Instance24"]["BorderSizePixel"] = 0;
	objects["Instance24"]["Rotation"] = 0;
	objects["Instance24"]["Transparency"] = 0;
	objects["Instance24"]["Name"] = "Selection";
	objects["Instance24"]["SelectionOrder"] = 0;
	objects["Instance24"]["Visible"] = false;
	objects["Instance24"]["Selectable"] = false;
	objects["Instance24"]["Position"] = UDim2.new(1, -5, 0, 0);
	objects["Instance24"]["BackgroundColor3"] = Color3.new(0.333333, 1, 0.498039);

	objects["Instance25"]["LayoutOrder"] = 0;
	objects["Instance25"]["Active"] = false;
	objects["Instance25"]["Parent"] = objects["Instance20"];
	objects["Instance25"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance25"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance25"]["ZIndex"] = -2;
	objects["Instance25"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance25"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance25"]["Draggable"] = false;
	objects["Instance25"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance25"]["ClipsDescendants"] = false;
	objects["Instance25"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance25"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance25"]["BackgroundTransparency"] = 0;
	objects["Instance25"]["BorderSizePixel"] = 0;
	objects["Instance25"]["Rotation"] = 0;
	objects["Instance25"]["Transparency"] = 0;
	objects["Instance25"]["Name"] = "FromServer";
	objects["Instance25"]["SelectionOrder"] = 0;
	objects["Instance25"]["Visible"] = false;
	objects["Instance25"]["Selectable"] = false;
	objects["Instance25"]["Position"] = UDim2.new(0, 5, 0, 0);
	objects["Instance25"]["BackgroundColor3"] = Color3.new(1, 0.333333, 0.498039);

	objects["Instance26"]["Visible"] = true;
	objects["Instance26"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance26"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance26"]["Active"] = true;
	objects["Instance26"]["TextStrokeTransparency"] = 1;
	objects["Instance26"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance26"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance26"]["ZIndex"] = 989;
	objects["Instance26"]["BorderSizePixel"] = 0;
	objects["Instance26"]["Draggable"] = false;
	objects["Instance26"]["RichText"] = false;
	objects["Instance26"]["Modal"] = false;
	objects["Instance26"]["AutoButtonColor"] = true;
	objects["Instance26"]["Transparency"] = 0;
	objects["Instance26"]["SelectionOrder"] = 0;
	objects["Instance26"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance26"]["TextScaled"] = false;
	objects["Instance26"]["TextWrap"] = false;
	objects["Instance26"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance26"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance26"]["Parent"] = objects["Instance8"];
	objects["Instance26"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance26"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance26"]["Position"] = UDim2.new(0, 120, 0, 0);
	objects["Instance26"]["BackgroundColor3"] = Color3.new(0.0941176, 0.0941176, 0.133333);
	objects["Instance26"]["Selected"] = false;
	objects["Instance26"]["TextSize"] = 14;
	objects["Instance26"]["Size"] = UDim2.new(0, 3, 1, 0);
	objects["Instance26"]["BackgroundTransparency"] = 0;
	objects["Instance26"]["TextWrapped"] = false;
	objects["Instance26"]["ClipsDescendants"] = false;
	objects["Instance26"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance26"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance26"]["Text"] = "";
	objects["Instance26"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance26"]["LayoutOrder"] = 0;
	objects["Instance26"]["Rotation"] = 0;
	objects["Instance26"]["LineHeight"] = 1;
	objects["Instance26"]["Name"] = "Scale";
	objects["Instance26"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance26"]["Selectable"] = true;
	objects["Instance26"]["MaxVisibleGraphemes"] = -1;
	objects["Instance26"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance26"]["TextTransparency"] = 0;

	objects["Instance27"]["LayoutOrder"] = 0;
	objects["Instance27"]["Active"] = false;
	objects["Instance27"]["Parent"] = objects["Instance8"];
	objects["Instance27"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance27"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance27"]["ZIndex"] = -7;
	objects["Instance27"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance27"]["Size"] = UDim2.new(1, -123, 1, -3);
	objects["Instance27"]["Draggable"] = false;
	objects["Instance27"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance27"]["ClipsDescendants"] = false;
	objects["Instance27"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance27"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance27"]["BackgroundTransparency"] = 0;
	objects["Instance27"]["BorderSizePixel"] = 0;
	objects["Instance27"]["Rotation"] = 0;
	objects["Instance27"]["Transparency"] = 0;
	objects["Instance27"]["Name"] = "ContentView";
	objects["Instance27"]["SelectionOrder"] = 0;
	objects["Instance27"]["Visible"] = true;
	objects["Instance27"]["Selectable"] = false;
	objects["Instance27"]["Position"] = UDim2.new(0, 123, 0, 3);
	objects["Instance27"]["BackgroundColor3"] = Color3.new(0.0705882, 0.0705882, 0.0980392);

	objects["Instance28"]["Visible"] = true;
	objects["Instance28"]["Active"] = true;
	objects["Instance28"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
	objects["Instance28"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance28"]["ZIndex"] = -6;
	objects["Instance28"]["BorderSizePixel"] = 0;
	objects["Instance28"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	objects["Instance28"]["Draggable"] = false;
	objects["Instance28"]["MidImage"] = "rbxasset://textures/ui/Scroll/scroll-middle.png";
	objects["Instance28"]["CanvasPosition"] = Vector2.new(0, 0);
	objects["Instance28"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.None;
	objects["Instance28"]["Transparency"] = 0;
	objects["Instance28"]["TopImage"] = "rbxasset://textures/ui/Scroll/scroll-top.png";
	objects["Instance28"]["SelectionOrder"] = 0;
	objects["Instance28"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.None;
	objects["Instance28"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance28"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	objects["Instance28"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Right;
	objects["Instance28"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance28"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance28"]["Size"] = UDim2.new(1, 0, 0, 100);
	objects["Instance28"]["ScrollBarImageColor3"] = Color3.new(0, 0, 0);
	objects["Instance28"]["BackgroundColor3"] = Color3.new(0.137255, 0.137255, 0.196078);
	objects["Instance28"]["Selectable"] = true;
	objects["Instance28"]["ClipsDescendants"] = true;
	objects["Instance28"]["ScrollBarImageTransparency"] = 0;
	objects["Instance28"]["ScrollBarThickness"] = 5;
	objects["Instance28"]["Parent"] = objects["Instance27"];
	objects["Instance28"]["BackgroundTransparency"] = 0;
	objects["Instance28"]["Rotation"] = 0;
	objects["Instance28"]["LayoutOrder"] = 0;
	objects["Instance28"]["Name"] = "ScrollingFrame";
	objects["Instance28"]["Position"] = UDim2.new(0, 0, 1, -100);
	objects["Instance28"]["ScrollingEnabled"] = true;
	objects["Instance28"]["BottomImage"] = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
	objects["Instance28"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance28"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;

	objects["Instance29"]["FillDirectionMaxCells"] = 0;
	objects["Instance29"]["CellPadding"] = UDim2.new(0, 5, 0, 5);
	objects["Instance29"]["Parent"] = objects["Instance28"];
	objects["Instance29"]["CellSize"] = UDim2.new(0.3240000009536743, 0, 0, 30);
	objects["Instance29"]["Name"] = "UIGridLayout";
	objects["Instance29"]["StartCorner"] = Enum.StartCorner.TopLeft;

	objects["Instance30"]["LayoutOrder"] = 0;
	objects["Instance30"]["Active"] = false;
	objects["Instance30"]["Parent"] = objects["Instance28"];
	objects["Instance30"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance30"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance30"]["ZIndex"] = -5;
	objects["Instance30"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance30"]["Size"] = UDim2.new(0, 100, 0, 100);
	objects["Instance30"]["Draggable"] = false;
	objects["Instance30"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance30"]["ClipsDescendants"] = false;
	objects["Instance30"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance30"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance30"]["BackgroundTransparency"] = 1;
	objects["Instance30"]["BorderSizePixel"] = 0;
	objects["Instance30"]["Rotation"] = 0;
	objects["Instance30"]["Transparency"] = 1;
	objects["Instance30"]["Name"] = "ButtonRow";
	objects["Instance30"]["SelectionOrder"] = 0;
	objects["Instance30"]["Visible"] = false;
	objects["Instance30"]["Selectable"] = false;
	objects["Instance30"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance30"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance31"]["LayoutOrder"] = 0;
	objects["Instance31"]["Active"] = false;
	objects["Instance31"]["Parent"] = objects["Instance30"];
	objects["Instance31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance31"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance31"]["ZIndex"] = -4;
	objects["Instance31"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance31"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.699999988079071, 0);
	objects["Instance31"]["Draggable"] = false;
	objects["Instance31"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance31"]["ClipsDescendants"] = false;
	objects["Instance31"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance31"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance31"]["BackgroundTransparency"] = 0;
	objects["Instance31"]["BorderSizePixel"] = 0;
	objects["Instance31"]["Rotation"] = 0;
	objects["Instance31"]["Transparency"] = 0;
	objects["Instance31"]["Name"] = "Display";
	objects["Instance31"]["SelectionOrder"] = 0;
	objects["Instance31"]["Visible"] = true;
	objects["Instance31"]["Selectable"] = false;
	objects["Instance31"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance31"]["BackgroundColor3"] = Color3.new(0.156863, 0.156863, 0.254902);

	objects["Instance32"]["Enabled"] = true;
	objects["Instance32"]["Transparency"] = 0;
	objects["Instance32"]["Name"] = "UIStroke";
	objects["Instance32"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance32"]["Parent"] = objects["Instance31"];
	objects["Instance32"]["Thickness"] = 1;
	objects["Instance32"]["Color"] = Color3.new(0.235294, 0.235294, 0.313726);
	objects["Instance32"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance33"]["LayoutOrder"] = 0;
	objects["Instance33"]["Active"] = false;
	objects["Instance33"]["Parent"] = objects["Instance31"];
	objects["Instance33"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance33"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance33"]["ZIndex"] = -2;
	objects["Instance33"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance33"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance33"]["Draggable"] = false;
	objects["Instance33"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance33"]["ClipsDescendants"] = false;
	objects["Instance33"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance33"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance33"]["BackgroundTransparency"] = 0;
	objects["Instance33"]["BorderSizePixel"] = 0;
	objects["Instance33"]["Rotation"] = 0;
	objects["Instance33"]["Transparency"] = 0;
	objects["Instance33"]["Name"] = "Type_BUTTON";
	objects["Instance33"]["SelectionOrder"] = 0;
	objects["Instance33"]["Visible"] = true;
	objects["Instance33"]["Selectable"] = false;
	objects["Instance33"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance33"]["BackgroundColor3"] = Color3.new(0.333333, 0.333333, 1);

	objects["Instance34"]["Visible"] = true;
	objects["Instance34"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance34"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance34"]["Active"] = false;
	objects["Instance34"]["TextStrokeTransparency"] = 1;
	objects["Instance34"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance34"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance34"]["ZIndex"] = -2;
	objects["Instance34"]["BorderSizePixel"] = 0;
	objects["Instance34"]["Draggable"] = false;
	objects["Instance34"]["RichText"] = false;
	objects["Instance34"]["Transparency"] = 1;
	objects["Instance34"]["SelectionOrder"] = 0;
	objects["Instance34"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance34"]["TextScaled"] = true;
	objects["Instance34"]["TextWrap"] = true;
	objects["Instance34"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance34"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance34"]["Parent"] = objects["Instance31"];
	objects["Instance34"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance34"]["TextSize"] = 14;
	objects["Instance34"]["Position"] = UDim2.new(0.05000000074505806, 5, 0.5, 0);
	objects["Instance34"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance34"]["Size"] = UDim2.new(0.8999999761581421, -5, 0.6000000238418579, 0);
	objects["Instance34"]["BackgroundTransparency"] = 1;
	objects["Instance34"]["LineHeight"] = 1;
	objects["Instance34"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance34"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance34"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance34"]["Text"] = "Button";
	objects["Instance34"]["LayoutOrder"] = 0;
	objects["Instance34"]["TextWrapped"] = true;
	objects["Instance34"]["Rotation"] = 0;
	objects["Instance34"]["TextTransparency"] = 0;
	objects["Instance34"]["Name"] = "RName";
	objects["Instance34"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance34"]["ClipsDescendants"] = false;
	objects["Instance34"]["MaxVisibleGraphemes"] = -1;
	objects["Instance34"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance34"]["Selectable"] = false;

	objects["Instance35"]["Visible"] = true;
	objects["Instance35"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance35"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance35"]["Active"] = true;
	objects["Instance35"]["TextStrokeTransparency"] = 1;
	objects["Instance35"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance35"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance35"]["ZIndex"] = 1;
	objects["Instance35"]["BorderSizePixel"] = 0;
	objects["Instance35"]["Draggable"] = false;
	objects["Instance35"]["RichText"] = false;
	objects["Instance35"]["Modal"] = false;
	objects["Instance35"]["AutoButtonColor"] = true;
	objects["Instance35"]["Transparency"] = 1;
	objects["Instance35"]["SelectionOrder"] = 0;
	objects["Instance35"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance35"]["TextScaled"] = false;
	objects["Instance35"]["TextWrap"] = false;
	objects["Instance35"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance35"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance35"]["Parent"] = objects["Instance30"];
	objects["Instance35"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance35"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance35"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance35"]["BackgroundColor3"] = Color3.new(0.196078, 0.196078, 0.196078);
	objects["Instance35"]["Selected"] = false;
	objects["Instance35"]["TextSize"] = 14;
	objects["Instance35"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance35"]["BackgroundTransparency"] = 1;
	objects["Instance35"]["TextWrapped"] = false;
	objects["Instance35"]["ClipsDescendants"] = false;
	objects["Instance35"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance35"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance35"]["Text"] = "";
	objects["Instance35"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance35"]["LayoutOrder"] = 0;
	objects["Instance35"]["Rotation"] = 0;
	objects["Instance35"]["LineHeight"] = 1;
	objects["Instance35"]["Name"] = "Button";
	objects["Instance35"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance35"]["Selectable"] = true;
	objects["Instance35"]["MaxVisibleGraphemes"] = -1;
	objects["Instance35"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance35"]["TextTransparency"] = 0;

	objects["Instance36"]["LayoutOrder"] = 0;
	objects["Instance36"]["Active"] = false;
	objects["Instance36"]["Parent"] = objects["Instance27"];
	objects["Instance36"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance36"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance36"]["ZIndex"] = -6;
	objects["Instance36"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance36"]["Size"] = UDim2.new(1, 0, 0, 3);
	objects["Instance36"]["Draggable"] = false;
	objects["Instance36"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance36"]["ClipsDescendants"] = false;
	objects["Instance36"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance36"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance36"]["BackgroundTransparency"] = 0;
	objects["Instance36"]["BorderSizePixel"] = 0;
	objects["Instance36"]["Rotation"] = 0;
	objects["Instance36"]["Transparency"] = 0;
	objects["Instance36"]["Name"] = "Shadow";
	objects["Instance36"]["SelectionOrder"] = 0;
	objects["Instance36"]["Visible"] = true;
	objects["Instance36"]["Selectable"] = false;
	objects["Instance36"]["Position"] = UDim2.new(0, 0, 1, -103);
	objects["Instance36"]["BackgroundColor3"] = Color3.new(0.0941176, 0.0941176, 0.133333);

	objects["Instance37"]["LayoutOrder"] = 0;
	objects["Instance37"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance37"]["LineHeight"] = 1;
	objects["Instance37"]["Active"] = true;
	objects["Instance37"]["TextStrokeTransparency"] = 1;
	objects["Instance37"]["SelectionStart"] = -1;
	objects["Instance37"]["PlaceholderColor3"] = Color3.new(0.7, 0.7, 0.7);
	objects["Instance37"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance37"]["ZIndex"] = -5;
	objects["Instance37"]["BorderSizePixel"] = 0;
	objects["Instance37"]["TextEditable"] = true;
	objects["Instance37"]["Draggable"] = false;
	objects["Instance37"]["RichText"] = false;
	objects["Instance37"]["Transparency"] = 0;
	objects["Instance37"]["SelectionOrder"] = 0;
	objects["Instance37"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	objects["Instance37"]["TextScaled"] = false;
	objects["Instance37"]["BackgroundColor3"] = Color3.new(0.0705882, 0.0705882, 0.0980392);
	objects["Instance37"]["FontFace"] = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance37"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance37"]["Parent"] = objects["Instance27"];
	objects["Instance37"]["TextWrapped"] = true;
	objects["Instance37"]["MaxVisibleGraphemes"] = -1;
	objects["Instance37"]["Name"] = "CodeBox";
	objects["Instance37"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance37"]["TextTransparency"] = 0;
	objects["Instance37"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance37"]["CursorPosition"] = 1;
	objects["Instance37"]["ClipsDescendants"] = false;
	objects["Instance37"]["PlaceholderText"] = "";
	objects["Instance37"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance37"]["Size"] = UDim2.new(1, 0, 1, -103);
	objects["Instance37"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance37"]["Selectable"] = true;
	objects["Instance37"]["ShowNativeInput"] = true;
	objects["Instance37"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance37"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance37"]["Text"] = "   1  | local args = {}\n   2  |\n   3  | nil.RemoteEvent:FireServer(unpack(args))\n   4  |\n   5  |\n   6  |\n   7  |\n   8  |\n\n9\n9.";
	objects["Instance37"]["TextSize"] = 14;
	objects["Instance37"]["Visible"] = true;
	objects["Instance37"]["Rotation"] = 0;
	objects["Instance37"]["MultiLine"] = true;
	objects["Instance37"]["BackgroundTransparency"] = 0;
	objects["Instance37"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	objects["Instance37"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance37"]["ClearTextOnFocus"] = false;
	objects["Instance37"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance37"]["TextWrap"] = true;

	objects["Instance38"]["Enabled"] = true;
	objects["Instance38"]["Transparency"] = 0;
	objects["Instance38"]["Name"] = "UIStroke";
	objects["Instance38"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance38"]["Parent"] = objects["Instance3"];
	objects["Instance38"]["Thickness"] = 2;
	objects["Instance38"]["Color"] = Color3.new(0, 0, 0);
	objects["Instance38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	objects["Instance39"]["Visible"] = true;
	objects["Instance39"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance39"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance39"]["Active"] = true;
	objects["Instance39"]["TextStrokeTransparency"] = 1;
	objects["Instance39"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance39"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance39"]["ZIndex"] = -8;
	objects["Instance39"]["BorderSizePixel"] = 0;
	objects["Instance39"]["Draggable"] = false;
	objects["Instance39"]["RichText"] = false;
	objects["Instance39"]["Modal"] = false;
	objects["Instance39"]["AutoButtonColor"] = true;
	objects["Instance39"]["Transparency"] = 0;
	objects["Instance39"]["SelectionOrder"] = 0;
	objects["Instance39"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance39"]["TextScaled"] = false;
	objects["Instance39"]["TextWrap"] = false;
	objects["Instance39"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance39"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance39"]["Parent"] = objects["Instance3"];
	objects["Instance39"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance39"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance39"]["Position"] = UDim2.new(1, -69, 0, 0);
	objects["Instance39"]["BackgroundColor3"] = Color3.new(0.176471, 0.176471, 0.254902);
	objects["Instance39"]["Selected"] = false;
	objects["Instance39"]["TextSize"] = 14;
	objects["Instance39"]["Size"] = UDim2.new(0, 23, 0, 23);
	objects["Instance39"]["BackgroundTransparency"] = 0;
	objects["Instance39"]["TextWrapped"] = false;
	objects["Instance39"]["ClipsDescendants"] = false;
	objects["Instance39"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance39"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance39"]["Text"] = "";
	objects["Instance39"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance39"]["LayoutOrder"] = 0;
	objects["Instance39"]["Rotation"] = 0;
	objects["Instance39"]["LineHeight"] = 1;
	objects["Instance39"]["Name"] = "Toggle2";
	objects["Instance39"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance39"]["Selectable"] = true;
	objects["Instance39"]["MaxVisibleGraphemes"] = -1;
	objects["Instance39"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance39"]["TextTransparency"] = 0;

	objects["Instance40"]["Visible"] = true;
	objects["Instance40"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance40"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);
	objects["Instance40"]["ImageTransparency"] = 0;
	objects["Instance40"]["Parent"] = objects["Instance39"];
	objects["Instance40"]["Position"] = UDim2.new(0.3499999940395355, 0, 0.3499999940395355, 0);
	objects["Instance40"]["BackgroundTransparency"] = 1;
	objects["Instance40"]["ImageRectOffset"] = Vector2.new(1072, 0);
	objects["Instance40"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance40"]["Image"] = "rbxasset://textures/ClassImages.png";
	objects["Instance40"]["TileSize"] = UDim2.new(1, 0, 1, 0);
	objects["Instance40"]["ImageRectSize"] = Vector2.new(16, 16);
	objects["Instance40"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance40"]["ZIndex"] = -7;
	objects["Instance40"]["BorderSizePixel"] = 0;
	objects["Instance40"]["SliceCenter"] = Rect.new(0, 0, 0, 0);
	objects["Instance40"]["Draggable"] = false;
	objects["Instance40"]["ScaleType"] = Enum.ScaleType.Stretch;
	objects["Instance40"]["ResampleMode"] = Enum.ResamplerMode.Default;
	objects["Instance40"]["ClipsDescendants"] = false;
	objects["Instance40"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance40"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance40"]["LayoutOrder"] = 0;
	objects["Instance40"]["ImageColor3"] = Color3.new(1, 1, 1);
	objects["Instance40"]["Rotation"] = 0;
	objects["Instance40"]["Transparency"] = 1;
	objects["Instance40"]["Name"] = "Picture";
	objects["Instance40"]["SelectionOrder"] = 0;
	objects["Instance40"]["SliceScale"] = 1;
	objects["Instance40"]["Selectable"] = false;
	objects["Instance40"]["Active"] = false;
	objects["Instance40"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance41"]["Visible"] = true;
	objects["Instance41"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance41"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);
	objects["Instance41"]["ImageTransparency"] = 0.5;
	objects["Instance41"]["Parent"] = objects["Instance39"];
	objects["Instance41"]["Position"] = UDim2.new(0.6000000238418579, 0, 0.6000000238418579, 0);
	objects["Instance41"]["BackgroundTransparency"] = 1;
	objects["Instance41"]["ImageRectOffset"] = Vector2.new(112, 0);
	objects["Instance41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance41"]["Image"] = "rbxassetid://6511490623";
	objects["Instance41"]["TileSize"] = UDim2.new(1, 0, 1, 0);
	objects["Instance41"]["ImageRectSize"] = Vector2.new(16, 16);
	objects["Instance41"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance41"]["ZIndex"] = -6;
	objects["Instance41"]["BorderSizePixel"] = 0;
	objects["Instance41"]["SliceCenter"] = Rect.new(0, 0, 0, 0);
	objects["Instance41"]["Draggable"] = false;
	objects["Instance41"]["ScaleType"] = Enum.ScaleType.Stretch;
	objects["Instance41"]["ResampleMode"] = Enum.ResamplerMode.Default;
	objects["Instance41"]["ClipsDescendants"] = false;
	objects["Instance41"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance41"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance41"]["LayoutOrder"] = 0;
	objects["Instance41"]["ImageColor3"] = Color3.new(1, 1, 1);
	objects["Instance41"]["Rotation"] = 0;
	objects["Instance41"]["Transparency"] = 1;
	objects["Instance41"]["Name"] = "State";
	objects["Instance41"]["SelectionOrder"] = 0;
	objects["Instance41"]["SliceScale"] = 1;
	objects["Instance41"]["Selectable"] = false;
	objects["Instance41"]["Active"] = false;
	objects["Instance41"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance42"]["Visible"] = true;
	objects["Instance42"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance42"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance42"]["Active"] = true;
	objects["Instance42"]["TextStrokeTransparency"] = 1;
	objects["Instance42"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance42"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance42"]["ZIndex"] = -8;
	objects["Instance42"]["BorderSizePixel"] = 0;
	objects["Instance42"]["Draggable"] = false;
	objects["Instance42"]["RichText"] = false;
	objects["Instance42"]["Modal"] = false;
	objects["Instance42"]["AutoButtonColor"] = false;
	objects["Instance42"]["Transparency"] = 0;
	objects["Instance42"]["SelectionOrder"] = 0;
	objects["Instance42"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance42"]["TextScaled"] = false;
	objects["Instance42"]["TextWrap"] = false;
	objects["Instance42"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance42"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance42"]["Parent"] = objects["Instance3"];
	objects["Instance42"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance42"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance42"]["Position"] = UDim2.new(1, -92, 0, 0);
	objects["Instance42"]["BackgroundColor3"] = Color3.new(0.176471, 0.176471, 0.254902);
	objects["Instance42"]["Selected"] = false;
	objects["Instance42"]["TextSize"] = 14;
	objects["Instance42"]["Size"] = UDim2.new(0, 23, 0, 23);
	objects["Instance42"]["BackgroundTransparency"] = 0;
	objects["Instance42"]["TextWrapped"] = false;
	objects["Instance42"]["ClipsDescendants"] = false;
	objects["Instance42"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance42"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance42"]["Text"] = "";
	objects["Instance42"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance42"]["LayoutOrder"] = 0;
	objects["Instance42"]["Rotation"] = 0;
	objects["Instance42"]["LineHeight"] = 1;
	objects["Instance42"]["Name"] = "Help";
	objects["Instance42"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance42"]["Selectable"] = true;
	objects["Instance42"]["MaxVisibleGraphemes"] = -1;
	objects["Instance42"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance42"]["TextTransparency"] = 0;

	objects["Instance43"]["Visible"] = true;
	objects["Instance43"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance43"]["Size"] = UDim2.new(0.75, 0, 0.75, 0);
	objects["Instance43"]["ImageTransparency"] = 0.5;
	objects["Instance43"]["Parent"] = objects["Instance42"];
	objects["Instance43"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance43"]["BackgroundTransparency"] = 1;
	objects["Instance43"]["ImageRectOffset"] = Vector2.new(0, 0);
	objects["Instance43"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance43"]["Image"] = "rbxassetid://6511490623";
	objects["Instance43"]["TileSize"] = UDim2.new(1, 0, 1, 0);
	objects["Instance43"]["ImageRectSize"] = Vector2.new(16, 16);
	objects["Instance43"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance43"]["ZIndex"] = -7;
	objects["Instance43"]["BorderSizePixel"] = 0;
	objects["Instance43"]["SliceCenter"] = Rect.new(0, 0, 0, 0);
	objects["Instance43"]["Draggable"] = false;
	objects["Instance43"]["ScaleType"] = Enum.ScaleType.Stretch;
	objects["Instance43"]["ResampleMode"] = Enum.ResamplerMode.Default;
	objects["Instance43"]["ClipsDescendants"] = false;
	objects["Instance43"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance43"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance43"]["LayoutOrder"] = 0;
	objects["Instance43"]["ImageColor3"] = Color3.new(1, 1, 1);
	objects["Instance43"]["Rotation"] = 0;
	objects["Instance43"]["Transparency"] = 1;
	objects["Instance43"]["Name"] = "Picture";
	objects["Instance43"]["SelectionOrder"] = 0;
	objects["Instance43"]["SliceScale"] = 1;
	objects["Instance43"]["Selectable"] = false;
	objects["Instance43"]["Active"] = false;
	objects["Instance43"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance44"]["LayoutOrder"] = 0;
	objects["Instance44"]["Active"] = false;
	objects["Instance44"]["Parent"] = objects["Instance0"];
	objects["Instance44"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance44"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance44"]["ZIndex"] = 10;
	objects["Instance44"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance44"]["Size"] = UDim2.new(0, 175, 1, 0);
	objects["Instance44"]["Draggable"] = false;
	objects["Instance44"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance44"]["ClipsDescendants"] = false;
	objects["Instance44"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance44"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance44"]["BackgroundTransparency"] = 1;
	objects["Instance44"]["BorderSizePixel"] = 0;
	objects["Instance44"]["Rotation"] = 0;
	objects["Instance44"]["Transparency"] = 1;
	objects["Instance44"]["Name"] = "Notifications";
	objects["Instance44"]["SelectionOrder"] = 0;
	objects["Instance44"]["Visible"] = true;
	objects["Instance44"]["Selectable"] = false;
	objects["Instance44"]["Position"] = UDim2.new(1, -175, 0, 0);
	objects["Instance44"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance45"]["LayoutOrder"] = 0;
	objects["Instance45"]["Active"] = false;
	objects["Instance45"]["Parent"] = objects["Instance44"];
	objects["Instance45"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance45"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance45"]["ZIndex"] = 11;
	objects["Instance45"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance45"]["Size"] = UDim2.new(1, 0, 0, 100);
	objects["Instance45"]["Draggable"] = false;
	objects["Instance45"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance45"]["ClipsDescendants"] = false;
	objects["Instance45"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance45"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance45"]["BackgroundTransparency"] = 1;
	objects["Instance45"]["BorderSizePixel"] = 0;
	objects["Instance45"]["Rotation"] = 0;
	objects["Instance45"]["Transparency"] = 1;
	objects["Instance45"]["Name"] = "NotificationBase";
	objects["Instance45"]["SelectionOrder"] = 0;
	objects["Instance45"]["Visible"] = false;
	objects["Instance45"]["Selectable"] = false;
	objects["Instance45"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance45"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance46"]["LayoutOrder"] = 0;
	objects["Instance46"]["Active"] = false;
	objects["Instance46"]["Parent"] = objects["Instance45"];
	objects["Instance46"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance46"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance46"]["ZIndex"] = 12;
	objects["Instance46"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance46"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.800000011920929, 0);
	objects["Instance46"]["Draggable"] = false;
	objects["Instance46"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance46"]["ClipsDescendants"] = false;
	objects["Instance46"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance46"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance46"]["BackgroundTransparency"] = 0;
	objects["Instance46"]["BorderSizePixel"] = 0;
	objects["Instance46"]["Rotation"] = 0;
	objects["Instance46"]["Transparency"] = 0;
	objects["Instance46"]["Name"] = "Display";
	objects["Instance46"]["SelectionOrder"] = 0;
	objects["Instance46"]["Visible"] = true;
	objects["Instance46"]["Selectable"] = false;
	objects["Instance46"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance46"]["BackgroundColor3"] = Color3.new(0.137255, 0.137255, 0.196078);

	objects["Instance47"]["Enabled"] = true;
	objects["Instance47"]["Transparency"] = 0;
	objects["Instance47"]["Name"] = "UIStroke";
	objects["Instance47"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance47"]["Parent"] = objects["Instance46"];
	objects["Instance47"]["Thickness"] = 2;
	objects["Instance47"]["Color"] = Color3.new(0, 0, 0);
	objects["Instance47"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance48"]["LayoutOrder"] = 0;
	objects["Instance48"]["Active"] = false;
	objects["Instance48"]["Parent"] = objects["Instance46"];
	objects["Instance48"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance48"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance48"]["ZIndex"] = 13;
	objects["Instance48"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance48"]["Size"] = UDim2.new(1, 0, 0.05000000074505806, 0);
	objects["Instance48"]["Draggable"] = false;
	objects["Instance48"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance48"]["ClipsDescendants"] = false;
	objects["Instance48"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance48"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance48"]["BackgroundTransparency"] = 0;
	objects["Instance48"]["BorderSizePixel"] = 0;
	objects["Instance48"]["Rotation"] = 0;
	objects["Instance48"]["Transparency"] = 0;
	objects["Instance48"]["Name"] = "Bar";
	objects["Instance48"]["SelectionOrder"] = 0;
	objects["Instance48"]["Visible"] = true;
	objects["Instance48"]["Selectable"] = false;
	objects["Instance48"]["Position"] = UDim2.new(0, 0, 0.949999988079071, 0);
	objects["Instance48"]["BackgroundColor3"] = Color3.new(0.0941176, 0.0941176, 0.133333);

	objects["Instance49"]["LayoutOrder"] = 0;
	objects["Instance49"]["Active"] = false;
	objects["Instance49"]["Parent"] = objects["Instance48"];
	objects["Instance49"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance49"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance49"]["ZIndex"] = 14;
	objects["Instance49"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance49"]["Size"] = UDim2.new(0.5, 0, 1, 0);
	objects["Instance49"]["Draggable"] = false;
	objects["Instance49"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance49"]["ClipsDescendants"] = false;
	objects["Instance49"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance49"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance49"]["BackgroundTransparency"] = 0;
	objects["Instance49"]["BorderSizePixel"] = 0;
	objects["Instance49"]["Rotation"] = 0;
	objects["Instance49"]["Transparency"] = 0;
	objects["Instance49"]["Name"] = "Frame";
	objects["Instance49"]["SelectionOrder"] = 0;
	objects["Instance49"]["Visible"] = true;
	objects["Instance49"]["Selectable"] = false;
	objects["Instance49"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance49"]["BackgroundColor3"] = Color3.new(0.666667, 0.666667, 1);

	objects["Instance50"]["Visible"] = true;
	objects["Instance50"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance50"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance50"]["Active"] = false;
	objects["Instance50"]["TextStrokeTransparency"] = 0;
	objects["Instance50"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance50"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance50"]["ZIndex"] = 13;
	objects["Instance50"]["BorderSizePixel"] = 0;
	objects["Instance50"]["Draggable"] = false;
	objects["Instance50"]["RichText"] = false;
	objects["Instance50"]["Transparency"] = 1;
	objects["Instance50"]["SelectionOrder"] = 0;
	objects["Instance50"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance50"]["TextScaled"] = true;
	objects["Instance50"]["TextWrap"] = true;
	objects["Instance50"]["FontFace"] = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance50"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance50"]["Parent"] = objects["Instance46"];
	objects["Instance50"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance50"]["TextSize"] = 14;
	objects["Instance50"]["Position"] = UDim2.new(0.02500000037252903, 0, 0.02500000037252903, 0);
	objects["Instance50"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance50"]["Size"] = UDim2.new(0.949999988079071, 0, 0.17499999701976776, 0);
	objects["Instance50"]["BackgroundTransparency"] = 1;
	objects["Instance50"]["LineHeight"] = 1;
	objects["Instance50"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance50"]["TextColor3"] = Color3.new(0.666667, 0.333333, 1);
	objects["Instance50"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance50"]["Text"] = "Notification";
	objects["Instance50"]["LayoutOrder"] = 0;
	objects["Instance50"]["TextWrapped"] = true;
	objects["Instance50"]["Rotation"] = 0;
	objects["Instance50"]["TextTransparency"] = 0;
	objects["Instance50"]["Name"] = "Title";
	objects["Instance50"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	objects["Instance50"]["ClipsDescendants"] = false;
	objects["Instance50"]["MaxVisibleGraphemes"] = -1;
	objects["Instance50"]["TextStrokeColor3"] = Color3.new(0.215686, 0.215686, 0.254902);
	objects["Instance50"]["Selectable"] = false;

	objects["Instance51"]["PaddingTop"] = UDim.new(0, 0);
	objects["Instance51"]["Name"] = "UIPadding";
	objects["Instance51"]["Parent"] = objects["Instance50"];
	objects["Instance51"]["PaddingBottom"] = UDim.new(0, 0);
	objects["Instance51"]["PaddingLeft"] = UDim.new(0.0500000007, 0);
	objects["Instance51"]["PaddingRight"] = UDim.new(0, 0);

	objects["Instance52"]["Visible"] = true;
	objects["Instance52"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance52"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance52"]["Active"] = false;
	objects["Instance52"]["TextStrokeTransparency"] = 0;
	objects["Instance52"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance52"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance52"]["ZIndex"] = 13;
	objects["Instance52"]["BorderSizePixel"] = 0;
	objects["Instance52"]["Draggable"] = false;
	objects["Instance52"]["RichText"] = false;
	objects["Instance52"]["Transparency"] = 1;
	objects["Instance52"]["SelectionOrder"] = 0;
	objects["Instance52"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	objects["Instance52"]["TextScaled"] = false;
	objects["Instance52"]["TextWrap"] = true;
	objects["Instance52"]["FontFace"] = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance52"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance52"]["Parent"] = objects["Instance46"];
	objects["Instance52"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance52"]["TextSize"] = 13;
	objects["Instance52"]["Position"] = UDim2.new(0.02500000037252903, 0, 0.20000000298023224, 0);
	objects["Instance52"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance52"]["Size"] = UDim2.new(0.949999988079071, 0, 0.699999988079071, 0);
	objects["Instance52"]["BackgroundTransparency"] = 1;
	objects["Instance52"]["LineHeight"] = 1;
	objects["Instance52"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance52"]["TextColor3"] = Color3.new(0.658824, 0.411765, 1);
	objects["Instance52"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance52"]["Text"] = "Content";
	objects["Instance52"]["LayoutOrder"] = 0;
	objects["Instance52"]["TextWrapped"] = true;
	objects["Instance52"]["Rotation"] = 0;
	objects["Instance52"]["TextTransparency"] = 0;
	objects["Instance52"]["Name"] = "Content";
	objects["Instance52"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	objects["Instance52"]["ClipsDescendants"] = false;
	objects["Instance52"]["MaxVisibleGraphemes"] = -1;
	objects["Instance52"]["TextStrokeColor3"] = Color3.new(0.215686, 0.215686, 0.254902);
	objects["Instance52"]["Selectable"] = false;

	objects["Instance53"]["FillDirection"] = Enum.FillDirection.Vertical;
	objects["Instance53"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Left;
	objects["Instance53"]["VerticalFlex"] = Enum.UIFlexAlignment.None;
	objects["Instance53"]["Parent"] = objects["Instance44"];
	objects["Instance53"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
	objects["Instance53"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	objects["Instance53"]["Name"] = "UIListLayout";
	objects["Instance53"]["Padding"] = UDim.new(0, 0);
	objects["Instance53"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Automatic;
	objects["Instance53"]["HorizontalFlex"] = Enum.UIFlexAlignment.None;

	objects["Instance54"]["LayoutOrder"] = 0;
	objects["Instance54"]["Active"] = false;
	objects["Instance54"]["Parent"] = objects["Instance0"];
	objects["Instance54"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance54"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance54"]["ZIndex"] = 1;
	objects["Instance54"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance54"]["Size"] = UDim2.new(0, 500, 0, 230);
	objects["Instance54"]["Draggable"] = false;
	objects["Instance54"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance54"]["ClipsDescendants"] = false;
	objects["Instance54"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance54"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance54"]["BackgroundTransparency"] = 0;
	objects["Instance54"]["BorderSizePixel"] = 0;
	objects["Instance54"]["Rotation"] = 0;
	objects["Instance54"]["Transparency"] = 0;
	objects["Instance54"]["Name"] = "PCNotification";
	objects["Instance54"]["SelectionOrder"] = 0;
	objects["Instance54"]["Visible"] = false;
	objects["Instance54"]["Selectable"] = false;
	objects["Instance54"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance54"]["BackgroundColor3"] = Color3.new(0.176471, 0.176471, 0.254902);

	objects["Instance55"]["Enabled"] = true;
	objects["Instance55"]["Transparency"] = 0;
	objects["Instance55"]["Name"] = "UIStroke";
	objects["Instance55"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance55"]["Parent"] = objects["Instance54"];
	objects["Instance55"]["Thickness"] = 2;
	objects["Instance55"]["Color"] = Color3.new(0, 0, 0);
	objects["Instance55"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	objects["Instance56"]["Visible"] = true;
	objects["Instance56"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance56"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance56"]["Active"] = false;
	objects["Instance56"]["TextStrokeTransparency"] = 0;
	objects["Instance56"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance56"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance56"]["ZIndex"] = 2;
	objects["Instance56"]["BorderSizePixel"] = 0;
	objects["Instance56"]["Draggable"] = false;
	objects["Instance56"]["RichText"] = false;
	objects["Instance56"]["Transparency"] = 1;
	objects["Instance56"]["SelectionOrder"] = 0;
	objects["Instance56"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance56"]["TextScaled"] = true;
	objects["Instance56"]["TextWrap"] = true;
	objects["Instance56"]["FontFace"] = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance56"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance56"]["Parent"] = objects["Instance54"];
	objects["Instance56"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance56"]["TextSize"] = 14;
	objects["Instance56"]["Position"] = UDim2.new(0.019999999552965164, 0, 0.019999999552965164, 0);
	objects["Instance56"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance56"]["Size"] = UDim2.new(0.9599999785423279, 0, 0.15000000596046448, 0);
	objects["Instance56"]["BackgroundTransparency"] = 1;
	objects["Instance56"]["LineHeight"] = 1;
	objects["Instance56"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance56"]["TextColor3"] = Color3.new(1, 0.333333, 0.498039);
	objects["Instance56"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance56"]["Text"] = "Warning";
	objects["Instance56"]["LayoutOrder"] = 0;
	objects["Instance56"]["TextWrapped"] = true;
	objects["Instance56"]["Rotation"] = 0;
	objects["Instance56"]["TextTransparency"] = 0;
	objects["Instance56"]["Name"] = "Title";
	objects["Instance56"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance56"]["ClipsDescendants"] = false;
	objects["Instance56"]["MaxVisibleGraphemes"] = -1;
	objects["Instance56"]["TextStrokeColor3"] = Color3.new(0.215686, 0.215686, 0.254902);
	objects["Instance56"]["Selectable"] = false;

	objects["Instance57"]["LayoutOrder"] = 0;
	objects["Instance57"]["Active"] = false;
	objects["Instance57"]["Parent"] = objects["Instance54"];
	objects["Instance57"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance57"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance57"]["ZIndex"] = 2;
	objects["Instance57"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance57"]["Size"] = UDim2.new(0.20000000298023224, 0, 0.17499999701976776, 0);
	objects["Instance57"]["Draggable"] = false;
	objects["Instance57"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance57"]["ClipsDescendants"] = false;
	objects["Instance57"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance57"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance57"]["BackgroundTransparency"] = 1;
	objects["Instance57"]["BorderSizePixel"] = 0;
	objects["Instance57"]["Rotation"] = 0;
	objects["Instance57"]["Transparency"] = 1;
	objects["Instance57"]["Name"] = "Exit";
	objects["Instance57"]["SelectionOrder"] = 0;
	objects["Instance57"]["Visible"] = true;
	objects["Instance57"]["Selectable"] = false;
	objects["Instance57"]["Position"] = UDim2.new(0.800000011920929, 0, 0.824999988079071, 0);
	objects["Instance57"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance58"]["LayoutOrder"] = 0;
	objects["Instance58"]["Active"] = false;
	objects["Instance58"]["Parent"] = objects["Instance57"];
	objects["Instance58"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance58"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance58"]["ZIndex"] = 3;
	objects["Instance58"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance58"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.699999988079071, 0);
	objects["Instance58"]["Draggable"] = false;
	objects["Instance58"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance58"]["ClipsDescendants"] = false;
	objects["Instance58"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance58"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance58"]["BackgroundTransparency"] = 0;
	objects["Instance58"]["BorderSizePixel"] = 0;
	objects["Instance58"]["Rotation"] = 0;
	objects["Instance58"]["Transparency"] = 0;
	objects["Instance58"]["Name"] = "Display";
	objects["Instance58"]["SelectionOrder"] = 0;
	objects["Instance58"]["Visible"] = true;
	objects["Instance58"]["Selectable"] = false;
	objects["Instance58"]["Position"] = UDim2.new(0.4749999940395355, 0, 0.5, 0);
	objects["Instance58"]["BackgroundColor3"] = Color3.new(0.156863, 0.156863, 0.254902);

	objects["Instance59"]["Enabled"] = true;
	objects["Instance59"]["Transparency"] = 0;
	objects["Instance59"]["Name"] = "UIStroke";
	objects["Instance59"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance59"]["Parent"] = objects["Instance58"];
	objects["Instance59"]["Thickness"] = 1;
	objects["Instance59"]["Color"] = Color3.new(0.235294, 0.235294, 0.313726);
	objects["Instance59"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance60"]["LayoutOrder"] = 0;
	objects["Instance60"]["Active"] = false;
	objects["Instance60"]["Parent"] = objects["Instance58"];
	objects["Instance60"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance60"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance60"]["ZIndex"] = 4;
	objects["Instance60"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance60"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance60"]["Draggable"] = false;
	objects["Instance60"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance60"]["ClipsDescendants"] = false;
	objects["Instance60"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance60"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance60"]["BackgroundTransparency"] = 0;
	objects["Instance60"]["BorderSizePixel"] = 0;
	objects["Instance60"]["Rotation"] = 0;
	objects["Instance60"]["Transparency"] = 0;
	objects["Instance60"]["Name"] = "Type_BUTTON";
	objects["Instance60"]["SelectionOrder"] = 0;
	objects["Instance60"]["Visible"] = true;
	objects["Instance60"]["Selectable"] = false;
	objects["Instance60"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance60"]["BackgroundColor3"] = Color3.new(0.333333, 1, 0.498039);

	objects["Instance61"]["Visible"] = true;
	objects["Instance61"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance61"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance61"]["Active"] = false;
	objects["Instance61"]["TextStrokeTransparency"] = 1;
	objects["Instance61"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance61"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance61"]["ZIndex"] = 4;
	objects["Instance61"]["BorderSizePixel"] = 0;
	objects["Instance61"]["Draggable"] = false;
	objects["Instance61"]["RichText"] = false;
	objects["Instance61"]["Transparency"] = 1;
	objects["Instance61"]["SelectionOrder"] = 0;
	objects["Instance61"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance61"]["TextScaled"] = true;
	objects["Instance61"]["TextWrap"] = true;
	objects["Instance61"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance61"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance61"]["Parent"] = objects["Instance58"];
	objects["Instance61"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance61"]["TextSize"] = 14;
	objects["Instance61"]["Position"] = UDim2.new(0.05000000074505806, 5, 0.5, 0);
	objects["Instance61"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance61"]["Size"] = UDim2.new(0.8999999761581421, -5, 0.6000000238418579, 0);
	objects["Instance61"]["BackgroundTransparency"] = 1;
	objects["Instance61"]["LineHeight"] = 1;
	objects["Instance61"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance61"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance61"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance61"]["Text"] = "Exit";
	objects["Instance61"]["LayoutOrder"] = 0;
	objects["Instance61"]["TextWrapped"] = true;
	objects["Instance61"]["Rotation"] = 0;
	objects["Instance61"]["TextTransparency"] = 0;
	objects["Instance61"]["Name"] = "RName";
	objects["Instance61"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance61"]["ClipsDescendants"] = false;
	objects["Instance61"]["MaxVisibleGraphemes"] = -1;
	objects["Instance61"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance61"]["Selectable"] = false;

	objects["Instance62"]["Visible"] = true;
	objects["Instance62"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance62"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance62"]["Active"] = true;
	objects["Instance62"]["TextStrokeTransparency"] = 1;
	objects["Instance62"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance62"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance62"]["ZIndex"] = 3;
	objects["Instance62"]["BorderSizePixel"] = 0;
	objects["Instance62"]["Draggable"] = false;
	objects["Instance62"]["RichText"] = false;
	objects["Instance62"]["Modal"] = false;
	objects["Instance62"]["AutoButtonColor"] = true;
	objects["Instance62"]["Transparency"] = 1;
	objects["Instance62"]["SelectionOrder"] = 0;
	objects["Instance62"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance62"]["TextScaled"] = false;
	objects["Instance62"]["TextWrap"] = false;
	objects["Instance62"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance62"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance62"]["Parent"] = objects["Instance57"];
	objects["Instance62"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance62"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance62"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance62"]["BackgroundColor3"] = Color3.new(0.196078, 0.196078, 0.196078);
	objects["Instance62"]["Selected"] = false;
	objects["Instance62"]["TextSize"] = 14;
	objects["Instance62"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance62"]["BackgroundTransparency"] = 1;
	objects["Instance62"]["TextWrapped"] = false;
	objects["Instance62"]["ClipsDescendants"] = false;
	objects["Instance62"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance62"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance62"]["Text"] = "";
	objects["Instance62"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance62"]["LayoutOrder"] = 0;
	objects["Instance62"]["Rotation"] = 0;
	objects["Instance62"]["LineHeight"] = 1;
	objects["Instance62"]["Name"] = "Button";
	objects["Instance62"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance62"]["Selectable"] = true;
	objects["Instance62"]["MaxVisibleGraphemes"] = -1;
	objects["Instance62"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance62"]["TextTransparency"] = 0;

	objects["Instance63"]["Visible"] = true;
	objects["Instance63"]["FontSize"] = Enum.FontSize.Size18;
	objects["Instance63"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance63"]["Active"] = false;
	objects["Instance63"]["TextStrokeTransparency"] = 0;
	objects["Instance63"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance63"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance63"]["ZIndex"] = 2;
	objects["Instance63"]["BorderSizePixel"] = 0;
	objects["Instance63"]["Draggable"] = false;
	objects["Instance63"]["RichText"] = false;
	objects["Instance63"]["Transparency"] = 1;
	objects["Instance63"]["SelectionOrder"] = 0;
	objects["Instance63"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance63"]["TextScaled"] = false;
	objects["Instance63"]["TextWrap"] = true;
	objects["Instance63"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance63"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance63"]["Parent"] = objects["Instance54"];
	objects["Instance63"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance63"]["TextSize"] = 16;
	objects["Instance63"]["Position"] = UDim2.new(0.019999999552965164, 0, 0.20000000298023224, 0);
	objects["Instance63"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance63"]["Size"] = UDim2.new(0.9599999785423279, 0, 0.5899999737739563, 0);
	objects["Instance63"]["BackgroundTransparency"] = 1;
	objects["Instance63"]["LineHeight"] = 1;
	objects["Instance63"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance63"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance63"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance63"]["Text"] = "PC exploits have become extremely unstable these days; Octo~Spy is a very powerful tool that logs EVERYTHING that happens - meaning that your executor may crash when you click \"Load\". You can click these arrows to switch modes, so script would work a little bit more stable (depends).\n\nI recommend that you do not use your main account for exploiting, as you may get banned. Use this script at your own risk.";
	objects["Instance63"]["LayoutOrder"] = 0;
	objects["Instance63"]["TextWrapped"] = true;
	objects["Instance63"]["Rotation"] = 0;
	objects["Instance63"]["TextTransparency"] = 0;
	objects["Instance63"]["Name"] = "Text";
	objects["Instance63"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance63"]["ClipsDescendants"] = false;
	objects["Instance63"]["MaxVisibleGraphemes"] = -1;
	objects["Instance63"]["TextStrokeColor3"] = Color3.new(0.215686, 0.215686, 0.254902);
	objects["Instance63"]["Selectable"] = false;

	objects["Instance64"]["LayoutOrder"] = 0;
	objects["Instance64"]["Active"] = false;
	objects["Instance64"]["Parent"] = objects["Instance54"];
	objects["Instance64"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance64"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance64"]["ZIndex"] = 2;
	objects["Instance64"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance64"]["Size"] = UDim2.new(0.10000000149011612, 0, 0.17499999701976776, 0);
	objects["Instance64"]["Draggable"] = false;
	objects["Instance64"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance64"]["ClipsDescendants"] = false;
	objects["Instance64"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance64"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance64"]["BackgroundTransparency"] = 1;
	objects["Instance64"]["BorderSizePixel"] = 0;
	objects["Instance64"]["Rotation"] = 0;
	objects["Instance64"]["Transparency"] = 1;
	objects["Instance64"]["Name"] = "Next";
	objects["Instance64"]["SelectionOrder"] = 0;
	objects["Instance64"]["Visible"] = true;
	objects["Instance64"]["Selectable"] = false;
	objects["Instance64"]["Position"] = UDim2.new(0.5659999847412109, 0, 0.824999988079071, 0);
	objects["Instance64"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance65"]["LayoutOrder"] = 0;
	objects["Instance65"]["Active"] = false;
	objects["Instance65"]["Parent"] = objects["Instance64"];
	objects["Instance65"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance65"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance65"]["ZIndex"] = 3;
	objects["Instance65"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance65"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.699999988079071, 0);
	objects["Instance65"]["Draggable"] = false;
	objects["Instance65"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance65"]["ClipsDescendants"] = false;
	objects["Instance65"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance65"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance65"]["BackgroundTransparency"] = 0;
	objects["Instance65"]["BorderSizePixel"] = 0;
	objects["Instance65"]["Rotation"] = 0;
	objects["Instance65"]["Transparency"] = 0;
	objects["Instance65"]["Name"] = "Display";
	objects["Instance65"]["SelectionOrder"] = 0;
	objects["Instance65"]["Visible"] = true;
	objects["Instance65"]["Selectable"] = false;
	objects["Instance65"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance65"]["BackgroundColor3"] = Color3.new(0.156863, 0.156863, 0.254902);

	objects["Instance66"]["Enabled"] = true;
	objects["Instance66"]["Transparency"] = 0;
	objects["Instance66"]["Name"] = "UIStroke";
	objects["Instance66"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance66"]["Parent"] = objects["Instance65"];
	objects["Instance66"]["Thickness"] = 1;
	objects["Instance66"]["Color"] = Color3.new(0.235294, 0.235294, 0.313726);
	objects["Instance66"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance67"]["LayoutOrder"] = 0;
	objects["Instance67"]["Active"] = false;
	objects["Instance67"]["Parent"] = objects["Instance65"];
	objects["Instance67"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance67"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance67"]["ZIndex"] = 4;
	objects["Instance67"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance67"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance67"]["Draggable"] = false;
	objects["Instance67"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance67"]["ClipsDescendants"] = false;
	objects["Instance67"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance67"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance67"]["BackgroundTransparency"] = 0;
	objects["Instance67"]["BorderSizePixel"] = 0;
	objects["Instance67"]["Rotation"] = 0;
	objects["Instance67"]["Transparency"] = 0;
	objects["Instance67"]["Name"] = "Type_BUTTON";
	objects["Instance67"]["SelectionOrder"] = 0;
	objects["Instance67"]["Visible"] = true;
	objects["Instance67"]["Selectable"] = false;
	objects["Instance67"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance67"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance68"]["Visible"] = true;
	objects["Instance68"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance68"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance68"]["Active"] = false;
	objects["Instance68"]["TextStrokeTransparency"] = 1;
	objects["Instance68"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance68"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance68"]["ZIndex"] = 4;
	objects["Instance68"]["BorderSizePixel"] = 0;
	objects["Instance68"]["Draggable"] = false;
	objects["Instance68"]["RichText"] = false;
	objects["Instance68"]["Transparency"] = 1;
	objects["Instance68"]["SelectionOrder"] = 0;
	objects["Instance68"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance68"]["TextScaled"] = true;
	objects["Instance68"]["TextWrap"] = true;
	objects["Instance68"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance68"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance68"]["Parent"] = objects["Instance65"];
	objects["Instance68"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance68"]["TextSize"] = 14;
	objects["Instance68"]["Position"] = UDim2.new(0.05000000074505806, 5, 0.5, 0);
	objects["Instance68"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance68"]["Size"] = UDim2.new(0.8999999761581421, -5, 0.6000000238418579, 0);
	objects["Instance68"]["BackgroundTransparency"] = 1;
	objects["Instance68"]["LineHeight"] = 1;
	objects["Instance68"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance68"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance68"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance68"]["Text"] = ">";
	objects["Instance68"]["LayoutOrder"] = 0;
	objects["Instance68"]["TextWrapped"] = true;
	objects["Instance68"]["Rotation"] = 0;
	objects["Instance68"]["TextTransparency"] = 0;
	objects["Instance68"]["Name"] = "RName";
	objects["Instance68"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance68"]["ClipsDescendants"] = false;
	objects["Instance68"]["MaxVisibleGraphemes"] = -1;
	objects["Instance68"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance68"]["Selectable"] = false;

	objects["Instance69"]["Visible"] = true;
	objects["Instance69"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance69"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance69"]["Active"] = true;
	objects["Instance69"]["TextStrokeTransparency"] = 1;
	objects["Instance69"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance69"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance69"]["ZIndex"] = 3;
	objects["Instance69"]["BorderSizePixel"] = 0;
	objects["Instance69"]["Draggable"] = false;
	objects["Instance69"]["RichText"] = false;
	objects["Instance69"]["Modal"] = false;
	objects["Instance69"]["AutoButtonColor"] = true;
	objects["Instance69"]["Transparency"] = 1;
	objects["Instance69"]["SelectionOrder"] = 0;
	objects["Instance69"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance69"]["TextScaled"] = false;
	objects["Instance69"]["TextWrap"] = false;
	objects["Instance69"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance69"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance69"]["Parent"] = objects["Instance64"];
	objects["Instance69"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance69"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance69"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance69"]["BackgroundColor3"] = Color3.new(0.196078, 0.196078, 0.196078);
	objects["Instance69"]["Selected"] = false;
	objects["Instance69"]["TextSize"] = 14;
	objects["Instance69"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance69"]["BackgroundTransparency"] = 1;
	objects["Instance69"]["TextWrapped"] = false;
	objects["Instance69"]["ClipsDescendants"] = false;
	objects["Instance69"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance69"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance69"]["Text"] = "";
	objects["Instance69"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance69"]["LayoutOrder"] = 0;
	objects["Instance69"]["Rotation"] = 0;
	objects["Instance69"]["LineHeight"] = 1;
	objects["Instance69"]["Name"] = "Button";
	objects["Instance69"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance69"]["Selectable"] = true;
	objects["Instance69"]["MaxVisibleGraphemes"] = -1;
	objects["Instance69"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance69"]["TextTransparency"] = 0;

	objects["Instance70"]["LayoutOrder"] = 0;
	objects["Instance70"]["Active"] = false;
	objects["Instance70"]["Parent"] = objects["Instance54"];
	objects["Instance70"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance70"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance70"]["ZIndex"] = 2;
	objects["Instance70"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance70"]["Size"] = UDim2.new(0.10000000149011612, 0, 0.17499999701976776, 0);
	objects["Instance70"]["Draggable"] = false;
	objects["Instance70"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance70"]["ClipsDescendants"] = false;
	objects["Instance70"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance70"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance70"]["BackgroundTransparency"] = 1;
	objects["Instance70"]["BorderSizePixel"] = 0;
	objects["Instance70"]["Rotation"] = 0;
	objects["Instance70"]["Transparency"] = 1;
	objects["Instance70"]["Name"] = "Previous";
	objects["Instance70"]["SelectionOrder"] = 0;
	objects["Instance70"]["Visible"] = true;
	objects["Instance70"]["Selectable"] = false;
	objects["Instance70"]["Position"] = UDim2.new(0, 0, 0.824999988079071, 0);
	objects["Instance70"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance71"]["LayoutOrder"] = 0;
	objects["Instance71"]["Active"] = false;
	objects["Instance71"]["Parent"] = objects["Instance70"];
	objects["Instance71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance71"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance71"]["ZIndex"] = 3;
	objects["Instance71"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance71"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.699999988079071, 0);
	objects["Instance71"]["Draggable"] = false;
	objects["Instance71"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance71"]["ClipsDescendants"] = false;
	objects["Instance71"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance71"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance71"]["BackgroundTransparency"] = 0;
	objects["Instance71"]["BorderSizePixel"] = 0;
	objects["Instance71"]["Rotation"] = 0;
	objects["Instance71"]["Transparency"] = 0;
	objects["Instance71"]["Name"] = "Display";
	objects["Instance71"]["SelectionOrder"] = 0;
	objects["Instance71"]["Visible"] = true;
	objects["Instance71"]["Selectable"] = false;
	objects["Instance71"]["Position"] = UDim2.new(0.6000000238418579, 0, 0.5, 0);
	objects["Instance71"]["BackgroundColor3"] = Color3.new(0.156863, 0.156863, 0.254902);

	objects["Instance72"]["Enabled"] = true;
	objects["Instance72"]["Transparency"] = 0;
	objects["Instance72"]["Name"] = "UIStroke";
	objects["Instance72"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance72"]["Parent"] = objects["Instance71"];
	objects["Instance72"]["Thickness"] = 1;
	objects["Instance72"]["Color"] = Color3.new(0.235294, 0.235294, 0.313726);
	objects["Instance72"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance73"]["LayoutOrder"] = 0;
	objects["Instance73"]["Active"] = false;
	objects["Instance73"]["Parent"] = objects["Instance71"];
	objects["Instance73"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance73"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance73"]["ZIndex"] = 4;
	objects["Instance73"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance73"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance73"]["Draggable"] = false;
	objects["Instance73"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance73"]["ClipsDescendants"] = false;
	objects["Instance73"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance73"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance73"]["BackgroundTransparency"] = 0;
	objects["Instance73"]["BorderSizePixel"] = 0;
	objects["Instance73"]["Rotation"] = 0;
	objects["Instance73"]["Transparency"] = 0;
	objects["Instance73"]["Name"] = "Type_BUTTON";
	objects["Instance73"]["SelectionOrder"] = 0;
	objects["Instance73"]["Visible"] = true;
	objects["Instance73"]["Selectable"] = false;
	objects["Instance73"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance73"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance74"]["Visible"] = true;
	objects["Instance74"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance74"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance74"]["Active"] = false;
	objects["Instance74"]["TextStrokeTransparency"] = 1;
	objects["Instance74"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance74"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance74"]["ZIndex"] = 4;
	objects["Instance74"]["BorderSizePixel"] = 0;
	objects["Instance74"]["Draggable"] = false;
	objects["Instance74"]["RichText"] = false;
	objects["Instance74"]["Transparency"] = 1;
	objects["Instance74"]["SelectionOrder"] = 0;
	objects["Instance74"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance74"]["TextScaled"] = true;
	objects["Instance74"]["TextWrap"] = true;
	objects["Instance74"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance74"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance74"]["Parent"] = objects["Instance71"];
	objects["Instance74"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance74"]["TextSize"] = 14;
	objects["Instance74"]["Position"] = UDim2.new(0.05000000074505806, 5, 0.5, 0);
	objects["Instance74"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance74"]["Size"] = UDim2.new(0.8999999761581421, -5, 0.6000000238418579, 0);
	objects["Instance74"]["BackgroundTransparency"] = 1;
	objects["Instance74"]["LineHeight"] = 1;
	objects["Instance74"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance74"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance74"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance74"]["Text"] = "<";
	objects["Instance74"]["LayoutOrder"] = 0;
	objects["Instance74"]["TextWrapped"] = true;
	objects["Instance74"]["Rotation"] = 0;
	objects["Instance74"]["TextTransparency"] = 0;
	objects["Instance74"]["Name"] = "RName";
	objects["Instance74"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance74"]["ClipsDescendants"] = false;
	objects["Instance74"]["MaxVisibleGraphemes"] = -1;
	objects["Instance74"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance74"]["Selectable"] = false;

	objects["Instance75"]["Visible"] = true;
	objects["Instance75"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance75"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance75"]["Active"] = true;
	objects["Instance75"]["TextStrokeTransparency"] = 1;
	objects["Instance75"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance75"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance75"]["ZIndex"] = 3;
	objects["Instance75"]["BorderSizePixel"] = 0;
	objects["Instance75"]["Draggable"] = false;
	objects["Instance75"]["RichText"] = false;
	objects["Instance75"]["Modal"] = false;
	objects["Instance75"]["AutoButtonColor"] = true;
	objects["Instance75"]["Transparency"] = 1;
	objects["Instance75"]["SelectionOrder"] = 0;
	objects["Instance75"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance75"]["TextScaled"] = false;
	objects["Instance75"]["TextWrap"] = false;
	objects["Instance75"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance75"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance75"]["Parent"] = objects["Instance70"];
	objects["Instance75"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance75"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance75"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance75"]["BackgroundColor3"] = Color3.new(0.196078, 0.196078, 0.196078);
	objects["Instance75"]["Selected"] = false;
	objects["Instance75"]["TextSize"] = 14;
	objects["Instance75"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance75"]["BackgroundTransparency"] = 1;
	objects["Instance75"]["TextWrapped"] = false;
	objects["Instance75"]["ClipsDescendants"] = false;
	objects["Instance75"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance75"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance75"]["Text"] = "";
	objects["Instance75"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance75"]["LayoutOrder"] = 0;
	objects["Instance75"]["Rotation"] = 0;
	objects["Instance75"]["LineHeight"] = 1;
	objects["Instance75"]["Name"] = "Button";
	objects["Instance75"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance75"]["Selectable"] = true;
	objects["Instance75"]["MaxVisibleGraphemes"] = -1;
	objects["Instance75"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance75"]["TextTransparency"] = 0;

	objects["Instance76"]["LayoutOrder"] = 0;
	objects["Instance76"]["Active"] = false;
	objects["Instance76"]["Parent"] = objects["Instance54"];
	objects["Instance76"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance76"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance76"]["ZIndex"] = 2;
	objects["Instance76"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance76"]["Size"] = UDim2.new(0.46000000834465027, 0, 0.17499999701976776, 0);
	objects["Instance76"]["Draggable"] = false;
	objects["Instance76"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance76"]["ClipsDescendants"] = false;
	objects["Instance76"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance76"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance76"]["BackgroundTransparency"] = 1;
	objects["Instance76"]["BorderSizePixel"] = 0;
	objects["Instance76"]["Rotation"] = 0;
	objects["Instance76"]["Transparency"] = 1;
	objects["Instance76"]["Name"] = "Load";
	objects["Instance76"]["SelectionOrder"] = 0;
	objects["Instance76"]["Visible"] = true;
	objects["Instance76"]["Selectable"] = false;
	objects["Instance76"]["Position"] = UDim2.new(0.10999999940395355, 0, 0.824999988079071, 0);
	objects["Instance76"]["BackgroundColor3"] = Color3.new(1, 1, 1);

	objects["Instance77"]["LayoutOrder"] = 0;
	objects["Instance77"]["Active"] = false;
	objects["Instance77"]["Parent"] = objects["Instance76"];
	objects["Instance77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	objects["Instance77"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance77"]["ZIndex"] = 3;
	objects["Instance77"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance77"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.699999988079071, 0);
	objects["Instance77"]["Draggable"] = false;
	objects["Instance77"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance77"]["ClipsDescendants"] = false;
	objects["Instance77"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance77"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance77"]["BackgroundTransparency"] = 0;
	objects["Instance77"]["BorderSizePixel"] = 0;
	objects["Instance77"]["Rotation"] = 0;
	objects["Instance77"]["Transparency"] = 0;
	objects["Instance77"]["Name"] = "Display";
	objects["Instance77"]["SelectionOrder"] = 0;
	objects["Instance77"]["Visible"] = true;
	objects["Instance77"]["Selectable"] = false;
	objects["Instance77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	objects["Instance77"]["BackgroundColor3"] = Color3.new(0.156863, 0.156863, 0.254902);

	objects["Instance78"]["Enabled"] = true;
	objects["Instance78"]["Transparency"] = 0;
	objects["Instance78"]["Name"] = "UIStroke";
	objects["Instance78"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
	objects["Instance78"]["Parent"] = objects["Instance77"];
	objects["Instance78"]["Thickness"] = 1;
	objects["Instance78"]["Color"] = Color3.new(0.235294, 0.235294, 0.313726);
	objects["Instance78"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Contextual;

	objects["Instance79"]["LayoutOrder"] = 0;
	objects["Instance79"]["Active"] = false;
	objects["Instance79"]["Parent"] = objects["Instance77"];
	objects["Instance79"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance79"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance79"]["ZIndex"] = 4;
	objects["Instance79"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance79"]["Size"] = UDim2.new(0, 5, 1, 0);
	objects["Instance79"]["Draggable"] = false;
	objects["Instance79"]["Style"] = Enum.FrameStyle.Custom;
	objects["Instance79"]["ClipsDescendants"] = false;
	objects["Instance79"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance79"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance79"]["BackgroundTransparency"] = 0;
	objects["Instance79"]["BorderSizePixel"] = 0;
	objects["Instance79"]["Rotation"] = 0;
	objects["Instance79"]["Transparency"] = 0;
	objects["Instance79"]["Name"] = "Type_BUTTON";
	objects["Instance79"]["SelectionOrder"] = 0;
	objects["Instance79"]["Visible"] = true;
	objects["Instance79"]["Selectable"] = false;
	objects["Instance79"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance79"]["BackgroundColor3"] = Color3.new(1, 0.333333, 0.498039);

	objects["Instance80"]["Visible"] = true;
	objects["Instance80"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance80"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance80"]["Active"] = false;
	objects["Instance80"]["TextStrokeTransparency"] = 1;
	objects["Instance80"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance80"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance80"]["ZIndex"] = 4;
	objects["Instance80"]["BorderSizePixel"] = 0;
	objects["Instance80"]["Draggable"] = false;
	objects["Instance80"]["RichText"] = false;
	objects["Instance80"]["Transparency"] = 1;
	objects["Instance80"]["SelectionOrder"] = 0;
	objects["Instance80"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance80"]["TextScaled"] = true;
	objects["Instance80"]["TextWrap"] = true;
	objects["Instance80"]["FontFace"] = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance80"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance80"]["Parent"] = objects["Instance77"];
	objects["Instance80"]["AnchorPoint"] = Vector2.new(0, 0.5);
	objects["Instance80"]["TextSize"] = 14;
	objects["Instance80"]["Position"] = UDim2.new(0.05000000074505806, 5, 0.5, 0);
	objects["Instance80"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance80"]["Size"] = UDim2.new(0.8999999761581421, -5, 0.6000000238418579, 0);
	objects["Instance80"]["BackgroundTransparency"] = 1;
	objects["Instance80"]["LineHeight"] = 1;
	objects["Instance80"]["BackgroundColor3"] = Color3.new(1, 1, 1);
	objects["Instance80"]["TextColor3"] = Color3.new(1, 1, 1);
	objects["Instance80"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance80"]["Text"] = "Load";
	objects["Instance80"]["LayoutOrder"] = 0;
	objects["Instance80"]["TextWrapped"] = true;
	objects["Instance80"]["Rotation"] = 0;
	objects["Instance80"]["TextTransparency"] = 0;
	objects["Instance80"]["Name"] = "RName";
	objects["Instance80"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance80"]["ClipsDescendants"] = false;
	objects["Instance80"]["MaxVisibleGraphemes"] = -1;
	objects["Instance80"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance80"]["Selectable"] = false;

	objects["Instance81"]["Visible"] = true;
	objects["Instance81"]["FontSize"] = Enum.FontSize.Size14;
	objects["Instance81"]["TextDirection"] = Enum.TextDirection.Auto;
	objects["Instance81"]["Active"] = true;
	objects["Instance81"]["TextStrokeTransparency"] = 1;
	objects["Instance81"]["TextTruncate"] = Enum.TextTruncate.None;
	objects["Instance81"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXY;
	objects["Instance81"]["ZIndex"] = 3;
	objects["Instance81"]["BorderSizePixel"] = 0;
	objects["Instance81"]["Draggable"] = false;
	objects["Instance81"]["RichText"] = false;
	objects["Instance81"]["Modal"] = false;
	objects["Instance81"]["AutoButtonColor"] = true;
	objects["Instance81"]["Transparency"] = 1;
	objects["Instance81"]["SelectionOrder"] = 0;
	objects["Instance81"]["TextYAlignment"] = Enum.TextYAlignment.Center;
	objects["Instance81"]["TextScaled"] = false;
	objects["Instance81"]["TextWrap"] = false;
	objects["Instance81"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal, false);
	objects["Instance81"]["BorderMode"] = Enum.BorderMode.Outline;
	objects["Instance81"]["Parent"] = objects["Instance76"];
	objects["Instance81"]["AnchorPoint"] = Vector2.new(0, 0);
	objects["Instance81"]["Style"] = Enum.ButtonStyle.Custom;
	objects["Instance81"]["Position"] = UDim2.new(0, 0, 0, 0);
	objects["Instance81"]["BackgroundColor3"] = Color3.new(0.196078, 0.196078, 0.196078);
	objects["Instance81"]["Selected"] = false;
	objects["Instance81"]["TextSize"] = 14;
	objects["Instance81"]["Size"] = UDim2.new(1, 0, 1, 0);
	objects["Instance81"]["BackgroundTransparency"] = 1;
	objects["Instance81"]["TextWrapped"] = false;
	objects["Instance81"]["ClipsDescendants"] = false;
	objects["Instance81"]["TextColor3"] = Color3.new(0, 0, 0);
	objects["Instance81"]["BorderColor3"] = Color3.new(0, 0, 0);
	objects["Instance81"]["Text"] = "";
	objects["Instance81"]["AutomaticSize"] = Enum.AutomaticSize.None;
	objects["Instance81"]["LayoutOrder"] = 0;
	objects["Instance81"]["Rotation"] = 0;
	objects["Instance81"]["LineHeight"] = 1;
	objects["Instance81"]["Name"] = "Button";
	objects["Instance81"]["TextXAlignment"] = Enum.TextXAlignment.Center;
	objects["Instance81"]["Selectable"] = true;
	objects["Instance81"]["MaxVisibleGraphemes"] = -1;
	objects["Instance81"]["TextStrokeColor3"] = Color3.new(0, 0, 0);
	objects["Instance81"]["TextTransparency"] = 0;
end;

-- Set modules
local o_require = require; local require;
local modules do
	modules = {};
	require = function(object)
		if modules[object] then
			return modules[object]();
		end
		return o_require(object);
	end;

	getfenv().require = require;

	modules[objects["Instance2"]] = function()
		local script = objects["Instance2"];
		local Lib = {}
		local function getFunc(name)
			return getfenv()[name]
		end
		local ENV = {
			game=game,
			Instance=Instance,
			type=type,
			typeof=typeof,
			wait=wait,
			workspace=workspace,
			Wait=wait,
			Workspace=workspace,
			Enum=Enum,
			ElapsedTime=getFunc("elapsedTime"),
			elapsedTime=getFunc("elapsedTime"),
			require=require,
			Random=Random,
			RaycastParams=RaycastParams,
			Region3=Region3,
			Ray=Ray,
			Rect=Rect,
			RotationCurveKey=RotationCurveKey,
			Region3int16=Region3int16,
			rawget=rawget,
			rawlen=rawlen,
			rawset=rawset,
			rawequal=rawequal,
			task=task,
			TweenInfo=TweenInfo,
			tostring=tostring,
			tonumber=tonumber,
			table=table,
			time=time,
			tick=tick,
			ypcall=pcall,
			UDim2=UDim2,
			utf8=utf8,
			unpack=unpack,
			UDim=UDim,
			UserSettings=UserSettings,
			ipairs=ipairs,
			os=os,
			OverlapParams=OverlapParams,
			pairs=pairs,
			pcall=pcall,
			plugin=plugin,
			PhysicalProperties=PhysicalProperties,
			PathWaypoint=PathWaypoint,
			printidentity=getFunc("printidentity"),
			Axes=Axes,
			assert=assert,
			script=nil,
			string=string,
			select=select,
			settings=settings,
			spawn=spawn,
			Secret=Secret,
			shared=shared,
			setfenv=setfenv,
			SharedTable=SharedTable,
			setmetatable=setmetatable,
			Spawn=spawn,
			Stats=getFunc("stats"),
			stats=getFunc("stats"),
			DateTime=DateTime,
			debug=debug,
			DockWidgetPluginGuiInfo=DockWidgetPluginGuiInfo,
			delay=delay,
			Delay=delay,
			Font=Font,
			Faces=Faces,
			File=File,
			FloatCurveKey=FloatCurveKey,
			getfenv=getfenv,
			getmetatable=getmetatable,
			gcinfo=gcinfo,
			Game=getFunc("Game"),
			loadstring=loadstring,
			xpcall=xpcall,
			CFrame=CFrame,
			Color3=Color3,
			coroutine=coroutine,
			ColorSequenceKeypoint=ColorSequenceKeypoint,
			ColorSequence=ColorSequence,
			CatalogSearchParams=CatalogSearchParams,
			collectgarbage=getFunc("collectgarbage"),
			Vector3=Vector3,
			Vector2=Vector2,
			Vector2int16=Vector2int16,
			Vector3int16=Vector3int16,
			Version=getFunc("version"),
			version=getFunc("version"),
			BrickColor=BrickColor,
			bit32=bit32,
			buffer=buffer,
			newproxy=newproxy,
			NumberSequence=NumberSequence,
			NumberSequenceKeypoint=NumberSequenceKeypoint,
			NumberRange=NumberRange,
			next=next,
			math=math,
			_G={},
			_VERSION=_VERSION,
			print=print,
			warn=warn,
			error=error,
		}
		local Main = {}
		local plr = game:GetService("Players").LocalPlayer
		Main.Mouse = plr and plr:GetMouse()
		local service = setmetatable({},{
			__index = function(self,name)
				return game:FindFirstChild(name) or game:GetService(name)
			end,
		})
		local cloneref = function(...)return...end
		local clonerefs = cloneref
		local create = function(data)
			local insts = {}
			for i,v in pairs(data) do insts[v[1]] = Instance.new(v[2]) end
			for _,v in pairs(data) do
				for prop,val in pairs(v[3]) do
					if type(val) == "table" then
						insts[v[1]][prop] = insts[val[1]]
					else
						insts[v[1]][prop] = val
					end
				end
			end
			return insts[1]
		end
		local createSimple = function(class,props)
			local inst = Instance.new(class)
			for i,v in next,props do
				inst[i] = v
			end
			return inst
		end
		local Settings = {
			Explorer = {
				_Recurse = true,
				Sorting = true,
				TeleportToOffset = Vector3.new(0,0,0),
				ClickToRename = true,
				AutoUpdateSearch = true,
				AutoUpdateMode = 0, -- 0 Default, 1 no tree update, 2 no descendant events, 3 frozen
				PartSelectionBox = true,
				GuiSelectionBox = true,
				CopyPathUseGetChildren = true
			},
			Properties = {
				_Recurse = true,
				MaxConflictCheck = 50,
				ShowDeprecated = false,
				ShowHidden = false,
				ClearOnFocus = false,
				LoadstringInput = true,
				NumberRounding = 3,
				ShowAttributes = false,
				MaxAttributes = 50,
				ScaleType = 1 -- 0 Full Name Shown, 1 Equal Halves
			},
			Theme = {
				_Recurse = true,
				Main1 = Color3.fromRGB(52,52,52),
				Main2 = Color3.fromRGB(45,45,45),
				Outline1 = Color3.fromRGB(33,33,33), -- Mainly frames
				Outline2 = Color3.fromRGB(55,55,55), -- Mainly button
				Outline3 = Color3.fromRGB(30,30,30), -- Mainly textbox
				TextBox = Color3.fromRGB(38,38,38),
				Menu = Color3.fromRGB(32,32,32),
				ListSelection = Color3.fromRGB(199,154,40),
				Button = Color3.fromRGB(60,60,60),
				ButtonHover = Color3.fromRGB(68,68,68),
				ButtonPress = Color3.fromRGB(40,40,40),
				Highlight = Color3.fromRGB(75,75,75),
				Text = Color3.fromRGB(255,255,255),
				PlaceholderText = Color3.fromRGB(100,100,100),
				Important = Color3.fromRGB(255,0,0),
				ExplorerIconMap = "",
				MiscIconMap = "",
				Syntax = {
					Text = Color3.fromRGB(204,204,204),
					Background = Color3.fromRGB(18,18,25),
					Selection = Color3.fromRGB(255,255,255),
					SelectionBack = Color3.fromRGB(66, 0, 50),
					Operator = Color3.fromRGB(204,204,204),
					Number = Color3.fromRGB(170, 170, 255),
					String = Color3.fromRGB(255, 85, 255),
					Comment = Color3.fromRGB(102,102,102),
					Keyword = Color3.fromRGB(255, 0, 127),
					Error = Color3.fromRGB(255,0,0),
					FindBackground = Color3.fromRGB(255, 170, 0),
					MatchingWord = Color3.fromRGB(85,85,85),
					BuiltIn = Color3.fromRGB(170, 85, 255),
					CurrentLine = Color3.fromRGB(45,50,65),
					LocalMethod = Color3.fromRGB(255, 170, 255),
					LocalProperty = Color3.fromRGB(255, 170, 255),
					Nil = Color3.fromRGB(255, 0, 255),
					Bool = Color3.fromRGB(255, 0, 255),
					Function = Color3.fromRGB(255, 0, 127),
					Local = Color3.fromRGB(255, 0, 127),
					Self = Color3.fromRGB(255, 0, 127),
					FunctionName = Color3.fromRGB(255, 170, 255),
					Bracket = Color3.fromRGB(204,204,204)
				},
			}
		}
		local function signalWait(s)return s:Wait()end
		local renderStepped = game["Run Service"].RenderStepped
		Lib.FastWait = function(s)
			if not s then return signalWait(renderStepped) end
			local start = tick()
			while tick() - start < s do signalWait(renderStepped) end
		end
		Lib.CheckMouseInGui = function(gui)
			if gui == nil then return false end
			Main.Mouse = Main.Mouse or plr and plr:GetMouse()
			local mouse = Main.Mouse
			local guiPosition = gui.AbsolutePosition
			local guiSize = gui.AbsoluteSize    

			return mouse.X >= guiPosition.X and mouse.X < guiPosition.X + guiSize.X and mouse.Y >= guiPosition.Y and mouse.Y < guiPosition.Y + guiSize.Y
		end
		Lib.CreateArrow = function(size,num,dir)
			local max = num
			local arrowFrame = createSimple("Frame",{
				BackgroundTransparency = 1,
				Name = "Arrow",
				Size = UDim2.new(0,size,0,size)
			})
			if dir == "up" then
				for i = 1,num do
					local newLine = createSimple("TextButton",{
						BackgroundColor3 = Color3.new(220/255,220/255,220/255),
						BorderSizePixel = 0,
						Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)+i-math.floor(max/2)-1),
						Size = UDim2.new(0,i+(i-1),0,1),
						Parent = arrowFrame,
						Text = "",
						AutoButtonColor = false
					})
				end
				return arrowFrame
			elseif dir == "down" then
				for i = 1,num do
					local newLine = createSimple("TextButton",{
						BackgroundColor3 = Color3.new(220/255,220/255,220/255),
						BorderSizePixel = 0,
						Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)-i+math.floor(max/2)+1),
						Size = UDim2.new(0,i+(i-1),0,1),
						Parent = arrowFrame,
						Text = "",
						AutoButtonColor = false
					})
				end
				return arrowFrame
			elseif dir == "left" then
				for i = 1,num do
					local newLine = createSimple("TextButton",{
						BackgroundColor3 = Color3.new(220/255,220/255,220/255),
						BorderSizePixel = 0,
						Position = UDim2.new(0,math.floor(size/2)+i-math.floor(max/2)-1,0,math.floor(size/2)-(i-1)),
						Size = UDim2.new(0,1,0,i+(i-1)),
						Parent = arrowFrame,
						Text = "",
						AutoButtonColor = false
					})
				end
				return arrowFrame
			elseif dir == "right" then
				for i = 1,num do
					local newLine = createSimple("TextButton",{
						BackgroundColor3 = Color3.new(220/255,220/255,220/255),
						BorderSizePixel = 0,
						Position = UDim2.new(0,math.floor(size/2)-i+math.floor(max/2)+1,0,math.floor(size/2)-(i-1)),
						Size = UDim2.new(0,1,0,i+(i-1)),
						Parent = arrowFrame,
						Text = "",
						AutoButtonColor = false
					})
				end
				return arrowFrame
			end
			error("r u ok")
		end
		Lib.Signal = (function()
			local funcs = {}

			local disconnect = function(con)
				local pos = table.find(con.Signal.Connections,con)
				if pos then table.remove(con.Signal.Connections,pos) end
			end

			funcs.Connect = function(self,func)
				if type(func) ~= "function" then error("Attempt to connect a non-function") end        
				local con = {
					Signal = self,
					Func = func,
					Disconnect = disconnect
				}
				self.Connections[#self.Connections+1] = con
				return con
			end

			funcs.Fire = function(self,...)
				for i,v in next,self.Connections do
					xpcall(coroutine.wrap(v.Func),function(e) warn(e.."\n"..debug.traceback()) end,...)
				end
			end

			local mt = {
				__index = funcs,
				__tostring = function(self)
					return "Signal: " .. tostring(#self.Connections) .. " Connections"
				end
			}

			local function new()
				local obj = {}
				obj.Connections = {}

				return setmetatable(obj,mt)
			end

			return {new = new}
		end)()
		Lib.ScrollBar = (function()
			local funcs = {}
			local user = service.UserInputService
			local mouse = Main.Mouse or plr and plr:GetMouse()
			local checkMouseInGui = Lib.CheckMouseInGui
			local createArrow = Lib.CreateArrow

			local function drawThumb(self)
				local total = self.TotalSpace
				local visible = self.VisibleSpace
				local index = self.Index
				local scrollThumb = self.GuiElems.ScrollThumb
				local scrollThumbFrame = self.GuiElems.ScrollThumbFrame

				if not (self:CanScrollUp()    or self:CanScrollDown()) then
					scrollThumb.Visible = false
				else
					scrollThumb.Visible = true
				end

				if self.Horizontal then
					scrollThumb.Size = UDim2.new(visible/total,0,1,0)
					if scrollThumb.AbsoluteSize.X < 16 then
						scrollThumb.Size = UDim2.new(0,16,1,0)
					end
					local fs = scrollThumbFrame.AbsoluteSize.X
					local bs = scrollThumb.AbsoluteSize.X
					scrollThumb.Position = UDim2.new(self:GetScrollPercent()*(fs-bs)/fs,0,0,0)
				else
					scrollThumb.Size = UDim2.new(1,0,visible/total,0)
					if scrollThumb.AbsoluteSize.Y < 16 then
						scrollThumb.Size = UDim2.new(1,0,0,16)
					end
					local fs = scrollThumbFrame.AbsoluteSize.Y
					local bs = scrollThumb.AbsoluteSize.Y
					scrollThumb.Position = UDim2.new(0,0,self:GetScrollPercent()*(fs-bs)/fs,0)
				end
			end

			local function createFrame(self)
				local newFrame = createSimple("Frame",{Style=0,Active=true,AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-16,0,0),Rotation=0,Selectable=false,Size=UDim2.new(0,16,1,0),SizeConstraint=0,Visible=true,ZIndex=1,Name="ScrollBar",})
				local button1 = nil
				local button2 = nil

				if self.Horizontal then
					newFrame.Size = UDim2.new(1,0,0,16)
					button1 = createSimple("ImageButton",{
						Parent = newFrame,
						Name = "Left",
						Size = UDim2.new(0,16,0,16),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false
					})
					createArrow(16,4,"left").Parent = button1
					button2 = createSimple("ImageButton",{
						Parent = newFrame,
						Name = "Right",
						Position = UDim2.new(1,-16,0,0),
						Size = UDim2.new(0,16,0,16),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false
					})
					createArrow(16,4,"right").Parent = button2
				else
					newFrame.Size = UDim2.new(0,16,1,0)
					button1 = createSimple("ImageButton",{
						Parent = newFrame,
						Name = "Up",
						Size = UDim2.new(0,16,0,16),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false
					})
					createArrow(16,4,"up").Parent = button1
					button2 = createSimple("ImageButton",{
						Parent = newFrame,
						Name = "Down",
						Position = UDim2.new(0,0,1,-16),
						Size = UDim2.new(0,16,0,16),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutoButtonColor = false
					})
					createArrow(16,4,"down").Parent = button2
				end

				local scrollThumbFrame = createSimple("Frame",{
					BackgroundTransparency = 1,
					Parent = newFrame,
				})
				if self.Horizontal then
					scrollThumbFrame.Position = UDim2.new(0,16,0,0)
					scrollThumbFrame.Size = UDim2.new(1,-32,1,0)
				else
					scrollThumbFrame.Position = UDim2.new(0,0,0,16)
					scrollThumbFrame.Size = UDim2.new(1,0,1,-32)
				end

				local scrollThumb = createSimple("TextButton",{
					BackgroundColor3 = Color3.new(120/255,120/255,120/255),
					BorderSizePixel = 0,
					Parent = scrollThumbFrame,
					Text = "",
					AutoButtonColor = false,
				})

				local markerFrame = createSimple("Frame",{
					BackgroundTransparency = 1,
					Name = "Markers",
					Size = UDim2.new(1,0,1,0),
					Parent = scrollThumbFrame
				})

				local buttonPress = false
				local thumbPress = false
				local thumbFramePress = false

				--local thumbColor = Color3.new(120/255,120/255,120/255)
				--local thumbSelectColor = Color3.new(140/255,140/255,140/255)
				button1.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress and self:CanScrollUp() then button1.BackgroundTransparency = 0.8 end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch or not self:CanScrollUp() then return end
					buttonPress = true
					button1.BackgroundTransparency = 0.5
					if self:CanScrollUp() then self:ScrollUp() self.Scrolled:Fire() end
					local buttonTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
						releaseEvent:Disconnect()
						if checkMouseInGui(button1) and self:CanScrollUp() then button1.BackgroundTransparency = 0.8 else button1.BackgroundTransparency = 1 end
						buttonPress = false
					end)
					while buttonPress do
						if tick() - buttonTick >= 0.3 and self:CanScrollUp() then
							self:ScrollUp()
							self.Scrolled:Fire()
						end
						wait()
					end
				end)
				button1.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress then button1.BackgroundTransparency = 1 end
				end)
				button2.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress and self:CanScrollDown() then button2.BackgroundTransparency = 0.8 end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch or not self:CanScrollDown() then return end
					buttonPress = true
					button2.BackgroundTransparency = 0.5
					if self:CanScrollDown() then self:ScrollDown() self.Scrolled:Fire() end
					local buttonTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
						releaseEvent:Disconnect()
						if checkMouseInGui(button2) and self:CanScrollDown() then button2.BackgroundTransparency = 0.8 else button2.BackgroundTransparency = 1 end
						buttonPress = false
					end)
					while buttonPress do
						if tick() - buttonTick >= 0.3 and self:CanScrollDown() then
							self:ScrollDown()
							self.Scrolled:Fire()
						end
						wait()
					end
				end)
				button2.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress then button2.BackgroundTransparency = 1 end
				end)

				scrollThumb.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and not thumbPress then scrollThumb.BackgroundTransparency = 0.2 scrollThumb.BackgroundColor3 = self.ThumbSelectColor end
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end

					local dir = self.Horizontal and "X" or "Y"
					local lastThumbPos = nil

					buttonPress = false
					thumbFramePress = false            
					thumbPress = true
					scrollThumb.BackgroundTransparency = 0
					local mouseOffset = mouse[dir] - scrollThumb.AbsolutePosition[dir]
					local mouseStart = mouse[dir]
					local releaseEvent
					local mouseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
						releaseEvent:Disconnect()
						if mouseEvent then mouseEvent:Disconnect() end
						if checkMouseInGui(scrollThumb) then scrollThumb.BackgroundTransparency = 0.2 else scrollThumb.BackgroundTransparency = 0 scrollThumb.BackgroundColor3 = self.ThumbColor end
						thumbPress = false
					end)
					self:Update()

					mouseEvent = user.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement and thumbPress and releaseEvent.Connected then
							local thumbFrameSize = scrollThumbFrame.AbsoluteSize[dir]-scrollThumb.AbsoluteSize[dir]
							local pos = mouse[dir] - scrollThumbFrame.AbsolutePosition[dir] - mouseOffset
							if pos > thumbFrameSize then
								pos = thumbFrameSize
							elseif pos < 0 then
								pos = 0
							end
							if lastThumbPos ~= pos then
								lastThumbPos = pos
								self:ScrollTo(math.floor(0.5+pos/thumbFrameSize*(self.TotalSpace-self.VisibleSpace)))
							end
							wait()
						end
					end)
				end)
				scrollThumb.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and not thumbPress then scrollThumb.BackgroundTransparency = 0 scrollThumb.BackgroundColor3 = self.ThumbColor end
				end)
				scrollThumbFrame.InputBegan:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch or checkMouseInGui(scrollThumb) then return end

					local dir = self.Horizontal and "X" or "Y"
					local scrollDir = 0
					if mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir] then
						scrollDir = 1
					end

					local function doTick()
						local scrollSize = self.VisibleSpace - 1
						if scrollDir == 0 and mouse[dir] < scrollThumb.AbsolutePosition[dir] then
							self:ScrollTo(self.Index - scrollSize)
						elseif scrollDir == 1 and mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir] then
							self:ScrollTo(self.Index + scrollSize)
						end
					end

					thumbPress = false            
					thumbFramePress = true
					doTick()
					local thumbFrameTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
						releaseEvent:Disconnect()
						thumbFramePress = false
					end)
					while thumbFramePress do
						if tick() - thumbFrameTick >= 0.3 and checkMouseInGui(scrollThumbFrame) then
							doTick()
						end
						wait()
					end
				end)

				newFrame.MouseWheelForward:Connect(function()
					self:ScrollTo(self.Index - self.WheelIncrement)
				end)

				newFrame.MouseWheelBackward:Connect(function()
					self:ScrollTo(self.Index + self.WheelIncrement)
				end)

				self.GuiElems.ScrollThumb = scrollThumb
				self.GuiElems.ScrollThumbFrame = scrollThumbFrame
				self.GuiElems.Button1 = button1
				self.GuiElems.Button2 = button2
				self.GuiElems.MarkerFrame = markerFrame

				return newFrame
			end

			funcs.Update = function(self,nocallback)
				local total = self.TotalSpace
				local visible = self.VisibleSpace
				local index = self.Index
				local button1 = self.GuiElems.Button1
				local button2 = self.GuiElems.Button2

				self.Index = math.clamp(self.Index,0,math.max(0,total-visible))

				if self.LastTotalSpace ~= self.TotalSpace then
					self.LastTotalSpace = self.TotalSpace
					self:UpdateMarkers()
				end

				if self:CanScrollUp() then
					for i,v in pairs(button1.Arrow:GetChildren()) do
						v.BackgroundTransparency = 0
					end
				else
					button1.BackgroundTransparency = 1
					for i,v in pairs(button1.Arrow:GetChildren()) do
						v.BackgroundTransparency = 0.5
					end
				end
				if self:CanScrollDown() then
					for i,v in pairs(button2.Arrow:GetChildren()) do
						v.BackgroundTransparency = 0
					end
				else
					button2.BackgroundTransparency = 1
					for i,v in pairs(button2.Arrow:GetChildren()) do
						v.BackgroundTransparency = 0.5
					end
				end

				drawThumb(self)
			end

			funcs.UpdateMarkers = function(self)
				local markerFrame = self.GuiElems.MarkerFrame
				markerFrame:ClearAllChildren()

				for i,v in pairs(self.Markers) do
					if i < self.TotalSpace then
						createSimple("TextButton",{
							BackgroundTransparency = 0,
							BackgroundColor3 = v,
							BorderSizePixel = 0,
							Position = self.Horizontal and UDim2.new(i/self.TotalSpace,0,1,-6) or UDim2.new(1,-6,i/self.TotalSpace,0),
							Size = self.Horizontal and UDim2.new(0,1,0,6) or UDim2.new(0,6,0,1),
							Name = "Marker"..tostring(i),
							Parent = markerFrame,
							Text = "",
							AutoButtonColor = false,
						})
					end
				end
			end

			funcs.AddMarker = function(self,ind,color)
				self.Markers[ind] = color or Color3.new(0,0,0)
			end
			funcs.ScrollTo = function(self,ind,nocallback)
				self.Index = ind
				self:Update()
				if not nocallback then
					self.Scrolled:Fire()
				end
			end
			funcs.ScrollUp = function(self)
				self.Index = self.Index - self.Increment
				self:Update()
			end
			funcs.ScrollDown = function(self)
				self.Index = self.Index + self.Increment
				self:Update()
			end
			funcs.CanScrollUp = function(self)
				return self.Index > 0
			end
			funcs.CanScrollDown = function(self)
				return self.Index + self.VisibleSpace < self.TotalSpace
			end
			funcs.GetScrollPercent = function(self)
				return self.Index/(self.TotalSpace-self.VisibleSpace)
			end
			funcs.SetScrollPercent = function(self,perc)
				self.Index = math.floor(perc*(self.TotalSpace-self.VisibleSpace))
				self:Update()
			end

			funcs.Texture = function(self,data)
				self.ThumbColor = data.ThumbColor or Color3.new(0,0,0)
				self.ThumbSelectColor = data.ThumbSelectColor or Color3.new(0,0,0)
				self.GuiElems.ScrollThumb.BackgroundColor3 = data.ThumbColor or Color3.new(0,0,0)
				self.Gui.BackgroundColor3 = data.FrameColor or Color3.new(0,0,0)
				self.GuiElems.Button1.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
				self.GuiElems.Button2.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
				for i,v in pairs(self.GuiElems.Button1.Arrow:GetChildren()) do
					v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
				end
				for i,v in pairs(self.GuiElems.Button2.Arrow:GetChildren()) do
					v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
				end
			end

			funcs.SetScrollFrame = function(self,frame)
				if self.ScrollUpEvent then self.ScrollUpEvent:Disconnect() self.ScrollUpEvent = nil end
				if self.ScrollDownEvent then self.ScrollDownEvent:Disconnect() self.ScrollDownEvent = nil end
				self.ScrollUpEvent = frame.MouseWheelForward:Connect(function() self:ScrollTo(self.Index - self.WheelIncrement) end)
				self.ScrollDownEvent = frame.MouseWheelBackward:Connect(function() self:ScrollTo(self.Index + self.WheelIncrement) end)
			end

			local mt = {}
			mt.__index = funcs

			local function new(hor)
				local obj = setmetatable({
					Index = 0,
					VisibleSpace = 0,
					TotalSpace = 0,
					Increment = 1,
					WheelIncrement = 1,
					Markers = {},
					GuiElems = {},
					Horizontal = hor,
					LastTotalSpace = 0,
					Scrolled = Lib.Signal.new()
				},mt)
				obj.Gui = createFrame(obj)
				obj:Texture({
					ThumbColor = Color3.fromRGB(60,60,60),
					ThumbSelectColor = Color3.fromRGB(75,75,75),
					ArrowColor = Color3.new(1,1,1),
					FrameColor = Color3.fromRGB(40,40,40),
					ButtonColor = Color3.fromRGB(75,75,75)
				})
				return obj
			end

			return {new = new}
		end)()
		Lib.CodeFrame = (function()
			local funcs = {}

			local typeMap = {
				[0] = "String",
				[1] = "String",
				[2] = "String",
				[3] = "String",
				[4] = "Comment",
				[5] = "Operator",
				[6] = "Number",
				[7] = "Keyword",
				[8] = "BuiltIn",
				[9] = "LocalMethod",
				[10] = "LocalProperty",
				[11] = "Nil",
				[12] = "Bool",
				[13] = "Function",
				[14] = "Local",
				[15] = "Self",
				[16] = "FunctionName",
				[17] = "Bracket"
			}

			local specialKeywordsTypes = {
				["nil"] = 11,
				["true"] = 12,
				["false"] = 12,
				["function"] = 13,
				["local"] = 14
			}

			local keywords = {
				["and"] = true,
				["break"] = true, 
				["do"] = true,
				["else"] = true,
				["elseif"] = true,
				["end"] = true,
				["false"] = true,
				["for"] = true,
				["function"] = true,
				["if"] = true,
				["in"] = true,
				["local"] = true,
				["nil"] = true,
				["not"] = true,
				["or"] = true,
				["repeat"] = true,
				["return"] = true,
				["then"] = true,
				["true"] = true,
				["until"] = true,
				["while"] = true,
				["type"] = true,
				["typeof"] = true,
				["self"] = true,
				["export"] = true,
				["continue"] = true,
				["OctoSpy"] = true,
				["Spy"] = true,
				["Octo"] = true
			}

			local builtIns = {}
			for i,_ in pairs(ENV) do
				builtIns[i] = true
			end

			local builtInInited = false

			local richReplace = {
				["'"] = "&apos;",
				["\""] = "&quot;",
				["<"] = "&lt;",
				[">"] = "&gt;",
				["&"] = "&amp;"
			}

			local tabSub = "\205"
			local tabReplacement = (" %s%s "):format(tabSub,tabSub)

			local tabJumps = {
				[("[^%s] %s"):format(tabSub,tabSub)] = 0,
				[(" %s%s"):format(tabSub,tabSub)] = -1,
				[("%s%s "):format(tabSub,tabSub)] = 2,
				[("%s [^%s]"):format(tabSub,tabSub)] = 1,
			}

			local tweenService = service.TweenService
			local lineTweens = {}

			local function initBuiltIn()
				local env = getfenv()
				local type = type
				local tostring = tostring
				for name,_ in next,builtIns do
					local envVal = env[name]
					if type(envVal) == "table" and name ~= "_G" then
						local items = {}
						for i,v in next,envVal do
							items[i] = true
						end
						builtIns[name] = items
					end
				end

				local enumEntries = {}
				local enums = Enum:GetEnums()
				for i = 1,#enums do
					enumEntries[tostring(enums[i])] = true
				end
				builtIns["Enum"] = enumEntries

				builtInInited = true
			end

			local function setupEditBox(obj)
				local editBox = obj.GuiElems.EditBox

				editBox.Focused:Connect(function()
					obj:ConnectEditBoxEvent()
					obj.Editing = true
				end)

				editBox.FocusLost:Connect(function()
					obj:DisconnectEditBoxEvent()
					obj.Editing = false
				end)

				editBox:GetPropertyChangedSignal("Text"):Connect(function()
					local text:string = editBox.Text
					if #text == 0 or obj.EditBoxCopying then return end
					editBox.Text = ""
					obj:AppendText(text:gsub("    ","    ").."")
				end)
			end

			local function setupMouseSelection(obj)
				local mouse = plr and plr:GetMouse()
				local codeFrame = obj.GuiElems.LinesFrame
				local lines = obj.Lines

				codeFrame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						local fontSizeX,fontSizeY = math.ceil(obj.FontSize/2),obj.FontSize

						local relX = mouse.X - codeFrame.AbsolutePosition.X
						local relY = mouse.Y - codeFrame.AbsolutePosition.Y
						local selX = math.round(relX / fontSizeX) + obj.ViewX
						local selY = math.floor(relY / fontSizeY) + obj.ViewY
						local releaseEvent,mouseEvent,scrollEvent
						local scrollPowerV,scrollPowerH = 0,0
						selY = math.min(#lines-1,selY)
						local relativeLine = lines[selY+1] or ""
						selX = math.min(#relativeLine, selX + obj:TabAdjust(selX,selY))

						obj.SelectionRange = {{-1,-1},{-1,-1}}
						obj:MoveCursor(selX,selY)
						obj.FloatCursorX = selX

						local function updateSelection()
							local relX = mouse.X - codeFrame.AbsolutePosition.X
							local relY = mouse.Y - codeFrame.AbsolutePosition.Y
							local sel2X = math.max(0,math.round(relX / fontSizeX) + obj.ViewX)
							local sel2Y = math.max(0,math.floor(relY / fontSizeY) + obj.ViewY)

							sel2Y = math.min(#lines-1,sel2Y)
							local relativeLine = lines[sel2Y+1] or ""
							sel2X = math.min(#relativeLine, sel2X + obj:TabAdjust(sel2X,sel2Y))

							if sel2Y < selY or (sel2Y == selY and sel2X < selX) then
								obj.SelectionRange = {{sel2X,sel2Y},{selX,selY}}
							else                        
								obj.SelectionRange = {{selX,selY},{sel2X,sel2Y}}
							end

							obj:MoveCursor(sel2X,sel2Y)
							obj.FloatCursorX = sel2X
							obj:Refresh()
						end

						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
								scrollEvent:Disconnect()
								obj:SetCopyableSelection()
								--updateSelection()
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								local upDelta = mouse.Y - codeFrame.AbsolutePosition.Y
								local downDelta = mouse.Y - codeFrame.AbsolutePosition.Y - codeFrame.AbsoluteSize.Y
								local leftDelta = mouse.X - codeFrame.AbsolutePosition.X
								local rightDelta = mouse.X - codeFrame.AbsolutePosition.X - codeFrame.AbsoluteSize.X
								scrollPowerV = 0
								scrollPowerH = 0
								if downDelta > 0 then
									scrollPowerV = math.floor(downDelta*0.05) + 1
								elseif upDelta < 0 then
									scrollPowerV = math.ceil(upDelta*0.05) - 1
								end
								if rightDelta > 0 then
									scrollPowerH = math.floor(rightDelta*0.05) + 1
								elseif leftDelta < 0 then
									scrollPowerH = math.ceil(leftDelta*0.05) - 1
								end
								updateSelection()
							end
						end)

						scrollEvent = clonerefs(game:GetService("RunService")).RenderStepped:Connect(function()
							if scrollPowerV ~= 0 or scrollPowerH ~= 0 then
								obj:ScrollDelta(scrollPowerH,scrollPowerV)
								updateSelection()
							end
						end)

						obj:Refresh()
					end
				end)
			end

			local function makeFrame(obj)
				local frame = create({
					{1,"TextButton",{AutoButtonColor=false,Text="",BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel = 0,Position=UDim2.new(0.5,-300,0.5,-200),Size=UDim2.new(0,600,0,400)}},
				})
				local elems = {}

				local linesFrame = Instance.new("Frame")
				linesFrame.Name = "Lines"
				linesFrame.BackgroundTransparency = 1
				linesFrame.Size = UDim2.new(1,0,1,0)
				linesFrame.ClipsDescendants = true
				linesFrame.Parent = frame

				local lineNumbersLabel = Instance.new("TextLabel")
				lineNumbersLabel.Name = "LineNumbers"
				lineNumbersLabel.BackgroundTransparency = 1
				lineNumbersLabel.Font = Enum.Font.Code
				lineNumbersLabel.TextXAlignment = Enum.TextXAlignment.Right
				lineNumbersLabel.TextYAlignment = Enum.TextYAlignment.Top
				lineNumbersLabel.ClipsDescendants = true
				lineNumbersLabel.RichText = true
				lineNumbersLabel.Parent = frame

				local cursor = Instance.new("TextButton")
				cursor.Name = "Cursor"
				cursor.BackgroundColor3 = Color3.fromRGB(220,220,220)
				cursor.BorderSizePixel = 0
				cursor.Parent = frame
				cursor.Text = ""
				cursor.AutoButtonColor = false

				local editBox = Instance.new("TextBox")
				editBox.Name = "EditBox"
				editBox.MultiLine = true
				editBox.Visible = false
				editBox.Parent = frame

				lineTweens.Invis = tweenService:Create(cursor,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 1})
				lineTweens.Vis = tweenService:Create(cursor,TweenInfo.new(0.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 0})

				elems.LinesFrame = linesFrame
				elems.LineNumbersLabel = lineNumbersLabel
				elems.Cursor = cursor
				elems.EditBox = editBox
				elems.ScrollCorner = create({{1,"TextButton",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,Text="",AutoButtonColor=false}}})

				elems.ScrollCorner.Parent = frame
				linesFrame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						obj:SetEditing(true,input)
					end
				end)

				obj.Frame = frame
				obj.Gui = frame
				obj.GuiElems = elems
				setupEditBox(obj)
				setupMouseSelection(obj)

				return frame
			end

			funcs.GetSelectionText = function(self)
				if not self:IsValidRange() then return "" end

				local selectionRange = self.SelectionRange
				local selX,selY = selectionRange[1][1], selectionRange[1][2]
				local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]
				local deltaLines = sel2Y-selY
				local lines = self.Lines

				if not lines[selY+1] or not lines[sel2Y+1] then return "" end

				if deltaLines == 0 then
					return self:ConvertText(lines[selY+1]:sub(selX+1,sel2X), false)
				end

				local leftSub = lines[selY+1]:sub(selX+1)
				local rightSub = lines[sel2Y+1]:sub(1,sel2X)

				local result = leftSub.."\n" 
				for i = selY+1,sel2Y-1 do
					result = result..lines[i+1].."\n"
				end
				result = result..rightSub

				return self:ConvertText(result,false)
			end

			funcs.SetCopyableSelection = function(self)
				local text = self:GetSelectionText()
				local editBox = self.GuiElems.EditBox

				self.EditBoxCopying = true
				editBox.Text = text
				editBox.SelectionStart = 1
				editBox.CursorPosition = #editBox.Text + 1
				self.EditBoxCopying = false
			end

			funcs.ConnectEditBoxEvent = function(self)
				if self.EditBoxEvent then
					self.EditBoxEvent:Disconnect()
				end

				self.EditBoxEvent = service.UserInputService.InputBegan:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

					local keycodes = Enum.KeyCode
					local keycode = input.KeyCode

					local function setupMove(key,func)
						local endCon,finished
						endCon = service.UserInputService.InputEnded:Connect(function(input)
							if input.KeyCode ~= key then return end
							endCon:Disconnect()
							finished = true
						end)
						func()
						Lib.FastWait(0.5)
						while not finished do func() Lib.FastWait(0.03) end
					end

					if keycode == keycodes.Down then
						setupMove(keycodes.Down,function()
							self.CursorX = self.FloatCursorX
							self.CursorY = self.CursorY + 1
							self:UpdateCursor()
							self:JumpToCursor()
						end)
					elseif keycode == keycodes.Up then
						setupMove(keycodes.Up,function()
							self.CursorX = self.FloatCursorX
							self.CursorY = self.CursorY - 1
							self:UpdateCursor()
							self:JumpToCursor()
						end)
					elseif keycode == keycodes.Left then
						setupMove(keycodes.Left,function()
							local line = self.Lines[self.CursorY+1] or ""
							self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
							if self.CursorX < 0 then
								self.CursorY = self.CursorY - 1
								local line2 = self.Lines[self.CursorY+1] or ""
								self.CursorX = #line2
							end
							self.FloatCursorX = self.CursorX
							self:UpdateCursor()
							self:JumpToCursor()
						end)
					elseif keycode == keycodes.Right then
						setupMove(keycodes.Right,function()
							local line = self.Lines[self.CursorY+1] or ""
							self.CursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
							if self.CursorX > #line then
								self.CursorY = self.CursorY + 1
								self.CursorX = 0
							end
							self.FloatCursorX = self.CursorX
							self:UpdateCursor()
							self:JumpToCursor()
						end)
					elseif keycode == keycodes.Backspace then
						setupMove(keycodes.Backspace,function()
							local startRange,endRange
							if self:IsValidRange() then
								startRange = self.SelectionRange[1]
								endRange = self.SelectionRange[2]
							else
								endRange = {self.CursorX,self.CursorY}
							end

							if not startRange then
								local line = self.Lines[self.CursorY+1] or ""
								self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
								if self.CursorX < 0 then
									self.CursorY = self.CursorY - 1
									local line2 = self.Lines[self.CursorY+1] or ""
									self.CursorX = #line2
								end
								self.FloatCursorX = self.CursorX
								self:UpdateCursor()

								startRange = startRange or {self.CursorX,self.CursorY}
							end

							self:DeleteRange({startRange,endRange},false,true)
							self:ResetSelection(true)
							self:JumpToCursor()
						end)
					elseif keycode == keycodes.Delete then
						setupMove(keycodes.Delete,function()
							local startRange,endRange
							if self:IsValidRange() then
								startRange = self.SelectionRange[1]
								endRange = self.SelectionRange[2]
							else
								startRange = {self.CursorX,self.CursorY}
							end

							if not endRange then
								local line = self.Lines[self.CursorY+1] or ""
								local endCursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
								local endCursorY = self.CursorY
								if endCursorX > #line then
									endCursorY = endCursorY + 1
									endCursorX = 0
								end
								self:UpdateCursor()

								endRange = endRange or {endCursorX,endCursorY}
							end

							self:DeleteRange({startRange,endRange},false,true)
							self:ResetSelection(true)
							self:JumpToCursor()
						end)
					elseif service.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
						if keycode == keycodes.A then
							self.SelectionRange = {{0,0},{#self.Lines[#self.Lines],#self.Lines-1}}
							self:SetCopyableSelection()
							self:Refresh()
						end
					end
				end)
			end

			funcs.DisconnectEditBoxEvent = function(self)
				if self.EditBoxEvent then
					self.EditBoxEvent:Disconnect()
				end
			end

			funcs.ResetSelection = function(self,norefresh)
				self.SelectionRange = {{-1,-1},{-1,-1}}
				if not norefresh then self:Refresh() end
			end

			funcs.IsValidRange = function(self,range)
				local selectionRange = range or self.SelectionRange
				local selX,selY = selectionRange[1][1], selectionRange[1][2]
				local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]

				if selX == -1 or (selX == sel2X and selY == sel2Y) then return false end

				return true
			end

			funcs.DeleteRange = function(self,range,noprocess,updatemouse)
				range = range or self.SelectionRange
				if not self:IsValidRange(range) then return end

				local lines = self.Lines
				local selX,selY = range[1][1], range[1][2]
				local sel2X,sel2Y = range[2][1], range[2][2]
				local deltaLines = sel2Y-selY

				if not lines[selY+1] or not lines[sel2Y+1] then return end

				local leftSub = lines[selY+1]:sub(1,selX)
				local rightSub = lines[sel2Y+1]:sub(sel2X+1)
				lines[selY+1] = leftSub..rightSub

				local remove = table.remove
				for i = 1,deltaLines do
					remove(lines,selY+2)
				end

				if range == self.SelectionRange then self.SelectionRange = {{-1,-1},{-1,-1}} end
				if updatemouse then
					self.CursorX = selX
					self.CursorY = selY
					self:UpdateCursor()
				end

				if not noprocess then
					self:ProcessTextChange()
				end
			end

			funcs.AppendText = function(self,text)
				self:DeleteRange(nil,true,true)
				local lines,cursorX,cursorY = self.Lines,self.CursorX,self.CursorY
				local line = lines[cursorY+1]
				local before = line:sub(1,cursorX)
				local after = line:sub(cursorX+1)

				text = text:gsub("\r\n","\n")
				text = self:ConvertText(text,true) -- Tab Convert

				local textLines = text:split("\n")
				local insert = table.insert

				for i = 1,#textLines do
					local linePos = cursorY+i
					if i > 1 then insert(lines,linePos,"") end

					local textLine = textLines[i]
					local newBefore = (i == 1 and before or "")
					local newAfter = (i == #textLines and after or "")

					lines[linePos] = newBefore..textLine..newAfter
				end

				if #textLines > 1 then cursorX = 0 end

				self:ProcessTextChange()
				self.CursorX = cursorX + #textLines[#textLines]
				self.CursorY = cursorY + #textLines-1
				self:UpdateCursor()
			end

			funcs.ScrollDelta = function(self,x,y)
				self.ScrollV:ScrollTo(self.ScrollV.Index + y)
				self.ScrollH:ScrollTo(self.ScrollH.Index + x)
			end

			-- x and y starts at 0
			funcs.TabAdjust = function(self,x,y)
				local lines = self.Lines
				local line = lines[y+1]
				x=x+1

				if line then
					local left = line:sub(x-1,x-1)
					local middle = line:sub(x,x)
					local right = line:sub(x+1,x+1)
					local selRange = (#left > 0 and left or " ") .. (#middle > 0 and middle or " ") .. (#right > 0 and right or " ")

					for i,v in pairs(tabJumps) do
						if selRange:find(i) then
							return v
						end
					end
				end
				return 0
			end

			funcs.SetEditing = function(self,on,input)            
				self:UpdateCursor(input)

				if on then
					if self.Editable then
						self.GuiElems.EditBox.Text = ""
						self.GuiElems.EditBox:CaptureFocus()
					end
				else
					self.GuiElems.EditBox:ReleaseFocus()
				end
			end

			funcs.CursorAnim = function(self,on)
				local cursor = self.GuiElems.Cursor
				local animTime = tick()
				self.LastAnimTime = animTime

				if not on then return end

				lineTweens.Invis:Cancel()
				lineTweens.Vis:Cancel()
				cursor.BackgroundTransparency = 0

				coroutine.wrap(function()
					while self.Editable do
						Lib.FastWait(0.5)
						if self.LastAnimTime ~= animTime then return end
						lineTweens.Invis:Play()
						Lib.FastWait(0.4)
						if self.LastAnimTime ~= animTime then return end
						lineTweens.Vis:Play()
						Lib.FastWait(0.2)
					end
				end)()
			end

			funcs.MoveCursor = function(self,x,y)
				self.CursorX = x
				self.CursorY = y
				self:UpdateCursor()
				self:JumpToCursor()
			end

			funcs.JumpToCursor = function(self)
				self:Refresh()
			end

			funcs.UpdateCursor = function(self,input)
				local linesFrame = self.GuiElems.LinesFrame
				local cursor = self.GuiElems.Cursor            
				local hSize = math.max(0,linesFrame.AbsoluteSize.X)
				local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
				local maxLines = math.ceil(vSize / self.FontSize)
				local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
				local viewX,viewY = self.ViewX,self.ViewY
				local totalLinesStr = tostring(#self.Lines)
				local fontWidth = math.ceil(self.FontSize / 2)
				local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

				if input then
					local linesFrame = self.GuiElems.LinesFrame
					local frameX,frameY = linesFrame.AbsolutePosition.X,linesFrame.AbsolutePosition.Y
					local mouseX,mouseY = input.Position.X,input.Position.Y
					local fontSizeX,fontSizeY = math.ceil(self.FontSize/2),self.FontSize

					self.CursorX = self.ViewX + math.round((mouseX - frameX) / fontSizeX)
					self.CursorY = self.ViewY + math.floor((mouseY - frameY) / fontSizeY)
				end

				local cursorX,cursorY = self.CursorX,self.CursorY

				local line = self.Lines[cursorY+1] or ""
				if cursorX > #line then cursorX = #line
				elseif cursorX < 0 then cursorX = 0 end

				if cursorY >= #self.Lines then
					cursorY = math.max(0,#self.Lines-1)
				elseif cursorY < 0 then
					cursorY = 0
				end

				cursorX = cursorX + self:TabAdjust(cursorX,cursorY)

				-- Update modified
				self.CursorX = cursorX
				self.CursorY = cursorY

				local cursorVisible = (cursorX >= viewX) and (cursorY >= viewY) and (cursorX <= viewX + maxCols) and (cursorY <= viewY + maxLines)
				if cursorVisible then
					local offX = (cursorX - viewX)
					local offY = (cursorY - viewY)
					cursor.Position = UDim2.new(0,linesOffset + offX*math.ceil(self.FontSize/2) - 1,0,offY*self.FontSize)
					cursor.Size = UDim2.new(0,1,0,self.FontSize+2)
					cursor.Visible = true
					self:CursorAnim(true)
				else
					cursor.Visible = false
				end
			end

			funcs.MapNewLines = function(self)
				local newLines = {}
				local count = 1
				local text = self.Text
				local find = string.find
				local init = 1

				local pos = find(text,"\n",init,true)
				while pos do
					newLines[count] = pos
					count = count + 1
					init = pos + 1
					pos = find(text,"\n",init,true)
				end

				self.NewLines = newLines
			end

			funcs.PreHighlight = function(self)
				local start = tick()
				local text = self.Text:gsub("\\\\","  ")
				--print("BACKSLASH SUB",tick()-start)
				local textLen = #text
				local found = {}
				local foundMap = {}
				local extras = {}
				local find = string.find
				local sub = string.sub
				self.ColoredLines = {}

				local function findAll(str,pattern,typ,raw)
					local count = #found+1
					local init = 1
					local x,y,extra = find(str,pattern,init,raw)
					while x do
						found[count] = x
						foundMap[x] = typ
						if extra then
							extras[x] = extra
						end

						count = count+1
						init = y+1
						x,y,extra = find(str,pattern,init,raw)
					end
				end
				local start = tick()
				findAll(text,"`",0,true)
				findAll(text,'"',1,true)
				findAll(text,"'",2,true)
				findAll(text,"%[(=*)%[",3)
				findAll(text,"--",4,true)
				table.sort(found)

				local newLines = self.NewLines
				local curLine = 0
				local lineTableCount = 1
				local lineStart = 0
				local lineEnd = 0
				local lastEnding = 0
				local foundHighlights = {}

				for i = 1,#found do
					local pos = found[i]
					if pos <= lastEnding then continue end

					local ending = pos
					local typ = foundMap[pos]
					if typ == 0 then
						ending = find(text,"`",pos+1,true)
						while ending and sub(text,ending-1,ending-1) == "\\" do
							ending = find(text,"`",ending+1,true)
						end
						if not ending then ending = textLen end
					elseif typ == 1 then
						ending = find(text,'"',pos+1,true)
						while ending and sub(text,ending-1,ending-1) == "\\" do
							ending = find(text,'"',ending+1,true)
						end
						if not ending then ending = textLen end
					elseif typ == 2 then
						ending = find(text,"'",pos+1,true)
						while ending and sub(text,ending-1,ending-1) == "\\" do
							ending = find(text,"'",ending+1,true)
						end
						if not ending then ending = textLen end
					elseif typ == 3 then
						_,ending = find(text,"]"..extras[pos].."]",pos+1,true)
						if not ending then ending = textLen end
					elseif typ == 4 then
						local ahead = foundMap[pos+2]

						if ahead == 3 then
							_,ending = find(text,"]"..extras[pos+2].."]",pos+1,true)
							if not ending then ending = textLen end
						else
							ending = find(text,"\n",pos+1,true) or textLen
						end
					end

					while pos > lineEnd do
						curLine = curLine + 1
						--lineTableCount = 1
						lineEnd = newLines[curLine] or textLen+1
					end
					while true do
						local lineTable = foundHighlights[curLine]
						if not lineTable then lineTable = {} foundHighlights[curLine] = lineTable end
						lineTable[pos] = {typ,ending}
						--lineTableCount = lineTableCount + 1

						if ending > lineEnd then
							curLine = curLine + 1
							lineEnd = newLines[curLine] or textLen+1
						else
							break
						end
					end

					lastEnding = ending
					--if i < 200 then print(curLine) end
				end
				self.PreHighlights = foundHighlights
				--print(tick()-start)
				--print(#found,curLine)
			end

			funcs.HighlightLine = function(self,line)
				local cached = self.ColoredLines[line]
				if cached then return cached end

				local sub = string.sub
				local find = string.find
				local match = string.match
				local highlights = {}
				local preHighlights = self.PreHighlights[line] or {}
				local lineText = self.Lines[line] or ""
				local lineLen = #lineText
				local lastEnding = 0
				local currentType = 0
				local lastWord = nil
				local wordBeginsDotted = false
				local funcStatus = 0
				local lineStart = self.NewLines[line-1] or 0

				local preHighlightMap = {}
				for pos,data in next,preHighlights do
					local relativePos = pos-lineStart
					if relativePos < 1 then
						currentType = data[1]
						lastEnding = data[2] - lineStart
						--warn(pos,data[2])
					else
						preHighlightMap[relativePos] = {data[1],data[2]-lineStart}
					end
				end

				for col = 1,#lineText do
					if col <= lastEnding then highlights[col] = currentType continue end

					local pre = preHighlightMap[col]
					if pre then
						currentType = pre[1]
						lastEnding = pre[2]
						highlights[col] = currentType
						wordBeginsDotted = false
						lastWord = nil
						funcStatus = 0
					else
						local char = sub(lineText,col,col)
						if find(char,"[%a_]") then
							local word = match(lineText,"[%a%d_]+",col)
							local wordType = (keywords[word] and 7) or (builtIns[word] and 8)

							lastEnding = col+#word-1

							if wordType ~= 7 then
								if wordBeginsDotted then
									local prevBuiltIn = lastWord and builtIns[lastWord]
									wordType = (prevBuiltIn and type(prevBuiltIn) == "table" and prevBuiltIn[word] and 8) or 10
								end

								if wordType ~= 8 then
									local x,y,br = find(lineText,"^%s*([%({\"'])",lastEnding+1)
									if x then
										wordType = (funcStatus > 0 and br == "(" and 16) or 9
										funcStatus = 0
									end
								end
							else
								wordType = specialKeywordsTypes[word] or wordType
								funcStatus = (word == "function" and 1 or 0)
							end

							lastWord = word
							wordBeginsDotted = false
							if funcStatus > 0 then funcStatus = 1 end

							if wordType then
								currentType = wordType
								highlights[col] = currentType
							else
								currentType = nil
							end
						elseif find(char,"%p") then
							local isDot = (char == ".")
							local isNum = isDot and find(sub(lineText,col+1,col+1),"%d")
							highlights[col] = (isNum and 6 or 5)

							if not isNum then
								local dotStr = isDot and match(lineText,"%.%.?%.?",col)
								if dotStr and #dotStr > 1 then
									currentType = 5
									lastEnding = col+#dotStr-1
									wordBeginsDotted = false
									lastWord = nil
									funcStatus = 0
								else
									if isDot then
										if wordBeginsDotted then
											lastWord = nil
										else
											wordBeginsDotted = true
										end
									else
										wordBeginsDotted = false
										lastWord = nil
									end

									funcStatus = ((isDot or char == ":") and funcStatus == 1 and 2) or 0
								end
							end
						elseif find(char,"%d") then
							local _,endPos = find(lineText,"%x+",col)
							local endPart = sub(lineText,endPos,endPos+1)
							if (endPart == "e+" or endPart == "e-") and find(sub(lineText,endPos+2,endPos+2),"%d") then
								endPos = endPos + 1
							end
							currentType = 6
							lastEnding = endPos
							highlights[col] = 6
							wordBeginsDotted = false
							lastWord = nil
							funcStatus = 0
						else
							highlights[col] = currentType
							local _,endPos = find(lineText,"%s+",col)
							if endPos then
								lastEnding = endPos
							end
						end
					end
				end

				self.ColoredLines[line] = highlights
				return highlights
			end

			funcs.Refresh = function(self)
				local start = tick()

				local linesFrame = self.Frame.Lines
				local hSize = math.max(0,linesFrame.AbsoluteSize.X)
				local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
				local maxLines = math.ceil(vSize / self.FontSize)
				local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
				local gsub = string.gsub
				local sub = string.sub

				local viewX,viewY = self.ViewX,self.ViewY

				local lineNumberStr = ""

				for row = 1,maxLines do
					local lineFrame = self.LineFrames[row]
					if not lineFrame then
						lineFrame = Instance.new("Frame")
						lineFrame.Name = "Line"
						lineFrame.Position = UDim2.new(0,0,0,(row-1)*self.FontSize)
						lineFrame.Size = UDim2.new(1,0,0,self.FontSize)
						lineFrame.BorderSizePixel = 0
						lineFrame.BackgroundTransparency = 1

						local selectionHighlight = Instance.new("Frame")
						selectionHighlight.Name = "SelectionHighlight"
						selectionHighlight.BorderSizePixel = 0
						selectionHighlight.BackgroundColor3 = Settings.Theme.Syntax.SelectionBack
						selectionHighlight.Parent = lineFrame

						local label = Instance.new("TextLabel")
						label.Name = "Label"
						label.BackgroundTransparency = 1
						label.Font = Enum.Font.Code
						label.TextSize = self.FontSize
						label.Size = UDim2.new(1,0,0,self.FontSize)
						label.RichText = true
						label.TextXAlignment = Enum.TextXAlignment.Left
						label.TextColor3 = self.Colors.Text
						label.ZIndex = 2
						label.Parent = lineFrame

						lineFrame.Parent = linesFrame
						self.LineFrames[row] = lineFrame
					end

					local relaY = viewY + row
					local lineText = self.Lines[relaY] or ""
					local resText = ""
					local highlights = self:HighlightLine(relaY)
					local colStart = viewX + 1

					local richTemplates = self.RichTemplates
					local textTemplate = richTemplates.Text
					local selectionTemplate = richTemplates.Selection
					local curType = highlights[colStart]
					local curTemplate = richTemplates[typeMap[curType]] or textTemplate

					-- Selection Highlight
					local selectionRange = self.SelectionRange
					local selPos1 = selectionRange[1]
					local selPos2 = selectionRange[2]
					local selRow,selColumn = selPos1[2],selPos1[1]
					local sel2Row,sel2Column = selPos2[2],selPos2[1]
					local selRelaX,selRelaY = viewX,relaY-1

					if selRelaY >= selPos1[2] and selRelaY <= selPos2[2] then
						local fontSizeX = math.ceil(self.FontSize/2)
						local posX = (selRelaY == selPos1[2] and selPos1[1] or 0) - viewX
						local sizeX = (selRelaY == selPos2[2] and selPos2[1]-posX-viewX or maxCols+viewX)

						lineFrame.SelectionHighlight.Position = UDim2.new(0,posX*fontSizeX,0,0)
						lineFrame.SelectionHighlight.Size = UDim2.new(0,sizeX*fontSizeX,1,0)
						lineFrame.SelectionHighlight.Visible = true
					else
						lineFrame.SelectionHighlight.Visible = false
					end

					-- Selection Text Color for first char
					local inSelection = selRelaY >= selRow and selRelaY <= sel2Row and (selRelaY == selRow and viewX >= selColumn or selRelaY ~= selRow) and (selRelaY == sel2Row and viewX < sel2Column or selRelaY ~= sel2Row)
					if inSelection then
						curType = -999
						curTemplate = selectionTemplate
					end

					for col = 2,maxCols do
						local relaX = viewX + col
						local selRelaX = relaX-1
						local posType = highlights[relaX]

						-- Selection Text Color
						local inSelection = selRelaY >= selRow and selRelaY <= sel2Row and (selRelaY == selRow and selRelaX >= selColumn or selRelaY ~= selRow) and (selRelaY == sel2Row and selRelaX < sel2Column or selRelaY ~= sel2Row)
						if inSelection then
							posType = -999
						end

						if posType ~= curType then
							local template = (inSelection and selectionTemplate) or richTemplates[typeMap[posType]] or textTemplate

							if template ~= curTemplate then
								local nextText = gsub(sub(lineText,colStart,relaX-1),"['\"<>&]",richReplace)
								resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. nextText .. "</font>") or nextText)
								colStart = relaX
								curTemplate = template
							end
							curType = posType
						end
					end

					local lastText = gsub(sub(lineText,colStart,viewX+maxCols),"['\"<>&]",richReplace)
					--warn("SUB",colStart,viewX+maxCols-1)
					if #lastText > 0 then
						resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. lastText .. "</font>") or lastText)
					end

					if self.Lines[relaY] then
						lineNumberStr = lineNumberStr .. (relaY-1 == self.CursorY and ("<b>"..relaY.."</b>\n") or relaY .. "\n")
					end

					lineFrame.Label.Text = resText
				end

				for i = maxLines+1,#self.LineFrames do
					self.LineFrames[i]:Destroy()
					self.LineFrames[i] = nil
				end

				self.Frame.LineNumbers.Text = lineNumberStr
				self:UpdateCursor()

				--print("REFRESH TIME",tick()-start)
			end

			funcs.UpdateView = function(self)
				local totalLinesStr = tostring(#self.Lines)
				local fontWidth = math.ceil(self.FontSize / 2)
				local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

				local linesFrame = self.Frame.Lines
				local hSize = linesFrame.AbsoluteSize.X
				local vSize = linesFrame.AbsoluteSize.Y
				local maxLines = math.ceil(vSize / self.FontSize)
				local totalWidth = self.MaxTextCols*fontWidth
				local scrollV = self.ScrollV
				local scrollH = self.ScrollH

				scrollV.VisibleSpace = maxLines
				scrollV.TotalSpace = #self.Lines + 1
				scrollH.VisibleSpace = math.ceil(hSize/fontWidth)
				scrollH.TotalSpace = self.MaxTextCols + 1

				scrollV.Gui.Visible = #self.Lines + 1 > maxLines
				scrollH.Gui.Visible = totalWidth > hSize

				local oldOffsets = self.FrameOffsets
				self.FrameOffsets = Vector2.new(scrollV.Gui.Visible and -16 or 0, scrollH.Gui.Visible and -16 or 0)
				if oldOffsets ~= self.FrameOffsets then
					self:UpdateView()
				else
					scrollV:ScrollTo(self.ViewY,true)
					scrollH:ScrollTo(self.ViewX,true)

					if scrollV.Gui.Visible and scrollH.Gui.Visible then
						scrollV.Gui.Size = UDim2.new(0,16,1,-16)
						scrollH.Gui.Size = UDim2.new(1,-16,0,16)
						self.GuiElems.ScrollCorner.Visible = true
					else
						scrollV.Gui.Size = UDim2.new(0,16,1,0)
						scrollH.Gui.Size = UDim2.new(1,0,0,16)
						self.GuiElems.ScrollCorner.Visible = false
					end

					self.ViewY = scrollV.Index
					self.ViewX = scrollH.Index
					self.Frame.Lines.Position = UDim2.new(0,linesOffset,0,0)
					self.Frame.Lines.Size = UDim2.new(1,-linesOffset+oldOffsets.X,1,oldOffsets.Y)
					self.Frame.LineNumbers.Position = UDim2.new(0,fontWidth,0,0)
					self.Frame.LineNumbers.Size = UDim2.new(0,#totalLinesStr*fontWidth,1,oldOffsets.Y)
					self.Frame.LineNumbers.TextSize = self.FontSize
				end
			end

			funcs.ProcessTextChange = function(self)
				local maxCols = 0
				local lines = self.Lines

				for i = 1,#lines do
					local lineLen = #lines[i]
					if lineLen > maxCols then
						maxCols = lineLen
					end
				end

				self.MaxTextCols = maxCols
				self:UpdateView()    
				self.Text = table.concat(self.Lines,"\n")
				self:MapNewLines()
				self:PreHighlight()
				self:Refresh()
				--self.TextChanged:Fire()
			end

			funcs.ConvertText = function(self,text,toEditor)
				if toEditor then
					return text:gsub("\t",(" %s%s "):format(tabSub,tabSub))
				else
					return text:gsub((" %s%s "):format(tabSub,tabSub),"\t")
				end
			end

			funcs.GetText = function(self) -- TODO: better (use new tab format)
				local source = table.concat(self.Lines,"\n")
				return self:ConvertText(source,false) -- Tab Convert
			end

			funcs.SetText = function(self,txt)
				txt = self:ConvertText(txt,true) -- Tab Convert
				local lines = self.Lines
				table.clear(lines)
				local count = 1

				for line in txt:gmatch("([^\n\r]*)[\n\r]?") do
					local len = #line
					lines[count] = line
					count = count + 1
				end

				self:ProcessTextChange()
			end

			funcs.MakeRichTemplates = function(self)
				local floor = math.floor
				local templates = {}

				for name,color in pairs(self.Colors) do
					templates[name] = ('<font color="rgb(%s,%s,%s)">'):format(floor(color.r*255),floor(color.g*255),floor(color.b*255))
				end

				self.RichTemplates = templates
			end

			funcs.ApplyTheme = function(self)
				local colors = Settings.Theme.Syntax
				self.Colors = colors
				self.Frame.LineNumbers.TextColor3 = colors.Text
				self.Frame.BackgroundColor3 = colors.Background
			end

			local mt = {__index = funcs}

			local function new()
				if not builtInInited then initBuiltIn() end

				local scrollV = Lib.ScrollBar.new()
				local scrollH = Lib.ScrollBar.new(true)
				scrollH.Gui.Position = UDim2.new(0,0,1,-16)
				local obj = setmetatable({
					FontSize = 15,
					ViewX = 0,
					ViewY = 0,
					Colors = Settings.Theme.Syntax,
					ColoredLines = {},
					Lines = {""},
					LineFrames = {},
					Editable = true,
					Editing = false,
					CursorX = 0,
					CursorY = 0,
					FloatCursorX = 0,
					Text = "",
					PreHighlights = {},
					SelectionRange = {{-1,-1},{-1,-1}},
					NewLines = {},
					FrameOffsets = Vector2.new(0,0),
					MaxTextCols = 0,
					ScrollV = scrollV,
					ScrollH = scrollH
				},mt)

				scrollV.WheelIncrement = 3
				scrollH.Increment = 2
				scrollH.WheelIncrement = 7

				scrollV.Scrolled:Connect(function()
					obj.ViewY = scrollV.Index
					obj:Refresh()
				end)

				scrollH.Scrolled:Connect(function()
					obj.ViewX = scrollH.Index
					obj:Refresh()
				end)

				makeFrame(obj)
				obj:MakeRichTemplates()
				obj:ApplyTheme()
				scrollV:SetScrollFrame(obj.Frame.Lines)
				scrollV.Gui.Parent = obj.Frame
				scrollH.Gui.Parent = obj.Frame

				obj:UpdateView()
				obj.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					obj:UpdateView()
					obj:Refresh()
				end)

				return obj
			end

			return {new = new}
		end)()

		return function(textbox,env)
			ENV = env or ENV
			local par = textbox.Parent
			local new = Lib.CodeFrame.new()
			new.Gui.Parent = par
			for i,v in pairs(textbox:GetChildren()) do
				if v then
					v.Parent = new.Gui
				end
			end
			new.Gui.Size = textbox.Size
			new.Gui.Position = textbox.Position
			new.Gui.AnchorPoint = textbox.AnchorPoint
			new.Gui.Visible = textbox.Visible
			textbox:Destroy()
			return setmetatable({},{
				__index = function(self,name)
					if name == "Text" then
						return new:GetText()
					else
						return new.Gui[name]
					end
				end,
				__newindex = function(self,name,val)
					if name == "Text" then
						new:SetText(val)
					else
						new.Gui[name] = val
					end
				end,
			})
		end
	end;
end;

-- Set scripts
do
	task.spawn(function() -- Instance1
		if not game:GetService("RunService"):IsClient() then return end
		local script = objects["Instance1"];
		local UI = script.Parent
		UI.Name = game:GetService("HttpService"):GenerateGUID(false):gsub("-", ""):sub(math.random(1, 16))

		local topbar = UI.Window
		local notifs = UI.Notifications
		local notif = UI.PCNotification

		local view = topbar.WindowView
		local viewScale = view.Scale

		local logs = view.Logs
		local content = view.ContentView
		local codeBox = content.CodeBox
		local code

		local log = logs.Log
		log.Parent = nil

		local function normalize(str)
			return str:gsub("\n", "\\n"):gsub("\t", "\\t"):gsub("\r", "\\r"):gsub("\"", "\\\"")..""
		end

		local childrenExist = {false, "a"}
		local function getPath(obj)
			if not obj then
				return "nil"
			elseif obj == workspace.Parent or obj == game then --[[it is different in some exploits :pray: :sob:, that's why i also use workspace.Parent]]
				return "game"
			elseif obj and not obj.Parent then
				local name = getfenv().getnilinstances and "getnilinstances" or getfenv().getnils and "getnils"
				if name then
					return "(function() local function getNil(objType, objName)\n    for i,v in "..name.."() do\n        if v.ClassName == objClass and v.Name == objName then\n            "
						.."return v\n        end\n    end\nend return getNil(\""..obj.ClassName.."\", \""..normalize(obj.Name).."\") end)()"
				else
					return "nil[\""..normalize(obj.Name).."\"] --[[ Object is parented to nil; getnilinstances does not exist in that exploit ]]"
				end
			end

			local path = ""
			while true do
				if obj.Parent == game or obj.Parent == workspace.Parent then
					path = ":GetService(\""..obj.ClassName:gsub(" ", "").."\")"..path
				elseif not obj.Parent then
					path = "game"..path
					return path:gsub("game%:GetService%(%\"Workspace%\"%)", "workspace") .. ""
				else
					childrenExist[1] = false
					childrenExist[2] = "a"

					for i,v in obj.Parent:GetChildren() do
						if v and v ~= obj and v.Name == obj.Name then
							childrenExist[1] = true
						elseif v == obj then
							childrenExist[2] = i
						end
					end
					if childrenExist[1] then
						if tonumber(childrenExist[2]) then
							path = ":GetChildren()["..childrenExist[2].."]"..path
						else
							path = ":WaitForChild(\""..normalize(obj.Name).."\", 9e9)"..path
						end
					else
						path = ":WaitForChild(\""..normalize(obj.Name).."\", 9e9)"..path
					end
				end

				obj = obj.Parent
			end
		end

		local tostr
		local ArgToString; ArgToString = function(arg)
			local type = typeof(arg)

			if type == "Instance" then
				return getPath(arg)
			elseif type == "number" or type == "boolean" or type == "nil" or type == "EnumItem" then
				return tostring(arg)
			elseif type == "string" then
				return "\""..normalize(arg).."\""
			elseif type == "function" then
				local s,n = pcall(debug.info, arg, "n")
				if s and n ~= "" then
					return "getfenv()[\""..normalize(n).."\"]"
				else
					return "function(...) return ... end --[[Unknown function: "..(not s and n or "Custom function").."]]"
				end
			elseif type == "table" then
				return tostr(arg)
			elseif type == "CFrame" or type == "Vector2" or type == "Vector3" or type == "Color3" or type == "UDim" or type == "UDim2" then
				return type..".new("..tostring(arg):gsub("{", ""):gsub("}", "")..")"
			elseif type == "Color3" then
				return "Color3.fromRGB("..tostring(arg)..")"
			elseif type == "BrickColor" then
				return "BrickColor.new(\""..arg.Name.."\")"
			elseif type == "Font" then
				return "Font.new(\""..arg.Family.."\", "..tostring(arg.Weight)..", "..tostring(arg.Style)..")"
			elseif type == "ColorSequence" or type == "NumberSequence" then
				return type..".new("..tostr(arg.Keypoints)..")"
			elseif type == "ColorSequenceKeypoint" or type == "NumberSequenceKeypoint" then
				return type..".new("..arg.Time..", "..ArgToString(arg.Value)..(type == "NumberSequenceKeypoint" and ", "..arg.Envelope or "")..")"
			elseif type == "NumberRange" then
				return type..".new("..arg.Min..", "..arg.Max..")"
			elseif type == "Enum" then
				return "Enum."..tostring(arg)
			elseif type == "Enums" then
				return "Enum"
			else
				return "--[[ Unknown type for ArgToString: \""..type.."\" ; Trying the awful method: type.new(tostring(arg)) ]] "..type..".new("..tostring(arg)..")"
			end
		end

		tostr = function(tbl, ind)
			if typeof(tbl) == "table" then
				ind = ind or 1

				local gen = "{\n"
				for i,v in tbl do
					gen = gen..string.rep("    ", ind).."["..tostr(i, ind + 1).."] = "..tostr(v, ind + 1)..";\n"
				end
				if gen == "{\n" then
					gen = "{}"
				else
					gen = gen..string.rep("    ", ind - 1).."}"
				end

				return gen
			else
				return ArgToString(tbl)
			end
		end

		local tSize = topbar.Size
		local vSize = view.Size

		local spyActive = false
		local logBindables = false
		local insertionQueue = {}
		local cons = {}
		local hooks = {}

		local ignore = {}
		local block = {}

		log.Parent = nil
		topbar.Size = UDim2.fromScale(0,0)
		view.Size = UDim2.fromScale(1,0)
		topbar.Visible = false
		notifs.NotificationBase.Visible = false

		local delta, dragInput
		local function makeDraggable(gui, xOnly, minX, maxX)
			minX = tonumber(minX) or -math.huge
			maxX = tonumber(maxX) or  math.huge

			local dragging, dragStart, startPos, delta

			cons[#cons+1] = gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					cons[#cons+1] = input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			cons[#cons+1] = gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)

			cons[#cons+1] = game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					delta = input.Position - dragStart
					gui:TweenPosition(UDim2.new(startPos.X.Scale, math.clamp(startPos.X.Offset + delta.X, minX, maxX), not xOnly and startPos.Y.Scale or 0, not xOnly and startPos.Y.Offset + delta.Y or 0), nil, nil, 0.3, true)
					delta = nil
				end
			end)
		end

		makeDraggable(topbar)

		if not pcall(function()
				UI.Parent = game.CoreGui
			end) then
			UI.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 9e9)
		end
		pcall(function()
			UI.OnTopOfCoreBlur = true
		end)

		local function colorButton(btn, hover, hoverCol, downCol)
			if not hover then
				hover = btn
			end
			local defCol = btn.BackgroundColor3
			if not hoverCol then
				hoverCol = Color3.new(math.clamp(defCol.R - 0.1, 0, 1), math.clamp(defCol.G - 0.1, 0, 1), math.clamp(defCol.B - 0.1, 0, 1))
			end
			if not downCol then
				downCol = Color3.new(math.clamp(hoverCol.R + 0.15, 0, 1), math.clamp(hoverCol.G + 0.15, 0, 1), math.clamp(hoverCol.B + 0.15, 0, 1))
			end
			hover.AutoButtonColor = false

			cons[#cons+1] = hover.MouseEnter:Connect(function()
				btn.BackgroundColor3 = hoverCol
			end)
			cons[#cons+1] = hover.MouseLeave:Connect(function()
				btn.BackgroundColor3 = defCol
			end)
			cons[#cons+1] = hover.MouseButton1Down:Connect(function()
				btn.BackgroundColor3 = downCol
			end)
			cons[#cons+1] = hover.MouseButton1Up:Connect(function()
				btn.BackgroundColor3 = defCol -- roblox's buttons work like that, nothing special
			end)
		end

		colorButton(notif.Load.Display, notif.Load.Button, nil, Color3.new(0.6, 0.6, 0.8))
		colorButton(notif.Exit.Display, notif.Exit.Button, nil, Color3.new(0.6, 0.6, 0.8))
		colorButton(notif.Next.Display, notif.Next.Button, nil, Color3.new(0.6, 0.6, 0.8))
		colorButton(notif.Previous.Display, notif.Previous.Button, nil, Color3.new(0.6, 0.6, 0.8))

		local function notification(text, title)
			local notif = notifs.NotificationBase:Clone()
			notif.Parent = notifs
			notif.Visible = true
			notif.Size = UDim2.fromScale(1, 0)
			notif.Display.Position = UDim2.fromScale(1.5, 0.5)
			notif.Display.Title.Text = title or "Notification"
			notif.Display.Content.Text = text or "Just notification, nothing special"
			notif.Display.Bar.Frame.Size = UDim2.fromScale(1,1)
			notif:TweenSize(UDim2.new(1, 0, 0, 100), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.225, true)
			task.wait(0.225)
			notif.Display:TweenPosition(UDim2.fromScale(0.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.775, true)
			notif.Display.Bar.Frame:TweenSize(UDim2.fromScale(0, 1), nil, Enum.EasingStyle.Linear, 4, true)
			task.wait(3.775)
			notif.Display:TweenPosition(UDim2.fromScale(1.5, 0.5), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.225, true)
			task.wait(0.225)
			notif:TweenSize(UDim2.fromScale(1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.225, true)
			task.wait(1)
			notif:Destroy()
		end

		local function close()
			spyActive = false
			logBindables = false
			for i,v in cons do
				v:Disconnect()
			end
			for i,v in hooks do
				task.spawn(v)
			end

			notifs:TweenPosition(UDim2.fromScale(1,1), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 1, true)
			view:TweenSize(UDim2.fromScale(1,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4, true)
			topbar:TweenSize(UDim2.fromScale(0,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4, true)
			task.wait(0.245)
			topbar.Parent:Destroy()
			task.wait(1)
			UI:Destroy()
		end

		local soft = false
		local legacy = false
		local eventListener = false
		local weakHooks = 0

		if not game:GetService("UserInputService").TouchEnabled and game:GetService("UserInputService").KeyboardEnabled and (getfenv().hookmetamethod and getfenv().getnamecallmethod or getfenv().getcallbackvalue or getfenv().hookfunction) then
			notif.Visible = true
			local done = false
			local exit = false

			local modes = {
				{
					"Load [Normal]",
					Color3.fromRGB(255, 0, 127)
				},
				{
					"Load [Soft]",
					Color3.fromRGB(255, 85, 127),
					function()
						soft = true
					end,
					function()
						notification("Soft mode provides more stable experience, but it won't log RemoteFunction.OnClientInvoke" .. ((not getfenv().hookmetamethod or not getfenv().getnamecallmethod) and " and BindableFunction.OnInvoke (because hookmetamethod not" .. (getfenv().hookmetamethod and " fully" or "") .. " supported)" or ""), "Mode")
					end,
				},
				{
					"Load [Weak hooks]",
					Color3.fromRGB(85, 170, 127),
					function()
						weakHooks = 1
					end,
					function()
						notification("Weak hooks mode will use WAY LESS hookfunction", "Mode")
					end,
				},
				{
					"Load [Weaker hooks]",
					Color3.fromRGB(0, 170, 127),
					function()
						weakHooks = 2
					end,
					function()
						notification("Weaker hooks mode won't use hookfunction at all", "Mode")
					end,
				},
				{
					"Load [Soft + Weaker hooks]",
					Color3.fromRGB(85, 170, 0),
					function()
						soft = true
						weakHooks = 2
					end,
					function()
						notification("This one shouldn't crash", "Mode")
					end,
				},
				{
					"Load [Legacy]",
					Color3.fromRGB(255, 170, 127),
					function()
						legacy = true
					end,
					function()
						notification("Legacy mode provides very stable experience, but won't log stuff, that came from server to client (.OnClientEvent is an example)", "Mode")
					end,
				},
				{
					"Load [Legacy + Weaker hooks]",
					Color3.fromRGB(0, 85, 0),
					function()
						weakHooks = 2
						legacy = true
					end,
					function()
						notification("A spy with ultra weak hooks", "Mode")
					end,
				},
				{
					"Load [Weakest]",
					Color3.fromRGB(0, 0, 0),
					function()
						weakHooks = 2
						legacy = true
						soft = true
					end,
					function()
						notification("Theres no way it can crash", "Mode")
					end,
				},
				{
					"Load SimpleSpy",
					Color3.new(1, 1, 1),
					function()
						notif.Visible = false

						close()
						UI:Destroy()

						exit = true

						loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
					end,
					function()
						notification("Will unload OctoSpy and load SimpleSpy", "Mode")
					end
				}
			}

			local currentMode = 1
			local function setMode()
				notif.Load.Display.RName.Text = modes[currentMode][1]
				notif.Load.Display.Type_BUTTON.BackgroundColor3 = modes[currentMode][2]
				if modes[currentMode][4] then
					modes[currentMode][4]()
				end
			end

			setMode()

			notif.Load.Button.MouseButton1Click:Connect(function()
				done = true

				if modes[currentMode][3] then
					modes[currentMode][3]()
				end

				notif.Visible = false
			end)
			notif.Exit.Button.MouseButton1Click:Connect(function()
				notif.Visible = false

				close()
				UI:Destroy()

				done = true
				exit = true
			end)
			notif.Next.Button.MouseButton1Click:Connect(function()
				currentMode += 1
				if currentMode > #modes then
					currentMode = 1
				end
				setMode()
			end)
			notif.Previous.Button.MouseButton1Click:Connect(function()
				currentMode -= 1
				if currentMode < 1 then
					currentMode = #modes
				end
				setMode()
			end)

			repeat task.wait() until done
			if exit then
				return
			end
		end

		local newc = getfenv().newcclosure or function(a)
			return a
		end
		local newl = function(a)
			return function(...)
				return a(...)
			end
		end

		local selected
		local function addButton(text)
			local btn = content.ScrollingFrame.ButtonRow:Clone()
			btn.Parent = content.ScrollingFrame
			btn.Display.RName.Text = text
			btn.Name = text
			btn.Visible = true

			colorButton(btn.Display, btn.Button, nil, Color3.new(0.6, 0.6, 0.8))

			return btn.Button
		end

		local titleTween1 = game:GetService("TweenService"):Create(topbar.Title, TweenInfo.new(0.35), {TextColor3 = Color3.new(0.66, 1, 0.5)})
		local titleTween2 = game:GetService("TweenService"):Create(topbar.Title, TweenInfo.new(0.35), {TextColor3 = topbar.Title.TextColor3 })
		local hf = false
		if getfenv().hookfunction then -- just for notificatin "your executor is supported"
			local func = function()
				return "skibidi"
			end
			if getfenv().hookfunction(func, function() return "toilet" end)() == "skibidi" and func() == "toilet" then
				hf = true
			end
		end
		local fs = 0
		if getfenv().firesignal then
			local rem = Instance.new("RemoteEvent")
			local f = false
			rem.OnClientEvent:Connect(function(a)
				f = a
			end)
			pcall(getfenv().firesignal, rem.OnClientEvent, true)
			if f == true then
				fs = 2
			else
				pcall(getfenv().firesignal, rem, "OnClientEvent", true)
				if f == true then
					fs = 1
				end
			end
		end

		local cps = 0
		local activated = false
		local cd = false
		local times = 0
		local easterMessages = {
			"Cool, you found an easter egg",
			"Why did you click that again?",
			"Again?",
			"Stop, it hurts!",
			"Please!!",
			"AW!",
			"Why you keep clicking???",
			"You know what?",
			"Uhh..",
			"Idk",
			"JUST STOP CLICKING ME!!!",
			"STOP!",
			"I SWEAR, IT IS PAINFUL",
			"AND RUDE!",
			"1 MORE TIME",
			"AND I WILL NEVER RESPOND TO YOU",
			"RAH",
			"Alright, what do you need?",
			"Oh yea, I forgot that you can't talk",
			"Well",
			"I beg",
			"Please",
			"Stop it",
			"#########",
			"I'm tired",
			"Stop",
			"You got it.",
			"",
			"",
			".",
			"..",
			"...",
			"STOP IT!!!!!!!",
			"|:",
			"):",
			"):<",
			"D:<",
			"Fuck you.",
			"Really, stop it.",
			"Please",
			"Fine, keep clicking me, I won't say anything.",
			"..."
		}

		cons[#cons+1] = topbar.MouseEnter:Connect(function()
			titleTween1:Play()
		end)
		cons[#cons+1] = topbar.MouseLeave:Connect(function()
			titleTween2:Play()
		end)
		cons[#cons+1] = topbar.MouseButton1Click:Connect(function()
			cps += 1

			if cps > 3 and not cd then
				cd = true
				times += 1
				cps = 0

				task.spawn(notification, easterMessages[times] or easterMessages[#easterMessages], "Easter egg")

				if not activated then
					activated = true

					titleTween1 = game:GetService("TweenService"):Create(topbar.Title, TweenInfo.new(0.35), {TextColor3 = Color3.new(0.75, 0.5, 0.75)})
					titleTween2 = game:GetService("TweenService"):Create(topbar.Title, TweenInfo.new(0.35), {TextColor3 = Color3.new(0.25, 0.75, 0.5)})

					titleTween1:Play()
				end

				repeat task.wait() until cps == 0
				task.wait(0.5)

				cd = false
			end
		end)

		task.spawn(function()
			while task.wait(1) and UI.Parent do
				cps = 0
			end
		end)

		colorButton(topbar.Close, nil, Color3.new(1, 0.25, 0.25))
		cons[#cons+1] = topbar.Close.MouseButton1Click:Connect(close)
		local function updState1()
			local x = topbar.Toggle.State.ImageRectOffset.X == 32 and 48 or topbar.Toggle.State.ImageRectOffset.X == 48 and 112 or topbar.Toggle.State.ImageRectOffset.X == 112 and 32

			if x == 32 and legacy then
				x = 48
			end
			if x == 48 and (not getfenv().hookmetamethod or not getfenv().getnamecallmethod or not hf) then
				x = 112
			end

			topbar.Toggle.State.ImageRectOffset = Vector2.new(x, x == 112 and 0 or 16)

			logs.From:TweenPosition(UDim2.new(x == 48 and 0 or -1, 0, 0, -3), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.4, true)
			logs.To:TweenPosition(UDim2.new(x == 32 and 0 or -1, 0, 0, -3), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.4, true)
			spyActive = x ~= 112
			-- too lazy to make a variable
		end
		local function updState2()
			local x = topbar.Toggle2.State.ImageRectOffset.X == 112 and 208 or 112

			topbar.Toggle2.State.ImageRectOffset = Vector2.new(x, 0)

			logBindables = x == 208
			-- same here
		end

		if legacy and not (getfenv().hookmetamethod and getfenv().getnamecallmethod) then
			topbar.Toggle2.Visible = false
			topbar.Help.Position = topbar.Toggle2.Position
		end

		if getfenv().hookmetamethod and getfenv().getnamecallmethod and hf then
			if getfenv().getnilinstances and getfenv().getinstances and getfenv().firesignal and getfenv().getcallbackvalue then
				task.spawn(notification, "That executor fully supports Octo~Spy (and simple spy)", "Supported")
			else
				task.spawn(notification, "That executor not fully supports Octo~Spy (but possibly supports simple spy)", "Supported")
			end
		else
			task.spawn(notification, "That does not fully support Octo~Spy (simple spy probably wont work)", "Unsupported")
		end

		cons[#cons+1] = topbar.Toggle.MouseButton1Click:Connect(updState1)
		cons[#cons+1] = topbar.Toggle2.MouseButton1Click:Connect(updState2)
		cons[#cons+1] = topbar.Help.MouseButton1Click:Connect(function()
			notification("Help button is coming soon!", "Coming soon")
		end)

		updState1()
		updState2()

		local offsetSize = logs.Size.X.Offset

		makeDraggable(viewScale, true, 80, 350)

		local sizeDiv = 6

		local function func(v, old, ...)
			local args = { ... }
			local args = tostr(args)
			local n:string = v.Name
			if #n >= math.floor(offsetSize/sizeDiv) then
				n = n:sub(0, math.floor(offsetSize/sizeDiv)).."..."
			end

			local log = log:Clone()
			log.Visible = true
			log.Display.Type.BackgroundColor3 = v.ClassName == "RemoteFunction" and Color3.new(0.77, 0.44, 1) or Color3.new(0.33, 0.11, 0.66)
			log.Display.RName.Text = n
			log.Display.FromServer.Visible = true
			log.Display.RName.TextColor3 = not block[v.Name] and not block[v] and Color3.new(1,1,1) or Color3.new(1, 0.5, 0.5)
			local msg
			if v.ClassName == "RemoteFunction" then
				msg = "local args = "..args.."\n\ngetcallbackvalue("..tostr(v)..", \"OnClientInvoke\")(unpack(args)) -- OnClientInvoke"
			else
				msg = "local args = "..args.."\n\n"..tostr(v)..":Invoke(unpack(args)) -- OnInvoke"
			end

			local t = {log, "From", msg, nil, v, args, "Invoke"}
			table.insert(insertionQueue, t)

			if not block[v.Name] and not block[v] then
				local res = {old(...)}
				t[4] = res

				return unpack(res)
			end
		end

		local function remoteEvent(v, ...)
			if spyActive and not ignore[v.Name] and not ignore[v] then
				local args = { ... }
				table.remove(args, 1) -- remove first argument, because it is "self"

				args = tostr(args)
				local n = v.Name
				if #n >= math.floor(offsetSize/sizeDiv) then
					n = n:sub(0, math.floor(offsetSize/sizeDiv)).."..."
				end

				local log = log:Clone()
				log.Visible = true
				log.Display.Type.BackgroundColor3 = v.ClassName == "UnreliableRemoteEvent" and Color3.new(1, 0.66, 0) or Color3.new(1, 0.88, 0)
				log.Display.RName.Text = n
				log.Display.RName.TextColor3 = not block[v.Name] and not block[v] and Color3.new(1,1,1) or Color3.new(1, 0.5, 0.5)

				local txt = "local args = "..args.."\n\n"
				if fs ~= 0 then
					txt = txt.."firesignal("..tostr(v) .. (fs == 1 and ", \"OnClientEvent\"" or ".OnClientEvent") .. ", unpack(args))"
				else
					txt = txt.."-- "..tostr(v)
				end
				table.insert(insertionQueue, {log, "From", txt.." -- OnClientEvent", nil, v, args, "Run"})
			end
		end
		local function bindableEvent(v, ...)
			if spyActive and logBindables and not ignore[v.Name] and not ignore[v] then
				local args = { ... }
				table.remove(args, 1) -- remove first argument, because it is "self"

				args = tostr(args)
				local n = v.Name
				if #n >= math.floor(offsetSize/sizeDiv) then
					n = n:sub(0, math.floor(offsetSize/sizeDiv)).."..."
				end

				local log = log:Clone()
				log.Visible = true
				log.Display.Type.BackgroundColor3 = Color3.new(1, 0.7, 0.3)
				log.Display.RName.Text = n
				log.Display.FromServer.Visible = true
				log.Display.RName.TextColor3 = not block[v.Name] and not block[v] and Color3.new(1,1,1) or Color3.new(1, 0.5, 0.5)

				table.insert(insertionQueue, {log, "From", "local args = "..args.."\n\n"..tostr(v)..":Fire(unpack(args)) -- Event", nil, v, args, "Fire"})
			end
		end

		local function rf(v)
			local name = v.ClassName == "RemoteFunction" and "OnClientInvoke" or "OnInvoke"
			local cbval = getfenv().getcallbackvalue(v, name)
			if cbval and weakHooks ~= 2 then
				local old; old = getfenv().hookfunction(cbval, newl(newc(function(...) -- i'm doing newlclosure(newclosure(luaClose)) because for some reason it crashed without that
					if (v.ClassName == "BindableFunction" and logBindables or v.ClassName ~= "BindableFunction") and spyActive and not ignore[v.Name] and not ignore[v] then
						return func(v, old, ...)
					end

					if block[v.Name] or block[v] then return end
					return old(...)
				end)))
				hooks[#hooks+1] = function()
					getfenv().hookfunction(cbval, old)
				end
			end
		end
		local function main(v:Instance)
			if typeof(v) == "Instance" then
				if v.ClassName == "RemoteEvent" or v.ClassName == "UnreliableRemoteEvent" then
					cons[#cons+1] = v.OnClientEvent:Connect(function(...)
						remoteEvent(v, ...)
					end)
				elseif getfenv().getcallbackvalue and hf and v.ClassName == "RemoteFunction" and not soft then
					local s,e = pcall(rf, v)
					if not s then
						--warn(e)
					end
				elseif not getfenv().hookmetamethod or not hf or not getfenv().getnamecallmethod then
					if v.ClassName == "BindableEvent" then
						cons[#cons+1] = v.Event:Connect(function(...)
							bindableEvent(v, ...)
						end)
					elseif getfenv().getcallbackvalue and hf and v.ClassName == "BindableFunction" and not soft then
						local s,e = pcall(rf, v)
						if not s then
							--warn(e)
						end
					end
				end
			end
		end

		local enums = 0
		local enumCalls = 0
		local function enumerate(list)
			enumCalls += 1

			for i,v in list do
				main(v)
				if i % 750 == 0 then
					task.wait()
					game:GetService("RunService").RenderStepped:Wait()
					task.wait()
				end
			end

			enums += 1
		end

		if not legacy then
			--task.spawn(enumerate, game:GetDescendants())
			local l1 = getfenv().getinstances and getfenv().getinstances() or game:GetDescendants()
			local l2 = getfenv().getnilinstances and getfenv().getnilinstances() or {}

			task.spawn(enumerate, l1)
			task.spawn(enumerate, l2)
		end

		cons[#cons+1] = game.DescendantAdded:Connect(main)

		local obj = Instance.new("RemoteEvent")
		local fireServer = obj.FireServer
		obj:Destroy()
		local obj = Instance.new("UnreliableRemoteEvent")
		local fireServer2 = obj.FireServer
		obj:Destroy()
		local obj = Instance.new("RemoteFunction")
		local invokeServer = obj.InvokeServer
		obj:Destroy()
		local obj = Instance.new("BindableEvent")
		local fire = obj.Fire
		obj:Destroy()
		local obj = Instance.new("BindableFunction")
		local invoke = obj.Invoke
		obj:Destroy()

		local old1, old2, old3, old4, old5 = fireServer, fireServer2, invokeServer, fire, invoke
		local fireServerHook, fireServer2Hook, invokeServerHook, fireHook, invokeHook = (newc(function(...)
			local self = ...
			if typeof(self) ~= "Instance" or self.ClassName ~= "RemoteEvent" then
				return old1(...)
			end
			if not spyActive then
				return not block[self] and not block[self.Name] and old1(...)
			end

			if not ignore[self] and not ignore[self.Name] then
				local args = { ... }
				table.remove(args, 1) -- remove first argument, because it is "self"

				args = tostr(args)
				local n = self.Name
				if #n >= math.floor(offsetSize/sizeDiv) then
					n = n:sub(0, math.floor(offsetSize/sizeDiv)).."..."
				end

				local log = log:Clone()
				log.Visible = true
				log.Display.Type.BackgroundColor3 = Color3.new(1, 0.66, 0)
				log.Display.RName.Text = n
				log.Display.RName.TextColor3 = not block[self.Name] and not block[self] and Color3.new(1,1,1) or Color3.new(1, 0.5, 0.5)

				table.insert(insertionQueue, {log, "To", "local args = "..args.."\n\n"..tostr(self)..":FireServer(unpack(args))", nil, self, args, "FireServer"})
			end

			if block[self.Name] or block[self] then return end
			return old1(...)
		end)), (newc(function(...)
			local self = ...
			if typeof(self) ~= "Instance" or self.ClassName ~= "UnreliableRemoteEvent" then
				return old2(...)
			end
			if not spyActive then
				return not block[self] and not block[self.Name] and old2(...)
			end

			if not ignore[self] and not ignore[self.Name] then
				local args = { ... }
				table.remove(args, 1) -- remove first argument, because it is "self"

				args = tostr(args)
				local n = self.Name
				if #n >= math.floor(offsetSize/sizeDiv) then
					n = n:sub(0, math.floor(offsetSize/sizeDiv)).."..."
				end

				local log = log:Clone()
				log.Visible = true
				log.Display.Type.BackgroundColor3 = Color3.new(1, 0.44, 0.22)
				log.Display.RName.Text = n
				log.Display.RName.TextColor3 = not block[self.Name] and not block[self] and Color3.new(1,1,1) or Color3.new(1, 0.5, 0.5)

				table.insert(insertionQueue, {log, "To", "local args = "..args.."\n\n"..tostr(self)..":FireServer(unpack(args)) -- Unreliable FireServer", nil, self, args, "FireServer"})
			end

			if block[self.Name] or block[self] then return end
			return old2(...)
		end)), (newc(function(...)
			local self = ...
			if typeof(self) ~= "Instance" or self.ClassName ~= "RemoteFunction" then
				return old3(...)
			end
			if not spyActive then
				return not block[self] and not block[self.Name] and old3(...)
			end

			if not ignore[self] and not ignore[self.Name] then
				local args = { ... }
				table.remove(args, 1) -- remove first argument, because it is "self"

				args = tostr(args)
				local n = self.Name
				if #n >= math.floor(offsetSize/sizeDiv) then
					n = n:sub(0, math.floor(offsetSize/sizeDiv)).."..."
				end

				local log = log:Clone()
				log.Visible = true
				log.Display.Type.BackgroundColor3 = Color3.new(0.77, 0.33, 1)
				log.Display.RName.Text = n
				log.Display.RName.TextColor3 = not block[self.Name] and not block[self] and Color3.new(1,1,1) or Color3.new(1, 0.5, 0.5)

				local t = {log, "To", "local args = "..args.."\n\n"..tostr(self)..":InvokeServer(unpack(args))", nil, self, args, "InvokeServer"}
				table.insert(insertionQueue, t)

				if block[self.Name] or block[self] then return end
				local res = {old3(...)}
				t[4] = res

				return unpack(res)
			end

			if block[self.Name] or block[self] then return end
			return old3(...)
		end)), (newc(function(...)
			local self = ...
			if typeof(self) ~= "Instance" or self.ClassName ~= "BindableEvent" then
				return old4(...)
			end
			bindableEvent(...)
			if block[self.Name] or block[self] then return end
			return old4(...)
		end)), (newc(function(...)
			local self = ...
			if typeof(self) ~= "Instance" or self.ClassName ~= "BindableFunction" then
				return old5(...)
			end
			return func(old5, ...)
		end))

		if hf and getfenv().hookmetamethod and getfenv().getnamecallmethod and weakHooks < 2 then
			old1 = getfenv().hookfunction(fireServer, fireServerHook)
			hooks[#hooks+1] = function()
				getfenv().hookfunction(fireServer, old1)
			end
			old2 = getfenv().hookfunction(fireServer2, fireServer2Hook)
			hooks[#hooks+1] = function()
				getfenv().hookfunction(fireServer2, old2)
			end
			old3 = getfenv().hookfunction(invokeServer, invokeServerHook)
			hooks[#hooks+1] = function()
				getfenv().hookfunction(invokeServer, old3)
			end
			old4 = getfenv().hookfunction(fire, fireHook)
			hooks[#hooks+1] = function()
				getfenv().hookfunction(fire, old4)
			end
			old5 = getfenv().hookfunction(invoke, invokeHook)
			hooks[#hooks+1] = function()
				getfenv().hookfunction(invoke, old5)
			end
		end

		if getfenv().hookmetamethod and getfenv().getnamecallmethod and hf then
			local getnamecallmethod = getfenv().getnamecallmethod

			local old; old = getfenv().hookmetamethod(game, "__namecall", newc(function(...)
				local self = ...
				if typeof(self) ~= "Instance" then
					return old(...)
				end

				local method = getnamecallmethod()
				method = method:sub(1, 1):lower() .. method:sub(2)

				if method == "fireServer" and self.ClassName == "RemoteEvent" then
					return fireServerHook(...)
				elseif method == "fireServer" and self.ClassName == "UnreliableRemoteEvent" then
					return fireServer2Hook(...)
				elseif method == "invokeServer" and self.ClassName == "RemoteFunction" then
					return invokeServerHook(...)
				elseif method == "fire" and self.ClassName == "BindableEvent" then
					return fireHook(...)
				elseif method == "invoke" and self.ClassName == "BindableFunction" then
					return invokeHook(...)
				end

				return old(...)
			end))
			hooks[#hooks+1] = function()
				getfenv().hookmetamethod(game, "__namecall", old)
			end
		end

		local id = 0

		cons[#cons+1] = game:GetService("RunService").RenderStepped:Connect(function()
			viewScale.Position = UDim2.fromOffset(math.clamp(viewScale.Position.X.Offset, 80, 350), 0)
			logs.Size = UDim2.new(0, viewScale.Position.X.Offset, 1, -3)
			offsetSize = logs.Size.X.Offset

			content.Size = UDim2.new(1, -offsetSize - 3, 1, -3)
			content.Position = UDim2.new(0, offsetSize + 3, 0, 3)

			while #insertionQueue > 0 do
				local obj = table.remove(insertionQueue)
				local log, part, content = obj[1], obj[2], obj[3]

				if log and part and content then
					local par = logs:FindFirstChild(part) or logs.From
					if #par:GetChildren() > 25 then
						par:FindFirstChild("Log"):Destroy()
					end
					id = id + 1

					log.LayoutOrder = 2e9 - id
					log.Parent = par
					colorButton(log.Display, log)
					cons[#cons+1] = log.MouseButton1Click:Connect(function()for i,v in logs.From:GetChildren() do
							if v then
								local sel = v:FindFirstChild("Selection", math.huge)
								if sel then
									sel.Visible = false
								end
							end
						end
						for i,v in logs.To:GetChildren() do
							if v then
								local sel = v:FindFirstChild("Selection", math.huge)
								if sel then
									sel.Visible = false
								end
							end
						end

						log.Display.Selection.Visible = true
						selected = obj

						code.Text = content
					end)
				end
			end
		end)

		if getfenv().toclipboard or getfenv().setclipboard then
			cons[#cons+1] = addButton("Copy code").MouseButton1Click:Connect(function()
				if not selected then
					return notification("Please, select a remote first!")
				end
				(getfenv().toclipboard or getfenv().setclipboard)(selected[3])
				notification("Copied!")
			end)
		else
			addButton("[Unavailable] Copy code")
		end
		cons[#cons+1] = addButton("Run code").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			if selected[7] == "Run" then
				local s,e = loadstring(selected[3])
				if s then
					s()
					notification("Ran the code!")
				else
					notification(e, "Error")
				end
			else
				local s,e = pcall(selected[5][selected[7]], selected[5], unpack(selected[6]))
				if s then
					notification("Ran the code!")
				else
					notification(e, "Error")
				end
			end
		end)
		cons[#cons+1] = addButton("Get result").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			if selected[4] then
				code.Text = "local packedResult = "..tostr(selected[4])
			else
				notification("No result!")
			end
		end)
		cons[#cons+1] = addButton("Ignore remote").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			ignore[selected[5]] = true
		end)
		cons[#cons+1] = addButton("Unignore remote").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			ignore[selected[5]] = false
		end)
		cons[#cons+1] = addButton("Ignore remote [n]").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			ignore[selected[5].Name] = true
		end)
		cons[#cons+1] = addButton("Block remote").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			if (selected[3]:IsA("BindableEvent") or selected[3]:IsA("BindableFunction")) and (not hf or not getfenv().hookmetamethod or not getfenv().getnamecallmethod) then
				return notification("Unable to hook the bindable: missing hookfunction / hookmetamethod / getnamecallmethod")
			end
			block[selected[5]] = true
		end)
		cons[#cons+1] = addButton("Unblock remote").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			block[selected[5]] = false
		end)
		cons[#cons+1] = addButton("Block remote [n]").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			block[selected[5].Name] = true
		end)
		cons[#cons+1] = addButton("Unignore remotes [n]").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			ignore[selected[5].Name] = false
		end)
		cons[#cons+1] = addButton("Unblock remotes [n]").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			block[selected[5].Name] = false
		end)
		cons[#cons+1] = addButton("Clear logs").MouseButton1Click:Connect(function()
			for i,v in logs.From:GetChildren() do
				if v and v:IsA("TextButton") and v.Visible then
					v:Destroy()
				end
			end
			for i,v in logs.To:GetChildren() do
				if v and v:IsA("TextButton") and v.Visible then
					v:Destroy()
				end
			end
		end)
		cons[#cons+1] = addButton("Unignore all remotes").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			ignore = {}
		end)
		cons[#cons+1] = addButton("Unblock all remotes").MouseButton1Click:Connect(function()
			if not selected then
				return notification("Please, select a remote first!")
			end

			block = {}
		end)

		task.spawn(function()
			repeat task.wait() until game:IsLoaded()
			task.wait(2.5)

			view:TweenSize(vSize, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.4, true)
			topbar:TweenSize(tSize, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.4, true)
			task.wait(0.1)
			topbar.Visible = true

			repeat task.wait() until enums == enumCalls

			notification("Octo~Spy fully loaded!\nShould log everything now.", "Fully loaded")
		end)

		code = require(script:FindFirstChildOfClass("ModuleScript"))(content.CodeBox)
		code.Text = "Welcome to the " .. topbar.Title.Text .. "!"
	end);
end;
