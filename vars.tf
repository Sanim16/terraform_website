#empty variables are gotten from a file terraform.tfvars which is excluded from version control
#this is done to prevent uploading secrets and AWS credentials

variable "AWS_CREDENTIALS" {} #empty to prevent uploading secrets
variable "VSCODE_PROFILE" {}  #empty to prevent uploading secrets
variable "AWS_REGION" {
  type    = string
  default = "us-east-1"

}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0a24ce26f4e187f9a"
    us-east-2 = "ami-0a5e8065e5b04c679"
  }

}
variable "KEY_PAIR" {}    #empty to prevent uploading secrets
variable "PUB_KEY" {}     #public key used for key pair creation
variable "PRIVATE_KEY" {} #private key used for key pair creation
variable "AWS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "MY_IP" {
  default = "0.0.0.0/0" #edit this to the ip address that needs ssh access. prefably your Ip address.
}