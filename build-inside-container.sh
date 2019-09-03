/init.sh

echo "CAP_SETUID: \$CAP_SETUID"
echo "CAP_SETGID: \$CAP_SETGID"

echo "uid:"
id -u

echo "gid:"
id -g

echo "username:"
whoami

echo "podman info:"
podman info

echo "subuid:"
cat /etc/subuid

echo "subgid:" 
cat /etc/subgid

echo "password:"
cat /etc/passwd

podman build .

tail -f /dev/null