provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3"
  region   = "ru-moscow-1"

  # Authorization keys
  access_key = var.access_key
  secret_key = var.secret_key
}

resourse "sbercloud_obs_bucket" "obs_bucket" {
      bucket                = "my-tf-test-bucket"
      acl                   = "private"
      enterprise_project_id = sbercloud_enterprise_project.ep_obs_bucket.id
}

resourse "sbercloud_obs_user" "obs_user" {
      name        = "bucket_user"
      description = "user for obs_bucket"
}
