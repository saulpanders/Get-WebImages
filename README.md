# Get-WebImages
Recursively downloads images from the target url to a local system, preserving the web relative path

## Usage
To use this script, clone this repo to your local system, then `Import-Module .\Get-WebImages.ps1

To run, simply:
```
PS C:\> Get-WebImages <url> <path>
```

### Arguments
There are two mandatory arguments:
* url
* path

#### Url
remote web host to pull images from

#### Path
location on system where pulled images are stored
