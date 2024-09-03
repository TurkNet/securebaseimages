# Docker

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.2 -f ./Dockerfile . --push

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

* dotnet6

```bash
docker buildx build --load --platform=linux/arm64  --tag local/dotnet6 -f ./rtes/dotnet6-core/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/dotnet6 -f ./rtes/dotnet6-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/rtes/dotnet-6:6.0.133-r0-1 -f ./rtes/dotnet6-core/Dockerfile . --push
```

* dotnet7

```bash
docker buildx build --load --platform=linux/arm64  --tag local/dotnet7 -f ./rtes/dotnet7-core/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/dotnet7 -f ./rtes/dotnet7-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/dotnet-7:7.0.120-r0-2 -f ./rtes/dotnet7-core/Dockerfile . --push
```

* dotnet8

[Install New Relic Java agent for Docker](https://docs.newrelic.com/docs/apm/agents/java-agent/additional-installation/install-new-relic-java-agent-docker/)

```bash
docker buildx build --load --platform=linux/arm64  --tag local/dotnet8 -f ./rtes/dotnet8-core/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/dotnet8 -f ./rtes/dotnet8-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/dotnet-8:8.0.8-r0-2 -f ./rtes/dotnet8-core/Dockerfile . --push
```

### JAVA

* Java-8

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java8 -f ./rtes/java-8/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java8 -f ./rtes/java-8/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-8:8.412.08-r1-1 -f ./rtes/java-8/Dockerfile . --push
```

* Java-11

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java11 -f ./rtes/java-11/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java11 -f ./rtes/java-11/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-11:11.0.24-r0-1 -f ./rtes/java-11/Dockerfile . --push
```

* Java-18

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java18 -f ./rtes/java-18/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java18 -f ./rtes/java-18/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-18:18.0.2.1.0-r5-1 -f ./rtes/java-18/Dockerfile . --push
```

* Java-19

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java19 -f ./rtes/java-19/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java19 -f ./rtes/java-19/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-19:19.0.2.7-r5-1 -f ./rtes/java-19/Dockerfile . --push
```

* Java-20

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java20 -f ./rtes/java-20/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java20 -f ./rtes/java-20/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-20:20.0.2.9-r4-1 -f ./rtes/java-20/Dockerfile . --push
```

* Java-21

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java21 -f ./rtes/java-21/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java21 -f ./rtes/java-21/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-21:21.0.4-r1-1 -f ./rtes/java-21/Dockerfile . --push
```

* Java-22

```bash
docker buildx build --load --platform=linux/arm64  --tag local/java22 -f ./rtes/java-22/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/java22 -f ./rtes/java-22/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/java-22:22.0.2-r0-1 -f ./rtes/java-22/Dockerfile . --push
```

### NodeJS

[Install the Node.js agent for Docker](https://docs.newrelic.com/docs/apm/agents/nodejs-agent/installation-configuration/install-nodejs-agent-docker/)

* NodeJS-16

```bash
docker buildx build --load --platform=linux/arm64  --tag local/nodejs16 -f ./rtes/nodejs-16/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/nodejs16 -f ./rtes/nodejs-16/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/nodejs-16:16.20.2-r6-1 -f ./rtes/nodejs-16/Dockerfile . --push
```

* NodeJS-18

```bash
docker buildx build --load --platform=linux/arm64  --tag local/nodejs18 -f ./rtes/nodejs-18/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/nodejs18 -f ./rtes/nodejs-18/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/nodejs-18:18.20.4-r0-1 -f ./rtes/nodejs-18/Dockerfile . --push
```

* NodeJS-19

```bash
docker buildx build --load --platform=linux/arm64  --tag local/nodejs19 -f ./rtes/nodejs-19/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/nodejs19 -f ./rtes/nodejs-19/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/nodejs-19:19.9.0-r8-1 -f ./rtes/nodejs-19/Dockerfile . --push
```

* NodeJS-20

```bash
docker buildx build --load --platform=linux/arm64  --tag local/nodejs20 -f ./rtes/nodejs-20/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/nodejs20 -f ./rtes/nodejs-20/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/nodejs-20:20.17.0-r0-1 -f ./rtes/nodejs-20/Dockerfile . --push
```

* NodeJS-21

```bash
docker buildx build --load --platform=linux/arm64  --tag local/nodejs21 -f ./rtes/nodejs-21/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/nodejs21 -f ./rtes/nodejs-21/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/nodejs-21:21.7.3-r2-1 -f ./rtes/nodejs-21/Dockerfile . --push
```

* NodeJS-22

```bash
docker buildx build --load --platform=linux/arm64  --tag local/nodejs22 -f ./rtes/nodejs-22/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/nodejs22 -f ./rtes/nodejs-22/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/nodejs-22:22.7.0-r0-1 -f ./rtes/nodejs-22/Dockerfile . --push
```

### Python

[Introduction to New Relic for Python](https://docs.newrelic.com/docs/apm/agents/python-agent/getting-started/introduction-new-relic-python/)

* Python 3-10

```bash
docker buildx build --load --platform=linux/arm64  --tag local/python3-10 -f ./rtes/python3-10/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/python3-10 -f ./rtes/python3-10/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/python3-10:3.10.14-r6-1 -f ./rtes/python3-10/Dockerfile . --push
```

* Python 3-11

```bash
docker buildx build --load --platform=linux/arm64  --tag local/python3-11 -f ./rtes/python3-11/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/python3-11 -f ./rtes/python3-11/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/python3-11:3.11.9-r8-1 -f ./rtes/python3-11/Dockerfile . --push
```

* Python 3-12

```bash
docker buildx build --load --platform=linux/arm64  --tag local/python3-12 -f ./rtes/python3-12/Dockerfile .

docker buildx build --load --platform=linux/amd64  --tag local/python3-12 -f ./rtes/python3-12/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64   --tag turknethub/rtes/python3-12:3.12.5-r2-1 -f ./rtes/python3-12/Dockerfile . --push
```

## New Relic Files

[New Relic Source Path](https://download.newrelic.com/dot_net_agent/previous_releases/)

https://nickjanetakis.com/blog/mount-secure-build-time-secrets-with-docker-and-docker-compose