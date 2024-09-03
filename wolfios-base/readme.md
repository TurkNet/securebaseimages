# tn-wolfios

Creating base image

```bash
docker buildx build --load --platform=linux/arm64 --tag local/tn-wolfios -f ./wolfios-base/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/tn-wolfios -f ./wolfios-base/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.2 -f ./wolfios-base/Dockerfile . --push
```

## Scout

```bash
docker scout quickview

docker scout cves local://local/tn-wolfios:latest
```

[Using Chainguard](https://edu.chainguard.dev/chainguard/chainguard-images/how-to-use-chainguard-images/)
