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
