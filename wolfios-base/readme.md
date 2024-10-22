# tn-wolfios

Creating base image

```bash
docker buildx build --load --platform=linux/arm64 --tag local/tn-wolfios -f ./wolfios-base/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/tn-wolfios -f ./wolfios-base/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.4-53 -f ./wolfios-base/Dockerfile . --push
```

## Scout

```bash
docker scout quickview

docker scout cves local://local/tn-wolfios:latest
```

* Signing

```bash
cosign sign --key cosign.key turknethub/tn-wolfios:0.0.4-53

cosign verify --key cosign.pub turknethub/tn-wolfios:0.0.4-53
```

* SBOM

```bash
syft attest --key cosign.key -o spdx-json turknethub/tn-wolfios:0.0.4-53 > tn-wolfios-sbom.att.json

cosign attach attestation --attestation tn-wolfios-sbom.att.json turknethub/tn-wolfios:0.0.4-53

cosign verify-attestation --key cosign.pub --type spdxjson turknethub/tn-wolfios:0.0.4-53 | jq '.payload | @base64d | fromjson | .predicate'

#Check vulnerabilities
cosign verify-attestation --key cosign.pub --type spdxjson turknethub/tn-wolfios:0.0.4-53 | jq '.payload | @base64d | fromjson | .predicate' | grype
```

[Using Chainguard](https://edu.chainguard.dev/chainguard/chainguard-images/how-to-use-chainguard-images/)
