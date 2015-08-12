$zipUrl = "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.0.0-windows.zip"
$zipFile = "phantomjs-2.0.0-windows.zip"
$zipDir = "$PSScriptRoot\extracted"
$phantomJsBinDir = "$zipDir\phantomjs-2.0.0-windows\bin"
$jasmineBrowserDir = "$PSScriptRoot\node_modules\gulp-jasmine-browser\lib"

# Download phantomjs zip file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($zipUrl,$zipFile)

# Delete temporary folder if exists
If (Test-Path $zipDir){
  Remove-Item $zipDir -Force -Recurse
}

# Extract phantomjs files to the temporary folder
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory("phantomjs-2.0.0-windows.zip", "extracted")

# Copy phantomjs.exe file to the runner folder 
copy "$phantomJsBinDir\phantomjs.exe" $jasmineBrowserDir
