terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_iam_service_account" "test-bucket-1-user" {
  folder_id = "b1gpmvbq8i3ut05872m7"
  name      = "test-bucket-1-user"
}

resource "yandex_resourcemanager_folder_iam_member" "test-bucket-1-editor" {
  folder_id = "b1gpmvbq8i3ut05872m7"
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.test-bucket-1-user.id}"
}


resource "yandex_iam_service_account_static_access_key" "test-bucket-1-access_key" {
  service_account_id = yandex_iam_service_account.test-bucket-1-user.id
  description        = "access_key for test-bucket-1"
}

resource "yandex_storage_bucket" "test-bucket-1" {
  bucket     = "test-bucket-1"
  access_key = yandex_iam_service_account_static_access_key.test-bucket-1-access_key
  secret_key = yandex_iam_service_account_static_access_key.test-bucket-1-secret_key
}


