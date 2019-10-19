/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "credentials_path" {
  description = "The path to the GCP credentials JSON file"
  default = "credentials.json"
}

variable "project_id" {
  description = "The GCP project to use for integration tests"
  default = "vela-cit"
}

variable "region" {
  description = "The GCP region to create and test resources in"
  default = "us-central1"
}

variable "subnetwork" {
  description = "The name of the subnetwork create this instance in."
  default     = "default"
}

variable "target_size" {
  description = "The target number of running instances for this managed instance group. This value should always be explicitly set unless this resource is attached to an autoscaler, in which case it should never be set."
  default = "2"
}

variable "service_account" {
  default = {
	"email" = "132955150590-compute@developer.gserviceaccount.com"
	"scopes" = ["compute-rw", "storage-ro"]
  }
  type = object({
    email  = string
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
}

variable "tags" {
  type        = list(string)
  description = "Network tags, provided as a list"
  default = [ "http-server", "https-server" ]
}

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
  default = {
	"name" = "terraform-instance"
  }
}

variable "startup_script" {
  description = "User startup script to run when instances spin up"
  default     = <<SCRIPT
#!/bin/bash

sudo -H apt-get install python3-pip -y
sudo -H pip3 install virtualenv
mkdir pyrest
virtualenv pyrest/
cd pyrest
source bin/activate
bin/pip3 install flask
gsutil cp gs://marcussantos-scripts/hello.py .
bin/python3 hello.py
SCRIPT
}

