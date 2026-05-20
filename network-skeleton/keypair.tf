# =========================================
# GENERATE PRIVATE KEY
# =========================================

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# =========================================
# CREATE AWS KEY PAIR
# =========================================

resource "aws_key_pair" "dev_key" {
  key_name   = "${var.environment}-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-keypair"
    }
  )
}

# =========================================
# SAVE PRIVATE KEY LOCALLY
# =========================================

resource "local_file" "private_key" {
  content = tls_private_key.ssh_key.private_key_pem

  filename = "${path.module}/${var.environment}-key.pem"

  file_permission = "0400"
}