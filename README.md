# Dockerfile: Streisand 
	> OS: Debian 
	> Setup With Ansible

## Confirmed Working

- [x] Linode

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
-v $PWD/app/generated-docs:/root/streisand/generated-docs/ \
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

