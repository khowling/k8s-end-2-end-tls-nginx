
## Create dotnet app with https endpoint


build/run app locally: 

> ! BASED ON  : https://learn.microsoft.com/en-us/aspnet/core/security/docker-https?view=aspnetcore-7.0

> ! NOTE: generate cert called `aspnetapp.pfx` in `./cert` directory


```
dotnet publish -c Release -o
docker build -t <ACR>.azurecr.io/dotnet-ssl:0.2 .


docker run --rm -it -p 8000:80 -p 8001:443 -e ASPNETCORE_URLS="https://+;http://+" -e ASPNETCORE_HTTPS_PORT=8001 -e ASPNETCORE_Kestrel__Certificates__Default__Password="<CREDENTIAL_PLACEHOLDER>" -e ASPNETCORE_Kestrel__Certificates__Default__Path=/https/aspnetapp.pfx -v $(pwd)/cert:/https/ <ACR>.azurecr.io/dotnet-ssl:0.2
```

## Deploy to AKS

Upload Cert into keyvault, and use CSI to mount to deployment.


