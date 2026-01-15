data "aws_availability_zone" "available" {
  state = "available"

}
locals {
  azs=slice(data.aws_availability_zone.available.name,0,3)
  public_subnet=[for k,az in local.azs : cidrsubnet(var.vpc_cidr, var.subnet_newbits, k)]
  private_subnets = [for k, az in local.azs : cidrsubnet(var.vpc_cidr, var.subnet_newbits, k + 10)]
}