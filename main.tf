resource "google_storage_bucket" "bucket" {
  name = "bucket19051991"
  location = "europe-west1"

lifecycle_rule {
  condition {
    age = 10
  }
  action {
    type = "setStorageClass"
    storage_class = "ARCHIVE"
  }
}
}

resource "google_storage_bucket_object" "pic" {
  name = "butterfly"
  bucket = google_storage_bucket.bucket.name
  source = "./download.png"
}

resource "google_storage_object_access_control" "objectaccesscontrol" {
  object = google_storage_bucket_object.pic.name
  bucket = google_storage_bucket.bucket.name
  role = "READER"
  entity = "allusers"
}