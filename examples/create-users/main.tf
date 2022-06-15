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

module "users" {
  source = "../.."
  users = [
    { name = "cam-user-test-aaa", remark = "test", use_api = true, force_delete = true }
  ]
}
