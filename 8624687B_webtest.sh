cat <<EOF > 8624687B_webtest.sh
#!/bin/bash
# Testing UAT server
curl -Is http://8624687B_uatsvr.localdomain | head -n 1 > /tmp/uatsvr-result-file
if grep -q "200 OK" /tmp/uatsvr-result-file; then
    echo "UAT Web Server is running successfully."
else
    echo "Error: UAT Web Server failed."
fi

# Testing Production server
curl -Is http://8624687B_prodsvr.localdomain | head -n 1 > /tmp/prodsvr-result-file
if grep -q "200 OK" /tmp/prodsvr-result-file; then
    echo "Production Web Server is running successfully."
else
    echo "Error: Production Web Server failed."
fi
EOF
chmod +x 8624687B_webtest.sh
