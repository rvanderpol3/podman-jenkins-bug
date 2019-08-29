# Dynamically create a "jenkins" user when the container starts
# tha maps to the uid that OpenShift has assigned to the container

userid=$(id -u)
username="jenkins"

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${username}:x:${userid}:0:${username}:/usr/sbin:/usr/sbin/nologin" >> /etc/passwd
  fi
fi

echo "devkit-build-tools version: $TAG"