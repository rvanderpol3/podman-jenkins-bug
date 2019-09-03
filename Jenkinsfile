node {
    podTemplate(
        label: "podman-jenkins-bug-pod",
        containers: [
            containerTemplate(
                name: "podman-jenkins-bug-container", 
                image: "labaneilers/podman-jenkins-bug:1", // Image built from build.dockerfile
                ttyEnabled: true,
                privileged: false,
                command: "tail",
                args: "-f /dev/null"
            )]
    ) {
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