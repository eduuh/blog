---
title: 'Azure Container Registry With NodeJs Container'
date: 2020-08-07T07:41:06-07:00
draft: false
description: 'Nodejs container. Deploy an Azure container registry. Building a container image using Azure container Registry'

categories:
  - azure
tags:
  - cli
series:
  - docker

image: images/azure/containeregistry.png
authorEmoji: ☁
---

You would consider Azure Container Registry. When you want to **manage a Private Docker Registry**

#### Learning Objectives.

{{<boxmd>}}

- Deploy an **Azure container registry using Cli**
- Build a container image using **Azure Container Registry Tasks**
- Deploy the container to **Azure container instance**
- **Replicate the container image** to multiple Azure regions.

{{</boxmd>}}

#### Create an Azure container registry.

1. Sign into the [Azure portal](portal.azure.com) with your Azure subscription.
2. Open the Azure cloud Shell from the **Azure portal using the Cloud shell**
3. Create a new **Resource group**. Name it **azurecontainer-rg**
4. Create **Azure container registry** withe **azure acr create**.

- The container **registry** name must be unique withe Azure and container between **5 and 50 alphanumeric characters**

- Choose the [location of your choice]. In case I decided to use **South Africa North**

##### Create a Resource Group. [az group create]

```bash
az group create --name azurecontainer-rg --location "South Africa North"
```

```Output
{
"id": "/subscriptions/946006fb-049f-4e97-bf87-ea3cb7308ebf/resourceGroups/azurecontainer-rg",
"location": "southafricanorth",
"managedBy": null,
"name": "azurecontainer-rg",
"properties": {
"provisioningState": "Succeeded"
},
"tags": null,
"type": "Microsoft.Resources/resourceGroups"
}
```

##### Create Azure container Registry. [az acr create]

We'll create an Azure container registry withe the **az acr** command.
A premium registry SKU is deployed. The **premount SKU** is required for **geo-replication**

To begin, we'll define an environment variable in the **cloud shell** called **eddnodecontainers** to hold the name we want to give our new container registry.

```bash
az acr create --resource-group azurecontainer-rg --name eddnodecontainers --sku Premium
```

```output

{- Finished ..
  "adminUserEnabled": false,
  "creationDate": "2020-09-07T10:32:10.280230+00:00",
  "dataEndpointEnabled": false,
  "dataEndpointHostNames": [],
  "encryption": {
    "keyVaultProperties": null,
    "status": "disabled"
  },

```

You will get a bigger **json output** than ☝. Unless you want **geolocation** Always start small. Use **--sku basic**. I think basic is okay when starting out, It offers **10GB storage space**, **two web hooks** and **\_Priced at \$0.167** per day at the time of this writing.

{{<boxmd>}}
Refer on **[Azure container Registry Pricing.](https://azure.microsoft.com/en-us/pricing/details/container-registry/)**

- There you will see different **sku** including **Basic, Standard, Premium**
  - What to consider when making your choice.
    **Storage size, Geolocation Replicate, Cost** of the registry

{{</boxmd>}}

##### Build container images with Azure Container Registry Tasks.

A standard **Dockerfile** provides build instructions. **Azure Container Registry Tasks** allows you to reuse any Dockerfile currently in your environment, **including Multi-staged builds**.

I will use my **dockerfile** for our example From this [github repository](https://github.com/eduuh/expressA-Z)

{{<boxmd>}}
**Important.**
You need Your **Own Azure Subscription** to run this exercise and you may incur charges. If you don't already have an Azure subscription, create a [free account](https://azure.microsoft.com/free/) before you begin.

{{</boxmd>}}

```dockerfile
FROM node:14-slim as base
LABEL org.opencontainers.image.authors=edwin@muraya
LABEL org.opencontainers.image.title="Dekut survellance"
LABEL org.opencontainers.image.licenses=MIT
LABEL com.edwin.nodeversion=$NODE_VERSION

ENV NODE_ENV=production
EXPOSE 8080
ENV PORT 8080
WORKDIR /app
COPY package*.json ./
RUN npm config list
RUN npm ci && npm cache clean --force

ENV PATH /app/node_modules/.bin:$PATH
CMD [ "node", "./bin/www"" ]

FROM base as dev
ENV NODE_ENV=development
RUN apt-get update -qq && apt-get install -qy \
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    --no-install-recommends
RUN npm config list
RUN  npm install --only=development && npm cache clean --force
USER node
CMD [ "nodemon", "./bin/www" ]

FROM dev as test
COPY . .
RUN npm audit


FROM test as pre-prod
USER root
RUN rm -rf ./tests && rm -rf ./node_modules

FROM base as prod
COPY --from=pre-prod /app /app
HEALTHCHECK CMD curl http://127.0.0.1/ || exit 1
USER node

```

👆is a Multistage Dockerfile to build my appication. This configuration add an **express** application to the **node:14-slim** images. After that , it configure the container to servet the applicaiton on port 8080 via the `expose command`.

##### Create a service Principal for Azure authentication.

In the Github workflow, you need to suplly **Azure Credentials** to authenticate to the **Azure CLI**. The following example creates a service principal with the **Contributor role** scoped to the **resource group of your container registry.**

First, get the **resource ID** for your resource group. Substitute the name of your group in the following **az group show** command.

The **resource group** id store in a Environment variable **groupId**.

```bash
groupId=$(az group show  --name azurecontainer-rg --query id --output tsv)
```

- Use **az ad sp create-for-rbac** to create the service principal:

```bash
az ad sp create-for-rbac --scope $groupId --role Contributor --sdk-auth
```

Output of this command 👇. I removed Sensitive information.

```Json
{
  "clientId": "xxxx6ddc-xxxx-xxxx-xxx-6433243598",
  "clientSecret": "xxxx79dc-xxxx-xxxx-xxxx-9jajWTDI9a",
  "subscriptionId": "xxxx251c-xxxx-xxxx-xxxx--ea334bf",
  "tenantId": "xxxx88bf-xxxx-xxxx-xxxx-2d7cd00233e6f",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}

```

```bash
az acr build --registry eddnodecontainers --image expressAtoZ:v1 .
```






