import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks defaultConfig
        { manageHook = myManageHook <+> manageHook defaultConfig 
        , layoutHook = spacingRaw False (Border 0 20 0 20) True (Border 20 0 20 0) True $ avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ def --xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#53a6a6" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , focusedBorderColor = "#ae6fed"
	, terminal = "urxvt"
	, borderWidth = 2
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
	, ((mod4Mask, xK_F11), spawn "qutebrowser")
	, ((mod4Mask, xK_F12), spawn "firefox")
        ]
