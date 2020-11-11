
#@(ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml playbooks/mysql.yml --ask-become-pass --ask-vault-pass)
#@(ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml playbooks/mysql.yml --ask-vault-pass)

galaxy:
	@(ansible-galaxy install -r requirements.yml --force)

infra:
	@(vagrant up)

destroy:
	@(vagrant destroy --f)

mysql: galaxy
	@(ansible-playbook playbooks/mysql.yml)

init: mysql
	@(ansible-playbook playbooks/lumis.yml --tags init-config -v)

lumis1: init
	@(ansible-playbook playbooks/lumis.yml --limit lumis1 --tags lumis)

cluster:
	@(ansible-playbook playbooks/lumis.yml --tags lumis)

apache: cluster
	@(ansible-playbook playbooks/lumis.yml --tags apache)
