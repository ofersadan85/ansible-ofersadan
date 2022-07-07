# ansible-ofersadan

This ansible role will set up my personal user environment on servers (meant for internal use only)

## Quick run

On a system with ansible - or after `sudo apt install ansible -y`

    ansible-galaxy role install ofersadan85.ofersadan --force && ansible localhost -m include_role -a name=ofersadan85.ofersadan

## Install only

    ansible-galaxy role install ofersadan85.ofersadan

## Example Playbook

This is a simple role without variables

    - hosts: all
      roles:
        - ofersadan85.ofersadan
