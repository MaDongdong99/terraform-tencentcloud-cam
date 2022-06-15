
module "groups" {
  source = "../.."
  groups = [
    {
      name = "test-group-1",
      remark = "test",
    }
  ]
}

output "groups" {
  value = module.groups.groups
}