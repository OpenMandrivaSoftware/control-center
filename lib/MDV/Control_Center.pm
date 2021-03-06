package MDV::Control_Center;

# Copyright (C) 1999-2008 Mandriva
#                         Daouda Lo
#                         Damien Krotkine
#                         Thierry Vignaud <tvignaud@mandriva.com>
#                         Yves Duret
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.


use strict;
use lib qw(/usr/lib/libDrakX);
use common;


use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
                    $bindir $sbindir $xbindir
                    $mcc_dir $themes_dir
                    %programs
                    $version
            );

our ($version) = cat_("/etc/mandrakelinux-release") =~ /\b(\d+\.\d+)/;


#-------------------------------------------------------------
# paths
our ($bindir, $sbindir, $xbindir)  = ("/usr/bin", "/usr/sbin", "/usr/X11R6/bin");
our $mcc_dir = "/usr/share/mcc";
our $themes_dir = "$mcc_dir/themes/";


# { key => { log_exp, binary, embedded?, description ] }
# embedded meaning: -1 => not embedded, 0 => external x11 app, 1 => proper embedding
our %programs =
  (
   "3D" =>
   {
    binary => "$sbindir/drak3d",
    embedded => 1,
    description => N("Configure 3D Desktop effects"),
    long_description => N("Configure 3D Desktop effects"),
    icon => 'drak3d',
   },


   "Authentication" =>
   {
    binary => "$sbindir/drakauth",
    embedded => 1,
    description =>
    #-PO: this message is already translated in drakx domain from which MCC will searchs it:
    N("Authentication"),
    long_description => N("Select the authentication method (local, NIS, LDAP, Windows Domain, ...)"),
    icon => 'drakauth-mdk',
   },


   "Backups" =>
   {
    binary => "$sbindir/drakbackup",
    embedded => 1,
    description => N("Backups"),
    long_description => N("Configure backups of the system and of the users' data"),
    icon => 'backup-mdk',
    application_driven_menu => 1,
   },


   "Snapshots" =>
   {
    binary => "$sbindir/draksnapshot-config",
    embedded => 1,
    description => N("Snapshots"),
    long_description => '',
    icon => 'snapshots',
   },


   "Boot Config" =>
   {
    binary => "$sbindir/drakboot --boot",
    embedded => 1,
    description => N("Set up boot system"),
    long_description => N("Set up how the system boots"),
    icon => 'drakboot-mdk',
   },


   "Boot Theme" =>
   {
    binary => "$sbindir/drakboot --splash",
    embedded => 1,
    description => N("Set up boot graphical theme of system"),
    long_description => N("Select the graphical theme of the system while booting"),
    icon => 'boot-theme-mdk',
   },


   "Connection Sharing" =>
   {
    binary => "$sbindir/drakgw",
    embedded => 1,
    description => N("Share the Internet connection with other local machines"),
    long_description => N("Share the Internet connection with other local machines"),
    icon => 'drakgw-mdk',
   },


   "Add Connection" =>
   {
    binary => "$sbindir/drakconnect --wizard",
    embedded => 1,
    description => N("Set up a new network interface (LAN, ISDN, ADSL, ...)"),
    long_description => N("Set up a new network interface (LAN, ISDN, ADSL, ...)"),
    icon => 'new-connection-mdk',
   },


   "Configure Internet" =>
   {
    binary => "$sbindir/drakconnect --internet",
    embedded => 1,
    description => N("Internet access"),
    long_description => N("Alter miscellaneous internet settings"),
    icon => 'internet-access-mdk',
   },


   "Console" =>
   {
    binary => "$sbindir/drakconsole",
    embedded => 1,
    description => N("Open a console as administrator"),
    long_description => N("Open a console as administrator"),
    icon => 'console-mdk',
   #The Console will help you to solve issues
   },


   "Date & Time" =>
   {
    binary => "$sbindir/drakclock",
    embedded => 1,
    description => N("Manage date and time"),
    long_description => N("Manage date and time"),
    icon => 'time-mdk',
   },


   "Display Manager chooser" =>
   {
    binary => "$sbindir/drakedm",
    embedded => 1,
    description => N("Set up display manager"),
    long_description => N("Choose the display manager that enables to select which user to log in"),
    icon => 'drakedm-mdk',
   },


   "Fax" =>
   {
    binary => "$sbindir/drakfax_server",
    embedded => 1,
    description => N("Configure a fax server"),
    long_description => N("Configure a fax server"),
    icon => 'drakfax-mdk',
   },


   "Firewall" =>
   {
    binary => "$sbindir/drakfirewall",
    embedded => 1,
    description => N("Set up your personal firewall"),
    long_description => N("Set up a personal firewall in order to protect the computer and the network"),
    icon => 'firewall-mdk',
   },


   "Fonts" =>
   {
    binary => "$sbindir/drakfont",
    embedded => 1,
    description => N("Manage, add and remove fonts. Import Windows(TM) fonts"),
    long_description => N("Manage, add and remove fonts. Import Windows(TM) fonts"),
    icon => 'drakfont-mdk',
   },


   "Graphical server configuration" =>
   {
    binary => "$sbindir/XFdrake",
    embedded => 1,
    description => N("Set up the graphical server"),
    long_description => N("Set up the graphical server"),
    icon => 'XFdrake-mdk'
   },


   "Hard Drives" =>
   {
    binary => "$sbindir/diskdrake --hd",
    embedded => 1,
    description => N("Manage disk partitions"),
    long_description => N("Create, delete and resize hard disk partitions"),
    icon => 'diskdrake_hd',
   },


   "Hardware List" =>
   {
    binary => "$sbindir/harddrake2",
    embedded => 1,
    description => N("Browse and configure hardware"),
    long_description => N("Browse and configure hardware"),
    icon => 'harddrake-mdk',
    application_driven_menu => 1,
   },


   "Sound" =>
   {
    binary => "$sbindir/draksound",
    embedded => 1,
    description => N("Sound Configuration"),
    long_description => N("Sound Configuration"),
    icon => 'sound',
   },


   "Hosts" =>
   {
    binary => "$sbindir/drakhosts",
    embedded => 1,
    description => N("Hosts definitions"),
    long_description => N("Manage hosts definitions"),
    icon => 'drakhosts',
   },


   "Install Software" =>
   {
    binary => "$sbindir/rpmdrake",
    embedded => 1,
    description => N("Install & Remove Software"),
    long_description => N("Install, uninstall software"),
    icon => 'installremoverpm',
    application_driven_menu => 1,
   },


   "Invictus Firewall" =>
   {
    binary => "$sbindir/drakinvictus",
    embedded => 1,
    description => N("Advanced setup for network interfaces and firewall"),
    long_description => N("Set up network interfaces failover and firewall replication"),
    icon => 'invictus',
   },


   "Keyboard" =>
   {
    binary => "$sbindir/keyboarddrake",
    embedded => 1,
    description => N("Set up the keyboard layout"),
    long_description => N("Set up the keyboard layout"),
    icon => 'keyboard-mdk',
   },


   "Kolab" =>
   {
    binary => "$sbindir/kolab",
    embedded => 1,
    description => N("Kolab"),
    long_description => N("Set up a groupware server"),
   },


   "Localization" =>
   {
    binary => "$bindir/localedrake",
    embedded => 1,
    icon => 'localedrake',
    description => N("Manage localization for your system"),
    long_description => N("Select the language and the country or region of the system"),
   },


   "Logs" =>
   {
    binary => "$sbindir/logdrake",
    embedded => 1,
    description => N("View and search system logs"),
    long_description => N("View and search system logs"),
    icon => 'logdrake-mdk',
   },


   "Manage Connection" =>
   {
    binary => "$sbindir/drakconnect --skip-wizard",
    embedded => 1,
    description => N("Manage connections"),
    long_description => N("Reconfigure a network interface"),
    icon => 'manage-connections-mdk',
   },


   "Manage park" =>
   {
    binary => "$sbindir/park-rpmdrake",
    embedded => 1,
    description => N("Manage computer group"),
    long_description => N("Manage installed software packages on a group of computers"),
    icon => 'drakpark-mdk',
   },

   "Administrative Tool Access" =>
   {
    binary => "$sbindir/draksec",
    embedded => 1,
    description => N("Configure access to administrative tools"),
    long_description => N("Define authentication required to access individual configuration tools "),
    icon => 'drakperm-mdk',
   },

   "Online Update" =>
   {
    binary => "$sbindir/OnlineUpdate",
    embedded => 1,
    description => N("Update your system"),
    long_description => N("Look at available updates and apply any fixes or upgrades to installed packages"),
    icon => 'OnlineUpdate',
    application_driven_menu => 1,
   },


   "Menus" =>
   {
    binary => "$bindir/drakmenustyle",
    embedded => 1,
    description => N("Menu Style"),
    long_description => N("Menu Style Configuration"),
    icon => 'drakmenustyle',
   },


   "Migration" =>
   {
    binary => "$sbindir/transfugdrake",
    embedded => 1,
    description => N("Import Windows(TM) documents and settings"),
    long_description => N("Import Windows(TM) documents and settings"),
    icon => 'migrationtools',
   },


   "Monitor Connection" =>
   {
    binary => "$sbindir/net_monitor",
    embedded => 1,
    description => N("Monitor connections"),
    long_description => N("Monitor the network connections"),
    icon => 'net_monitor-mdk',
   },


   "Mouse" =>
   {
    binary => "$sbindir/mousedrake",
    embedded => 1,
    description => N("Set up the pointer device (mouse, touchpad)"),
    long_description => N("Set up the pointer device (mouse, touchpad)"),
    icon => 'mousedrake-mdk',
   },


   "Parental Controls" => {
    binary => "$sbindir/drakguard",
    embedded => 1,
    description => N("Parental Controls"),
    long_description => N("Parental Controls"),
    icon => 'drakguard',
   },


   "Network Center" =>
   {
    binary => "$sbindir/draknetcenter",
    embedded => 1,
    description => N("Network Center"),
    long_description => N("Manage your network devices"),
    icon => 'netcenter',
   },


   "Network Profiles" =>
   {
    binary => "$sbindir/draknetprofile",
    embedded => 1,
    description => N("Manage different network profiles"),
    long_description => N("Activate and manage network profiles"),
    icon => 'draknetprofile',
   },


   "NFS mount points" =>
   {
    binary => "$sbindir/diskdrake --nfs",
    embedded => 1,
    description => N("Access NFS shared drives and directories"),
    long_description => N("Set NFS mount points"),
    icon => 'diskdrake_nfs',
   },


   "NFS exports" =>
   {
    binary => "$sbindir/draknfs",
    embedded => 1,
    description => N("Share drives and directories using NFS"),
    long_description => N("Manage NFS shares"),
    icon => 'draknfs',
    application_driven_menu => 1,
   },


   "Package stats" =>
   {
    binary => "$sbindir/drakstats",
    embedded => 1,
    description => N("Package Stats"),
    long_description => N("Show statistics about usage of installed software packages"),
    icon => 'source-manager',
   },


   "Partition Sharing" =>
   {
    binary => "$sbindir/diskdrake --fileshare",
    embedded => 1,
    description => N("Share your hard disk partitions"),
    long_description => N("Set up sharing of your hard disk partitions"),
    icon => 'diskdrake_fileshare',
   },


   "Printer" =>
   {
    binary => "$sbindir/system-config-printer",
    embedded => 1,
    description => N("Set up the printer(s), the print job queues, ..."),
    icon => 'printer-mcc-mdk',
    long_description => N("Set up the printer(s), the print job queues, ..."),
    services_to_start_after_install => [ 'cups' ],
    application_driven_menu => 1,
   },
 

   "Programs scheduling" =>
   {
    binary => "$xbindir/drakcronat",
    embedded => 1,
    description => N("Scheduled tasks"),
    long_description => N("Schedule programs to run periodically or at given times"),
    #DrakCronAt enables to schedule Programs execution through crond and atd daemons
    icon => 'drakcronat-mdk',
   },

   "Proxy Configuration" =>
   {
    binary => "$sbindir/drakproxy",
    embedded => 1,
    description => N("Proxy"),
    long_description => N("Set up a proxy server for files and web browsing"),
    icon => 'drakproxy-mdk',
   },

   "Remote Control" =>
   {
    binary => "$bindir/rfbdrake",
    embedded => 1,
    description => N("Remote Control (Linux/Unix, Windows)"),
    long_description => N("Remote Control of another machine (Linux/Unix, Windows)"),
    icon => 'internet-access-mdk',
   },


   "Remove Interface" =>
   {
    binary => "$sbindir/drakconnect --del",
    embedded => 1,
    description => N("Remove a connection"),
    long_description => N("Delete a network interface"),
    icon => 'remove-connection-mdk',
   },


   #- currently unused
   "Roaming" =>
   {
    binary => "$sbindir/drakroam",
    embedded => 1,
    description => N("Wireless connection"),
    long_description => N("Wireless connection"),
    icon => 'drakroam-mdk',
   },


   "Access Windows shares" =>
   {
    binary => "$sbindir/diskdrake --smb",
    embedded => 1,
    description => N("Access Windows (SMB) shared drives and directories"),
    long_description => N("Configuration of Windows (Samba) shared drives and directories"),
    icon => 'diskdrake_samba',
   },


   "Samba configuration" =>
   {
    binary => "$sbindir/draksambashare",
    embedded => 1,
    description => N("Share drives and directories with Windows (SMB) systems"),
    long_description => N("Manage configuration of Samba"),
    icon => 'draksambashare',
    application_driven_menu => 1,
   },

   "Scanner" =>
   {
    binary => "$sbindir/scannerdrake",
    embedded => 1,
    description => N("Set up scanner"),
    long_description => N("Set up scanner"),
    icon => 'scanner-mdk',
   },


   "Security Level" =>
   {
    binary => "$sbindir/msecgui",
    embedded => 1,
    description => N("Configure system security, permissions and audit"),
    long_description => N("Set the system security level, periodic security audit and permissions"),
    icon => 'draksec-mdk',
    application_driven_menu => 1,
   },


   "Services" =>
   {
    binary => "$sbindir/drakxservices",
    embedded => 1,
    description => N("Manage system services by enabling or disabling them"),
    long_description => N("Manage system services by enabling or disabling them"),
    icon => 'service-mdk',
   },


   "Software Media Manager" =>
   {
    binary => "$sbindir/edit-urpm-sources.pl",
    embedded => 1,
    description => N("Configure media sources for install and update"),
    long_description => N("Select from where software packages are downloaded "),
    icon => 'rpmdrake-mdk',
    application_driven_menu => 1,
   },


   "Updates Configuration" =>
   {
    binary => "$sbindir/omvapplet-config",
    embedded => 1,
    description => N("Configure updates frequency"),
    icon => 'rpmdrake-mdk',
   },

   "Tomoyo Policy" =>
   {
    binary => "$sbindir/tomoyo-gui",
    embedded => 1,
    description => N("Configure TOMOYO Linux policy"),
    long_description => N("View and configure TOMOYO Linux security policy"),
    icon => 'draksec-mdk',
    application_driven_menu => 1,
   },


   "UPS" =>
   {
    binary => "$sbindir/drakups --wizard",
    embedded => 1,
    description =>
      #-PO: UPS==Uninterruptible power supply
      N("Set up a UPS for power monitoring"),
    long_description =>
    #-PO: here power means electrical power
    N("Set up a UPS for power monitoring"),
    icon => 'drakups-mdk',
   },


   "Users" =>
   {
    # too big
    binary => "$sbindir/userdrake",
    embedded => 1,
    description => N("Manage users on system"),
    long_description => N("Add, remove or change users of the system"),
    icon => 'user-mdk',
    application_driven_menu => 1,
   },


   "Virtualization" =>
   {
    binary => "$sbindir/drakvirt",
    embedded => 1,
    description => N("Virtualization"),
    long_description => N("Virtual machines management"),
    icon => 'drakvirt',
   },


   "VPN" =>
   {
    binary => "$sbindir/drakvpn",
    embedded => 1,
    description => N("Configure VPN connection to secure network access"),
    long_description => N("Configure VPN connection to secure network access"),
    icon => 'drakvpn',
   },


   "WebDAV mount points" =>
   {
    binary => "$sbindir/diskdrake --dav",
    embedded => 1,
    description => N("Access WebDAV shared drives and directories"),
    long_description => N("Set WebDAV mount points"),
    icon => 'webdav-mdk',
   },

  );




1;
