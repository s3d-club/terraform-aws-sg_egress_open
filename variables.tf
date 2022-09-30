variable "cidr6" {
  type = list(string)

  description = <<-END
	  IP6 CIDR

		Notes are [HERE](https://go.s3d.club/tf/name-prefix).
		END
}

variable "cidr" {
  type = list(string)

  description = <<-END
	  IP4 CIDR

		Note are [HERE](https://go.s3d.club/tf/name-prefix).
		END
}

variable "name_prefix" {
  type = string

  description = <<-END
		Name Prefix

		The value for the `Name` tag and a prefix value for the security group name.

		The string `-egress-open` will be appended to the name prefix when the
		`Name` tag is defined. The security group name shares this name and also a
		random suffix from the resource provider.

		Notes are [HERE](https://go.s3d.club/tf/name-prefix).
		END
}

variable "tags" {
  type = map(string)

  description = <<-END
    Tags for resources

    All resources will include thise tag values.

		Tags in the **output** of this module will include all these **input** tags
		merged with the the [part_name](https://go.s3d.club/tf/part_name) and version
		of this module.

		Notes are [HERE](https://go.s3d.club/tf/tagging).
		END
}

variable "vpc" {
  type = string

  description = <<-END
	  VPC ID

		Notes are [HERE](https://go.s3d.club/tf/aws/vpc).
		END
}
