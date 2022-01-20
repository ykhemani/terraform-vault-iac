resource "vault_policy" "admin" {
  name = "admin"

  policy = <<-EOT
    path "sys/internal/counters/entities" {
      capabilities = ["read"]
    }

    path "identity/entity/id" {
      capabilities = ["list"]
    }

    path "sys/auth" {
      capabilities = ["read"]
    }

    path "sys/namespaces" {
      capabilities = ["list"]
    }

    path "auth/*"
    {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # Create, update, and delete auth methods
    path "sys/auth/*"
    {
      capabilities = ["create", "update", "delete", "sudo"]
    }

    # List auth methods
    path "sys/auth"
    {
      capabilities = ["read"]
    }

    # List existing policies
    path "sys/policies/acl"
    {
      capabilities = ["list"]
    }

    # Create and manage ACL policies
    path "sys/policies/acl/*"
    {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # List, create, update, and delete key/value secrets
    path "secret/*"
    {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # Manage secrets engines
    path "sys/mounts/*"
    {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }

    # List existing secrets engines.
    path "sys/mounts"
    {
      capabilities = ["read"]
    }

    # Read health checks
    path "sys/health"
    {
      capabilities = ["read", "sudo"]
    }
  EOT
}

