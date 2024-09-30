#!/bin/bash

set -e  # Isso fará o script parar se qualquer comando falhar

# Função para verificar o status do último comando
check_status() {
    if [ $? -eq 0 ]; then
        echo "Passo $1 concluído com sucesso."
    else
        echo "Erro no passo $1. Saindo."
        exit 1
    fi
}

# 1 terraform deploy
cd terraform
terraform init
terraform apply -auto-approve
check_status 1

# 2 copy env
ec2_ip=$(terraform output -raw ec2_public_ip)
rds_db_endpoint=$(terraform output -raw rds_endpoint)
rds_db_name="todolist_db_rds"
rds_db_user="postgresrds"
rds_db_password="rdsdb12435"
[ -n "$ec2_ip" ] && [ -n "$rds_db_endpoint" ] && check_status 2 || (echo "Erro no passo 2: Variáveis não definidas corretamente"; exit 1)

# 3 getting ansible ready
cd ../ansible
echo -e "[EC2]\n$ec2_ip ansible_user=ubuntu ansible_python_interpreter=/usr/bin/python3 ansible_private_key_file=~/labsuser.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'" > ./inventory.ini
[ -f ./inventory.ini ] && check_status 3 || (echo "Erro no passo 3: Arquivo inventory.ini não criado"; exit 1)

# 4 create .env file
echo -e "DB_HOST=$rds_db_endpoint\nDB_NAME=$rds_db_name\nDB_USER=$rds_db_user\nDB_PASSWORD=$rds_db_password" > ./.env
[ -f ./.env ] && check_status 4 || (echo "Erro no passo 4: Arquivo .env não criado"; exit 1)

# 5 exec playbook
ansible-playbook -i inventory.ini deploy_todolist_app.yml
rm .env
check_status 5

echo "Todos os passos concluídos com sucesso!"
