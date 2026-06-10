docker buildx build --platform linux/amd64 --tag registry.turknet.net.tr/securebaseimages/runnerimages/tn-base-runner-dev:0.0.2 -f ./Dockerfile . --push

docker buildx build --platform linux/amd64 --tag registry.turknet.net.tr/securebaseimages/runnerimages/tn-base-runner-prod:0.0.2 -f ./Dockerfile . --push