resource "aws_key_pair" "instance_key_pair" {
  key_name = "${var.project_name}-key"
  public_key = var.ec2_public_key
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.project_name}-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "instance" {
  ami                     = var.ec2_ami
  instance_type           = var.ec2_instance_type
  vpc_security_group_ids  = [aws_security_group.ec2_instance_sg.id]
  subnet_id               = module.vpc.public_subnets[0]
  user_data               = file("${path.module}/scripts/bastion-userdata.sh")
  key_name                = aws_key_pair.instance_key_pair.key_name
  iam_instance_profile    = aws_iam_instance_profile.instance_profile.name

  tags = {
    Name = var.project_name
  }
}

resource "aws_eip" "eip_ec2_instance" {
  instance  = aws_instance.instance.id
  domain    = "vpc"

  tags = {
      Name = "${var.project_name}-eip"
  }
}