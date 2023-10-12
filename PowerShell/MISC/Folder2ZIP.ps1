function Compress-Subfolders
{
    param
    (
        [Parameter(Mandatory = $true)][string] $InputFolder,
        [Parameter(Mandatory = $true)][string] $OutputFolder
    )

    $subfolders = Get-ChildItem $InputFolder | Where-Object { $_.PSIsContainer }

    ForEach ($s in $subfolders) 
    {
        $path = $s 
        write-host("-----------" + $s)
        $path
        #Set-Location $path.FullName
        $fullpath = $path.FullName
        $pathName = $path.BaseName

        #Get all items 
        #$items = Get-ChildItem

        $zipname = $path.name + ".zip"
        $zippath = $outputfolder + $zipname
        $t = ($path.FullName.replace("[","``[").replace("]","``]") )

        Compress-Archive -Path $t -DestinationPath $zippath
        write-host("-----------+" + $t)
    }
}

Compress-Subfolders -InputFolder "D:\m365-alfresco-migration\cmis\*" -OutputFolder "D:\m365-alfresco-migration\zip\"

#___________For test___________

#$s = $subfolders[2]
#$d = $s.FullName.Replace("[","`[").Replace("]","`]")
#Compress-Archive -$s -DestinationPath C:\work\Pour_test_toZip\La_bas\test.zip
