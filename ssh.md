# Ssh

SSH stands for secure shell. It allows for a remote connection to a machine over TCP.

`ssh username@host`

The default port is 22.

The normal way to use ssh is to have a public/private key pair shared between client and host. E.g., the client generates a public private key pair via the following

## Generating and Using a public/private key pair

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

This uses OpenSSH utilities/protocols/whatever, to generate a machine-local public-private key pair. -t specifies the type of key generated, -b the bitsize, and -C adds a comment, which can help you differentiate between multiple keys.

Next you should set up your `ssh-agent`, which is a service that runs on your local machine, and manages your private keys. This service will be available for when remote services want to validate that you are who you say you are. I don't understand it very well, but the two steps are 1, make sure it's running, and 2, add your newly generated private key to it.

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

The output of `ssh-agent -s` is quite straightforward. It is setting \(and also creating\(?\)\) env vars that are discoverable by the ssh client when trying to check your keys.

## Adding a hostname to your ssh

On the machine you are connecting _from_ you can edit `~/.ssh/config` to include a hostname with your required IP address, thereby allowing you to write `ssh aeg` instead of `ssh root@123.123.123.123`.

For example, in you could add something like this in `~/.ssh/config` file, include the following:

```bash
Host aeg
  HostName 123.123.123.123
  User root
```

Now you can connect with `ssh aeg` instead of `ssh root@123.123.123.123`.
