Windows 2003 MS08-067 Patch 
https://www.microsoft.com/en-us/download/details.aspx?id=6185 
 
Windows XP MS08-067 Patch 
https://www.microsoft.com/en-us/download/details.aspx?id=3205 
 
MalwareBytes Definitions 
http://downloads.malwarebytes.org/file/mbam_rules 
 
MalwareBytes Installer 
https://www.malwarebytes.com/ 
 
Gitlab backup 
https://docs.gitlab.com/omnibus/settings/backups.html 
 
Porstgres Backup 
https://www.postgresql.org/docs/9.1/static/backup-dump.html 
 
Mysql Backup 
http://www.tecmint.com/mysql-backup-and-restore-commands-for-database-administration/


Windows 2003 MS08-067 Patch 
https://www.microsoft.com/en-us/download/details.aspx?id=6185 
 
Windows XP MS08-067 Patch 
https://www.microsoft.com/en-us/download/details.aspx?id=3205 
 
Windows 2003 SP2 
https://technet.microsoft.com/en-us/windowsserver/bb229701 
 
Windows XP SP2 
https://www.microsoft.com/en-us/download/details.aspx?id=17791  
 
Mod Security 
https://modsecurity.org/download.html 
https://www.trustwave.com/Resources/SpiderLabs-Blog/Web-Application-Defender-s-Cookbook--CCDC-Blue-Team-Cheatsheet/ 
Visual Studio dependency 
https://www.microsoft.com/en-us/download/details.aspx?id=40784 
 
Sysinternals 
https://technet.microsoft.com/en-us/sysinternals/bb842062.aspx 
 
IIS 5 Hardening 
https://msdn.microsoft.com/en-us/library/ff648653.aspx  
 
IIS 6 Practices 
https://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/596cdf5a-c852-4b79-b55a-708e5283ced5.mspx?mfr=true 
 
IIS 8 Hardening 
https://technet.microsoft.com/en-us/library/jj635855%28v=ws.11%29.aspx?f=255&MSPPError=-2147217396 (Request Filtering) 
 
Windows MBSA 
https://technet.microsoft.com/en-us/security/cc184924.aspx 
 
SQL Server 2003 Hardening 
https://msdn.microsoft.com/en-us/library/ff648664.aspx?f=255&MSPPError=-2147217396#c18618429_011 
 
PowerSploit 
https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc 
 
Prevent Mimikatz 
https://support.microsoft.com/en-us/help/2871997/microsoft-security-advisory-update-to-improve-credentials-protection-and-management-may-13,-2014  
 
Links to publicly available CIS benchmarks: 
Only do items that are Level 1 and Scored. 
Windows 2012 R2 v2.2.0 (1 revision old): https://goo.gl/V0LDqx 
Windows 2012 non-R2 v1.0.0 (at least 1 revision old): https://goo.gl/SSHmrd 
Microsoft SQL 2014 v1.1.0 (1 revision old): https://goo.gl/UDalt9 
Microsoft SQL 2012 v1.0.0 (at least 1 revision old): https://goo.gl/KZyhUz 
Microsoft IIS 8 v1.4.0 (1 revision old): https://goo.gl/NIQxzk




 
 
https://technet.microsoft.com/en-us/library/jj573828(v=wps.630).aspx 
https://technet.microsoft.com/en-us/library/hh831755(v=ws.11).aspx 
 
Get-NetFirewallProfile –Name Domain 
 
Set-NetFirewallProfile –Name Domain –LogAllowed True 
 
Set-NetFirewallRule –Direction Inbound  
 
Set-NetFirewallProfile -DefaultInboundAction Block –DefaultOutboundAction Block –NotifyOnListen True –LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall.log 
 
Allow Ping Inbound: 
New-NetFirewallRule -Name Allow_Ping -DisplayName “Allow Ping” -Protocol ICMPv4 -IcmpType 8 -Profile Any -Action Allow 
 
Allow All Inbound from Specified IPs: 
New-NetFirewallRule –Name Allow_All_Inbound -DisplayName "Allow All Inbound" -Direction Inbound –Action Allow –Protocol Any –RemoteAddress @("192.168.1.1","10.0.0.1") 
 
*NEEDS WORK* 
Allow IE Outbound: 
New-NetFirewallRule -Name Allow_IE_Outbound –DisplayName "Allow IE Outbound"" -Direction Outbound –Program "C:\Program Files\Internet Explorer\iexplore.exe" –Action Allow –Port 80,443 –Protocol TCP 
 
Allow DNS? 
Does downloading and etc. need other ports or protocols? 
 
 
 



iptables firewall


# KAA
#!/bin/bash 
Iptables --flush 
iptables -P INPUT DROP 
iptables -P FORWARD DROP 
iptables -P OUTPUT ACCEPT 
 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 
 
# allow icmp 
Iptables –A INPUT –p icmp –j ACCEPT 
 
# allow ssh, http, and https  traffic from  
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport ssh -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport http -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 8080 -j ACCEPT 
 
 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport ssh -j ACCEPT 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport http -j ACCEPT 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 8080 -j ACCEPT



# GITLAB
#!/bin/bash 
Iptables --flush 
iptables -P INPUT DROP 
iptables -P FORWARD DROP 
iptables -P OUTPUT ACCEPT 
 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 
 
# allow icmp 
Iptables –A INPUT –p icmp –j ACCEPT 
 
# allow ssh, http, and https  traffic from  
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport ssh -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport http -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 12320 -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 12321 -j ACCEPT 
 
 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport ssh -j ACCEPT 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport http -j ACCEPT 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 12320 -j ACCEPT
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 12321 -j ACCEPT



# ELK
#!/bin/bash 
Iptables --flush 
iptables -P INPUT DROP 
iptables -P FORWARD DROP 
iptables -P OUTPUT ACCEPT 
 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 
 
# allow icmp 
Iptables –A INPUT –p icmp –j ACCEPT 
 
# allow ssh, http, and https  traffic from  
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport ssh -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport http -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 5601 -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 9200 -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 20 -j ACCEPT 
iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 21 -j ACCEPT 
 
 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport ssh -j ACCEPT 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport http -j ACCEPT 
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 5601 -j ACCEPT
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 9200 -j ACCEPT
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 20 -j ACCEPT
iptables -A OUTPUT -p tcp -d XXX.XXX.XXX.XXX --dport 21 -j ACCEPT

