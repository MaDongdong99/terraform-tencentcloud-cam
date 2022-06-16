provider tencentcloud {
  region = var.tencentcloud_provider_region == "" || var.tencentcloud_provider_region == null ? "ap-guangzhou": var.tencentcloud_provider_region
  domain = var.tencentcloud_provider_domain == "" ? null : var.tencentcloud_provider_domain
  protocol = var.tencentcloud_provider_protocol == "" ? null : var.tencentcloud_provider_protocol
}