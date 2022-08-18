terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.30.0"
    }
  }
}

provider "google" {
  project = "sit-22t2-breaking-capt-8718903"
  region = "australia-southeast2"
}

#1 create storage bucket
resource "google_storage_bucket" "static-site" {
  name          = "captcha-store-1"
  location      = "AUSTRALIA-SOUTHEAST2"
  force_destroy = true
  }
}

#2 Data block to upload sample assests - unknown

#3 Function
data "google_cloudfunctions_function" "my-function" {
  name = "bc-function-1"
}

#4 Create pubsub
resource "google_pubsub_topic" "ps1" {
  name = "bc_ps1"

  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"
}

#5 create storage bucket for output
resource "google_storage_bucket" "static-site" {
  name          = "captcha-store-2"
  location      = "AUSTRALIA-SOUTHEAST2"
  force_destroy = true
  }
}
