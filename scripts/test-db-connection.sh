#!/bin/bash

echo "Testing PostgreSQL connection..."

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Test connection
docker compose exec -T postgres psql -U $POSTGRES_USER -d $POSTGRES_DB -c "SELECT version();"

if [ $? -eq 0 ]; then
    echo "✅ Database connection successful!"
else
    echo "❌ Database connection failed!"
    exit 1
fi