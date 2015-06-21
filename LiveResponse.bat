@ECHO OFF
TITLE - ** LIVE RESPONSE **-: @azeemnow :-** LIVE RESPONSE **
color 0B

ECHO ***********************************************************************
ECHO Destination drive example "F:"
set /p loc= Provide drive letter where you would like files to save and press enter?  
ECHO Files will be created in %loc% directory!

mkdir %loc%\%computername%
mkdir %loc%\%computername%\mem
mkdir %loc%\%computername%\Volatile
mkdir %loc%\%computername%\MD5
mkdir %loc%\%computername%\HDD


@SET /P RAM= Do you want to acquire memory? [y/n]
@IF /I "%RAM%" EQU "y" GOTO getmem
@GOTO volatiledata

:getmem


"%~dp0"win64dd.exe /f %loc%\%computername%\mem.img
#64bit only

:volatiledata 

ECHO Volatile data is now being collected...


@net time \\%computername% |find "Current time" > %loc%\%computername%\Volatile\net_time_start.txt

doskey /history > %loc%\%computername%\Volatile\doskey_history.txt
"%~dp0"md5deep.exe -b "%loc%\%computername%\Volatile\doskey_history.txt" > %loc%\%computername%\MD5\doskey_history.txt

date /t time /t > %loc%\%computername%\Volatile\date_time.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\date_time.txt > %loc%\%computername%\MD5\md5_date_time.txt

@ECHO     Collecting network status  
netstat -ano > %loc%\%computername%\Volatile\netstat_ano.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\netstat_ano.txt > %loc%\%computername%\MD5\md5_netstat_ano.txt

@ECHO     Collecting network status  2
netstat -rn > %loc%\%computername%\Volatile\netstat_rn.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\netstat_rn.txt > %loc%\%computername%\MD5\md5_netstat_rn.txt

@ECHO     Collecting network status  3
netstat -anob > %loc%\%computername%\Volatile\netStat_anob.txt 
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\netStat_anob.txt > %loc%\%computername%\MD5\md5_netStat_anob.txt

@ECHO     Collecting network settings 
Ipconfig /all > %loc%\%computername%\Volatile\ipconfig_all.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\ipconfig_all.txt > %loc%\%computername%\MD5\md5_ipconfig_all.txt

@ECHO     Collecting network settings 2
Ipconfig /displaydns > %loc%\%computername%\Volatile\display_dns.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\display_dns.txt > %loc%\%computername%\MD5\md5_display_dns.txt

tasklist -m > %loc%\%computername%\Volatile\tasklist_m.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\tasklist_m.txt > %loc%\%computername%\MD5\md5_tasklist_m.txt

tasklist -svc > %loc%\%computername%\Volatile\tasklist_svc.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\tasklist_svc.txt > %loc%\%computername%\MD5\md5_tasklist_svc.txt

net sessions > %loc%\%computername%\Volatile\NetSessions.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\NetSessions.txt > %loc%\%computername%\MD5\md5_NetSessions.txt

net file > %loc%\%computername%\Volatile\netfile.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\netfile.txt > %loc%\%computername%\MD5\md5_netfile.txt

nbtstat -c > %loc%\%computername%\Volatile\nbtstat.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\nbtstat.txt > %loc%\%computername%\MD5\md5_nbtstat.txt

date > %loc%\output\date.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\date.txt > %loc%\%computername%\MD5\md5_date.txt

time > %loc%\output\time.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\time.txt > %loc%\%computername%\MD5\md5_time.txt

systeminfo > %loc%\%computername%\Volatile\systeminfo.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\systeminfo.txt > %loc%\%computername%\MD5\md5_systeminfo.txt

fsutil behavior query disablelastaccess > %loc%\%computername%\Volatile\fsutil.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\fsutil.txt > %loc%\%computername%\MD5\md5_fsutil.txt.txt

dir /t:a /a /s /o:d C:\ > %loc%\%computername%\Volatile\C_MACTime.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\C_MACTime.txt > %loc%\%computername%\MD5\md5_C_MACTime.txt

@dir /t:a /a /s /o:d D:\ > %loc%\%computername%\Volatile\D_MACTime.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\D_MACTime.txt > %loc%\%computername%\MD5\md5_D_MACTime.txt

"%~dp0"pclip.exe > %loc%\%computername%\Volatile\pclip.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\pclip.txt > %loc%\%computername%\MD5\md5_pclip.txt

@"%~dp0"PsLoggedon.exe /accepteula > %loc%\%computername%\Volatile\logged_on_users.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\logged_on_users.txt.txt > %loc%\%computername%\MD5\md5_logged_on_users.txt

@"%~dp0"logonsessions.exe /accepteula > %loc%\%computername%\Volatile\logonsession.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\logonsession.txt > %loc%\%computername%\MD5\md5_logonsession.txt

@"%~dp0"NetUsers.exe -local -history > %loc%\%computername%\Volatile\netusers.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\netusers.txt > %loc%\%computername%\MD5\md5_netusers.txt

@"%~dp0"psfile.exe /accepteula > %loc%\%computername%\Volatile\psfile.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\psfile.txt > %loc%\%computername%\MD5\md5_psfile.txt

@"%~dp0"tlist.exe -v > %loc%\%computername%\Volatile\tlist_v.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\tlist.txt > %loc%\%computername%\MD5\md5_tlist_v.txt

@"%~dp0"tlist.exe -t >> %loc%\%computername%\Volatile\tlist_t.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\tlist_t.txt > %loc%\%computername%\MD5\md5_tlist_t.txt

@"%~dp0"pslist.exe -x /accepteula > %loc%\%computername%\Volatile\pslist_x.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\pslist_x.txt > %loc%\%computername%\MD5\md5_pslist_x.txt

"%~dp0"pslist.exe -t /accepteula > %loc%\%computername%\Volatile\pslist_t.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\pslist_t.txt > %loc%\%computername%\MD5\md5_pslist_t.txt

@"%~dp0"listdlls.exe /accepteula > %loc%\%computername%\Volatile\listdlls.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\listdlls.txt > %loc%\%computername%\MD5\md5_listdlls.txt

@"%~dp0"Fport.exe > %loc%\%computername%\Volatile\fport.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\fport.txt > %loc%\%computername%\MD5\md5_fport.txt

"%~dp0"auditpol.exe > %loc%\%computername%\Volatile\Auditpol.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\Auditpol.txt > %loc%\%computername%\MD5\md5_Auditpol.txt

"%~dp0"NTlast.exe > %loc%\%computername%\Volatile\ntlast_success_logons.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\ntlast_success_logons.txt > %loc%\%computername%\MD5\md5_ntlast_success_logons.txt

"%~dp0"NTlast.exe -f > %loc%\%computername%\Volatile\ntlast_failed_consolelogons.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\ntlast_failed_consolelogons.txt > %loc%\%computername%\MD5\ntlast_failed_consolelogons.txt

"%~dp0"NTLast.exe -r > %loc%\%computername%\Volatile\ntlast_success_remotelogons.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\ntlast_success_remotelogons.txt > %loc%\%computername%\MD5\md5_ntlast_success_remotelogons.txt

"%~dp0"NTLast.exe -f -r > %loc%\%computername%\Volatile\ntlast_failed_remotelogons.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\ntlast_failed_remotelogons.txt > %loc%\%computername%\MD5\md5_ntlast_failed_remotelogons.txt

@"%~dp0"edd.exe > %loc%\%computername%\Volatile\edd.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\edd.txt > %loc%\%computername%\MD5\md5_edd.txt

@"%~dp0"di.exe > %loc%\%computername%\Volatile\di.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\di.txt > %loc%\%computername%\MD5\md5_di.txt

@"%~dp0"share.exe > %loc%\%computername%\Volatile\share.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\share.txt > %loc%\%computername%\MD5\md5_share.txt

"%~dp0"autorunsc.exe /accepteula > %loc%\%computername%\Volatile\autorunsc.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\autorunsc.txt > %loc%\%computername%\MD5\md5_autorunsc.txt

@"%~dp0"PsGetsid.exe /accepteula > %loc%\%computername%\Volatile\psgetsid.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\psgetsid.txt > %loc%\%computername%\MD5\md5_psgetsid.txt

@ECHO     Checking for Encryption
"%~dp0"edd.exe > %loc%\%computername%\Volatile\edd.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\edd.txt > %loc%\%computername%\MD5\md5_edd.txt

@ECHO     Collecting OS info 
@"%~dp0"OSTest.exe > %loc%\%computername%\Volatile\OSTest.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\OSTest.txt > %loc%\%computername%\MD5\md5_OSTest.txt

@"%~dp0"tcpvcon.exe -can /accepteula > %loc%\%computername%\Volatile\tcpvcon.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\tcpvcon.txt > %loc%\%computername%\MD5\md5_tcpvcon.txt

@"%~dp0"RASConns.exe > %loc%\%computername%\Volatile\rasconns.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\rasconns.txt > %loc%\%computername%\MD5\md5_rasconns.txt

@ECHO     Collecting Prefetch Files
@ls -latr %systemroot%\prefetch > %loc%\%computername%\Volatile\prefetchfiles.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\prefetchfiles.txt > %loc%\%computername%\MD5\md5_prefetchfiles.txt

@ECHO     Collecting service listing
@psservice.exe /accepteula  >  %loc%\%computername%\Volatile\psservice.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\psservice.txt > %loc%\%computername%\MD5\md5_psservice.txt

@ECHO     Collecting event logs (Security)
@psloglist.exe -s -x security /accepteula > %loc%\%computername%\Volatile\evt_sec.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\evt_sec.txt > %loc%\%computername%\MD5\md5_evt_sec.txt

@ECHO     Collecting event logs (System)
@psloglist.exe -s -x system /accepteula > %loc%\%computername%\Volatile\evt_sys.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\evt_sys.txt > %loc%\%computername%\MD5\md5_evt_sys.txt

@ECHO     Collecting event logs (Application)
@psloglist.exe -s -x application /accepteula > %loc%\%computername%\Volatile\evt_app.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\evt_app.txt > %loc%\%computername%\MD5\md5_evt_app.txt

@ECHO     Collecting event logs (Security2)
@dumpel.exe -l security -f %loc%\%computername%\Volatile\security_evt_app.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\security_evt_sec.txt > %loc%\%computername%\MD5\md5_security_evt_sec.txt

@ECHO     Collecting event logs (System2)
@dumpel.exe -l system -f %loc%\%computername%\Volatile\system_evt_app.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\system_evt_sec.txt > %loc%\%computername%\MD5\md5_system_evt_sec.txt

@ECHO     Collecting event logs (System3)
@dumpel.exe -l application -f %loc%\%computername%\Volatile\application_evt_app.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\application_evt_sec.txt > %loc%\%computername%\MD5\md5_application_evt_sec.txt

@ECHO     Copying event logs (Security)
@copy %SystemRoot%\system32\config\secevent.evt %loc%\%computername%\Volatile\secevent.evt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\secevent.evt > %loc%\%computername%\MD5\md5_secevent_evt.txt

@ECHO     Copying event logs (System)
@copy %SystemRoot%\system32\config\sysevent.evt %loc%\%computername%\Volatile\sysevent.evt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\sysevent.evt > %loc%\%computername%\MD5\md5_sysevent_evt.txt

@ECHO     Copying event logs (Application)
@copy %SystemRoot%\system32\config\appevent.evt %loc%\%computername%\Volatile\appevent.evt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\appevent.evt > %loc%\%computername%\MD5\md5_appevent_evt.txt

@ECHO     Copying event logs (Setup)
@copy %SystemRoot%\system32\config\setupevent.evt %loc%\%computername%\Volatile\setupevent.evt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\setupevent.evt > %loc%\%computername%\MD5\md5_setupevent_evt.txt

@ECHO     Collecting USB Info
@USBDeview.exe /stext %loc%\%computername%\Volatile\usbdeview.txt
@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\usbdeview.evt > %loc%\%computername%\MD5\md5_usbdeview.txt

#@ECHO     Collecting Reg (SAM)
#@reg save HKLM\SAM %loc%\%computername%\Volatile\%computername%_SAM_Hive
#@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\%computername%_SAM_Hive > %loc%\%computername%\MD5\md5_%computername%_SAM_Hive.txt

#@ECHO     Collecting Reg (System)
#@reg save HKLM\SYSTEM %loc%\%computername%\Volatile\%computername%_SYSTEM_Hive
#@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\%computername%_SYSTEM_Hive > %loc%\%computername%\MD5\md5_%computername%_System_Hive.txt

#@ECHO     Collecting Reg (Security)
#@reg save HKLM\SYSTEM %loc%\%computername%\Volatile\%computername%_Security_Hive
#@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\%computername%_Security_Hive > %loc%\%computername%\MD5\md5_%computername%_Security_Hive.txt

#@ECHO     Collecting Reg (Software)
#@reg save HKLM\SOFTWARE %loc%\%computername%\Volatile\%computername%_Software_Hive
#@"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\%computername%_Software_Hive > %loc%\%computername%\MD5\md5_%computername%_Software_Hive.txt

@net time \\%computername% |find "Current time" > %loc%\%computername%\Volatile\net_time_finish.txt
"%~dp0"md5deep.exe -b %loc%\%computername%\Volatile\net_time_finish.txt > %loc%\%computername%\MD5\md5_net_time_finish.txt

ECHO
"%~dp0"edd.exe


:end



ECHO Script has completed and will now exit. Thanks! @azeemnow

PAUSE

