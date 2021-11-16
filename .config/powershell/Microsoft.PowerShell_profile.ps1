### PowerShell User Configuration File ###

## Install Modules
if ( -Not(Get-Module -ListAvailable -Name oh-my-posh)) {
    Install-Module oh-my-posh -Scope CurrentUser
}

## Import and Update Modules
Import-Module oh-my-posh
#Update-Module oh-my-posh

## Theme
Set-PoshPrompt -Theme fish
Enable-PoshTransientPrompt

## Aliases
Function Show-All { Get-ChildItem -Attributes ReadOnly,Hidden,System,Directory,Archive,Device,Normal,Temporary,SparseFile,ReparsePoint,Compressed,Offline,NotContentIndexed,Encrypted,IntegrityStream,NoScrubData $args }
Set-Alias -Name "ll" -Value Show-All

Function Update-Repo { git submodule update --init --recursive; git fetch; git pull --ff-only; git submodule foreach git fetch }
Set-Alias -Name "git-update" -Value Update-Repo

Function Reset-Repo { git add .; git reset --hard; git fetch -a; git pull --ff-only; git submodule deinit --all --force; git submodule update --init --recursive; git submodule sync }
Set-Alias -Name "git-refresh" -Value Reset-Repo