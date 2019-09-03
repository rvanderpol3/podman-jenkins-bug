. values.env

export IMAGE_TAG="labaneilers/podman-bug:$IMAGE_VERSION"

docker build -e -t "$IMAGE_TAG" -f build.nojenkins.dockerfile .
docker push "$IMAGE_TAG"

oc delete pod podman-bug --force --grace-period=0

cat pod.yaml | envsubst | oc create -f -