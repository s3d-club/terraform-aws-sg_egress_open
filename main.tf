module "name" {
  source = "github.com/s3d-club/terraform-external-name?ref=v0.1.15"

  path    = path.module
  context = join("-", [var.name_prefix, "egress-open"])
  tags    = var.tags
}

resource "aws_security_group" "this" {
  name_prefix = module.name.prefix
  description = "Egress OPEN for all protocols"
  tags        = module.name.tags
  vpc_id      = var.vpc_id

  egress {
    description      = "Egress for all ports/protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidrs
    ipv6_cidr_blocks = var.cidr6s
  }
}
