Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
C:\ForensicPrograms\plaso-main\venv\Scripts\Activate.ps1
function Show-PlasoGUI {
    # --- Create Form ---
    $form = New-Object Windows.Forms.Form
    $form.Text = "Plaso Frontend"
    $form.Size = New-Object Drawing.Size(650, 500)
    $form.StartPosition = "CenterScreen"

# --- Timezone ---
$lblTimezone = New-Object Windows.Forms.Label
$lblTimezone.Text = "Timezone:"
$lblTimezone.Location = "10,20"
$lblTimezone.AutoSize = $true
$form.Controls.Add($lblTimezone)

$cbTimezone = New-Object Windows.Forms.ComboBox
$cbTimezone.Location = "150,20"
$cbTimezone.Width = 380
$cbTimezone.DropDownStyle = "DropDownList"

# Add timezone options
$timezones = @(
    "Africa/Abidjan",
    "Africa/Accra",
    "Africa/Addis_Ababa",
    "Africa/Algiers",
    "Africa/Asmara",
    "Africa/Asmera",
    "Africa/Bamako",
    "Africa/Bangui",
    "Africa/Banjul",
    "Africa/Bissau",
    "Africa/Blantyre",
    "Africa/Brazzaville",
    "Africa/Bujumbura",
    "Africa/Cairo",
    "Africa/Casablanca",
    "Africa/Ceuta",
    "Africa/Conakry",
    "Africa/Dakar",
    "Africa/Dar_es_Salaam",
    "Africa/Djibouti",
    "Africa/Douala",
    "Africa/El_Aaiun",
    "Africa/Freetown",
    "Africa/Gaborone",
    "Africa/Harare",
    "Africa/Johannesburg",
    "Africa/Juba",
    "Africa/Kampala",
    "Africa/Khartoum",
    "Africa/Kigali",
    "Africa/Kinshasa",
    "Africa/Lagos",
    "Africa/Libreville",
    "Africa/Lome",
    "Africa/Luanda",
    "Africa/Lubumbashi",
    "Africa/Lusaka",
    "Africa/Malabo",
    "Africa/Maputo",
    "Africa/Maseru",
    "Africa/Mbabane",
    "Africa/Mogadishu",
    "Africa/Monrovia",
    "Africa/Nairobi",
    "Africa/Ndjamena",
    "Africa/Niamey",
    "Africa/Nouakchott",
    "Africa/Ouagadougou",
    "Africa/Porto-Novo",
    "Africa/Sao_Tome",
    "Africa/Timbuktu",
    "Africa/Tripoli",
    "Africa/Tunis",
    "Africa/Windhoek",
    "America/Adak",
    "America/Anchorage",
    "America/Anguilla",
    "America/Antigua",
    "America/Araguaina",
    "America/Argentina/Buenos_Aires",
    "America/Argentina/Catamarca",
    "America/Argentina/ComodRivadavia",
    "America/Argentina/Cordoba",
    "America/Argentina/Jujuy",
    "America/Argentina/La_Rioja",
    "America/Argentina/Mendoza",
    "America/Argentina/Rio_Gallegos",
    "America/Argentina/Salta",
    "America/Argentina/San_Juan",
    "America/Argentina/San_Luis",
    "America/Argentina/Tucuman",
    "America/Argentina/Ushuaia",
    "America/Aruba",
    "America/Asuncion",
    "America/Atikokan",
    "America/Atka",
    "America/Bahia",
    "America/Bahia_Banderas",
    "America/Barbados",
    "America/Belem",
    "America/Belize",
    "America/Blanc-Sablon",
    "America/Boa_Vista",
    "America/Bogota",
    "America/Boise",
    "America/Buenos_Aires",
    "America/Cambridge_Bay",
    "America/Campo_Grande",
    "America/Cancun",
    "America/Caracas",
    "America/Catamarca",
    "America/Cayenne",
    "America/Cayman",
    "America/Chicago",
    "America/Chihuahua",
    "America/Ciudad_Juarez",
    "America/Coral_Harbour",
    "America/Cordoba",
    "America/Costa_Rica",
    "America/Creston",
    "America/Cuiaba",
    "America/Curacao",
    "America/Danmarkshavn",
    "America/Dawson",
    "America/Dawson_Creek",
    "America/Denver",
    "America/Detroit",
    "America/Dominica",
    "America/Edmonton",
    "America/Eirunepe",
    "America/El_Salvador",
    "America/Ensenada",
    "America/Fort_Nelson",
    "America/Fort_Wayne",
    "America/Fortaleza",
    "America/Glace_Bay",
    "America/Godthab",
    "America/Goose_Bay",
    "America/Grand_Turk",
    "America/Grenada",
    "America/Guadeloupe",
    "America/Guatemala",
    "America/Guayaquil",
    "America/Guyana",
    "America/Halifax",
    "America/Havana",
    "America/Hermosillo",
    "America/Indiana/Indianapolis",
    "America/Indiana/Knox",
    "America/Indiana/Marengo",
    "America/Indiana/Petersburg",
    "America/Indiana/Tell_City",
    "America/Indiana/Vevay",
    "America/Indiana/Vincennes",
    "America/Indiana/Winamac",
    "America/Indianapolis",
    "America/Inuvik",
    "America/Iqaluit",
    "America/Jamaica",
    "America/Jujuy",
    "America/Juneau",
    "America/Kentucky/Louisville",
    "America/Kentucky/Monticello",
    "America/Knox_IN",
    "America/Kralendijk",
    "America/La_Paz",
    "America/Lima",
    "America/Los_Angeles",
    "America/Louisville",
    "America/Lower_Princes",
    "America/Maceio",
    "America/Managua",
    "America/Manaus",
    "America/Marigot",
    "America/Martinique",
    "America/Matamoros",
    "America/Mazatlan",
    "America/Mendoza",
    "America/Menominee",
    "America/Merida",
    "America/Metlakatla",
    "America/Mexico_City",
    "America/Miquelon",
    "America/Moncton",
    "America/Monterrey",
    "America/Montevideo",
    "America/Montreal",
    "America/Montserrat",
    "America/Nassau",
    "America/New_York",
    "America/Nipigon",
    "America/Nome",
    "America/Noronha",
    "America/North_Dakota/Beulah",
    "America/North_Dakota/Center",
    "America/North_Dakota/New_Salem",
    "America/Nuuk",
    "America/Ojinaga",
    "America/Panama",
    "America/Pangnirtung",
    "America/Paramaribo",
    "America/Phoenix",
    "America/Port-au-Prince",
    "America/Port_of_Spain",
    "America/Porto_Acre",
    "America/Porto_Velho",
    "America/Puerto_Rico",
    "America/Punta_Arenas",
    "America/Rainy_River",
    "America/Rankin_Inlet",
    "America/Recife",
    "America/Regina",
    "America/Resolute",
    "America/Rio_Branco",
    "America/Rosario",
    "America/Santa_Isabel",
    "America/Santarem",
    "America/Santiago",
    "America/Santo_Domingo",
    "America/Sao_Paulo",
    "America/Scoresbysund",
    "America/Shiprock",
    "America/Sitka",
    "America/St_Barthelemy",
    "America/St_Johns",
    "America/St_Kitts",
    "America/St_Lucia",
    "America/St_Thomas",
    "America/St_Vincent",
    "America/Swift_Current",
    "America/Tegucigalpa",
    "America/Thule",
    "America/Thunder_Bay",
    "America/Tijuana",
    "America/Toronto",
    "America/Tortola",
    "America/Vancouver",
    "America/Virgin",
    "America/Whitehorse",
    "America/Winnipeg",
    "America/Yakutat",
    "America/Yellowknife",
    "Antarctica/Casey",
    "Antarctica/Davis",
    "Antarctica/DumontDUrville",
    "Antarctica/Macquarie",
    "Antarctica/Mawson",
    "Antarctica/McMurdo",
    "Antarctica/Palmer",
    "Antarctica/Rothera",
    "Antarctica/South_Pole",
    "Antarctica/Syowa",
    "Antarctica/Troll",
    "Antarctica/Vostok",
    "Arctic/Longyearbyen",
    "Asia/Aden",
    "Asia/Almaty",
    "Asia/Amman",
    "Asia/Anadyr",
    "Asia/Aqtau",
    "Asia/Aqtobe",
    "Asia/Ashgabat",
    "Asia/Ashkhabad",
    "Asia/Atyrau",
    "Asia/Baghdad",
    "Asia/Bahrain",
    "Asia/Baku",
    "Asia/Bangkok",
    "Asia/Barnaul",
    "Asia/Beirut",
    "Asia/Bishkek",
    "Asia/Brunei",
    "Asia/Calcutta",
    "Asia/Chita",
    "Asia/Choibalsan",
    "Asia/Chongqing",
    "Asia/Chungking",
    "Asia/Colombo",
    "Asia/Dacca",
    "Asia/Damascus",
    "Asia/Dhaka",
    "Asia/Dili",
    "Asia/Dubai",
    "Asia/Dushanbe",
    "Asia/Famagusta",
    "Asia/Gaza",
    "Asia/Harbin",
    "Asia/Hebron",
    "Asia/Ho_Chi_Minh",
    "Asia/Hong_Kong",
    "Asia/Hovd",
    "Asia/Irkutsk",
    "Asia/Istanbul",
    "Asia/Jakarta",
    "Asia/Jayapura",
    "Asia/Jerusalem",
    "Asia/Kabul",
    "Asia/Kamchatka",
    "Asia/Karachi",
    "Asia/Kashgar",
    "Asia/Kathmandu",
    "Asia/Katmandu",
    "Asia/Khandyga",
    "Asia/Kolkata",
    "Asia/Krasnoyarsk",
    "Asia/Kuala_Lumpur",
    "Asia/Kuching",
    "Asia/Kuwait",
    "Asia/Macao",
    "Asia/Macau",
    "Asia/Magadan",
    "Asia/Makassar",
    "Asia/Manila",
    "Asia/Muscat",
    "Asia/Nicosia",
    "Asia/Novokuznetsk",
    "Asia/Novosibirsk",
    "Asia/Omsk",
    "Asia/Oral",
    "Asia/Phnom_Penh",
    "Asia/Pontianak",
    "Asia/Pyongyang",
    "Asia/Qatar",
    "Asia/Qostanay",
    "Asia/Qyzylorda",
    "Asia/Rangoon",
    "Asia/Riyadh",
    "Asia/Saigon",
    "Asia/Sakhalin",
    "Asia/Samarkand",
    "Asia/Seoul",
    "Asia/Shanghai",
    "Asia/Singapore",
    "Asia/Srednekolymsk",
    "Asia/Taipei",
    "Asia/Tashkent",
    "Asia/Tbilisi",
    "Asia/Tehran",
    "Asia/Tel_Aviv",
    "Asia/Thimbu",
    "Asia/Thimphu",
    "Asia/Tokyo",
    "Asia/Tomsk",
    "Asia/Ujung_Pandang",
    "Asia/Ulaanbaatar",
    "Asia/Ulan_Bator",
    "Asia/Urumqi",
    "Asia/Ust-Nera",
    "Asia/Vientiane",
    "Asia/Vladivostok",
    "Asia/Yakutsk",
    "Asia/Yangon",
    "Asia/Yekaterinburg",
    "Asia/Yerevan",
    "Atlantic/Azores",
    "Atlantic/Bermuda",
    "Atlantic/Canary",
    "Atlantic/Cape_Verde",
    "Atlantic/Faeroe",
    "Atlantic/Faroe",
    "Atlantic/Jan_Mayen",
    "Atlantic/Madeira",
    "Atlantic/Reykjavik",
    "Atlantic/South_Georgia",
    "Atlantic/St_Helena",
    "Atlantic/Stanley",
    "Australia/ACT",
    "Australia/Adelaide",
    "Australia/Brisbane",
    "Australia/Broken_Hill",
    "Australia/Canberra",
    "Australia/Currie",
    "Australia/Darwin",
    "Australia/Eucla",
    "Australia/Hobart",
    "Australia/LHI",
    "Australia/Lindeman",
    "Australia/Lord_Howe",
    "Australia/Melbourne",
    "Australia/NSW",
    "Australia/North",
    "Australia/Perth",
    "Australia/Queensland",
    "Australia/South",
    "Australia/Sydney",
    "Australia/Tasmania",
    "Australia/Victoria",
    "Australia/West",
    "Australia/Yancowinna",
    "Brazil/Acre",
    "Brazil/DeNoronha",
    "Brazil/East",
    "Brazil/West",
    "CET",
    "CST6CDT",
    "Canada/Atlantic",
    "Canada/Central",
    "Canada/Eastern",
    "Canada/Mountain",
    "Canada/Newfoundland",
    "Canada/Pacific",
    "Canada/Saskatchewan",
    "Canada/Yukon",
    "Chile/Continental",
    "Chile/EasterIsland",
    "Cuba",
    "EET",
    "EST",
    "EST5EDT",
    "Egypt",
    "Eire",
    "Etc/GMT",
    "Etc/GMT+0",
    "Etc/GMT+1",
    "Etc/GMT+10",
    "Etc/GMT+11",
    "Etc/GMT+12",
    "Etc/GMT+2",
    "Etc/GMT+3",
    "Etc/GMT+4",
    "Etc/GMT+5",
    "Etc/GMT+6",
    "Etc/GMT+7",
    "Etc/GMT+8",
    "Etc/GMT+9",
    "Etc/GMT-0",
    "Etc/GMT-1",
    "Etc/GMT-10",
    "Etc/GMT-11",
    "Etc/GMT-12",
    "Etc/GMT-13",
    "Etc/GMT-14",
    "Etc/GMT-2",
    "Etc/GMT-3",
    "Etc/GMT-4",
    "Etc/GMT-5",
    "Etc/GMT-6",
    "Etc/GMT-7",
    "Etc/GMT-8",
    "Etc/GMT-9",
    "Etc/GMT0",
    "Etc/Greenwich",
    "Etc/UCT",
    "Etc/UTC",
    "Etc/Universal",
    "Etc/Zulu",
    "Europe/Amsterdam",
    "Europe/Andorra",
    "Europe/Astrakhan",
    "Europe/Athens",
    "Europe/Belfast",
    "Europe/Belgrade",
    "Europe/Berlin",
    "Europe/Bratislava",
    "Europe/Brussels",
    "Europe/Bucharest",
    "Europe/Budapest",
    "Europe/Busingen",
    "Europe/Chisinau",
    "Europe/Copenhagen",
    "Europe/Dublin",
    "Europe/Gibraltar",
    "Europe/Guernsey",
    "Europe/Helsinki",
    "Europe/Isle_of_Man",
    "Europe/Istanbul",
    "Europe/Jersey",
    "Europe/Kaliningrad",
    "Europe/Kiev",
    "Europe/Kirov",
    "Europe/Kyiv",
    "Europe/Lisbon",
    "Europe/Ljubljana",
    "Europe/London",
    "Europe/Luxembourg",
    "Europe/Madrid",
    "Europe/Malta",
    "Europe/Mariehamn",
    "Europe/Minsk",
    "Europe/Monaco",
    "Europe/Moscow",
    "Europe/Nicosia",
    "Europe/Oslo",
    "Europe/Paris",
    "Europe/Podgorica",
    "Europe/Prague",
    "Europe/Riga",
    "Europe/Rome",
    "Europe/Samara",
    "Europe/San_Marino",
    "Europe/Sarajevo",
    "Europe/Saratov",
    "Europe/Simferopol",
    "Europe/Skopje",
    "Europe/Sofia",
    "Europe/Stockholm",
    "Europe/Tallinn",
    "Europe/Tirane",
    "Europe/Tiraspol",
    "Europe/Ulyanovsk",
    "Europe/Uzhgorod",
    "Europe/Vaduz",
    "Europe/Vatican",
    "Europe/Vienna",
    "Europe/Vilnius",
    "Europe/Volgograd",
    "Europe/Warsaw",
    "Europe/Zagreb",
    "Europe/Zaporozhye",
    "Europe/Zurich",
    "GB",
    "GB-Eire",
    "GMT",
    "GMT+0",
    "GMT-0",
    "GMT0",
    "Greenwich",
    "HST",
    "Hongkong",
    "Iceland",
    "Indian/Antananarivo",
    "Indian/Chagos",
    "Indian/Christmas",
    "Indian/Cocos",
    "Indian/Comoro",
    "Indian/Kerguelen",
    "Indian/Mahe",
    "Indian/Maldives",
    "Indian/Mauritius",
    "Indian/Mayotte",
    "Indian/Reunion",
    "Iran",
    "Israel",
    "Jamaica",
    "Japan",
    "Kwajalein",
    "Libya",
    "MET",
    "MST",
    "MST7MDT",
    "Mexico/BajaNorte",
    "Mexico/BajaSur",
    "Mexico/General",
    "NZ",
    "NZ-CHAT",
    "Navajo",
    "PRC",
    "PST8PDT",
    "Pacific/Apia",
    "Pacific/Auckland",
    "Pacific/Bougainville",
    "Pacific/Chatham",
    "Pacific/Chuuk",
    "Pacific/Easter",
    "Pacific/Efate",
    "Pacific/Enderbury",
    "Pacific/Fakaofo",
    "Pacific/Fiji",
    "Pacific/Funafuti",
    "Pacific/Galapagos",
    "Pacific/Gambier",
    "Pacific/Guadalcanal",
    "Pacific/Guam",
    "Pacific/Honolulu",
    "Pacific/Johnston",
    "Pacific/Kanton",
    "Pacific/Kiritimati",
    "Pacific/Kosrae",
    "Pacific/Kwajalein",
    "Pacific/Majuro",
    "Pacific/Marquesas",
    "Pacific/Midway",
    "Pacific/Nauru",
    "Pacific/Niue",
    "Pacific/Norfolk",
    "Pacific/Noumea",
    "Pacific/Pago_Pago",
    "Pacific/Palau",
    "Pacific/Pitcairn",
    "Pacific/Pohnpei",
    "Pacific/Ponape",
    "Pacific/Port_Moresby",
    "Pacific/Rarotonga",
    "Pacific/Saipan",
    "Pacific/Samoa",
    "Pacific/Tahiti",
    "Pacific/Tarawa",
    "Pacific/Tongatapu",
    "Pacific/Truk",
    "Pacific/Wake",
    "Pacific/Wallis",
    "Pacific/Yap",
    "Poland",
    "Portugal",
    "ROC",
    "ROK",
    "Singapore",
    "Turkey",
    "UCT",
    "US/Alaska",
    "US/Aleutian",
    "US/Arizona",
    "US/Central",
    "US/East-Indiana",
    "US/Eastern",
    "US/Hawaii",
    "US/Indiana-Starke",
    "US/Michigan",
    "US/Mountain",
    "US/Pacific",
    "US/Samoa",
    "UTC",
    "Universal",
    "W-SU",
    "WET",
    "Zulu"

    )
    $cbTimezone.Items.AddRange($timezones)
    $cbTimezone.SelectedItem = "UTC"
    $form.Controls.Add($cbTimezone)

    # --- Parsers ---
    $lblParsers = New-Object Windows.Forms.Label
    $lblParsers.Text = "Parsers:"
    $lblParsers.Location = "10,60"
    $lblParsers.AutoSize = $true
    $form.Controls.Add($lblParsers)

    $txtParsers = New-Object Windows.Forms.TextBox
    $txtParsers.Location = "150,60"
    $txtParsers.Width = 300
    $txtParsers.Text = "default"
    $form.Controls.Add($txtParsers)

    $btnParsers = New-Object Windows.Forms.Button
    $btnParsers.Text = "List"
    $btnParsers.Location = "470,58"
    $btnParsers.Width = 60
    $form.Controls.Add($btnParsers)

    $btnParsers.Add_Click({
        # Create new form
        $parsersForm = New-Object Windows.Forms.Form
        $parsersForm.Text = "Available Parsers"
        $parsersForm.Size = New-Object Drawing.Size(400, 300)
        $parsersForm.StartPosition = "CenterParent"

        # Add a multiline textbox with vertical scrollbar
        $txtParsersList = New-Object Windows.Forms.TextBox
        $txtParsersList.Multiline = $true
        $txtParsersList.ScrollBars = "Vertical"
        $txtParsersList.ReadOnly = $true
        $txtParsersList.Dock = "Fill"
        $txtParsersList.Text = '
*********************************** Parsers ************************************
                 Name : Description
--------------------------------------------------------------------------------
    android_app_usage : Parser for Android usage history (usage-history.xml)
                        files.
              asl_log : Parser for Apple System Log (ASL) files.
              bencode : Parser for Bencoded files.
       binary_cookies : Parser for Safari Binary Cookie files.
             bodyfile : Parser for SleuthKit version 3 bodyfile.
              bsm_log : Parser for Basic Security Module (BSM) event auditing
                        files.
         chrome_cache : Parser for Google Chrome or Chromium Cache files.
   chrome_preferences : Parser for Google Chrome Preferences files.
             cups_ipp : Parser for CUPS IPP files.
  custom_destinations : Parser for Custom destinations jump list
                        (.customDestinations-ms) files.
                 czip : Parser for Compound ZIP files.
                esedb : Parser for Extensible Storage Engine (ESE) Database
                        File (EDB) format.
             filestat : Parser for file system stat information.
        firefox_cache : Parser for Mozilla Firefox Cache version 1 file
                        (version 31 or earlier).
       firefox_cache2 : Parser for Mozilla Firefox Cache version 2 file
                        (version 32 or later).
         fish_history : Parser for Fish history files.
            fseventsd : Parser for MacOS File System Events Disk Log Stream
                        (fseventsd) files.
             java_idx : Parser for Java WebStart Cache IDX files.
                jsonl : Parser for JSON-L log files.
                  lnk : Parser for Windows Shortcut (LNK) files.
      locate_database : Parser for Locate database file (updatedb).
         mac_keychain : Parser for MacOS keychain database files.
    mcafee_protection : Parser for McAfee Anti-Virus access protection log
                        files.
                  mft : Parser for NTFS $MFT metadata files.
               msiecf : Parser for Microsoft Internet Explorer (MSIE) 4 - 9
                        cache (index.dat) files.
networkminer_fileinfo : Parser for NetworkMiner .fileinfos files.
                olecf : Parser for OLE Compound File (OLECF) format.
         onedrive_log : Parser for OneDrive Log files.
         opera_global : Parser for Opera global history (global_history.dat)
                        files.
  opera_typed_history : Parser for Opera typed history (typed_history.xml)
                        files.
                   pe : Parser for Portable Executable (PE) files.
                plist : Parser for Property list (plist) files.
           pls_recall : Parser for PL SQL cache file (PL-SQL developer recall
                        file) format.
             prefetch : Parser for Windows Prefetch File (PF).
          recycle_bin : Parser for Windows $Recycle.Bin $I files.
    recycle_bin_info2 : Parser for Windows Recycler INFO2 files.
                rplog : Parser for Windows Restore Point log (rp.log) files.
           simatic_s7 : Parser for SIMATIC S7 Log files.
    spotlight_storedb : Parser for Apple Spotlight store database (store.db)
                        files.
               sqlite : Parser for SQLite database files.
     symantec_scanlog : Parser for Symantec AV Corporate Edition and Endpoint
                        Protection log files.
      systemd_journal : Parser for Systemd journal files.
                 text : Parser for text-based log files.
       trendmicro_url : Parser for Trend Micro Office Web Reputation log files.
        trendmicro_vd : Parser for Trend Micro Office Scan Virus Detection log
                        files.
      unified_logging : Parser for Apple Unified Logging (AUL) 64-bit tracev3
                        files.
              usnjrnl : Parser for NTFS USN change journal ($UsnJrnl:$J) file
                        system metadata files.
                 utmp : Parser for Linux libc6 utmp files.
                utmpx : Parser for Mac OS X 10.5 utmpx files.
            wincc_sys : Parser for WinCC Sys Log files.
  windefender_history : Parser for Windows Defender scan DetectionHistory
                        files.
               winevt : Parser for Windows EventLog (EVT) files.
              winevtx : Parser for Windows XML EventLog (EVTX) files.
               winjob : Parser for Windows Scheduled Task job (or at-job)
                        files.
           winpca_db0 : Parser for Windows PCA DB0 log files.
           winpca_dic : Parser for Windows PCA DIC log files.
               winreg : Parser for Windows NT Registry (REGF) files.
--------------------------------------------------------------------------------

*************************** Parser plugins: bencode ****************************
                Name : Description
--------------------------------------------------------------------------------
bencode_transmission : Parser for Transmission BitTorrent activity files.
    bencode_utorrent : Parser for uTorrent active torrent files.
--------------------------------------------------------------------------------

***************************** Parser plugins: czip *****************************
Name : Description
--------------------------------------------------------------------------------
oxml : Parser for OpenXML (OXML) files.
--------------------------------------------------------------------------------

**************************** Parser plugins: esedb *****************************
               Name : Description
--------------------------------------------------------------------------------
       file_history : Parser for Windows 8 File History ESE database files.
      msie_webcache : Parser for Internet Explorer WebCache ESE database
                      (WebCacheV01.dat, WebCacheV24.dat) files.
               srum : Parser for System Resource Usage Monitor (SRUM) ESE
                      database files.
user_access_logging : Parser for Windows User Access Logging ESE database
                      files.
--------------------------------------------------------------------------------

**************************** Parser plugins: jsonl *****************************
                                Name : Description
--------------------------------------------------------------------------------
                  aws_cloudtrail_log : Parser for AWS CloudTrail Log.
                  azure_activity_log : Parser for Azure Activity Log.
azure_application_gateway_access_log : Parser for Azure Application Gateway
                                       access log.
             docker_container_config : Parser for Docker container
                                       configuration files.
                docker_container_log : Parser for Docker container log files.
                 docker_layer_config : Parser for Docker layer configuration
                                       files.
                             gcp_log : Parser for Google Cloud (GCP) log.
             ios_application_privacy : Parser for iOS Application Privacy
                                       report.
                 microsoft_audit_log : Parser for Microsoft (Office) 365 audit
                                       log.
--------------------------------------------------------------------------------

**************************** Parser plugins: olecf *****************************
                        Name : Description
--------------------------------------------------------------------------------
olecf_automatic_destinations : Parser for Automatic destinations jump list OLE
                               compound file (.automaticDestinations-ms).
               olecf_default : Parser for Generic OLE compound item.
      olecf_document_summary : Parser for Document summary information
                               (\0x05DocumentSummaryInformation).
               olecf_summary : Parser for Summary information
                               (\0x05SummaryInformation) (top-level only).
--------------------------------------------------------------------------------

**************************** Parser plugins: plist *****************************
                        Name : Description
--------------------------------------------------------------------------------
                     airport : Parser for Airport plist files.
                    apple_id : Parser for Apple account information plist
                               files.
                 ios_carplay : Parser for Apple iOS Car Play application plist
                               files.
        ios_identityservices : Parser for Idstatuscache plist files.
                 ipod_device : Parser for iPod, iPad and iPhone plist files.
               launchd_plist : Parser for Launchd plist files.
macos_background_items_plist : Parser for Mac OS backgrounditems.btm or
                               BackgroundItems-v[3-9].btm plist files.
             macos_bluetooth : Parser for MacOS Bluetooth plist files.
       macos_install_history : Parser for MacOS installation history plist
                               files.
     macos_login_items_plist : Parser for Mac OS com.apple.loginitems.plist
                               files.
    macos_login_window_plist : Parser for Mac OS login window plist files.
       macos_software_update : Parser for MacOS software update plist files.
    macos_startup_item_plist : Parser for Mac OS startup item plist files.
                     macuser : Parser for MacOS user plist files.
               plist_default : Parser for plist files.
            safari_downloads : Parser for Safari Downloads plist files.
              safari_history : Parser for Safari history plist files.
                   spotlight : Parser for Spotlight searched terms plist files.
            spotlight_volume : Parser for Spotlight volume configuration plist
                               files.
                time_machine : Parser for MacOS TimeMachine plist files.
--------------------------------------------------------------------------------

**************************** Parser plugins: sqlite ****************************
                     Name : Description
--------------------------------------------------------------------------------
        android_app_usage : Parser for Android app_usage SQLite database
                            (app_usage) files.
            android_calls : Parser for Android call history SQLite database
                            (contacts2.db) files.
              android_sms : Parser for Android text messages (SMS) SQLite
                            database (mmssms.dbs) files.
            android_turbo : Parser for Android turbo SQLite database
                            (turbo.db) files.
          android_webview : Parser for Android WebView SQLite database files.
     android_webviewcache : Parser for Android WebViewCache SQLite database
                            files.
                 appusage : Parser for MacOS application usage SQLite database
                            (application_usage.sqlite) files.
        chrome_17_cookies : Parser for Google Chrome 17 - 65 cookies SQLite
                            database files.
        chrome_27_history : Parser for Google Chrome 27 and later history
                            SQLite database files.
        chrome_66_cookies : Parser for Google Chrome 66 and later cookies
                            SQLite database files.
         chrome_8_history : Parser for Google Chrome 8 - 25 history SQLite
                            database files.
          chrome_autofill : Parser for Google Chrome autofill SQLite database
                            (Web Data) files.
chrome_extension_activity : Parser for Google Chrome extension activity SQLite
                            database files.
                  dropbox : Parser for Dropbox sync history database
                            (sync_history.db) files.
     edge_load_statistics : Parser for SQLite database files.
       firefox_10_cookies : Parser for Mozilla Firefox cookies SQLite database
                            file version 10.
    firefox_118_downloads : Parser for Mozilla Firefox 118 downloads SQLite
                            database (downloads.sqlite) files.
        firefox_2_cookies : Parser for Mozilla Firefox cookies SQLite database
                            file version 2.
        firefox_downloads : Parser for Mozilla Firefox downloads SQLite
                            database (downloads.sqlite) files.
          firefox_history : Parser for Mozilla Firefox history SQLite database
                            (places.sqlite) files.
             google_drive : Parser for Google Drive snapshot SQLite database
                            (snapshot.db) files.
        hangouts_messages : Parser for Google Hangouts conversations SQLite
                            database (babel.db) files.
                 imessage : Parser for MacOS and iOS iMessage database
                            (chat.db, sms.db) files.
            ios_datausage : Parser for iOS data usage SQLite databse
                            (DataUsage.sqlite) file..
             ios_netusage : Parser for iOS network usage SQLite database
                            (netusage.sqlite) files.
             ios_powerlog : Parser for iOS powerlog SQLite database
                            (CurrentPowerlog.PLSQL) files.
           ios_screentime : Parser for iOS Screen Time SQLite database
                            (RMAdminStore-Local.sqlite).
                  kik_ios : Parser for iOS Kik messenger SQLite database
                            (kik.sqlite) files.
                     kodi : Parser for Kodi videos SQLite database
                            (MyVideos.db) files.
            ls_quarantine : Parser for MacOS launch services quarantine events
                            database SQLite database files.
    mac_document_versions : Parser for MacOS document revisions SQLite
                            database files.
           mac_knowledgec : Parser for MacOS Duet/KnowledgeC SQLites database
                            files.
                mac_notes : Parser for MacOS Notes SQLite database
                            (NotesV7.storedata) files.
   mac_notificationcenter : Parser for MacOS Notification Center SQLite
                            database files.
          mackeeper_cache : Parser for MacOS MacKeeper cache SQLite database
                            files.
                 macostcc : Parser for MacOS Transparency, Consent, Control
                            (TCC) SQLite database (TCC.db) files.
         safari_historydb : Parser for Safari history SQLite database
                            (History.db) files.
                    skype : Parser for Skype SQLite database (main.db) files.
    tango_android_profile : Parser for Tango on Android profile SQLite
                            database files.
         tango_android_tc : Parser for Tango on Android TC SQLite database
                            files.
          twitter_android : Parser for Twitter on Android SQLite database
                            files.
              twitter_ios : Parser for Twitter on iOS 8 and later SQLite
                            database (twitter.db) files.
  windows_eventtranscript : Parser for Windows diagnosis EventTranscript
                            SQLite database (EventTranscript.db) files.
windows_push_notification : Parser for Windows 10 push notification SQLite
                            database (wpndatabase.db) files.
         windows_timeline : Parser for Windows 10 timeline SQLite database
                            (ActivitiesCache.db) files.
                zeitgeist : Parser for Zeitgeist activity SQLite database
                            files.
--------------------------------------------------------------------------------

***************************** Parser plugins: text *****************************
                           Name : Description
--------------------------------------------------------------------------------
                 android_logcat : Parser for Android logcat files.
                  apache_access : Parser for Apache access log (access.log)
                                  files.
                    apt_history : Parser for Advanced Packaging Tool (APT)
                                  History log files.
                 aws_elb_access : Parser for AWS ELB Access log files.
                   bash_history : Parser for Bash history files.
              confluence_access : Parser for Confluence access log
                                  (access.log) files.
                        cri_log : Parser for Container Runtime Interface log
                                  files.
                           dpkg : Parser for Debian package manager log
                                  (dpkg.log) files.
                 gdrive_synclog : Parser for Google Drive Sync log files.
                      googlelog : Parser for Google-formatted log files.
                  ios_lockdownd : Parser for iOS lockdown daemon log.
                       ios_logd : Parser for iOS sysdiagnose logd files.
                ios_sysdiag_log : Parser for iOS sysdiag log.
            mac_appfirewall_log : Parser for MacOS Application firewall log
                                  (appfirewall.log) files.
                  mac_securityd : Parser for MacOS security daemon (securityd)
                                  log files.
                       mac_wifi : Parser for MacOS Wi-Fi log (wifi.log) files.
              macos_launchd_log : Parser for Mac OS launchd log files.
             popularity_contest : Parser for Popularity Contest log files.
                     postgresql : Parser for PostgreSQL application log files.
          powershell_transcript : Parser for PowerShell transcript event.
                          santa : Parser for Santa log (santa.log) files.
                           sccm : Parser for System Center Configuration
                                  Manager (SCCM) client log files.
                        selinux : Parser for SELinux audit log (audit.log)
                                  files.
                       setupapi : Parser for Windows SetupAPI log files.
                skydrive_log_v1 : Parser for OneDrive (or SkyDrive) version 1
                                  log files.
                skydrive_log_v2 : Parser for OneDrive (or SkyDrive) version 2
                                  log files.
                  snort_fastlog : Parser for Snort3/Suricata fast-log alert
                                  log (fast.log) files.
                      sophos_av : Parser for Sophos anti-virus log file
                                  (SAV.txt) files.
                         syslog : Parser for System log (syslog) files.
             syslog_traditional : Parser for Traditional system log (syslog)
                                  files.
     teamviewer_application_log : Parser for TeamViewer application log file
                                  parser..
teamviewer_connections_incoming : Parser for TeamViewer
                                  connections_incoming.txt log files.
teamviewer_connections_outgoing : Parser for TeamViewer connections.txt log
                                  files.
                        viminfo : Parser for Viminfo files.
                         vsftpd : Parser for vsftpd log files.
                    winfirewall : Parser for Windows Firewall log files.
                         winiis : Parser for Microsoft IIS log files.
                       xchatlog : Parser for XChat log files.
                xchatscrollback : Parser for XChat scrollback log files.
           zsh_extended_history : Parser for ZSH extended history files.
--------------------------------------------------------------------------------

**************************** Parser plugins: winreg ****************************
                                Name : Description
--------------------------------------------------------------------------------
                             amcache : Parser for AMCache (AMCache.hve).
                      appcompatcache : Parser for Application Compatibility
                                       Cache Registry data.
                              bagmru : Parser for BagMRU (or ShellBags)
                                       Registry data.
                                 bam : Parser for Background Activity
                                       Moderator (BAM) Registry data.
                            ccleaner : Parser for CCleaner Registry data.
               explorer_mountpoints2 : Parser for Windows Explorer mount
                                       points Registry data.
              explorer_programscache : Parser for Windows Explorer Programs
                                       Cache Registry data.
                microsoft_office_mru : Parser for Microsoft Office MRU
                                       Registry data.
               microsoft_outlook_mru : Parser for Microsoft Outlook search MRU
                                       Registry data.
             mrulist_shell_item_list : Parser for Most Recently Used (MRU)
                                       Registry data.
                      mrulist_string : Parser for Most Recently Used (MRU)
                                       Registry data.
           mrulistex_shell_item_list : Parser for Most Recently Used (MRU)
                                       Registry data.
                    mrulistex_string : Parser for Most Recently Used (MRU)
                                       Registry data.
     mrulistex_string_and_shell_item : Parser for Most Recently Used (MRU)
                                       Registry data.
mrulistex_string_and_shell_item_list : Parser for Most Recently Used (MRU)
                                       Registry data.
                           msie_zone : Parser for Microsoft Internet Explorer
                                       zone settings Registry data.
                           mstsc_rdp : Parser for Terminal Server Client
                                       Connection Registry data.
                       mstsc_rdp_mru : Parser for Terminal Server Client Most
                                       Recently Used (MRU) Registry data.
                      network_drives : Parser for Windows network drives
                                       Registry data.
                            networks : Parser for Windows networks
                                       (NetworkList) Registry data.
                          userassist : Parser for User Assist Registry data.
                windows_boot_execute : Parser for Boot Execution Registry data.
                 windows_boot_verify : Parser for Windows boot verification
                                       Registry data.
                         windows_run : Parser for Run and run once Registry
                                       data.
                   windows_sam_users : Parser for Security Accounts Manager
                                       (SAM) users Registry data.
                    windows_services : Parser for Windows drivers and services
                                       Registry data.
                    windows_shutdown : Parser for Windows last shutdown
                                       Registry data.
                  windows_task_cache : Parser for Windows Task Scheduler cache
                                       Registry data.
                    windows_timezone : Parser for Windows time zone Registry
                                       data.
                  windows_typed_urls : Parser for Windows Explorer typed URLs
                                       Registry data.
                 windows_usb_devices : Parser for Windows USB device Registry
                                       data.
             windows_usbstor_devices : Parser for Windows USB Plug And Play
                                       Manager USBStor Registry data.
                     windows_version : Parser for Windows version (product)
                                       Registry data.
                            winlogon : Parser for Windows log-on Registry data.
                          winrar_mru : Parser for WinRAR History Registry data.
                      winreg_default : Parser for Windows Registry data.
--------------------------------------------------------------------------------

******************* Parser presets (plaso\data\presets.yaml) *******************
      Name : Parsers and plugins
--------------------------------------------------------------------------------
   android : android_app_usage, chrome_cache, filestat,
             sqlite/android_app_usage, sqlite/android_calls,
             sqlite/android_sms, sqlite/android_turbo, sqlite/android_webview,
             sqlite/android_webviewcache, sqlite/chrome_8_history,
             sqlite/chrome_17_cookies, sqlite/chrome_27_history,
             sqlite/chrome_66_cookies, sqlite/skype
       ios : jsonl/ios_application_privacy, plist/ios_identityservices,
             sqlite/imessage, sqlite/ios_netusage, sqlite/ios_powerlog,
             sqlite/ios_screentime, sqlite/kik_ios, sqlite/twitter_ios,
             text/ios_lockdownd, text/ios_logd, text/ios_sysdiag_log
     linux : bencode, czip/oxml, jsonl/docker_container_config,
             jsonl/docker_container_log, jsonl/docker_layer_config, filestat,
             olecf, pls_recall, sqlite/google_drive, sqlite/skype,
             sqlite/zeitgeist, systemd_journal, text/apt_history,
             text/bash_history, text/dpkg, text/gdrive_synclog, text/googlelog,
             text/popularity_contest, text/selinux, text/syslog,
             text/syslog_traditional, text/vsftpd, text/xchatlog,
             text/xchatscrollback, text/zsh_extended_history, utmp, webhist
     macos : asl_log, bencode, bsm_log, cups_ipp, czip/oxml, filestat,
             fseventsd, mac_keychain, olecf, plist, spotlight_storedb,
             sqlite/appusage, sqlite/google_drive, sqlite/imessage,
             sqlite/ls_quarantine, sqlite/mac_document_versions,
             sqlite/mac_notes, sqlite/mackeeper_cache, sqlite/mac_knowledgec,
             sqlite/skype, text/bash_history, text/gdrive_synclog,
             text/mac_appfirewall_log, text/mac_securityd, text/mac_wifi,
             text/macos_launchd_log, text/syslog, text/syslog_traditional,
             text/zsh_extended_history, utmpx, webhist
   mactime : bodyfile
   webhist : binary_cookies, chrome_cache, chrome_preferences,
             esedb/msie_webcache, firefox_cache, java_idx, msiecf,
             opera_global, opera_typed_history, plist/safari_history,
             sqlite/chrome_8_history, sqlite/chrome_17_cookies,
             sqlite/chrome_27_history, sqlite/chrome_66_cookies,
             sqlite/chrome_autofill, sqlite/chrome_extension_activity,
             sqlite/firefox_2_cookies, sqlite/firefox_10_cookies,
             sqlite/firefox_downloads, sqlite/firefox_history,
             sqlite/safari_historydb
      win7 : custom_destinations, esedb/file_history,
             esedb/user_access_logging, olecf/olecf_automatic_destinations,
             recycle_bin, text/powershell_transcript, winevtx, win_gen,
             winpca_db0, winpca_dic
 win7_slow : esedb, mft, win7
   win_gen : bencode, czip/oxml, filestat, lnk, mcafee_protection, olecf, pe,
             prefetch, sqlite/google_drive, sqlite/skype, symantec_scanlog,
             text/gdrive_synclog, text/sccm, text/setupapi,
             text/skydrive_log_v1, text/skydrive_log_v2,
             text/teamviewer_application_log,
             text/teamviewer_connections_incoming,
             text/teamviewer_connections_outgoing, text/winfirewall, usnjrnl,
             webhist, winjob, winreg
     winxp : recycle_bin_info2, rplog, win_gen, winevt
winxp_slow : esedb, mft, winxp
--------------------------------------------------------------------------------
        '
        $parsersForm.Controls.Add($txtParsersList)
        [void]$parsersForm.ShowDialog($form)
        #[System.Windows.Forms.MessageBox]::Show($parsersList, "Available Parsers")
    })
    # --- Storage ---
    $lblStorage = New-Object Windows.Forms.Label
    $lblStorage.Text = "Storage file (.plaso):"
    $lblStorage.Location = "10,100"
    $lblStorage.AutoSize = $true
    $form.Controls.Add($lblStorage)

    $txtStorage = New-Object Windows.Forms.TextBox
    $txtStorage.Location = "150,100"
    $txtStorage.Width = 300
    $form.Controls.Add($txtStorage)

    $btnBrowseStorage = New-Object Windows.Forms.Button
    $btnBrowseStorage.Text = "Browse"
    $btnBrowseStorage.Location = "470,98"
    $btnBrowseStorage.Width = 60
    $form.Controls.Add($btnBrowseStorage)

    $btnBrowseStorage.Add_Click({
        $dialog = New-Object Windows.Forms.SaveFileDialog
        $dialog.Filter = "Plaso files (*.plaso)|*.plaso"
        if ($dialog.ShowDialog() -eq "OK") {
            $txtStorage.Text = $dialog.FileName
        }
    })

    # --- Evidence ---
    $lblEvidence = New-Object Windows.Forms.Label
    $lblEvidence.Text = "Evidence path:"
    $lblEvidence.Location = "10,140"
    $lblEvidence.AutoSize = $true
    $form.Controls.Add($lblEvidence)

    $txtEvidence = New-Object Windows.Forms.TextBox
    $txtEvidence.Location = "150,140"
    $txtEvidence.Width = 300
    $form.Controls.Add($txtEvidence)

    # --- Filesystem Timeline ---
    $chkFsTimeline = New-Object Windows.Forms.CheckBox
    $chkFsTimeline.Text = "Add file system timeline"
    $chkFsTimeline.Location = "10,180"
    $chkFsTimeline.AutoSize = $true
    $form.Controls.Add($chkFsTimeline)

    $lblFsFile = New-Object Windows.Forms.Label
    $lblFsFile.Text = "Body file path:"
    $lblFsFile.Location = "30,210"
    $lblFsFile.AutoSize = $true
    $lblFsFile.Visible = $false
    $form.Controls.Add($lblFsFile)

    $txtFsFile = New-Object Windows.Forms.TextBox
    $txtFsFile.Location = "150,210"
    $txtFsFile.Width = 300
    $txtFsFile.Visible = $false
    $form.Controls.Add($txtFsFile)

    $btnBrowseFs = New-Object Windows.Forms.Button
    $btnBrowseFs.Text = "Browse"
    $btnBrowseFs.Location = "470,208"
    $btnBrowseFs.Width = 60
    $btnBrowseFs.Visible = $false
    $form.Controls.Add($btnBrowseFs)

    $chkFsTimeline.Add_CheckedChanged({
        $visible = $chkFsTimeline.Checked
        $lblFsFile.Visible = $visible
        $txtFsFile.Visible = $visible
        $btnBrowseFs.Visible = $visible
    })

    $btnBrowseFs.Add_Click({
        $dialog = New-Object Windows.Forms.OpenFileDialog
        $dialog.Filter = "Body files (*.body;*.txt)|*.body;*.txt|All files (*.*)|*.*"
        if ($dialog.ShowDialog() -eq "OK") {
            $txtFsFile.Text = $dialog.FileName
        }
    })

    # --- Run Psort ---
    $chkRunPsort = New-Object Windows.Forms.CheckBox
    $chkRunPsort.Text = "Run psort after parsing"
    $chkRunPsort.Location = "10,250"
    $chkRunPsort.AutoSize = $true
    $form.Controls.Add($chkRunPsort)

    $chkFilter = New-Object Windows.Forms.CheckBox
    $chkFilter.Text = "Filter with time range"
    $chkFilter.Location = "30,280"
    $chkFilter.AutoSize = $true
    $form.Controls.Add($chkFilter)

    $lblStart = New-Object Windows.Forms.Label
    $lblStart.Text = "Start:"
    $lblStart.Location = "50,310"
    $lblStart.AutoSize = $true
    $form.Controls.Add($lblStart)

    $dtStart = New-Object Windows.Forms.DateTimePicker
    $dtStart.Location = "150,310"
    $dtStart.Width = 200
    $dtStart.Format = [System.Windows.Forms.DateTimePickerFormat]::Custom
    $dtStart.CustomFormat = "yyyy-MM-dd HH:mm:ss"
    $dtStart.ShowUpDown = $true
    $form.Controls.Add($dtStart)

    $lblEnd = New-Object Windows.Forms.Label
    $lblEnd.Text = "End:"
    $lblEnd.Location = "50,340"
    $lblEnd.AutoSize = $true
    $form.Controls.Add($lblEnd)

    $dtEnd = New-Object Windows.Forms.DateTimePicker
    $dtEnd.Location = "150,340"
    $dtEnd.Width = 200
    $dtEnd.Format = [System.Windows.Forms.DateTimePickerFormat]::Custom
    $dtEnd.CustomFormat = "yyyy-MM-dd HH:mm:ss"
    $dtEnd.ShowUpDown = $true
    $form.Controls.Add($dtEnd)

    # --- Run Button ---
    $btnRun = New-Object Windows.Forms.Button
    $btnRun.Text = "Run log2timeline"
    $btnRun.Location = "250,400"
    $btnRun.Width = 150
    $form.Controls.Add($btnRun)

    # --- Run Logic ---
    $btnRun.Add_Click({
        $timezone = $cbTimezone.Text
        $parsers = $txtParsers.Text
        $storage = $txtStorage.Text
        if (-not $storage.EndsWith(".plaso")) {
            $storage = "$storage.plaso"
        }
        $evidence = $txtEvidence.Text  

        $logFile = [System.IO.Path]::ChangeExtension($storage, ".log.gz")
        if ($parsers -eq "default") {
            # If $parsers is "default", exclude the --parsers option
            $cmd = "log2timeline.exe --partition all --timezone $timezone --logfile $logFile --storage_file $storage $evidence"
        } else {
            # Otherwise, include the --parsers option with the specified value
            $cmd = "log2timeline.exe --partition all --timezone $timezone --parsers $parsers --logfile $logFile --storage_file $storage $evidence"
        }
        [System.Windows.Forms.MessageBox]::Show("Running:`n$cmd")
        Invoke-Expression $cmd

        if ($chkFsTimeline.Checked -and $txtFsFile.Text) {
            $fsBodyFile = $txtFsFile.Text
            $cmd = "log2timeline.exe --parsers 'mactime' --logfile $logFile --storage_file '$storage' '$fsBodyFile'"
            [System.Windows.Forms.MessageBox]::Show("Running:`n$cmd")
            Invoke-Expression $cmd
        }

        if ($chkRunPsort.Checked) {
            $psortTimeFilter = ""
            if ($chkFilter.Checked) {
                $start = $dtStart.Value.ToString("yyyy-MM-dd HH:mm:ss")
                $end = $dtEnd.Value.ToString("yyyy-MM-dd HH:mm:ss")
                $psortTimeFilter = "date > '$start' AND date < '$end'"
            }
            $outputCSV = [System.IO.Path]::ChangeExtension($storage, ".csv")
            $cmd = "psort.exe --logfile $logFile -o l2tcsv -w $outputCSV $storage `"$psortTimeFilter`""
            [System.Windows.Forms.MessageBox]::Show("Running:`n$cmd")
            Invoke-Expression $cmd
            [System.Windows.Forms.MessageBox]::Show("Results will be saved to $outputCSV")
        }
    })

    # --- Show Form ---
    $form.Add_Shown({$form.Activate()})
    [void]$form.ShowDialog()
}

Show-PlasoGUI
