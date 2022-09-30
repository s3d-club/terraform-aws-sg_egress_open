module "name" {
  source = "git::https://github.com/s3d-club/terraform-external-data-name-tags?ref=v0.1.0"

  path         = path.module
  name_prefix  = var.name_prefix
  name_segment = "egress-open"
  tags         = var.tags
}

resource "aws_security_group" "this" {
  name_prefix = module.name.name_prefix
  description = "Egress OPEN for all protocols"
  tags        = module.name.tags
  vpc_id      = var.vpc

  egress {
    description      = "Egress for all ports/protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr
    ipv6_cidr_blocks = var.cidr6
  }
}
