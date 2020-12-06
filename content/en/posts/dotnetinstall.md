---
title: 'Installing Dotnet SDk'
date: 2020-04-19T07:41:06-07:00
draft: true
description: 'How I Use tmux for Local Development'

categories: ['server']
tags: ['cli']

weight: 3
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

Installing dotnet core in ubuntu using snap.

```bash
apt-get update
apt-get install snapd
```

Search for available Dotnet packages.

```bash
snap find dotnet
```

Here is the command output

```bash
Name                         Version  Publisher     Notes    Summary
dotnet-sdk                   5.0.100  dotnetcore✓   classic  Develop high performance applications in less time, on any platform.
dotnet-runtime-21            2.1.23   dotnetcore✓   -        Cross-Platform .NET Core Runtime.
dotnet-runtime-31            3.1.10   dotnetcore✓   -        Cross-Platform .NET Core Runtime.
dotnet-runtime-50            5.0.0    dotnetcore✓   -        Cross-Platform .NET Runtime.
uno-platform-iot-sample-app  1.0      uno-platform  -        Uno Platform IoT Sample App
iot-dotnet-sample            1.0      iotnxt        -        .NET Core example Snap
test-hello                   0.1      iotnxt        -        simple dotnet hello world
```

Install the Dotnet Package. You aliase the dotnet snap to dotnet.

```bash
snap install dotnet-sdk --classic
snap alias dotnet-sdk.dotnet dotnet
```

Verify the List of snap package insalled.

```bash
snap list
```

Here is the command output.

```bash
```

verfy the Dotnet installation.

```bash
dotnet --info
```

Heare is the command output.

```bash
```

Congratulations! You have now installed dotnet installation on your **ubuntu linux**.

### Testing the dotnet Installation.

Create a Dotnet project.

```bash
mkdir test
cd test
dotnet new console
```

Start the dotnet project.

```bash
dotnet run
```

If you receive the following error message the dotnet installation is not okay.

```bash

```

Build your project

```bash
dotnet bin/Debug/netcoreapp3.1/test.dll
```

The dotnet installation is successfully installed.