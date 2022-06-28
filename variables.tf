variable "user_default_remark" {
  default = ""
}

variable "user_default_console_login" {
  default = true
}

variable "user_default_country_code" {
  default = "86"
}

variable "user_default_email" {
  default = ""
}

variable "user_default_force_delete" {
  default = false
}

variable "user_default_need_reset_password" {
  default = true
}

variable "user_default_password" {
  default = null
}

variable "user_default_phone_num" {
  default = ""
}

variable "user_default_use_api" {
  default = false
}

variable "users" {
  type = list(object({
    name = string
    remark = optional(string)
    console_login = optional(bool)
    country_code = optional(string)
    email = optional(string)
    force_delete = optional(bool)
    need_reset_password = optional(bool)
    password = optional(string)
    phone_num = optional(string)
    use_api = optional(bool)
  }))
  default = []
}

variable "groups" {
  type = list(object({
    name = string
    remark = optional(string)
    users = optional(list(string))
    policy_names = optional(list(string))
  }))
  default = []
}

variable "default_policy_type" {
  default = 2  // 1 means customer strategy and 2 means preset strategy.
}