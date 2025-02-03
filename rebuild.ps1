# Define the services to rebuild (excluding MongoDB)
$services = "frontend", "crypto-market", "event-dispatcher", "authentication", "user-management", "notification"

Write-Output "🔨 Rebuilding services (excluding MongoDB)..."
docker compose -f docker-composelocale.yml build $services

Write-Output "🚀 Starting rebuilt services..."
docker compose -f docker-composelocale.yml up -d $services

Write-Output "♻️ Restarting MongoDB (without stopping)..."
docker compose -f docker-composelocale.yml restart mongodb

Write-Output "✅ All services are up and MongoDB has been restarted safely!"
