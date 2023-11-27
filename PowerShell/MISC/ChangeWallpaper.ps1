# Path to the image to be used as wallpaper
$imagePath = "C:\path\to\your\wallpaper.jpg"

# Registry location for wallpaper settings
$RegPath = "HKCU:\Control Panel\Desktop"
$WallpaperPath = $imagePath
$WallpaperStyle = 0  # 0: Fill, 2: Fit, 6: Stretch, 10: Span, 22: Tile
$TileWallpaper = 0   # 0: No, 1: Yes

# Setting up the wallpaper
Set-ItemProperty -Path $RegPath -Name Wallpaper -Value $WallpaperPath
Set-ItemProperty -Path $RegPath -Name WallpaperStyle -Value $WallpaperStyle
Set-ItemProperty -Path $RegPath -Name TileWallpaper -Value $TileWallpaper

# Refreshing wallpaper settings
$signature = @"
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
"@
$SPI_SETDESKWALLPAPER = 0x0014
$UpdateIniFile = 0x01
$SendChangeEvent = 0x02

$null = Add-Type -MemberDefinition $signature -Name User32 -Namespace Win32Functions -PassThru

# Changing the wallpaper
[Win32Functions.User32]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, ($UpdateIniFile -bor $SendChangeEvent))
