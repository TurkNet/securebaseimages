# Docker

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.2 -f ./Dockerfile . --push

# linux/amd64 için
  docker buildx build --load --platform=linux/amd64 --tag local/dotnet:6.0.133-r0 -f ../sdks/dotnet6-core/Dockerfile .

# linux/arm64 için
  docker buildx build --load --platform=linux/arm64 --tag local/dotnet:6.0.133-r0 -f ../sdks/dotnet6-core/Dockerfile .

## Build & Repository

### DotNet

* dotnet6

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet6 -f ./sdks/dotnet6-core/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/dotnet6 -f ./sdks/dotnet6-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64 --tag turknethub/sdks/dotnet-6:6.0.133-r0-1 -f ./sdks/dotnet6-core/Dockerfile . --push
```

* dotnet7

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet7 -f ./sdks/dotnet7-core/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/dotnet7 -f ./sdks/dotnet7-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/dotnet-7:7.0.120-r0-1 -f ./sdks/dotnet7-core/Dockerfile . --push
```

* dotnet8

```bash
docker buildx build --load --platform=linux/arm64 --tag local/dotnet8 -f ./sdks/dotnet8-core/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/dotnet8 -f ./sdks/dotnet8-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/dotnet-8:8.0.8-r0-1 -f ./sdks/dotnet8-core/Dockerfile . --push
```

### JAVA

* Java-8

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java8 -f ./sdks/java-8/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java8 -f ./sdks/java-8/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-8:8.412.08-r1-1 -f ./sdks/java-8/Dockerfile . --push
```

* Java-11

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java11 -f ./sdks/java-11/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java11 -f ./sdks/java-11/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-11:11.0.24-r0-1 -f ./sdks/java-11/Dockerfile . --push
```

* Java-18

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java18 -f ./sdks/java-18/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java18 -f ./sdks/java-18/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-18:18.0.2.1.0-r5-1 -f ./sdks/java-18/Dockerfile . --push
```

* Java-19

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java19 -f ./sdks/java-19/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java19 -f ./sdks/java-19/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-19:19.0.2.7-r5-1 -f ./sdks/java-19/Dockerfile . --push
```

* Java-20

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java20 -f ./sdks/java-20/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java20 -f ./sdks/java-20/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-20:20.0.2.9-r4-1 -f ./sdks/java-20/Dockerfile . --push
```

* Java-21

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java21 -f ./sdks/java-21/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java21 -f ./sdks/java-21/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-21:21.0.4-r1-1 -f ./sdks/java-21/Dockerfile . --push
```

* Java-22

```bash
docker buildx build --load --platform=linux/arm64 --tag local/java22 -f ./sdks/java-22/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/java22 -f ./sdks/java-22/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/java-22:22.0.2-r0-1 -f ./sdks/java-22/Dockerfile . --push
```

### NodeJS

* NodeJS-16

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs16 -f ./sdks/nodejs-16/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/nodejs16 -f ./sdks/nodejs-16/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/nodejs-16:16.20.2-r6-1 -f ./sdks/nodejs-16/Dockerfile . --push
```

* NodeJS-18

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs18 -f ./sdks/nodejs-18/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/nodejs18 -f ./sdks/nodejs-18/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/nodejs-18:18.20.4-r0-1 -f ./sdks/nodejs-18/Dockerfile . --push
```

* NodeJS-19

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs19 -f ./sdks/nodejs-19/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/nodejs19 -f ./sdks/nodejs-19/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/nodejs-19:19.9.0-r8-1 -f ./sdks/nodejs-19/Dockerfile . --push
```

* NodeJS-20

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs20 -f ./sdks/nodejs-20/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/nodejs20 -f ./sdks/nodejs-20/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/nodejs-20:20.17.0-r0-1 -f ./sdks/nodejs-20/Dockerfile . --push
```

* NodeJS-21

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs21 -f ./sdks/nodejs-21/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/nodejs21 -f ./sdks/nodejs-21/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/nodejs-21:21.7.3-r2-1 -f ./sdks/nodejs-21/Dockerfile . --push
```

* NodeJS-22

```bash
docker buildx build --load --platform=linux/arm64 --tag local/nodejs22 -f ./sdks/nodejs-22/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/nodejs22 -f ./sdks/nodejs-22/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/nodejs-22:22.7.0-r0-1 -f ./sdks/nodejs-22/Dockerfile . --push
```

### Python

* Python 3-10

```bash
docker buildx build --load --platform=linux/arm64 --tag local/python3-10 -f ./sdks/python3-10/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/python3-10 -f ./sdks/python3-10/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/python3-10:3.10.14-r6-1 -f ./sdks/python3-10/Dockerfile . --push
```

* Python 3-11

```bash
docker buildx build --load --platform=linux/arm64 --tag local/python3-11 -f ./sdks/python3-11/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/python3-11 -f ./sdks/python3-11/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/python3-11:3.11.9-r8-1 -f ./sdks/python3-11/Dockerfile . --push
```

* Python 3-12

```bash
docker buildx build --load --platform=linux/arm64 --tag local/python3-12 -f ./sdks/python3-12/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/python3-12 -f ./sdks/python3-12/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/sdks/python3-12:3.12.5-r2-1 -f ./sdks/python3-12/Dockerfile . --push
```
