# List of unwanted packages
$unwantedApps = @(
    "*News*",
    "*BingWeather*",
    "*GetHelp*",
    "*Microsoft.Office.Desktop*",
    "*Solitaire*",
    "*CasualGames*",
    "*MicrosoftStickyNotes*",
    "*Microsoft.People*",
    "*FeedbackHub*",
    "*WindowsMaps*",
    "*QuickAssist*",
    "*MoviesTV*",
    "*SpotifyMusic*",
    "*windowscommunicationsapps*",
	"*Microsoft.Getstarted*",
	"*Clipchamp*",
	"*ZuneVideo*",
	"*MicrosoftOfficeHub*",
	"*WindowsAlarms*",
	"*WindowsCamera*",
	"*YourPhone*",
	"*Todos*"
)

foreach ($appPattern in $unwantedApps) {
    # Find the app package
    $app = Get-AppxPackage -Name $appPattern

    # Check if the app exists
    if ($app) {
        # Display app information
        Write-Host "App found: $($app.Name)"
        Write-Host "PackageFullName: $($app.PackageFullName)"
        Write-Host ""

        # Ask for user confirmation
        $confirmation = Read-Host "Do you want to uninstall this app? (y/n)"

        if ($confirmation -eq 'y') {
            # Uninstall the app
            Remove-AppxPackage -Package $app.PackageFullName
            Write-Host "App $($app.Name) uninstalled successfully.`n"
        } else {
            Write-Host "Skipped uninstalling app $($app.Name).`n"
        }
    } else {
        Write-Host "App not found for pattern: $appPattern`n"
    }
}