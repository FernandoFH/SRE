resource "aws_vpc" "testing_subnet" {
  cidr_block = "10.100.0.0/16"
}

resource "aws_subnet" "this" {
  count      = 6
  vpc_id     = aws_vpc.testing_subnet.id
  cidr_block = cidrsubnet(aws_vpc.testing_subnet.cidr_block, 4, count.index)
}
