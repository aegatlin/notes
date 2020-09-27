# lsof

It `l`i`s`ts `o`pen `f`iles. Among other things, these open files include network files like internet sockets, UNIX domain sockets, etc.

## `lsof` flags

The following tags are listed in order of personal importance.

* -i

  By itself, it will list all the open `i`nternet and network files. Otherwise, it will attempt to match the provided argument, which should be an internet address specified as follows: `[46][protocol][@hostname|hostaddr][:service|port]`. E.g., `:3000`.

* -n

  Tells `lsof` to `n`ot convert IP addresses to hostnames. The lookup times for the hostnames can drastically affect the time it takes to run `lsof`. I'm guessing this is because the `lsof` service has to reach out to the internet and check DNSs until it finds one that knows the hostname of the IP address it's checking against.

  * "Name" column for `lsof -ni`

    `192.168.1.102:64649->52.63.63.51:https (ESTABLISHED)`

  * "Name" column for `lsof -i`

    `192-168-1-102.tpgi.com.au:64649->ec2-52-63-63-51.ap-southeast-2.compute.amazonaws.com:https (ESTABLISHED)`

  * -t

    Lists `t`ersely. I.e., it lists just the PIDs.

## `lsof` in Action

`lsof -i :3000` will list every open network file listening on port :3000

`lsof -nti :3000` will list just the PIDs listening on port :3000

`lsof -n | grep LISTEN` will list every listening process/open-file

