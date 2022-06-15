// Defaults
//  remark              = ""
//  console_login       = true
//  use_api             = false
//  need_reset_password = true
//  password            = null
//  phone_num           = ""
//  email               = ""
//  country_code        = "86"
//  force_delete        = false

module "group-with-users" {
  source = "../.."
  groups = [
    { name = "test-group-1", remark = "test",
      users = ["cam-user-test-aaa", "cam-user-test-bbb"]
    }
  ]
  users = [
    { name = "cam-user-test-aaa", remark = "test", use_api = true, force_delete = true },
    { name = "cam-user-test-bbb", remark = "test-bbb", use_api = true, force_delete = true }
  ]
}
