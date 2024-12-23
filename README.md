# FolderShortcut

  

This PowerShell script is designed to assist in creating a network location for a UNC path on a Windows system. It creates a "folder shortcut" in the %AppData%\Microsoft\Windows\Network Shortcuts\ directory, which will then be displayed as a network location in both File Explorer and the Navigation panel.

  

## Informations

  

Folder shortcuts seems to work like symbolic links but are often confused with regular shortcuts (.lnk) due to limited documentation. Although their use cases are few, they don't require elevated privileges to create. I’ve found them useful for manually creating network locations on Windows, which can be challenging to deploy in a domain-controlled environment. This script allowed me to deploy a desired network location to a specified UNC path via GPO.

  

Reference :

* https://superuser.com/questions/456399/what-different-types-of-shortcut-are-there

  

## Disclaimer

  

This script is provided as-is without any warranties. Use it at your own risk. The author is not responsible for any damage, data loss, or unintended consequences that may occur as a result of running this script.

