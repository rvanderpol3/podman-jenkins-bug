node {
    podTemplate(
        label: "podman-jenkins-bug-pod",
        yaml: """apiVersion: v1
kind: Pod
metadata:
  generateName: podman-jenkins-bug-pod-
  labels: 
    name: podman-jenkins-bug-pod
    label: podman-jenkins-bug-pod
spec:
  containers:
  - name: podman-jenkins-bug-container
    image: labaneilers/podman-jenkins-bug:13
    tty: true
    command: [ "tail" ]
    args: [ "-f", "/dev/null" ]
""") {
        node("podman-jenkins-bug-pod") {
            container ("podman-jenkins-bug-container") {
                stage("checkout") {
                    checkout scm
                }
                stage("Build") {
                    sh """
                        /init.sh

                        echo "CAP_SETUID: \$CAP_SETUID"
                        echo "CAP_SETGID: \$CAP_SETGID"

                        whoami
                        podman info

                        echo "subuid:"
                        cat /etc/subuid

                        echo "subgid:" 
                        cat /etc/subgid

                        echo "password:"
                        cat /etc/passwd

                        podman build .
                    """
                }
            }
        }
    }
}