# Docker

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.4-56 -f ./Dockerfile . --push

# linux/amd64 için
  docker buildx build --load --platform=linux/amd64 --tag local/dotnet:6.0.133-r0 -f ../sdk/dotnet6/Dockerfile .

# linux/arm64 için
  docker buildx build --load --platform=linux/arm64 --tag local/dotnet:6.0.133-r0 -f ../sdk/dotnet6/Dockerfile .

## Build & Repository

### DotNet

| Version | Release type | Support phase | Latest release | Latest release date | End of support |
|---|---|---|---|---|---|
| .NET 8.0 (latest) | Long Term Support | Active | 8.0.8 | August 15, 2024 | November 10, 2026|
|.NET 6.0 | Long Term Support | Maintenance | 6.0.33 | August 13, 2024 | November 12, 2024|

**LTS Tooltip**: Long Term Support (LTS) releases have an extended support period (3 years). Use LTS if you need to stay supported on the same version of .NET for longer.
**Active Tooltip**: During the active support period, .NET releases are updated to improve functional capabilities and mitigate security vulnerabilities.
**Maintenance Tooltip**: The last 6 months of support before the release reaches end of life. During the maintenance support period, .NET releases are updated to mitigate security vulnerabilities only.

[dotnet LTS](https://dotnet.microsoft.com/en-us/download/dotnet)

[dotnet-install-script](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script)

* **dotnet3**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet3 -f ./sdk/dotnet3/Dockerfile ./sdk/dotnet3

docker buildx build --load --platform=linux/amd64 --tag local/dotnet3 -f ./sdk/dotnet3/Dockerfile ./sdk/dotnet3

docker buildx build --platform=linux/amd64,linux/arm64 --tag turknethub/sdk/dotnet-3:3.1.426-1 -f ./sdk/dotnet3/Dockerfile ./sdk/dotnet3 --push

trivy image local/dotnet3
```

* **dotnet6**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet6 -f ./sdk/dotnet6/Dockerfile ./sdk/dotnet6

docker buildx build --load --platform=linux/amd64 --tag local/dotnet6 -f ./sdk/dotnet6/Dockerfile ./sdk/dotnet6

docker buildx build --platform=linux/amd64,linux/arm64 --tag turknethub/sdk/dotnet-6:6.0.133-r0-1 -f ./sdk/dotnet6/Dockerfile ./sdk/dotnet6 --push

trivy image local/dotnet6
```

* **dotnet7**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet7 -f ./sdk/dotnet7/Dockerfile ./sdk/dotnet7

docker buildx build --load --platform=linux/amd64 --tag local/dotnet7 -f ./sdk/dotnet7/Dockerfile ./sdk/dotnet7

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/dotnet-7:7.0.120-r0-1 -f ./sdk/dotnet7/Dockerfile ./sdk/dotnet7 --push

trivy image local/dotnet7
```

* **dotnet8**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet8 -f ./sdk/dotnet8/Dockerfile ./sdk/dotnet8

docker buildx build --load --platform=linux/amd64 --tag local/dotnet8 -f ./sdk/dotnet8/Dockerfile ./sdk/dotnet8

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/dotnet-8:8.0.8-r0-1 -f ./sdk/dotnet8/Dockerfile ./sdk/dotnet8 --push

trivy image local/dotnet8
```

### JAVA

* **Java-8**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java8 -f ./sdk/java-8/Dockerfile ./sdk/java-8

docker buildx build --load --platform=linux/amd64 --tag local/java8 -f ./sdk/java-8/Dockerfile ./sdk/java-8

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-8:8.412.08-r1-1 -f ./sdk/java-8/Dockerfile ./sdk/java-8 --push

trivy image local/java8
```

* **Java-11**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java11 -f ./sdk/java-11/Dockerfile ./sdk/java-11

docker buildx build --load --platform=linux/amd64 --tag local/java11 -f ./sdk/java-11/Dockerfile ./sdk/java-11

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-11:11.0.24-r0-1 -f ./sdk/java-11/Dockerfile ./sdk/java-11 --push

trivy image local/java11
```

* **Java-18**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java18 -f ./sdk/java-18/Dockerfile ./sdk/java-18

docker buildx build --load --platform=linux/amd64 --tag local/java18 -f ./sdk/java-18/Dockerfile ./sdk/java-18

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-18:18.0.2.1.0-r5-1 -f ./sdk/java-18/Dockerfile ./sdk/java-18 --push

trivy image local/java18
```

* **Java-19**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java19 -f ./sdk/java-19/Dockerfile ./sdk/java-19

docker buildx build --load --platform=linux/amd64 --tag local/java19 -f ./sdk/java-19/Dockerfile ./sdk/java-19

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-19:19.0.2.7-r5-1 -f ./sdk/java-19/Dockerfile ./sdk/java-19 --push

trivy image local/java19
```

* **Java-20**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java20 -f ./sdk/java-20/Dockerfile ./sdk/java-20

docker buildx build --load --platform=linux/amd64 --tag local/java20 -f ./sdk/java-20/Dockerfile ./sdk/java-20

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-20:20.0.2.9-r4-1 -f ./sdk/java-20/Dockerfile ./sdk/java-20 --push

trivy image local/java20
```

* **Java-21**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java21 -f ./sdk/java-21/Dockerfile ./sdk/java-21

docker buildx build --load --platform=linux/amd64 --tag local/java21 -f ./sdk/java-21/Dockerfile ./sdk/java-21

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-21:21.0.4-r1-1 -f ./sdk/java-21/Dockerfile ./sdk/java-21 --push

trivy image local/java21
```

* **Java-22**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java22 -f ./sdk/java-22/Dockerfile ./sdk/java-22

docker buildx build --load --platform=linux/amd64 --tag local/java22 -f ./sdk/java-22/Dockerfile ./sdk/java-22

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/java-22:22.0.2-r0-1 -f ./sdk/java-22/Dockerfile ./sdk/java-22 --push

trivy image local/java22
```

### NodeJS

* **NodeJS-16**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs16 -f ./sdk/nodejs-16/Dockerfile ./sdk/nodejs-16

docker buildx build --load --platform=linux/amd64 --tag local/nodejs16 -f ./sdk/nodejs-16/Dockerfile ./sdk/nodejs-16

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/nodejs-16:16.20.2-r6-1 -f ./sdk/nodejs-16/Dockerfile ./sdk/nodejs-16 --push

trivy image local/nodejs16
```

* **NodeJS-18**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs18 -f ./sdk/nodejs-18/Dockerfile ./sdk/nodejs-18

docker buildx build --load --platform=linux/amd64 --tag local/nodejs18 -f ./sdk/nodejs-18/Dockerfile ./sdk/nodejs-18

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/nodejs-18:18.20.4-r0-1 -f ./sdk/nodejs-18/Dockerfile ./sdk/nodejs-18 --push

trivy image local/nodejs18
```

* **NodeJS-19**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs19 -f ./sdk/nodejs-19/Dockerfile ./sdk/nodejs-19

docker buildx build --load --platform=linux/amd64 --tag local/nodejs19 -f ./sdk/nodejs-19/Dockerfile ./sdk/nodejs-19

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/nodejs-19:19.9.0-r8-1 -f ./sdk/nodejs-19/Dockerfile ./sdk/nodejs-19 --push

trivy image local/nodejs19
```

* **NodeJS-20**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs20 -f ./sdk/nodejs-20/Dockerfile ./sdk/nodejs-20

docker buildx build --load --platform=linux/amd64 --tag local/nodejs20 -f ./sdk/nodejs-20/Dockerfile ./sdk/nodejs-20

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/nodejs-20:20.17.0-r0-1 -f ./sdk/nodejs-20/Dockerfile ./sdk/nodejs-20 --push

trivy image local/nodejs20
```

* **NodeJS-21**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs21 -f ./sdk/nodejs-21/Dockerfile ./sdk/nodejs-21

docker buildx build --load --platform=linux/amd64 --tag local/nodejs21 -f ./sdk/nodejs-21/Dockerfile ./sdk/nodejs-21

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/nodejs-21:21.7.3-r2-1 -f ./sdk/nodejs-21/Dockerfile ./sdk/nodejs-21 --push

trivy image local/nodejs21
```

* **NodeJS-22**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs22 -f ./sdk/nodejs-22/Dockerfile ./sdk/nodejs-22

docker buildx build --load --platform=linux/amd64 --tag local/nodejs22 -f ./sdk/nodejs-22/Dockerfile ./sdk/nodejs-22

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/nodejs-22:22.7.0-r0-1 -f ./sdk/nodejs-22/Dockerfile ./sdk/nodejs-22 --push

trivy image local/nodejs22
```

### Python

* **Python 3-10**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/python3-10 -f ./sdk/python3-10/Dockerfile ./sdk/python3-10

docker buildx build --load --platform=linux/amd64 --tag local/python3-10 -f ./sdk/python3-10/Dockerfile ./sdk/python3-10

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/python3-10:3.10.14-r6-1 -f ./sdk/python3-10/Dockerfile ./sdk/python3-10 --push

trivy image local/python3-10
```

* **Python 3-11**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/python3-11 -f ./sdk/python3-11/Dockerfile ./sdk/python3-11

docker buildx build --load --platform=linux/amd64 --tag local/python3-11 -f ./sdk/python3-11/Dockerfile ./sdk/python3-11

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/python3-11:3.11.9-r8-1 -f ./sdk/python3-11/Dockerfile ./sdk/python3-11 --push

trivy image local/python3-11
```

* **Python 3-12**

```bash
docker buildx build --load --platform=linux/arm64 --tag local/python3-12 -f ./sdk/python3-12/Dockerfile ./sdk/python3-12

docker buildx build --load --platform=linux/amd64 --tag local/python3-12 -f ./sdk/python3-12/Dockerfile ./sdk/python3-12

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdk/python3-12:3.12.5-r2-1 -f ./sdk/python3-12/Dockerfile ./sdk/python3-12 --push

trivy image local/python3-12
```
