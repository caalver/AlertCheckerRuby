class ThreatDictionary


  def checkKey(key)

    @dictionary.has_key?(key)

  end

  def lookupviakey(key)

   @dictionary[key]

  end

  def appendemailtexttohithash(hash)

    hash[:emailtext]  = @emailtext
    hash

  end

  def setemailtext(key)

    @emailtext = @dictionary[key]

  end

  def initialize
    @emailtext = "Event not present in event dictionary."

    @dictionary = {
         "SERVER-APACHE Apache Struts remote code execution attempt" => "This is some placeholder text1",
         "INDICATOR-SCAN UPnP service discover attempt" => "This is some placeholder text2",
         "POLICY-OTHER FTP anonymous login attempt" => "This is some placeholder text3",
         "APP-DETECT OpenVAS Scanner User-Agent attempt" => "This is some placeholder text4",
         "MALWARE-CNC Win.Trojan.Pmabot outbound connection" => "This is some placeholder text5",
         "SERVER-IIS Microsoft ASP.NET bad request denial of service attempt" => "This is some placeholder text6",
         "POLICY-OTHER Adobe ColdFusion admin interface access attempt" => "This is some placeholder text7",
         "SERVER-IIS Microsoft Windows IIS directory traversal attempt" => "This is some placeholder text8",
         "SQL url ending in comment characters - possible sql injection attempt" => "This is some placeholder text9",
         "MALWARE-CNC User-Agent known malicious user-agent string ZmEu - vulnerability scanner" => "This is some placeholder text10",
         "POLICY-OTHER Adobe ColdFusion admin API access attempt" => "This is some placeholder text11",
         "SERVER-IIS iissamples access" => "This is some placeholder text12",
         "SERVER-IIS view source via translate header" => "This is some placeholder text13",
         "SQL 1 = 1 - possible sql injection attempt" => "This is some placeholder text14",
         "MALWARE-CNC User-Agent known malicious user agent - Mozilla" => "This is some placeholder text15",
         "INDICATOR-SCAN User-Agent known malicious user-agent Masscan" => "This is some placeholder text16",
         "MALWARE-CNC Win.Trojan.Boda variant outbound connection" => "This is some placeholder text17",
         "SERVER-IIS encoding access" => "This is some placeholder text18",
         "SERVER-OTHER Exim malformed BDAT code execution attempt" => "This is some placeholder text19",
         "SERVER-WEBAPP JBoss JMX console access attempt" => "This is some placeholder text20",
         "APP-DETECT failed FTP login attempt" => "This is some placeholder text21",
         "SERVER-IIS /exchange/root.asp access" => "This is some placeholder text22",
         "SERVER-IIS sgdynamo.exe access" => "This is some placeholder text23",
         "SERVER-IIS viewcode access" => "This is some placeholder text24",
         "SERVER-MAIL EXPN overflow attempt" => "This is some placeholder text25",
         "SERVER-OTHER OpenSSL SSLv3 warning denial of service attempt" => "This is some placeholder text26",
         "SQL generic sql with comments injection attempt - GET parameter" => "This is some placeholder text27",
         "INDICATOR-COMPROMISE c99shell.php command request - about" => "This is some placeholder text28",
         "MALWARE-CNC DeputyDog diskless method outbound connection" => "This is some placeholder text29",
         "MALWARE-CNC User-Agent known malicious user-agent string Morfeus Scanner" => "This is some placeholder text30",
         "OS-WINDOWS Microsoft Lync Server meeting URL XSS attempt" => "This is some placeholder text31",
         "OS-WINDOWS Microsoft generic javascript handler in URI XSS attempt" => "This is some placeholder text32",
         "SERVER-IIS /exchange/root.asp attempt" => "This is some placeholder text33",
         "SERVER-IIS Form_JScript.asp access" => "This is some placeholder text34",
         "SERVER-IIS Synchrologic Email Accelerator userid list access attempt" => "This is some placeholder text35",
         "SERVER-IIS _mem_bin access" => "This is some placeholder text36",
         "SERVER-IIS codebrowser SDK access" => "This is some placeholder text37",
         "SERVER-IIS directory listing" => "This is some placeholder text38",
         "SERVER-IIS global.asa access" => "This is some placeholder text39",
         "SERVER-WEBAPP Avtech IP Camera unauthenticated config access attempt" => "This is some placeholder text40",
         "SERVER-WEBAPP D-Link multiple products HNAP SOAPAction header command injection attempt" => "This is some placeholder text41",
         "SERVER-WEBAPP JBoss JMXInvokerServlet access attempt" => "This is some placeholder text42",
         "SERVER-WEBAPP Linksys E-series HNAP TheMoon remote code execution attempt" => "This is some placeholder text43",
         "SERVER-WEBAPP Netgear DGN1000 series routers arbitrary command execution attempt" => "This is some placeholder text44",
         "SERVER-WEBAPP Netgear DGN1000 series routers authentication bypass attempt" => "This is some placeholder text45",
         "SERVER-WEBAPP Siemens IP-Camera credential disclosure attempt" => "This is some placeholder text46",
         "SQL 1 = 0 - possible sql injection attempt" => "This is some placeholder text47",
         "OS-OTHER Bash CGI environment variable injection attempt" => "This is some placeholder text48",
         "SERVER-IIS Unauthorized IP Access Attempt" => "This is some placeholder text49",
         "SERVER-OTHER OpenSSL TLSv1.1 heartbeat read overrun attempt" => "This is some placeholder text50",
         "MALWARE-CNC Win.Trojan.Zbot variant outbound connection" => "This is some placeholder text51",
         "PUA-P2P GNUTella client request" => "This is some placeholder text52",
         "PUA-P2P Outbound GNUTella client request" => "This is some placeholder text53",
         "SERVER-IIS /SiteServer/Publishing/viewcode.asp access" => "This is some placeholder text54",
         "SERVER-IIS Microsoft IIS Range header integer overflow attempt" => "This is some placeholder text55",
         "SERVER-IIS Microsoft Windows IIS UNC mapped virtual host file source code access attempt" => "This is some placeholder text56",
         "SERVER-IIS cmd.exe access" => "This is some placeholder text57",
         "SERVER-IIS foxweb.dll access" => "This is some placeholder text58",
         "SERVER-IIS foxweb.exe access" => "This is some placeholder text59",
         "SERVER-IIS iisadmin access" => "This is some placeholder text60",
         "SERVER-IIS nsiislog.dll access" => "This is some placeholder text61",
         "SERVER-IIS register.asp access" => "This is some placeholder text62",
         "SERVER-IIS scripts-browse access" => "This is some placeholder text63",
         "SERVER-IIS showcode access" => "This is some placeholder text64",
         "SERVER-IIS srchadm access" => "This is some placeholder text65",
         "SERVER-IIS viewcode.asp access" => "This is some placeholder text66",
         "SERVER-ORACLE Oracle WebLogic Server remote command execution attempt" => "This is some placeholder text67",
     }
end




end