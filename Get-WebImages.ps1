function Get-WebImages {
<#
    .SYNOPSIS
        Parses the images from a web site and writes images to a directory
    .DESCRIPTION
        Get-WebImages is a wrapper for Invoke-WebRequest + some parsing and directory creation.
        Currently the only parameters are URL which is mandatory and system path to write output to.
#>
[CmdletBinding()]
[ValidateNotNullorEmpty()]
param(
        [Parameter(Mandatory)]
        [string]$url,
		
		[Parameter(Mandatory)]
		[string]$path,

        [Parameter()]
        [string]$length=0

)
            write-host $url                 
            [System.Uri]$URLString = $url


            #At this point $URL is a string with just the URL and querystring as requested
            $URLString

            #Heres how you might interrogate it
            [system.uri]$URL = $URLString
            #$Token = ($URL.Query -split '=')[1]
            #Write-Host $URL.host
            #Write-Host $Token

            
            if ((Invoke-WebRequest $URLString -Method Head).StatusCode -eq 200) {

                #Does it exist? then start bulk download

                $Images = (Invoke-WebRequest $URLString).Images.src

                $path += $URL.AbsolutePath.Replace("/", "\")

                
                If(!(test-path $path)) {
                   
                    New-Item -ItemType Directory -Force -Path $path
                }


                foreach ($img in $Images) {
				
				
					write-host $path
                    Start-BitsTransfer -Source $img -Destination $path -TransferType Download
                }

            }
            else {
                Write-Host "Error: host unreachable"
            }

}