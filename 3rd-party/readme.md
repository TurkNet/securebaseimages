# Docker

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.4-70 -f ./Dockerfile . --push

## Vulnerability

[Syft GitHub](https://github.com/anchore/syft)
https://github.com/anchore/syft#adding-an-sbom-to-an-image-as-an-attestation-using-syft

[Generate SBOM example](https://github.com/anchore/syft/wiki/Attestation#local-private-key-support)

* Signing

```bash
docker buildx build --platform=linux/amd64,linux/arm64 --tag turknethub/rtes/dotnet-6:6.0.133-r0-1 -f ./rtes/dotnet6-core/Dockerfile . --push

cosign sign --key cosign.key turknethub/rtes/dotnet-6:6.0.133-r0-1

cosign verify --key cosign.pub turknethub/rtes/dotnet-6:6.0.133-r0-1
```

* SBOM

```bash
syft attest --key cosign.key -o spdx-json turknethub/rtes/dotnet-6:6.0.133-r0-1 > dotnet6-sbom.att.json

cosign attach attestation --attestation dotnet6-sbom.att.json turknethub/rtes/dotnet-6:6.0.133-r0-1

cosign verify-attestation --key cosign.pub --type spdxjson turknethub/rtes/dotnet-6:6.0.133-r0-1 | jq '.payload | @base64d | fromjson | .predicate'

#Check vulnerabilities
cosign verify-attestation --key cosign.pub --type spdxjson turknethub/rtes/dotnet-6:6.0.133-r0-1 | jq '.payload | @base64d | fromjson | .predicate' | grype
```

[Grype GitHub](https://github.com/anchore/grype)

docker sbom local/nodejs16 --format syft-json -o nodejs-sbom.json
grype sbom:./nodejs-sbom.json

https://opensource.com/article/21/12/sigstore-container-images

https://www.cncf.io/blog/2022/03/30/trusting-sboms-in-the-software-supply-chain-syft-now-creates-attestations-using-sigstore/

## Build & Repository

### DotNet

* openresty

[LuaRocks](https://luarocks.org)

```bash
docker buildx build --load --platform=linux/arm64  --tag local/openresty -f ./3rd-party/openresty/Dockerfile ./3rd-party/openresty

docker buildx build --load --platform=linux/amd64  --tag local/openresty -f ./3rd-party/openresty/Dockerfile ./3rd-party/openresty

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/openresty:1.21.4.1 -f ./3rd-party/openresty/Dockerfile ./3rd-party/openresty --push
```

* chrome


[Chrome Version List JSON](https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json)
[Chrome Version List](https://googlechromelabs.github.io/chrome-for-testing/)

```bash

docker buildx build --load --platform=linux/amd64  --tag local/chrome -f ./3rd-party/chrome/Dockerfile ./3rd-party/chrome

docker buildx build --platform=linux/amd64  --tag turknethub/chrome:128.0.6613.119-r0.1 -f ./3rd-party/chrome/Dockerfile ./3rd-party/chrome --push

```