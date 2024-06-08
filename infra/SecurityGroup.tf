resource "aws_security_group" "alb" {
    name = "alb_ecs"
    vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "tcp_alb" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp" # Comunicação externa
  cidr_blocks       = ["0.0.0.0/0"] # Todas os ips podem acessar nossa aplicação
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "tcp_alb_egress" {
  type              = "egress"
  from_port         = 0 # Todas as portas liberadas
  to_port           = 0 # Todas as portas liberadas
  protocol          = "-1" # Qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"] # Todas os ips podem acessar nossa aplicação
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group" "private" {
    name = "private_access_ECS"
    vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "ingress_private_ECS" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = aws_security_group.alb.id
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "egress_private_ECS" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # Comunicação externa
  cidr_blocks = ["0.0.0.0/0"]# Apenas o Load Balance pode realizar requisições
  security_group_id = aws_security_group.private.id
}