#!MANAGED-CONFIG {$userapiUrl}

[General]
loglevel = notify
dns-server = system, 119.29.29.29, 223.6.6.6, 80.80.80.80
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8, localhost, *.local, *.crashlytics.com
external-controller-access = MixChina@0.0.0.0:8233
interface = 0.0.0.0
port = 8234
enhanced-mode-by-rule = false
exclude-simple-hostnames = true
ipv6 = true

[Proxy]
🚀 Direct = direct
{$ss_group}

[Proxy Group]
🍃 Proxy = select, 🍈 Select, 🚀 Direct

🍂 Domestic = select, 🚀 Direct, 🍃 Proxy

☁️ Others = select, 🍃 Proxy, 🚀 Direct

🍈 Select = select{$ss_name}

[Rule]
{file_get_contents("https://raw.githubusercontent.com/lhie1/Rules/master/Auto/PROXY.conf")}
{file_get_contents("https://raw.githubusercontent.com/lhie1/Rules/master/Auto/DIRECT.conf")}

GEOIP,CN,🍂 Domestic
FINAL,☁️ Others,dns-failed
