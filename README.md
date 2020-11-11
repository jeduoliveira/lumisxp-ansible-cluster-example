Cluster LumisXP utilizando Ansible
===

Neste exemplo eu utilizo o vagrant para criação das VMs, neste examplo são 3 VMs, um banco de dados MySQL e dois servidores para o LumisXP, ElasticSearchs e os apaches.

Iniciando o projeto
---

execute a inicialização do projeto

    make infra

Criar a estrutura preliminar

    make lumis1

Realizar a configuração final do cluster

    make apache
