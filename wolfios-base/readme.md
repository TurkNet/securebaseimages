# Packer

[Packer Docker Documentation](https://developer.hashicorp.com/packer/tutorials/docker-get-started/docker-get-started-build-image)

packer init .

packer fmt .

packer validate .

## Packer Docker Plugin

[Packer Docker Plugin](https://developer.hashicorp.com/packer/integrations/hashicorp/docker)

* install docker plugin

```bash
packer plugins install github.com/hashicorp/docker
```


packer build -var 'arch=arm64' build-os.pkr.hcl

packer build -var 'arch=amd64' build-os.pkr.hcl

* tn-wolfios

```bash
docker buildx build --load --platform=linux/arm64 --tag local/tn-wolfios -f ./rtes/dotnet6-core/Dockerfile .

docker buildx build --load --platform=linux/amd64 --tag local/tn-wolfios -f ./rtes/dotnet6-core/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.2 -f ./rtes/dotnet6-core/Dockerfile . --push
```




docker buildx build --load --platform=linux/arm64 --tag local/tn-wolfios -f ./wolfios-base/Dockerfile .

docker buildx build --platform=linux/amd64,linux/arm64  --tag turknethub/tn-wolfios:0.0.2 -f ./wolfios-base/Dockerfile . --push


### Scout

docker scout quickview

docker scout cves local://local/tn-wolfios:latest





[Using Chainguard](https://edu.chainguard.dev/chainguard/chainguard-images/how-to-use-chainguard-images/)