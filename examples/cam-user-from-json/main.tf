module "cam_group_user_policy" {
  source = "../../modules/cam-group-user-policy"

  users = jsondecode(file("./users.json"))
#  users = {
#    "user1": {
#      "email": "test_user1@abc.com",
#      "user_remark": "user1",
#      "password": "Passw0rd!@#",
#      "phone_num": "13800138000",
#      "country_code": "86",
#      "need_reset_password": true,
#      "console_login": true,
#      "use_api": true
#    },
#    "user2": {
#      "email": "test_user2@abc.com",
#      "user_remark": "user2",
#      "phone_num": "13800138000",
#      "country_code": "86",
#      "need_reset_password": false,
#      "console_login": true,
#      "use_api": true
#    }
#  }

}