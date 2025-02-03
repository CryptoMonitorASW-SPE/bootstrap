Write-Output "⏹️ Stopping all services..."
docker compose -f docker-composelocale.yml stop
Write-Output "✅ All services have been stopped."
