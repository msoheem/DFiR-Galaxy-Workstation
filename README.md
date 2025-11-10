# 🛰️ DFiR Galaxy Workstation

This repository contains support files for the **DFiR Galaxy Workstation** — a preconfigured forensic virtual machine built to streamline Digital Forensics and Incident Response (DFIR) workflows.

All files in this repo are located within the VM at: C:\ForensicPrograms\DFIR_Toolbar

## 📂 Included Files

| File Name | Description |
|------------|-------------|
| **ChangeCurrentEvidenceName.bat** | Changes the current evidence name when you click on **Cases → Add Evidence Name**. |
| **ForensicsHandler.bat** | AI-generated batch file used to parse evidence automatically based on its extension. |
| **ForensicsTools.reg** | Registry file that configures the **Windows Explorer context menu** for forensic tools. |
| **ForensicsTools_v2.reg** | Improved version of the context menu registry file. It addresses the Windows Explorer submenu limit (≈13 visible items). |
| **menu_config** | Configuration file for the DFIR Toolbar interface. |
| **PlasoAddTimelineHelper.bat** | Helper script for running Plaso timeline creation. |
| **plasoHelper.bat / plasoHelper.ps1 / plasoHelperGUI.ps1 / plasoHelperNoGUI.ps1** | A set of helper scripts used by Plaso to process evidence with or without a GUI. |
| **PlasoRunPsortHelper.bat / PlasoRunPsortHelper.ps1** | Plaso post-processing helper scripts for `psort` operations. |

---

## ⚙️ Updating the Context Menu

Windows Explorer limits submenus in the context menu to around **13 visible items**.  
To make all tools accessible, `ForensicsTools_v2.reg` introduces a reorganized structure.

To update:
1. Double-click `ForensicsTools_v2.reg`.
2. Confirm the registry changes when prompted.
3. Restart Windows Explorer (or reboot).

---

## 💾 VM Download

You can download the **DFiR Galaxy Workstation VM** from:
Note: this is the link for v1.2 (latest)

🔗 [https://1024terabox.com/s/1qTKJ1PM-NxdnFVSNbSmzHg](https://1024terabox.com/s/a0J5uOpxptTSb175sqCxnw)

---

## 📘 Documentation

Learn more about the DFiR Galaxy Workstation and its setup:

- 🛰️ [**DFiR Galaxy Workstation: A Swiss Army Knife for DFIR Investigations**](https://medium.com/@mahmoudsoheem/dfir-galaxy-workstation-a-swiss-army-knife-for-dfir-investigations-979d888d024b)  
- 🚀 [**Getting Started with The DFiR Galaxy Workstation**](https://medium.com/@mahmoudsoheem/getting-started-with-the-dfir-galaxy-workstation-7f4b56bfbe1e)  
- 🧰 [**Available Tools in DFiR Galaxy Workstation**](https://medium.com/@mahmoudsoheem/available-tools-in-dfir-galaxy-workstation-b92112a05577)

---

## 🧑‍💻 Author

**Mahmoud Soheem**  
Digital Forensics & Incident Response Engineer  
[LinkedIn](https://www.linkedin.com/in/mahmoudsoheem) • [Medium](https://medium.com/@mahmoudsoheem)

