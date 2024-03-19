<#
    .Synopsis
    Wipes PowerShell command history.

    .Description
    Alt + F7 and Clear-History don't quite clear PowerShell's command history.
    This command uses them in conjunction with deleting PSReadline's history
    file. Special thanks to all the people who answered the question at
    https://stackoverflow.com/q/13257775.
#>

function Clear-AllHistory {
    # Delete history file.
    Remove-Item $(Get-PSReadlineOption).HistorySavePath

    # These commands clear out the current session.
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [System.Windows.Forms.SendKeys]::Sendwait('%{F7 2}')

    Clear-History
    Clear-Host
}

Export-ModuleMember -Function Clear-AllHistory