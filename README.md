# Terraform-ECS

Este repositório contém scripts Terraform para provisionar uma infraestrutura Amazon ECS (Elastic Container Service). A configuração inclui uma VPC, cluster ECS, balanceador de carga e políticas de auto-escalonamento para garantir um ambiente escalável e seguro para a execução de aplicações containerizadas.

## Visão Geral da Arquitetura

- **VPC**: Contém subnets públicas e privadas, um Internet Gateway e tabelas de roteamento.
- **Grupos de Segurança**: Controlam o tráfego de entrada e saída.
- **Cluster ECS**: Hospeda as tasks ECS.
- **Definição de Task ECS**: Define os containers Docker a serem executados.
- **Serviço ECS**: Gerencia a execução das tasks ECS.
- **Balanceador de Carga (ALB)**: Distribui o tráfego de entrada entre as tasks ECS.
- **Auto-escalonamento**: Ajusta o número de instâncias com base na demanda.

## Pré-requisitos

- Terraform instalado na sua máquina local.
- AWS CLI configurado com permissões apropriadas.
- Docker instalado (se for construir imagens de container localmente).

## Instruções de Configuração

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/GustavoHBraga/Terraform-ECS.git
   cd Terraform-ECS
   ```

2. **Inicialize o Terraform:**
   ```bash
   terraform init
   ```
   
3. **Revise e ajuste as variáveis:**
Edite o arquivo `variables.tf` para corresponder à sua configuração e preferências.

4. **Aplique a configuração do Terraform:**
   ```bash
   terraform apply
   ```
Confirme a ação com `yes` quando solicitado.

## Variáveis

- `vpc_cidr`: O bloco CIDR para a VPC.
- `public_subnets`: Lista de CIDRs das subnets públicas.
- `private_subnets`: Lista de CIDRs das subnets privadas.
- `ecs_cluster_name`: Nome do cluster ECS.
- `alb_name`: Nome do Application Load Balancer.
- `task_definition`: Detalhes para a definição da task ECS.
- `service_name`: Nome do serviço ECS.

## Saídas

- `vpc_id`: O ID da VPC.
- `ecs_cluster_id`: O ID do cluster ECS.
- `alb_dns_name`: O nome DNS do Application Load Balancer.
