/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 4;       /* gap pixel between windows */
static const unsigned int snap      = 4;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int drawtitle          = 1;
//static const char *fonts[]          = { "xos4 Terminus:size=12" };
//static const char *fonts[]          = { "Bitstream Vera Sans Mono:style=Roman:pixelsize=10" };
static const char *fonts[]          = { "Hack-Regular:size=8" };

static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#005577";
static char selbgcolor[]            = "#005577";

static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

static const unsigned int alphas[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { OPAQUE,    0xf3,      0xd0 },
	[SchemeSel]  = { OPAQUE,    0xf3,      0xff }
};

/* tagging */
//static const char *tags[] = { "1:tm", "2:wb", "3:tg", "4:st", "5:pr", "6:av", "7:dl", "8:gm", "9:nu"};
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                             instance    title       tags mask     isfloating   monitor */
	{ "Steam",                           NULL,       NULL,       0,            1,           -1 },
	{ "Tor Browser",                     NULL,       NULL,       0,            1,           -1 },
	{ "Mirosoft Teams - Preview",        NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.65; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle },
	{ "[]=",      tile },
	{ "><>",      NULL },
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

/* commands */
static const char *dmenuemoji[]   = { "dmenuemoji", NULL };
static const char *dmenukaomoji[]   = { "dmenukaomoji", NULL };
static const char *dmenuunicode[] = { "dmenuunicode", NULL };
static const char *dmenusurf[] = { "dmenusurf", NULL };

static const char *screenshot[] = { "takescreenshot", NULL };

static const char *upvol[] = { "amixer", "set", "Master", "5%+", NULL };
static const char *downvol[] = { "amixer", "set", "Master", "5%-", NULL };
static const char *mute[] = { "amixer", "-q", "set", "Master", "toggle", NULL };

static const char *brightnessup[] = { "brightness", "set", "+10%", NULL };
static const char *brightnessdown[] = { "brightness", "set", "10%-", NULL };

static const char *poweroffcmd[] = { "systemctl", "poweroff", NULL };
static const char *rebootcmd[] = { "systemctl", "reboot", NULL };

static const char *musplay[] = { "cmus-remote", "-u", NULL };
static const char *musnext[] = { "cmus-remote", "-n", NULL };
static const char *musprev[] = { "cmus-remote", "-r", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_Return, spawn,          SHCMD("$TERMINAL") },
	//{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("DVTM_EDITOR=dmenudvtmpipe $TERMINAL -e dvtm -t dvtm -m \\`") },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("$TERMINAL -e tmux new-session -A -s default") },

	{ MODKEY,                       XK_u,      spawn,          SHCMD("dmenulinks") },

	{ MODKEY,                       XK_o,      spawn,          SHCMD("$RUNMENU") },
	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = dmenuemoji } },
	{ MODKEY|ShiftMask,             XK_k,      spawn,          {.v = dmenukaomoji } },
	{ MODKEY|ShiftMask,             XK_u,      spawn,          {.v = dmenuunicode } },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = dmenusurf } },

	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },

	{ MODKEY,                       XK_space,  zoom,           {0} },

	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },

	{ MODKEY,                       XK_w,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = poweroffcmd} },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          {.v = rebootcmd} },

	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_s,      setlayout,      {.v = &layouts[1] } },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },

	{ MODKEY|ShiftMask,             XK_f,      togglefloating, {0} },

	{ 0,        XF86XK_MonBrightnessDown, spawn,          {.v = brightnessdown } },
	{ 0,          XF86XK_MonBrightnessUp, spawn,          {.v = brightnessup } },

	{ 0,         XF86XK_AudioPlay, spawn,          {.v = musplay } },
	{ 0,         XF86XK_AudioNext, spawn,          {.v = musnext } },
	{ 0,         XF86XK_AudioPrev, spawn,          {.v = musprev } },

	{ 0,         XF86XK_AudioRaiseVolume, spawn,          {.v = upvol } },
	{ 0,         XF86XK_AudioLowerVolume, spawn,          {.v = downvol } },
	{ 0,                XF86XK_AudioMute, spawn,          {.v = mute } },

	{ 0,                        XK_Print, spawn,          {.v = screenshot } },

	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

