# create test variables using terraform

# if you want to pass vars by populating vars files

#create test variable
variable "testvar" {
    type        = string
    default     = "hello"
    description = "for passing to ansible via var file"
}

#write variable to file
resource "local_file" "output_tf_vars" {
    content    =  <<-DOC
      tf_example_variable: ${var.testvar}
      DOC
    filename   = "./tf_to_ansible_vars.yml"
}

###################################
# if you want to pass vars to an ansible-playbook command

#create test variable
variable "testvar2" {
    type        = string
    default     = "hello2"
    description = "for passing to ansible via extra vars command line argument when running playbook"
}

# run playbook in terraform using tf vars in the extra vars
resource "null_resource" "execute_ansible"{
  provisioner "local-exec" {
    command = "ansible-playbook ansible_debug.yml --extra-vars=\"tf_example_variable=${var.testvar2}\""
  }
}



