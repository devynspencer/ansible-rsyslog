#

all: up provision

up:
	vagrant up --no-provision

provision:
	vagrant provision

configure:
	ansible-playbook --ask-pass --ask-become-pass --inventory-file inventory test.yml

destroy:
	vagrant destroy -f

rebuild: destroy all configure

logs:
	vagrant ssh --command 'sudo tail -f /var/log/messages'
