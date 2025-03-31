#!/bin/bash
# Remoção de estruturas antigas
echo "Removendo diretórios..."
rm -rf /publico /adm /ven /sec

echo "Removendo usuários..."
for usuario in carlos maria joao debora sebastiana roberto josefina amanda rogerio
do
    userdel -r $usuario 2>/dev/null
done

echo "Removendo grupos..."
for grupo in GRP_ADM GRP_VEN GRP_SEC
do
    groupdel $grupo 2>/dev/null
done


# Criação de grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC


# Criação de diretórios
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

chown root:root /publico /adm /ven /sec


# Permissões dos diretórios
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec


# Criação de usuários
# ADM
useradd carlos -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123)
useradd maria -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123)
useradd joao -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123)

# VEN
useradd debora -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123)
useradd sebastiana -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123)
useradd roberto -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123)

# SEC
useradd josefina -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123)
useradd amanda -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123)
useradd rogerio -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123)

echo "Provisionamento concluído com sucesso."

