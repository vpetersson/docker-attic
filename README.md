# Dockerized Attic receiver

[Attic](https://attic-backup.org/) is a fantastic piece of backup software. Instead of having to re-write your own backup script all the time, you can just tap into Attic and get other nice features like retention policies and de-duplication.

By default, Attic support SSH targets, which is awesome. However, if you're backing up a production server, you probably do not want to grant it proper shell access to the SSH target. This Docker container solves that.


## Usage

### Create the server

Here's an example of a container setup on the remote server.

    $ docker run -d \
        -v /etc/ssh:/etc/ssh:ro \
        -v /path/to/vault:/home/attic/vault \
        --name attic \
        -e "SSHKEY=Your public ssh key" \
        --restart always \
        -p 2222:22 \
        vpetersson/attic

This will:

 * Use the host's ssh folder (`/etc/ssh`) such that the SSH host keys remain the same
 * Map the local folder `/path/to/vault` to `/home/attic/vault` in the container (this is where you store your backups)
 * Install the SSH key provided for the user `attic` into the container
 * Make the container listen on port 2222

### Create a backup

With the container up and running, you can initiate your vault as follows:

    $ attic init ssh://attic@your-server:2222/home/attic/vault/repository.attic
