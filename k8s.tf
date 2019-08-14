provider "ibm" {
  ibmcloud_api_key = "${var.ibmcloud_api_key}"
}

resource "ibm_container_cluster" "testacc_cluster" {
  name         = "my_cluster"
  datacenter   = "dal10"
  machine_type = "free"
  hardware     = "shared"

  #public_vlan_id  = "vlan"
  #private_vlan_id = "vlan"
  #subnet_id       = ["1154643"]
  #region          = "eu-de"

  default_pool_size = 1
  webhook = [{
    level = "Normal"
    type  = "slack"
    url   = "https://hooks.slack.com/services/yt7rebjhgh2r4rd44fjk"
  }]
  org_guid     = "test"
  space_guid   = "test_space"
  account_guid = "test_acc"
}
