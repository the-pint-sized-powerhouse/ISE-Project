{
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "logo": {
        "type": "none",
        "padding": {
          "top": 2,
        },
      },
      "general": {},
      "display": {
        "disableLinewrap": "false",
        "separator": "",
        "key": {
          "width": 16,
        },
        "constants": [
          "\u001b[48;2;43;43;69m",
          "\u001b[48;2;56;59;78m",
          "\u001b[90m│                                                            │\u001b[60D\u001b[39m",
        ],
      },
      "modules": [
        {
          "type": "custom",
          "key": "{#90}╭─────────────╮",
          "format": "{#90}╭────────────────────────────────────────────────────────────╮",
        },
        {
          "type": "title",
          "key": "{#90}│ {#92}User        {#90}│",
          "format": "{$3}{user-name} {#2}[{home-dir}]",
        },
        {
          "type": "datetime",
          "key": "{#90}│ {#92}Datetime    {#90}│",
          "format": "{$3}{year}-{month-pretty}-{day-in-month}  {hour-pretty}:{minute-pretty}:{second-pretty}  {#2}{weekday}  {#2}[W{week}] {#2}[UTC{offset-from-utc}]",
        },
        {
          "type": "host",
          "key": "{#90}│ {#93}Machine     {#90}│",
          "format": "{$3}{name} {#2}{version}",
        },
        {
          "type": "os",
          "key": "{#90}│ {#93}OS          {#90}│",
          "format": "{$3}{pretty-name}  {#2}[{arch}]",
        },
        {
          "type": "kernel",
          "key": "{#90}│ {#93}Kernel      {#90}│",
          "format": "{$3}{sysname} {#2}[v{release}]",
        },
        {
          "type": "uptime",
          "key": "{#90}│ {#93}Uptime      {#90}│",
          "format": "{$3}{days} Days + {hours}:{minutes}:{seconds}",
        },
        {
          "type": "cpu",
          "key": "{#90}│ {#91}CPU         {#90}│",
          "showPeCoreCount": true,
          "temp": true,
          "format": "{$3}{name} {#2}[C:{core-types}] {#2}[{freq-max}]",
        },
        {
          "type": "gpu",
          "key": "{#90}│ {#91}GPU         {#90}│",
          "detectionMethod": "auto",
          "hideType": "none",
          "temp": true,
          "format": "{$3}{name} {#2}[C:{core-count}] {#2}[{type}]",
        },
        {
          "type": "memory",
          "key": "{#90}│ {#91}Memory      {#90}│",
          "format": "{$3}{used} / {total} ({percentage})",
        },
        {
          "type": "disk",
          "key": "{#90}│ {#91}Disk        {#90}│",
          "format": "{$3}{size-used} / {size-used} ({size-percentage})",
        },
        {
          "type": "poweradapter",
          "key": "{#90}│ {#91}Power       {#90}│",
          "format": "{$3}{name}",
        },
        {
          "type": "terminal",
          "key": "{#90}│ {#95}Terminal    {#90}│",
          "format": "{$3}{pretty-name} {#2}[{version}]",
        },
        {
          "type": "terminalfont",
          "key": "{#90}│ {#95}Font        {#90}│",
          "format": "{$3}{name}  {#2}[{size}]",
        },
        {
          "type": "shell",
          "key": "{#90}│ {#95}Shell       {#90}│",
          "format": "{$3}{exe-name}  {#2}[v{version}] {#2}[PID:{pid}]",
        },
        {
          "type": "command",
          "key": "{#90}│ {#95}Theme       {#90}│",
          "text": ".config/fastfetch/theme",
          "format": "{$3}{result}  {#2}[Base16-Scheme]"
        },
        {
          "type": "custom",
          "key": "{#90}╰─────────────╯",
          "format": "{#90}╰────────────────────────────────────────────────────────────╯",
        },
      ],
    }
  '';
}
