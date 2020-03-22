# Dockerfile: Streisand 
	> OS: Debian 
	> Setup With Ansible

## Confirmed Working

- [x] Linode
  > 10/18/2019 requires:
	- `apt upgrade && apt update`
	- `git clone https://github.com/StreisandEffect/streisand.git`
 	- `pip install linode-api4=='2.2.1'`

## Tested

- [x] Digital Ocean
- [x] Linode

## Untested
- [ ] Amazon
- [ ] Rackspace


This will prompt you to enter your API credentials

After it's finished, Streisand will try and xdg-open the generated documentation (which will fail).

Note:
> The name of the html file will be the same as the name you gave in the server setup. If you name your server `streisand-demo`, then the file will be `streisand-demo.html`.


### How To Run The Docker Setup ###

```bash
docker run \
-v $PWD/app:/root/.ssh/ \
-p 80:8080 \
--name streisand \
-it --rm researchranks/debian.ansible.streisand:latest /bin/sh
```

### How Add Secure RSA Keys Before Running Setup ###

 - copy ``id_rsa`` keys the ``/app/`` docker project directory


### How To Run the Streisand Setup ###

 - root working directory
     - `cd ~/streisand`

```
./streisand
```


### How To Access the Generated VPN Profiles ###

 - ``/app/generated-docs/vpn.profiles``


#### Edge Cases:
 * Digital Ocean:
    - remove `@local` from the ssh `id_rsa.pub` key that is uploaded on the `digitalocean` settings. It has been an edgecase with `ansible` and `streisand `