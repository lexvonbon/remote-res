$textfile = cat ".\dlList.txt"

foreach ($item in $textfile) {     
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
    $client = New-Object System.Net.WebClient;

    $split = $item.ToString().LastIndexOf("/") + 1;
    $fileName = $item.ToString().Substring($split, $item.ToString().Length - $split);
    $client.DownloadFile($item, "C:\Users\MCSstu\Downloads\$filename");
    
}
