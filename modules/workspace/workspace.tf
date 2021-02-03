locals {
    system = jsondecode( file ("${path.module}/assets/system.json" ) )
}

resource "tfe_workspace" "minetest_server" {
  name  = format("%s_%s", 
                local.system["env_stage"],
                local.system["workspace"]
                )
  organization = local.system["tfc_organization"]
  queue_all_runs = false
  auto_apply = true
  working_directory = "terraform"
}

resource "tfe_variable" "mt_access_token" {
    key          = "access_token"
    value        = ""
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Cloud Token to create Minetest Server"
    sensitive    = true
}

resource "tfe_variable" "mt_env_name" {
    key          = "env_name"
    value        = lookup(local.system, "env_name")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Name of the Component"
}

resource "tfe_variable" "mt_env_stage" {
    key          = "env_stage"
    value        = lookup(local.system, "env_stage")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Stage of the Component"
}

resource "tfe_variable" "mt_location" {
    key          = "location"
    value        = lookup(local.system, "location")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Location of the Component"
}

resource "tfe_variable" "mt_system_function" {
    key          = "system_function"
    value        = lookup(local.system, "system_function")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "System Function of the Component"
}

resource "tfe_variable" "mt_server_image" {
    key          = "server_image"
    value        = lookup(local.system, "server_image")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "server_image of the Component"
}

resource "tfe_variable" "mt_server_type" {
    key          = "server_type"
    value        = lookup(local.system, "server_type")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "server_type of the Component"
}

resource "tfe_variable" "mt_keyname" {
    key          = "keyname"
    value        = lookup(local.system, "keyname")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "keyname of the Component"
}

resource "tfe_variable" "mt_network_zone" {
    key          = "network_zone"
    value        = lookup(local.system, "network_zone")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "network_zone of the Component"
}

resource "tfe_variable" "mt_disk_id" {
    key          = "disk_id"
    value        = lookup(local.system, "disk_id")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "disk_id of the Component"
}

resource "tfe_variable" "mt_version" {
    key          = "mt_version"
    value        = lookup(local.system, "mt_version")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Minetest Server version to install"
    sensitive    = false
}

resource "tfe_variable" "mt_server_name" {
    key          = "mt_server_name"
    value        = lookup(local.system, "mt_server_name")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Minetest Server Name"
    sensitive    = false
}

resource "tfe_variable" "mt_server_description" {
    key          = "mt_server_description"
    value        = lookup(local.system, "mt_server_description")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Minetest Server Startup Description"
    sensitive    = false
}

resource "tfe_variable" "mt_bind_address" {
    key          = "mt_bind_address"
    value        = lookup(local.system, "mt_bind_address")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Minetest Server Listener Address"
    sensitive    = false
}

resource "tfe_variable" "mt_bind_port" {
    key          = "mt_bind_port"
    value        = lookup(local.system, "mt_bind_port")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Minetest Server Listener Address Port"
    sensitive    = false
}

resource "tfe_variable" "mt_admin_name" {
    key          = "mt_admin_name"
    value        = lookup(local.system, "mt_admin_name")
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Minetest Server Admin Account name"
    sensitive    = false
}


resource "tfe_variable" "mt_default_password" {
    key          = "mt_default_password"
    value        = ""
    category     = "terraform"
    workspace_id = tfe_workspace.minetest_server.id
    description  = "Default password for new Minetest Server users"
    sensitive    = true
}
