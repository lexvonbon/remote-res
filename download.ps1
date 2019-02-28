PARAM ($inputFile)

$textfile = cat $inputFile

foreach ($item in $textfile) {     
    $redirected = [System.Net.WebRequest]::Create($item).GetResponse()
    $redirected.ResponseUri.OriginalString
    $url = $response.ResponseUri.ToString()
    $redirected.Close()
    
    $split = $url.LastIndexOf('/') + 1
    $fileName = $url.Substring($split, $url.Length - $split)
    
    $destination = "$download-to" + $fileName

    Write-Host $destination " curently downloading"

    (New-Object System.Net.WebClient).DownloadFile($url, $destination)
    
}
