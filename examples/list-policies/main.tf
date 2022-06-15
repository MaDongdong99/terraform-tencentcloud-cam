
module "policies" {
  source = "../.."
}

output "policies" {
  value = module.policies.all-policies
}
