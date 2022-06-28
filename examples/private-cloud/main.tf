provider "tencentcloud" {
  domain = "api3.yun.com"
  protocol = "HTTP"
  region = "jj"
}


module "policies" {
  source = "../.."


//  groups = [
//    { name = "test-group-1", remark = "test",
////      users = ["cam-user-test-aaa", "cam-user-test-bbb"]
//      policy_names = ["ProjectFullAccess", "QCloudCmqQueueCreaterFullAccess", "ProjectReadOnlyAccess"]
//    }
//  ]

  users = [
    { name = "cam-user-test-aaa", remark = "test", use_api = true, force_delete = true }
  ]
}

//output "policies" {
//  value = module.policies.all-policies
//}
