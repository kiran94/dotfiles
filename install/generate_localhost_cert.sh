# https://www.humankode.com/asp-net-core/develop-locally-with-https-self-signed-certificates-and-asp-net-core

BASE=~/.certificates/
CONFIG=$BASE/localhost.conf
KEY_FILE=$BASE/localhost.key
CERT_FILE=$BASE/localhost.crt
PFX_FILE=$BASE/localhost.pfx

mkdir -p $BASE

# These two need to be added to bashrc afterwards so they are loaded
# in login
# For the password, it's probably not so important for the sake
# of local development.
export ASPNETCORE_Kestrel__Certificates__Default__Path=$PFX_FILE
export ASPNETCORE_Kestrel__Certificates__Default__Password=Password123

cat << EOL > $CONFIG
[req]
default_bits       = 2048
default_keyfile    = localhost.key
distinguished_name = req_distinguished_name
req_extensions     = req_ext
x509_extensions    = v3_ca

[req_distinguished_name]
countryName                 = Country Name (2 letter code)
countryName_default         = US
stateOrProvinceName         = State or Province Name (full name)
stateOrProvinceName_default = New York
localityName                = Locality Name (eg, city)
localityName_default        = Rochester
organizationName            = Organization Name (eg, company)
organizationName_default    = localhost
organizationalUnitName      = organizationalunit
organizationalUnitName_default = Development
commonName                  = Common Name (e.g. server FQDN or YOUR name)
commonName_default          = localhost
commonName_max              = 64

[req_ext]
subjectAltName = @alt_names

[v3_ca]
subjectAltName = @alt_names

[alt_names]
DNS.1   = localhost
DNS.2   = 127.0.0.1
EOL


# Generate and Apply the Certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY_FILE -out $CERT_FILE -config $CONFIG -passin pass:$ASPNETCORE_Kestrel__Certificates__Default__Password
sudo openssl pkcs12 -export -out $PFX_FILE -inkey $KEY_FILE -in $CERT_FILE
sudo certutil -d sql:$HOME/.pki/nssdb -A -t "P,," -n "localhost" -i $CERT_FILE

# List the Existing Certificates
# certutil -L -d sql:${HOME}/.pki/nssdb

# Delete the Existing Certificate
# certutil -D -d sql:${HOME}/.pki/nssdb -n "localhost"

# Open up access to the file otherwise the server cannot access it
# https://github.com/dotnet/runtime/issues/24051
sudo chmod 777 $PFX_FILE





