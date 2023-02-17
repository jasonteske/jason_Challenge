#!/bin/bash
yum update -y
yum install httpd.x86_64 -y
yum install mod_ssl -y
systemctl start httpd
systemctl enable httpd
sudo touch /etc/httpd/conf.d/jasonteske.com.conf
sudo mkdir /etc/httpd/ssl
echo '<html>' >> /var/www/html/index.html
echo '<head>'  >> /var/www/html/index.html
echo '<title>Hello World</title>' >> /var/www/html/index.html
echo '</head>' >> /var/www/html/index.html
echo '<body>' >> /var/www/html/index.html
echo '<h1>Hello World!</h1>' >> /var/www/html/index.html
echo '</body>' >> /var/www/html/index.html
echo '</html>' >> /var/www/html/index.html
echo '<VirtualHost *:80>' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAdmin me@jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerName jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAlias www.jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  DocumentRoot /var/www/html' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  RewriteEngine on' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  RewriteRule ^/(.*) https://%{HTTP_HOST}/$1 [R,L]' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '</VirtualHost>' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '<VirtualHost *:443>' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAdmin me@jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerName jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  ServerAlias www.jasonteske.com' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  DocumentRoot /var/www/html' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  SSLEngine on' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  SSLCertificateFile /etc/httpd/ssl/jasonteske.com.crt' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '  SSLCertificateKeyFile /etc/httpd/ssl/jasonteske.com.key' >> /etc/httpd/conf.d/jasonteske.com.conf
echo '</VirtualHost>' >> /etc/httpd/conf.d/jasonteske.com.conf
cat >> /etc/httpd/ssl/jasonteske.com.crt << EOF
-----BEGIN CERTIFICATE-----
MIIDODCCAiCgAwIBAgIQaGUvKBh85Evt4SDVGAE60TANBgkqhkiG9w0BAQsFADAu
MRMwEQYDVQQKEwpqdGVza2UgSU5DMRcwFQYDVQQDEw5qYXNvbnRlc2tlLmNvbTAe
Fw0yMzAyMTcyMDM2NTdaFw0yMzAyMjQyMDM2NTdaMC4xEzARBgNVBAoTCmp0ZXNr
ZSBJTkMxFzAVBgNVBAMTDmphc29udGVza2UuY29tMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAu8Uv+g5xDJ3Ar1PhoAr0hW3zFmnpK4RSX2tAUr2cBi2s
+9L7W99RDzPEgTPl4N61Hm4gXACMdQl3eRNOvRH3iz4zOCCQZZUkaD+C98AWQ0kz
jc155VYw494AxUyU1ILizKpJnHmDsZtmNs+A9Je77cLvbhN7fhiLV/Tn8XvQ0veE
wV0yDvoVw3A2qaAWF10dPSI3WrMKgDmd95AoNs45yeCEG1zxqSqOTTaefXdVThwM
KfA2mLxPP955F1fVtFX8SEqFaWjDh7qd0tEvrNH4eTf9gOOezyAyiF7mcXZG3gdm
vd6yz7oPmgbKzbswepVR1vurGXoZcoDKPmoBlV0GDwIDAQABo1IwUDAOBgNVHQ8B
Af8EBAMCBaAwEwYDVR0lBAwwCgYIKwYBBQUHAwEwDAYDVR0TAQH/BAIwADAbBgNV
HREEFDASghAqLmphc29udGVza2UuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQC56dYd
u++TI3PHw1c9mDovXiVIfyJqAAPsDcTphw20YIosCUbxMygDo0gLdRDnCtE1k4U/
81mWshmSIASuCEoBdfN+hpcOdBqMk9g3h16CXbGUhSmJISHnpXdC321Ng5ERsD6m
3/xxbUg4I/N2q638miwRqFA1E3X7EuzD7O+I+8kze9k4ggCwX/UgEUbplv5lYwGd
EKYmmIiKCrgWD9KSwJMVS6JwJTB5aWK8wWA34cihk1QnnHlBlxb3COjNvJPc9ptn
BYRzXR5FFcPT9gjrRQmJGFrfbrsOIsj9fCod21QUy1g3W0vGh/uGYbJkXW2j4RWv
ES3xg4bGxA0K7ii8
-----END CERTIFICATE-----
EOF
cat >> /etc/httpd/ssl/jasonteske.com.key << EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC7xS/6DnEMncCv
U+GgCvSFbfMWaekrhFJfa0BSvZwGLaz70vtb31EPM8SBM+Xg3rUebiBcAIx1CXd5
E069EfeLPjM4IJBllSRoP4L3wBZDSTONzXnlVjDj3gDFTJTUguLMqkmceYOxm2Y2
z4D0l7vtwu9uE3t+GItX9Ofxe9DS94TBXTIO+hXDcDapoBYXXR09IjdaswqAOZ33
kCg2zjnJ4IQbXPGpKo5NNp59d1VOHAwp8DaYvE8/3nkXV9W0VfxISoVpaMOHup3S
0S+s0fh5N/2A457PIDKIXuZxdkbeB2a93rLPug+aBsrNuzB6lVHW+6sZehlygMo+
agGVXQYPAgMBAAECggEACGow2Tr2dANJ1FGlBeAXzzb7MuDyMyIN8vrCejLHIDvB
ydNNsnNSlaTTRJsHzUkNwtxalOTtZn1THljwKWb5ugLCltxWvEavyAA4pVO1a7SH
G+6+bLmtHTkgvbbN4Kww780d2WZUsYvuS7yG4e8+28vloQA8g40kCYAPOPI8jIe5
Xt+gyOW2LZf6EuaT7zuC9CFQUf23nVG4qBoDLAJSrcgDGymwJgHvodji7xmUF/kQ
ZgouHf1is+/MjcqIE3T41raz8n/Fu7Gntl+KwQ9a08gyRD0COo3Aw3fEZj+as9FJ
+TCdHXV8MLU7dB1nrjNbsDH/sMr3v6HyI287C6wjgQKBgQD3aAdE5kW8q0NRNRvs
IiT3lOjJ2qJljdHDnGQoLXIh0vgMcoDb/xJSwM8j8raMOQPG+GtBOG+qOlKAyJ55
PJhEtuJcpVApZ1kuxGSskc4AtXNpW0s0MEqLnZNq/teLRBJClgwxbW0OdrMKndvF
f5DB6HxUqnW/sCTXpss2K4EqQQKBgQDCSt3YMaObI1GfCZi/uMakxeyCkTumgz4a
hiwmj6LPhbWS1uZuEzTw3jSuZ9fHo8Sl2ViqZogHqbg01bu56IbdgvpGeKL/dRHn
sEPLqRU8cBaux/UeN0kdyg/q13fcr9YhECZUk1JaHYmaltNR6WhJis8wiRvWcDC7
/p2enqn8TwKBgC65Vc4cUwVLrt3yUsCoviSH2eLtSIg3XWs86Olxk8Fxj2kCYvWp
WXOJeFVIrFMVHXKBTfg2SVhzxUsPGGa7G+K2S0/F5Lq9Cum7K2wv6SDXI+G83RoR
GLL/YmztjhV+GJi8r7bR/KujnTKfF3dYHSWR25E91BkMkhisJmqnkrBBAoGBAK3S
XPb2MfCxgGxQIaAkp1Ly381QMZWfBQil0QoOpxISBYgBStZfyJVVtrvxm1K4aU4X
TQPmBv0UEgDy1qhUJ5Q1gcNaWjlBe2tUftLNynnvrdtgeSM3Quqrw+HOMyX1ChU6
ZZB03NBSbLEpDpXRw8NHtGUvxP/sDy2hdVJbkKhxAoGAZtFxeXEVIjc6Zde2XmJC
I64ln7K0g8rW6D29hWZ+szD2js0XPFouC9ALZAM0ZGMkcsEbr9GUnI96lYcEWB6+
N9nPNFStB0xSr22Ad88mQuitFs54FmRq6SjxUmZwKbIIgEZIkqvHjw0QjjqkBdZE
3O/pv5ecDBhZNnDFBrN437Y=
-----END PRIVATE KEY-----
EOF 
