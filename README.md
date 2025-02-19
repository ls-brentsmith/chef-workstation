# Chef Workstation


**Umbrella Project**: [Chef Workstation](https://github.com/chef/chef-oss-practices/blob/master/projects/chef-workstation.md)

* **[Project State](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md):** Active
* **Issues [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md):** 14 days
* **Pull Request [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md):** 14 days

Chef Workstation installs everything you need to get started using Chef on Windows, Mac and Linux.
It includes:
- chef-run, a new tool for executing ad-hoc tasks against your servers
- ChefDK, all the tools you know and love

## Getting Started

1. Download [Chef Workstation](https://downloads.chef.io/chef-workstation)

2. Double-click the `.dmg` or `.msi` file to start the install process, or use the package manager for your Linux distribution.

3. Open a terminal, and try out an ad-hoc task. Here's the general usage:

    `chef-run  [flags] <Target host|IP|SSH|WinRM> <Resource> <Resource Name> [properties]`

  * Install the 'ntp' package on 'hostname' over ssh, using password from the environment:

    `chef-run username:$PASSWORD@hostname package ntp`

  * Create user 'timmy' on 'hostname' over winrm:

    `chef-run winrm://username@hostname user timmy`

  * Run the recipe 'nginx::passenger' on 'hostname' over ssh on port 2222 using a keyfile:

    `chef-run ssh://hostname:2222 -i ~/.ssh/id_rsa nginx::passenger`

4. Use `chef-run -h` for additional information about usage and available flags.

## Building Chef-Workstation Packages

We use Omnibus to describe our packaging. Please review [chef-workstation/omnibus/README.MD](https://github.com/chef/chef-workstation/tree/master/omnibus) for further details.

## Copyright and License

Code released under the [Apache license](LICENSE). Images and any trademarked content are Copyright 2018 by [Chef Software, Inc.](https://www.chef.io).
