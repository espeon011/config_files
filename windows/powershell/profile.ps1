# Powershell Profile

## PowerShell Core7 でも Console のデフォルトエンコーディングは sjis なので必要
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

## git log などのマルチバイト文字を表示させるため
$env:LESSCHARSET = "utf-8"

## zsh 風の tab 補完
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# vim keybind
Set-PSReadLineOption -EditMode vi

$env:EDITOR = "hx"
$EDITOR = "hx"

# eza
if (Get-Command eza -ErrorAction SilentlyContinue) {
    function ls { eza --icons auto --git --header @args }
    function ll { eza --icons auto --git --header --long @args }
    function la { eza --icons auto --git --header --long --all @args }
    function lt { eza --icons auto --git --header --tree @args }
    Remove-Item Alias:ls -ErrorAction SilentlyContinue
}

# which -> Get-Command
Set-Alias which Get-Command

# scoop
$env:Path = "$HOME\scoop\shims;" + $env:Path

# uv tool
# $env:Path = "$HOME\.local\bin;" + $env:Path

# starship
$env:STARSHIP_CONFIG = "$HOME\.config\starship\config.toml"
Invoke-Expression (& starship init powershell)

