#!/bin/bash

# Configuration
URL="http://localhost:8080"
EXPECTED_TEXT="Boardgame Lists V1.0.1"

echo "🚀 Starting Smoke Test for Boardgame Application..."
echo "Checking $URL..."

# 1. Check if the application is reachable
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS_CODE" -eq 200 ] || [ "$STATUS_CODE" -eq 302 ]; then
    echo "✅ Application is reachable (Status: $STATUS_CODE)"
else
    echo "❌ Application is NOT reachable (Status: $STATUS_CODE)"
    exit 1
fi

# 2. Check for key content on the homepage
CONTENT=$(curl -s "$URL")
if echo "$CONTENT" | grep -q "$EXPECTED_TEXT"; then
    echo "✅ Homepage content verified: Found '$EXPECTED_TEXT'"
else
    echo "❌ Homepage content verification FAILED: Could not find '$EXPECTED_TEXT'"
    # Optional: print content for debugging
    # echo "$CONTENT"
    exit 1
fi

# 3. Check if the login page is accessible
LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/login")
if [ "$LOGIN_STATUS" -eq 200 ]; then
    echo "✅ Login page is accessible"
else
    echo "❌ Login page is NOT accessible (Status: $LOGIN_STATUS)"
    exit 1
fi

# 4. Check if the health page is accessible
HEALTH_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/healthz")
if [ "$HEALTH_STATUS" -eq 200 ]; then
    echo "✅ Health page is accessible"
    HEALTH_BODY=$(curl -s "$URL/healthz")
    if echo "$HEALTH_BODY" | grep -q "\"status\":\"UP\""; then
        echo "✅ Application status is UP"
    else
        echo "❌ Application status is NOT UP: $HEALTH_BODY"
        exit 1
    fi
else
    echo "❌ Health page is NOT accessible (Status: $HEALTH_STATUS)"
    exit 1
fi

# 5. Check if H2 Console is reachable (optional but good for smoke tests)
H2_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/h2-console")
if [ "$H2_STATUS" -eq 200 ]; then
    echo "✅ H2 Console is accessible"
else
    echo "⚠️  H2 Console returned $H2_STATUS (This might be expected if disabled in some profiles)"
fi

echo "🎉 Smoke test passed successfully!"
exit 0
