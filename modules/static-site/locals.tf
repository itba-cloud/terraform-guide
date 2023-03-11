locals {
  filetypes = {
    "html" : "text/html",
    "jpg" : "image/jpg",
    "jpeg" : "image/jpeg",
    "png" : "image/png",
    "css" : "text/css",
    "js" : "application/javascript",
    "json" : "application/json",
  }

  file_with_type = flatten([
    for type, mime in local.filetypes : [
      for key, value in fileset("${var.src}/", "**/*.${type}") : {
        mime = mime
        file_name = value
      }
    ]
  ])

  constants = join("\n", [for k,v in var.constants : "const ${k} = '${v}';"])
  
}