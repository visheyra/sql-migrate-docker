# sql-migrate-docker
Container that wraps https://github.com/rubenv/sql-migrate for use in CD Pipeline / Kubernetes job / ...

## How to

This section explains how to use the container, where to mount the volumes, which environemtn variable should be set

### Volumes

| Mountpoint | Description |
|:---:|:---:|
| /tmp | Folder where to mount your different sql files, check [rubenv github](https://github.com/rubenv/sql-migrate) for how to write those files. |

### Environment

| Variable | Mandatory | Description |
| :---: | :---: | :---: |
| CONFIG | No | Path to sql-migrate config file, can be omitted. If omitted, it's assumed that the configuration file is called `dbconfig.yml` and is stored along the other sql files in the /files folder |

### Additional features

* Commands
  * **reset**: Un-apply the entire files on the DB.

## What's next

* [x] Additional reset command
* [ ] Kubernetes job example
* [ ] Jenkins declarative pipeline example
