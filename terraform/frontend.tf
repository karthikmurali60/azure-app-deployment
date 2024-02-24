resource "azurerm_container_app" "web" {
  name                         = "ew-frontend"
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = azurerm_resource_group.this.name
  revision_mode                = "Single"

  secret {
    name  = "container-registry-password"
    value = azurerm_container_registry.this.admin_password
  }

  registry {
    server               = azurerm_container_registry.this.login_server
    username             = azurerm_container_registry.this.admin_username
    password_secret_name = "container-registry-password"
  }

  lifecycle {
    ignore_changes = [
      template.0.container[0].image
    ]
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "ew-frontend"
      image  = "ewacrtestkarthik.azurecr.io/fruits-frontend:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      
      env {
        name  = "API"
        value = format("https://%s", azurerm_container_app.api.latest_revision_fqdn)
      }
    }

    min_replicas = 1
  }
}
