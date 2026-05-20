resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  subnet_id                   = aws_subnet.public_subnet_az1.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = aws_key_pair.dev_key.key_name
  associate_public_ip_address = true
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-bastion"
    }
  )

}