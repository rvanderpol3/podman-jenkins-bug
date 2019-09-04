/init.sh

echo "CAP_SETUID: \$CAP_SETUID"
echo "CAP_SETGID: \$CAP_SETGID"

echo "id:"
id

echo "username:"
whoami

echo "podman info:"
podman info

echo "subuid:"
cat /etc/subuid

echo "subgid:" 
cat /etc/subgid

# echo "password:"
# cat /etc/passwd

podman build .

echo "podman exit code: $?"

tail -f /dev/null