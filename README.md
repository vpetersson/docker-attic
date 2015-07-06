# Dockerized Attic receiver

[Attic](https://attic-backup.org/) is a fantastic piece of backup software. Instead of having to re-write your own backup script all the time, you can just tap into Attic and get other nice features like retention policies and de-duplication.

By default, Attic support SSH targets, which is awesome. However, if you're backing up a production server, you probably do not want to grant it proper shell access to the SSH target. This Docker container solves that. It is a stand-alone container that


## Usage

    $ docker run -d \
        -v /etc/ssh:/etc/ssh:ro \
        -v /path/to/vault:/home/attic/vault \
        --name attic \
        -e "SSHKEY=Your public ssh key" \
        -p 2222:22 \
        vpetersson/attic


