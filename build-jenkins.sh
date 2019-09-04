export IMAGE_VERSION="25"

export IMAGE_TAG="labaneilers/podman-jenkins-bug:$IMAGE_VERSION"

docker build --build-arg TAG="$IMAGE_VERSION" -t "$IMAGE_TAG" -f build.nojenkins.dockerfile .
docker push "$IMAGE_TAG"