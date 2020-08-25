---

title: 'Encrypting files in Linux'
description: 'Encryption commands such as gpg can be used to secure your most sensitive files on Linux systems.'
date: 2020-08-19T14:00:48Z
draft: true
hideToc: true
enableToc: true
author: eduuh
authorEmoji: 😎
weight: 1

tags:
- linux
categories:
- Productivity
series:
- workspace

image: images/encrypt/encrypt.png

author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Command-Line enthusiastic , Javascript and dotnet developer 

---

- GnuPrivacy Guard (GPG) allows you to securely encrypt files.
- GPG relies on the idea of **two encryption keys** per person.
- Each person has a **private key** and a **public key**.
  - The public key can decrypt something that was encrypted using the private key.

To send a file securely, you encrypt it with your private key and the recipent's public key. The public key can decrypt something that was encrypted using the private key.

- Public keys must be shared. You need to have public keys of the recipent in order to encrypt the file and recipient needs to have your public key do decrypt it.

- There is no danger making your public key **public**.
- **Private keys** must be kept secret and secure.

##### Generating Your Keys. Using the Terminal.

- The `gpg` command is available in most distributions
- You don't have to use GPG with email.
  -You can encrypt files and make them available for dowload, or pass them physically to the recipient.

- You do need to associate an **email address** with the keys you generate.

  - choose one of your emails to use.

- The command to generate your keys is **--full-generate-keys**.

{{<boxmd>}}
**\$ gpg --full-generate-key**
{{</boxmd>}}

- You will be asked to pick an encryption type from a menu.
  - You could decide to use the default (**number 1**)
  - Use expirly of one year. (your choice)

![genkey image](/images/encrypt/genkey.png)

### Importaing Someone Else's Public Key.

- To encryt a message that another person can decrypt, we must have their public key.
  - If you have been provided with their key in a file, you can import it with the following command.

finish the blog with
https://www.howtogeek.com/427982/how-to-encrypt-and-decrypt-files-with-gpg-on-linux/
