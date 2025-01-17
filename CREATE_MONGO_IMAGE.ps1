$MONGOOriginalImage = "mongo:8.0.1-noble"
$MONGOContainerName = "mongodb"
$NoVolumeMONGOImageName = "mongonovolume"

# Controllo se l'immagine esiste già
$FOUND = docker image ls -q $NoVolumeMONGOImageName
if ($FOUND) {
    Write-Host "Image $NoVolumeMONGOImageName esiste già, LA ELIMINO E RICREO"
    docker rmi -f $FOUND
}

Write-Host "Running container $MONGOContainerName"
docker run -itd --name $MONGOContainerName $MONGOOriginalImage

Write-Host "Wait until container is up"
$NUMATTEMPTS = 0
do {
    Start-Sleep -Seconds 1
    $NUMATTEMPTS++
    $OUT = docker ps --no-trunc --filter "name=^/$MONGOContainerName" --filter "status=running" --format "{{.ID}}"
    Write-Host "Attempt $NUMATTEMPTS"
} while (-not $OUT)

Write-Host "Find anonymous volumes"
$VOLUMIseparatidavirgole = docker ps --no-trunc --filter "name=^/$MONGOContainerName" --filter "status=running" --format "{{.Mounts}}"

Write-Host "Stopping container $MONGOContainerName"
docker stop $MONGOContainerName

Write-Host "Export stopped container"
try {
    docker export $MONGOContainerName -o "${MONGOContainerName}_export.tar"
} catch {
    Write-Host "Errore durante l'esportazione del container. Assicurati che il container sia stato arrestato correttamente."
    exit 1
}

Write-Host "Import image in local Docker registry"
docker import "${MONGOContainerName}_export.tar" $NoVolumeMONGOImageName
Remove-Item "${MONGOContainerName}_export.tar"

Write-Host "Remove stopped container"
docker rm $MONGOContainerName

Write-Host "Remove anonymous volumes"
if ($VOLUMIseparatidavirgole) {
    $VolumeIDs = $VOLUMIseparatidavirgole -split ',\s*' | ForEach-Object {
        $_.Split(':')[0]
    }
    $VolumeIDs | ForEach-Object { docker volume rm -f $_ }
}

Write-Host "List Mongo images"
docker images $NoVolumeMONGOImageName