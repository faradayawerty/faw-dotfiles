/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 0;        /* gaps between windows */
static const unsigned int snap      = 8;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Hack-Regular:size=12" };
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { "#d2c5bc", "#101010", "#202020" },
	[SchemeSel]  = { "#101010", "#0f829d", "#0f829d"  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { 0xffU, 0xd0, 0xffU },
	[SchemeSel]  = { 0xffU, 0xd0, 0xffU },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
//static const char *tags[] = { "1", "2" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Steam",    NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          SHCMD("rofi -show run") },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("uxterm") },
	{ MODKEY|ControlMask,           XK_Return, spawn,          SHCMD("uxterm -e tmux new-session -A -s default") },
	{ MODKEY|ControlMask,           XK_c,      spawn,          SHCMD("uxterm -e tty-clock -csC4") },
	{ MODKEY|ControlMask,           XK_h,      spawn,          SHCMD("uxterm -e htop") },
	{ MODKEY|ControlMask,           XK_q,      spawn,          SHCMD("uxterm -e qalc") },
	{ MODKEY|ControlMask,           XK_f,      spawn,          SHCMD("uxterm -e rover") },
	{ MODKEY|ControlMask,           XK_y,      spawn,          SHCMD("uxterm -e pipe-viewer --resolution 720") },
	{ MODKEY|ControlMask,           XK_t,      spawn,          SHCMD("telegram-desktop") },
	{ MODKEY|ControlMask,           XK_b,      spawn,          SHCMD("chromium") },
	{ MODKEY,                       XK_e,      spawn,          SHCMD("dmenu_emoji") },
	{ MODKEY,                       XK_u,      spawn,          SHCMD("dmenu_unicode") },
	{ MODKEY,                       XK_s,      spawn,          SHCMD("dmenu_resolution") },
	{ 0,                            XK_Print,  spawn,          SHCMD("screen") },
	{ MODKEY,             XK_bracketleft,      spawn,          SHCMD("cmus-remote -r") },
	{ MODKEY,             XK_bracketright,     spawn,          SHCMD("cmus-remote -n") },
	{ MODKEY,             XK_backslash,        spawn,          SHCMD("cmus-remote -u") },
	{ 0,          XF86XK_AudioRaiseVolume,     spawn,          SHCMD("amixer set Master 5%+") },
	{ 0,          XF86XK_AudioLowerVolume,     spawn,          SHCMD("amixer set Master 5%-") },
	{ 0,          XF86XK_AudioMute,            spawn,          SHCMD("amixer -q set Master toggle") },
	{ 0,          XF86XK_MonBrightnessUp,      spawn,          SHCMD("brightnessctl set +5%") },
	{ 0,          XF86XK_MonBrightnessDown,    spawn,          SHCMD("brightnessctl set 5%-") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_w,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY,                       XK_q,      quit,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      spawn,          SHCMD("systemctl poweroff") },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          SHCMD("systemctl reboot") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkStatusText,        0,              Button1,        spawn,          SHCMD("uxterm") },
	{ ClkStatusText,        0,              Button2,        spawn,          SHCMD("chromium") },
	{ ClkStatusText,        0,              Button3,        spawn,          SHCMD("rofi -show run") },
	{ ClkWinTitle,          0,              Button2,        killclient,     {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

