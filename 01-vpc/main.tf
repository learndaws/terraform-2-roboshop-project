module "vpc_project" {
    #source = "../terraform-2-vpc-developer"
    source = "git::https://github.com/learndaws/terraform-2-vpc-developer.git?ref=main"
    vpc_function_tags = var.vpc_function_tags
    igw_function_tags = var.igw_function_tags    
    public_subnet_function_tags = var.public_subnet_function_tags
    private_subnet_function_tags = var.private_subnet_function_tags
    database_subnet_function_tags = var.database_subnet_function_tags
    nat_gw_function_tags = var.nat_gw_function_tags
    rt_public_function_tags = var.rt_public_function_tags
    rt_private_function_tags = var.rt_private_function_tags
    cidr_block = "10.1.0.0/16"
    public_cidr_subnets = var.public_cidr_subnets
    private_cidr_subnets = var.private_cidr_subnets
    database_cidr_subnets = var.database_cidr_subnets
    is_peering_required = var.is_peering_required
}