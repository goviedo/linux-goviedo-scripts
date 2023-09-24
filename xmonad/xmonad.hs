-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.DragPane
import XMonad.Layout.LayoutCombinators hiding ((|||))
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Util.Run
import System.IO
import qualified Data.Map        as M
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import XMonad.Layout.ResizableTile
import XMonad.Hooks.SetWMName
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat) 

-- The main function.
--xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
main = do
-- Custom PP, configure it as you like. It determines what is being written to the bar.
--myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
-- Command to launch the bar.
--myBar = "xmobar"

	xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.rc"

-- Main configuration, override the defaults to your liking.
	xmonad $ defaultConfig 
		{ 
	 		modMask = mod4Mask,
			startupHook = setWMName "LG3D",
	 		--keys = myKeys,
	 		layoutHook = myLayoutHook, 
	 		--terminal = "mrxvt -name mrxvt-alt", 
	 		terminal = "lxterminal", 
	 		borderWidth = 2, 
			normalBorderColor = "#abc123",
			focusedBorderColor = "#456def" ,
			manageHook = ( isFullscreen --> doFullFloat) <+> manageDocks <+> manageHook defaultConfig, 
			logHook = dynamicLogWithPP xmobarPP 
				{ 	ppOutput = hPutStrLn xmproc 
					, ppTitle = xmobarColor "blue" "" . shorten 50 
					, ppLayout = const "" -- to disable the layout info on xmobar 
				}
		}`additionalKeys`
		[((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
		, ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
		, ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")
		, ((0, xF86XK_MonBrightnessUp    ), spawn "masbrillo")
		, ((0, xF86XK_MonBrightnessDown  ), spawn "menosbrillo")
		, ((mod4Mask, xK_a), sendMessage MirrorShrink)
		, ((mod4Mask, xK_z), sendMessage MirrorExpand)
		]

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

--ResizableTall .... permite que el MirrorShrink y MirrorExpand funcionen.
--Antes era solo Tall. Ademas se coloco los [] que permitieron que no hubiera
--error de synataxis.
myLayoutHook = spacing 4 $ avoidStruts . smartBorders $
    ResizableTall 1 (20 / 100) (1 / 2) [] ||| tabbedLayout ||| Full ||| gimpLayout
  where
    tabbedLayout = tabbedBottomAlways shrinkText defaultTheme
    gimpLayout = tabbedLayout ****||* Full

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
--
--keysToAdd x = [((mod4Mask, xK_F4), kill)] 
--keysToDel x = [((mod4Mask .|. shiftMask), xK_c)] 
--newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x)) -- to include new keys to existing keys 
--myKeys x = foldr M.delete (newKeys x) (keysToDel x) -- to delete the unused keys 

--Configuracion inicial. Tiene el problema que elimina las teclas por defecto
-- por lo que hay que usar addtionalKeys con EzConfig como import
--myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launch a terminal
--    [ ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
--	, ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
--	, ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")
--	, ((0, xF86XK_MonBrightnessUp    ), spawn "masbrillo")
--	, ((0, xF86XK_MonBrightnessDown  ), spawn "menosbrillo")
    -- launch gmrun
--    , ((modMask .|. shiftMask, xK_p     ), spawn "gmrun")
--   ]

