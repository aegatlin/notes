# ls

* ll is an alias I use representing `ls -al`
  - `-a`, or `--all`: "do not ignore entries starting with .".
  - `-l`: "use long listing format".

When listing files using the long listing format, you will see the
readable-writable-executable states in the leftmost column. There is also a
designation for file type. There are a few possible file types in a \*nix
system like linux. The normal file type is unspecified `-`. The most common
other file types is `d` for directory. Next most common is the `l` link file,
which are most commonly symlink files. Then `s` are socket files, which behave
like network sockets, but exist as files in Linux to facilitate local
client-server communication between processes. Then there are the `c` and `b`
character and block special files, respectively. Special files are essentially
the hardware device communication medium. The two types of special files
correspond to the type of communciation that occurs. Character special files
transfer data in byte-sized amounts, monitors, terminals, printers, etc., while
Block special files tansfer data in larger block amounts, like hard-drives,
etc. Lastly, there is the `p` named pipe file, which is a glorified pipe across
users and is rarely used (I assume).
