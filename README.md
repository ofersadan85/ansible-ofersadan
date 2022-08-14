# ansible-ofersadan

This ansible role will set up my personal user environment on servers (meant for internal use only).

This role requires ansible >= 2.9 and the ansible.posix collection.

## Install with Dependencies

    ansible-galaxy collection install ansible.posix --force
    ansible-galaxy role install ofersadan85.ofersadan --force

## Quick run

On a system with ansible installed, run the following command:

    ansible localhost -m include_role -a name=ofersadan85.ofersadan

## Example Playbook

This is a simple role without variables

    - hosts: all
      roles:
        - ofersadan85.ofersadan
