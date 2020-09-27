# Useful shell functions

## Kill pid on port

Usage

```bash
$ ./kill_pid_on_port :3000
```

Implementation

```bash
kill_pid_on_port () {
  if [ ! -z $(command -v lsof) ]; then
    if [[ ! -z $(lsof -nti $1) ]]; then
      kill -9 $(lsof -nti $1)
    fi
  fi
}
```

How it works

1. Checks for the presence of `lsof`
   - There's a very small chance that `lsof` does NOT exist on some thin cloud containers.
   - It is if-checking the non-emptyness (`! -z`) of the path to the executable `command -v lsof`.
2. Check for a process (i.e., an open network file) listening on the provided port.
3. Kill that PID! Sig 9 hardcore! XD

## Wait for pid death on port

Usage

```bash
> ./wait_for_pid_death_on_port :3000
```

Implementation

```bash
wait_for_pid_death_on_port () {
  if [ ! -z $(command -v lsof) ]; then
    while [ -z "$SERVER_PID" ]; do
      local SERVER_PID=$(lsof -nti $1)
      sleep 1
    done
  else
    sleep 20
  fi
}
```

How it works

1. Checks for the presence of `lsof`
   - There's a very small chance that `lsof` does NOT exist on some thin cloud containers.
   - It is if-checking the non-emptyness (`! -z`) of the path to the executable `command -v lsof`.
2. Check every 1 second to see if the server pid has terminated. Exit when it has.
   - The `else` block is for the the unlikely scenario where there is no `lsof` command, in which case you just sleep for a long time (20 seconds). It's arbitrary, and we all hope it's long enough for the server pid to terminate.
