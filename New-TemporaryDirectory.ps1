Function New-TemporaryDirectory{
	$tempDirectoryBase = [System.IO.Path]::GetTempPath();
	$newTempDirPath = [String]::Empty;
	Do {
		[string] $name = [System.Guid]::NewGuid();
		$newTempDirPath = (Join-Path $tempDirectoryBase $name);
	} While (Test-Path $newTempDirPath);

	$create=New-Item -ItemType Directory -Path $newTempDirPath;
    return $create.FullName
}

