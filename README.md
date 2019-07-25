# opensipscp

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with opensipscp](#setup)
    * [Beginning with opensipscp](#beginning-with-opensipscp)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module install OpenSIPS Control Panel, a PHP Web Portal for provisioning OpenSIPS SIP server.

## Setup

This module OpenSIPS CP Web Portal and it does not include OpenSIPS sip proxy. The opensips must be installed some other way (e.g: using alisio-opensips module)

This module writes to the mysql database so be careful if installing on top of an existent OpenSIPS installation. You should consider backup your database first.


### Beginning with opensipscp

To install OpenSIPS CP with the default module options, simply include the class in your manifest.

```
include opensipscp
```
To install OpenSIPS proxy and OpenSIPS control with default values

```
class{'opensips':}

class{'opensipscp':}

Class['opensips'] -> Class['opensipscp']
```

### Setup Requirements

* Mysql database
* Apache
* opensips

## Usage

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

You can use the following parameters to customize your installation.

* `$db_opensips_db` The opensips database. It must match your current opensips installation. Default value: 'opensips'
* `$db_opensips_user` The database user. Default Value: 'opensips'
* `$db_opensips_pw` The password for the opensips database user. Default value 'opensipsrw'
* `$db_server_ip` The opensips database host. Default value: 'localhost'
* `$opensipscp_admin_user` The initial OpenSIPS Control Panel GUI admin user. Default value:'admin'
* `$opensipscp_admin_pw` The initial OpenSIPS Control Panel GUI admin password. Default value: 'opensips'
* `$opensipscp_alias_folder`  The apache alias for the OpenSIPS Control Panel. Default Value: '/cp'

## Limitations

This module does not provision an OpenSIPS proxy server.

This module was tested with puppet 5 running on Centos7.


## Development

Please follow the licence guidelines
