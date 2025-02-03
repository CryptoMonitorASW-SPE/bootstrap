#!/bin/bash
# Script to rebuild all services except MongoDB and restart MongoDB without stopping it

SERVICES="frontend crypto-market event-dispatcher authentication user-management notification"

echo "🔨 Rebuilding services (excluding MongoDB)..."
docker compose -f docker-composelocale.yml build $SERVICES

echo "🚀 Starting rebuilt services..."
docker compose -f docker-composelocale.yml up -d $SERVICES

echo "♻️ Restarting MongoDB (without stopping)..."
docker compose -f docker-composelocale.yml restart mongodb

echo "✅ All services are up and MongoDB has been restarted safely!"
