# Docker and wsl
## 1. Compact `.vhdx` file
> To save space, compact `.vhdx`
### 1.1 Shutdown all docker and wsl in powershell

```powershell
PS> Get-Process "Docker Desktop" | Stop-Process -Force
PS> Get-Process docker, com.docker.build, com.docker.backend -ErrorAction SilentlyContinue | Stop-Process -Force
# Recheck
PS> Get-Process *docker* -ErrorAction SilentlyContinue

PS> wsl --shutdown
# Recheck
wsl -l -v
```
### 1.2 Diskpart

```powershell
PS> diskpart
diskpart> select vdisk file="C:\Users\steco\AppData\Local\Docker\wsl\disk\docker_data.vhdx"
diskpart> attach vdisk readonly
diskpart> compact vdisk
diskpart> detach vdisk
diskpart> exit
```
### 1.3 Restart

```powershell
PS> net start com.docker.service
# Recheck
PS> sc query com.docker.service
```
---
## 2. Localhost, internet and IP
> After a wsl and docker restart, port forwarder must be modified
### 2.1 Enter container and get IP

```bash
$ hostname -I
```
### 2.2 In Powershell, run

```powershell
PS> docker rm -f port-forwarder
PS> docker run -d --name port-forwarder -p 8888:8888 alpine/socat TCP-LISTEN:8888,fork,reuseaddr TCP-CONNECT:<my IP>:8888
```
### 2.3 To test if it's successful, see if there's any error when running

```powershell
PS> curl http://localhost:8888/
```
### 2.4 Jupyter

```bash
$ cd ~/d2l-zh
$ jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.disable_check_xsrf=True --NotebookApp.allow_origin='*' --NotebookApp.allow_remote_access=True
```

```bash
$ jupyter notebook list
```
