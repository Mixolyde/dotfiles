import 'dart:io';

Future<void> main() async {  
  var now = new DateTime.now();
  String dateStr = "${now.year}${now.month}${now.day}";
  print ("Date String: $dateStr");
  
  // Phone Media Backup
  File backupDrive = new File("/e");
  if(! await backupDrive.exists()){
    print("[!] Backup Drive not detected!");
    exit(1);
  }
  
  File phoneDrive = new File("/d");
  if(! await phoneDrive.exists()){
    print("[!] Phone Drive not detected!");
    exit(1);
  }
  

  
  // destination directories
  String destRoot = "/e/PhoneBackups/${dateStr}_A01_Phone";
  String sourceRoot = "/d";
  List<List<String>> sourceDestPairs = [
    ["$sourceRoot/Data/emu", "$destRoot/emu"],
    ["$sourceRoot/Data/test", "$destRoot/Images/Camera"],
    ["$sourceRoot/Data/test", "$destRoot/Images/WhatsApp Images"],
    ["$sourceRoot/Data/test", "$destRoot/Video/Camera"],
    ["$sourceRoot/Data/test", "$destRoot/Video/WhatsApp Video"],
  ];

  //for each pair, robo copy source to dest
  sourceDestPairs.forEach((pair) async {
    copySourceToDest(pair[0], pair[1]);
  });
  
  //move
  //robocopy "$DestDirForCameraPhotos" "$DestDirForCameraVideo" "*.mp4" /np /MOVE

}

void copySourceToDest(String source, String dest) async {
  print("Copying from $source to $dest");
  File sourceFile = new File(source);
  if(! await sourceFile.exists()){
    print("[!] Source folder $source not detected!");
  }
  
  File destFile = new File(dest);
  await destFile.create(recursive: true);
  
  ProcessResult result = await Process.run(
    "robocopy", 
    [source, dest, "/e", "/w:1", "/np", "/nfl", "/ndl"]);
print("Exit code: ${result.exitCode}");

  //robocopy "1" "2" /e /w:1 /np /nfl /ndl
}


/*
$Summary = [Hashtable]@{NewFilesCount=0; ExistingFilesCount=0}


# New-Item "Folder" -ItemType "directory"
# Copy-Item "$($dateStr)_work" -Destination "" -Force
# if ( Test-Path "$($dateStr)_" -PathType Container ) {
# robocopy "1" "2" /e /w:1 /np /nfl /ndl

function Get-PhoneMainDir($phoneName)
{
  $o = New-Object -com Shell.Application
  $rootComputerDirectory = $o.NameSpace(0x11)
  $phoneDirectory = $rootComputerDirectory.Items() | Where-Object {$_.Name -eq $phoneName} | select -First 1
    
  if($phoneDirectory -eq $null)
  {
    throw "Not found '$phoneName' folder in This computer. Connect your phone."
  }
  
  return $phoneDirectory;
}


function Get-FullPathOfMtpDir($mtpDir)
{
 $fullDirPath = ""
 $directory = $mtpDir.GetFolder
 while($directory -ne $null)
 {
   $fullDirPath =  -join($directory.Title, '\', $fullDirPath)
   $directory = $directory.ParentFolder;
 }
 return $fullDirPath
}



function Copy-FromPhoneSource-ToBackup($sourceMtpDir, $destDirPath)
{
 Create-Dir $destDirPath
 $destDirShell = (new-object -com Shell.Application).NameSpace($destDirPath)
 $fullSourceDirPath = Get-FullPathOfMtpDir $sourceMtpDir

 
 Write-Host "Copying from: '" $fullSourceDirPath "' to '" $destDirPath "'"
 
 $copiedCount, $existingCount = 0
 
 foreach ($item in $sourceMtpDir.GetFolder.Items())
  {
   $itemName = ($item.Name)
   $fullFilePath = Join-Path -Path $destDirPath -ChildPath $itemName

   if($item.IsFolder)
   {
      Write-Host $item.Name " is folder, stepping into"
      Copy-FromPhoneSource-ToBackup  $item (Join-Path $destDirPath $item.GetFolder.Title)
   }
   elseif(Test-Path $fullFilePath)
   {
      Write-Host "Element '$itemName' already exists"
      $existingCount++;
   }
   else
   {
     $copiedCount++;
     Write-Host ("Copying #{0}: {1}{2}" -f $copiedCount, $fullSourceDirPath, $item.Name)
     $destDirShell.CopyHere($item)
   }
  }
  $script:Summary.NewFilesCount += $copiedCount 
  $script:Summary.ExistingFilesCount += $existingCount 
  Write-Host "Copied '$copiedCount' elements from '$fullSourceDirPath'"
}


$phoneName = "Brian G5" #Phone name as it appears in This PC
$phoneRootDir = Get-PhoneMainDir $phoneName

$phoneEmuSourceDir = Get-SubFolder $phoneRootDir "Internal Storage\emu"
Copy-FromPhoneSource-ToBackup $phoneEmuSourceDir $DestDirForEmu

$phonePhotosSourceDir = Get-SubFolder $phoneRootDir "Internal Storage\DCIM\Camera"
Copy-FromPhoneSource-ToBackup $phonePhotosSourceDir $DestDirForCameraPhotos

$phoneWAPhotosSourceDir = Get-SubFolder $phoneRootDir "Internal Storage\WhatsApp\Media\WhatsApp Images"
Copy-FromPhoneSource-ToBackup $phoneWAPhotosSourceDir $DestDirForWhatsAppPhotos

$phoneWAVideoSourceDir = Get-SubFolder $phoneRootDir "Internal Storage\WhatsApp\Media\WhatsApp Video"
Copy-FromPhoneSource-ToBackup $phoneWAVideoSourceDir $DestDirForWhatsAppVideo

write-host ($Summary | out-string)

robocopy "$DestDirForCameraPhotos" "$DestDirForCameraVideo" "*.mp4" /np /MOVE

}

#robocopy "C:\Users\Brian\Documents" "E:\DocumentsBackup" /np /nfl /ndl /e /COPY:DA
#robocopy "C:\Users\Brian\Pictures" "E:\PicturesBackup" /np /nfl /ndl /e /COPY:DA

*/