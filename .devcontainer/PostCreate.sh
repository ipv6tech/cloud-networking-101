mkdir -p ~/.ssh \
&& ssh-keygen -N "" -f ~/.ssh/one-ring \
&& mkdir -p ~/.oci/ \
&& openssl genrsa -out ~/.oci/oci_key.pem 2048 \
&& chmod 600 ~/.oci/oci_key.pem \
&& openssl rsa -pubout -in ~/.oci/oci_key.pem -out ~/.oci/oci_key_public.pem