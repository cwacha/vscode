$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#Install-BinFile -Name npp-menu -Path $toolsDir\root\install_context_menu_open_with_notepad.cmd
if !(Test-Path $toolsDir\root\data\user-data\User\settings.json -PathType Leaf) {
	Copy-Item $toolsDir\root\data\user-data\User\settings.json.dist $toolsDir\root\data\user-data\User\settings.json
}
