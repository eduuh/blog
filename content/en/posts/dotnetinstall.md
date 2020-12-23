---
title: 'Installing Dotnet SDK on Ubuntu Server'
date: 2020-12-19T12:41:06-07:00
draft: false
description: 'Installing dotnet sdk on ubuntu server using snap. The official way did not work for for the server. Here is way I got it working.'

categories: ['server']
tags: ['cli']

author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

Installing dotnet core in ubuntu sever using snap.

```bash
apt-get update
apt-get install snapd
```

Search for available Dotnet packages. The search will list out the latest dotnet **sdks and runtimes**.

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

### Installing the LTS

To install the current Lts version **3.1.10** using snap you will need to install snap using the command.

```bash
sudo snap install dotnet-sdk --channel=3.1/stable --classic
```

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

The dotnet installation is successfully installed .

### Working with My Server Remotely From Visual Studio Code.

Once I installed **dotnet** successfully in my **ubuntu** server. I needed to connect remotely from my **vscode** in order to make quick changes on the server. But ominisharp does not seem to find **any sdk** installed. The solution was to create a sybolic link as shown below.

Run The command below to find out where you dotnet installation is located. Since we used snap to install, its located in the /snap folder.

```bash
which dotnet
/snap/bin/dotnet
```

Add the line to your **bashrc** or **zshrc** file.

```bash
export PATH=$PATH:/snap/bin/dotnet
```
