# SSH

[Closing a stale SSH connection](https://davidisaksson.dev/posts/closing-stale-ssh-connections/)

Built in to the SSH client are multiple hidden commands that can be triggered with a so called escape sequence. These commands can be access by a combination of the tilde prefix (~) followed by the command.

For example ~? print the help message containing all of the supported escape sequences:
```
david@remote-host:~$ ~?
Supported escape sequences:
 ~.   - terminate session
 ~B   - send a BREAK to the remote system
 ~R   - request rekey
 ~#   - list forwarded connections
 ~?   - this message
 ~~   - send the escape character by typing it twice
(Note that escapes are only recognized immediately after newline.)
```
