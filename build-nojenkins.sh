. values.env

export IMAGE_VERSION="15"

set -e

export IMAGE_TAG="labaneilers/podman-bug:$IMAGE_VERSION"

docker build --build-arg TAG="$IMAGE_TAG" -t "$IMAGE_TAG" -f build.nojenkins.dockerfile .
docker push "$IMAGE_TAG"

set +e
oc delete pod podman-bug --force --grace-period=0

cat pod.yaml | envsubst | oc create -f -