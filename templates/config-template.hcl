# Define the storage node-ID and path
storage "raft" {
  node_id           = "{{ ansible_hostname }}"
  path              = "/opt/vault/data"
}

# Set up externally available APIs
api_addr            = "http://{{ ansible_default_ipv4.address }}:8200"
cluster_addr        = "http://{{ ansible_default_ipv4.address }}:8201"

# Specify the cluster name
cluster_name        = "{{ vault_cluster_name }}"

# Start listener TCP listener for APIs
listener "tcp" {
  address           = "0.0.0.0:8200"
  cluster_address   = "0.0.0.0:8201"
  tls_disable       = true
}

default_lease_ttl   = "20m"
disable_mlock       = true
disable_cache       = true 
ui                  = true


