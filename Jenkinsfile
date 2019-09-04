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
    image: labaneilers/podman-jenkins-bug:25
    tty: true
    command: [ "tail" ]
    args: [ "-f", "/dev/null" ]
    securityContext:
      privileged: true
""") {
        node("podman-jenkins-bug-pod") {
            container ("podman-jenkins-bug-container") {
                stage("checkout") {
                    checkout scm
                }
                stage("Build") {
                    sh """
                        /init.sh

                        whoami
                        id -u
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