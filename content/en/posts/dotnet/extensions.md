---
title: 'Dotnet WebApi Extensions'
description: 'Dotnet Core Nuget Packages That I use.'
date: 2020-11-10T08:11:28Z
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 🤖
series:
  - c#
---

## Ensure they are the same version.

1. [Microsoft.EntityFrameworkCore 5.0.0](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore/)
2. [Microsoft.EntityFrameworkCore.Sqlite 5.0.0](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Sqlite/)

### Trace Levels

1. [Microsoft.Extensions.Configuration](https://www.nuget.org/packages/Microsoft.Extensions.Configuration/)
2. [Microsoft.Extensions.Configurations.Binder](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.Binder/)
3. [Microsoft.Extensions.Configuration.Json](https://www.nuget.org/packages?q=Microsoft.Extensions.Configuration.Json)
4. [Microsoft.Extensions.Configuration.FileExtensions](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.FileExtensions/)

#### Unit Testing.

Fixing bugs in code is expensive. The earlier that a bug is discovered in the development process, the less expensive it will be to fix.

Unit tesiting is a good way to find bugs early in the development process. Some developers even follow the priciple of **test-driven Development (TDD)**

Microsof has a **proprietary unit testing framework** known as **MS Test** however i choose to be using a the third party framework **xUnit.net**.

#### Create a class library **that needs testing**
