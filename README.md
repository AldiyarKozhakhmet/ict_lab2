# ICT6001 - Laboratory Work № 2
Working with files, directories, command-line pipelines, and automation scripts in Linux (Bash) and Windows (PowerShell).

## Contents
- `scripts/backup.sh` - Automated shell script for backing up the docs directory, handling errors, and cleaning old archives.
- `scripts/backup.ps1` - Equivalent PowerShell backup script.
- `docs/` - Documentation and analysis output (e.g., top10.txt).

## How to run
To execute the backup script:
```bash
./scripts/backup.sh
Working with files, directories, command-line pipelines, and automation scripts in Linux (Bash) and Windows (PowerShell).
- `scripts/backup.sh` - Automated shell script for backing up the docs directory, handling errors, and cleaning old archives.
- `scripts/backup.ps1` - Equivalent PowerShell backup script.
- `docs/` - Documentation and analysis output (e.g., top10.txt).
```bash
./scripts/backup.sh
cat << 'EOF' > scripts/backup.ps1
$ErrorActionPreference = "Stop"
$SrcDir = "$PSScriptRoot/../docs"
$BackupDir = "$PSScriptRoot/../backup"
$LogFile = "$PSScriptRoot/../logs/backup.log"
$DateStr = Get-Date -Format "yyyyMMdd_HHmmss"
$ArchiveName = "docs_backup_$DateStr.zip"
git branch -M main
git remote add origin https://github.com/твой_логин/ict_lab2.git
git push -u origin main
clear
Working with files, directories, command-line pipelines, and automation scripts in Linux (Bash) and Windows (PowerShell).
- `scripts/backup.sh` - Automated shell script for backing up the docs directory, handling errors, and cleaning old archives.
- `scripts/backup.ps1` - Equivalent PowerShell backup script.
- `docs/` - Documentation and analysis output (e.g., top10.txt).
```bash
./scripts/backup.sh
cat << 'EOF' > scripts/backup.ps1
$ErrorActionPreference = "Stop"
$SrcDir = "$PSScriptRoot/../docs"
$BackupDir = "$PSScriptRoot/../backup"
$LogFile = "$PSScriptRoot/../logs/backup.log"
$DateStr = Get-Date -Format "yyyyMMdd_HHmmss"
$ArchiveName = "docs_backup_$DateStr.zip"

if (-Not (Test-Path -Path $SrcDir)) {
    Add-Content -Path $LogFile -Value "[$DateStr] Error: Source directory not found."
    exit
}

Compress-Archive -Path $SrcDir -DestinationPath "$BackupDir\$ArchiveName" -Force
Add-Content -Path $LogFile -Value "[$DateStr] Backup created: $ArchiveName"

Get-ChildItem -Path $BackupDir -Filter "docs_backup_*.zip" | Where-Object { $_.CreationTime -lt (Get-Date).AddDays(-7) } | Remove-Item
