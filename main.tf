
locals {

  // merge user defaults
  users = flatten([
    for user in var.users: {
    name = user.name
    remark = user.remark == null ? var.user_default_remark: user.remark
    console_login = user.console_login == null ? var.user_default_console_login: user.console_login
    use_api = user.use_api == null ? var.user_default_use_api: user.use_api
    console_login = user.console_login == null ? var.user_default_console_login: user.console_login
    need_reset_password = user.need_reset_password == null ? var.user_default_need_reset_password: user.need_reset_password
    password = user.password == null ? var.user_default_password: user.password
    phone_num = user.phone_num == null ? var.user_default_phone_num: user.phone_num
    email = user.email == null ? var.user_default_email: user.email
    country_code = user.country_code == null ? var.user_default_country_code: user.country_code
    force_delete = user.force_delete == null ? var.user_default_force_delete: user.force_delete
    tags = user.tags == null ? {} : user.tags
    }
  ])

  groups = flatten([
    for group in var.groups: {
    name = group.name
    remark = group.remark == null ? "" : group.remark
    users = group.users == null ? [] : group.users
    policy_names = group.policy_names == null ? [] : group.policy_names
    }
  ])

  group_id_map = { for idx, group in tencentcloud_cam_group.groups: local.groups[idx].name => group.id }

  policy_id_map = { for policy in data.tencentcloud_cam_policies.all-policies.policy_list: policy.name => policy.policy_id... }

  group_policies = flatten([
    for group in local.groups: [
      for policy_name in group.policy_names: [
        for policy_id in local.policy_id_map[policy_name]: {
          group_id = local.group_id_map[group.name]
          policy_id = policy_id
        }
      ]
    ]
  ])

}

resource "tencentcloud_cam_user" "users" {
  count = length(local.users)
  name                = local.users[count.index].name
  remark              = local.users[count.index].remark
  console_login       = local.users[count.index].console_login
  use_api             = local.users[count.index].use_api
  need_reset_password = local.users[count.index].need_reset_password
  password            = local.users[count.index].password
  phone_num           = local.users[count.index].phone_num
  email               = local.users[count.index].email
  country_code        = local.users[count.index].country_code
  force_delete        = local.users[count.index].force_delete
  tags = local.users[count.index].tags

}

resource "tencentcloud_cam_group" "groups" {
  count = length(local.groups)
  name   = local.groups[count.index].name
  remark = local.groups[count.index].remark
}

resource "tencentcloud_cam_group_membership" "user-in-group" {
  depends_on = [tencentcloud_cam_user.users]
  count = length(local.groups)
  group_id   = local.group_id_map[local.groups[count.index].name]
  user_names = local.groups[count.index].users
}

resource "tencentcloud_cam_group_policy_attachment" "policies-of-group" {
  count = length(local.group_policies)
  group_id  = local.group_policies[count.index].group_id
  policy_id = local.group_policies[count.index].policy_id
}

data "tencentcloud_cam_policies" "all-policies" {
  type = var.default_policy_type
}


output "groups" {
  value = local.group_id_map
}

output "all-policies" {
  value = local.policy_id_map
}