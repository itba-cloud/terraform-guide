# ITBA - Cloud Computing

Para acceder a los ejercicios de la [Guía de Terraform](GUIDE.md).

> Tener en cuenta que los archivos de resolución son de guía, y muchos pueden no cumplir con los estándares esperados para la materia **los cuales fueron explicados en clase**. Dicho de otra manera, tomar la resolución como ejemplo no como regla, a menos que se especifique explicitamente lo contrario.

------------

# Terraform

Terraform es una herramienta de infraestructura como código (IaC) que permite crear y gestionar recursos de infraestructura en la nube de forma declarativa. En este repositorio se encuentran los archivos de configuración de Terraform para desplegar recursos en Amazon Web Services (AWS).

## Instalación

### Terraform

Puedes descargar la última versión de Terraform desde el sitio oficial de Terraform en [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html). Sigue las instrucciones de instalación adecuadas para tu sistema operativo.

### AWS CLI

AWS CLI es una interfaz de línea de comandos para interactuar con los servicios de AWS. Puedes encontrar información sobre cómo instalar AWS CLI en la documentación oficial de AWS en [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/).

## Configuración

Antes de empezar a usar Terraform y AWS CLI, necesitarás configurar tus credenciales de AWS. Puedes hacerlo ejecutando el siguiente comando de AWS CLI:

```bash
aws configure
```
Esto te pedirá tu Access Key ID, Secret Access Key, Región por defecto y Formato de salida por defecto. Asegúrate de tener tus credenciales de AWS a mano para completar este proceso.

## Uso
Una vez que hayas instalado Terraform y AWS CLI, y hayas configurado tus credenciales de AWS, puedes usar los siguientes comandos de Terraform para crear, actualizar y destruir infraestructura en AWS:

### Inicializar un directorio de trabajo de Terraform
```bash
terraform init
```
Mostrar un plan de los cambios propuestos
```bash
terraform plan
```
### Crear o actualizar recursos de infraestructura
```bash
terraform apply
```

### Destruir recursos de infraestructura
```bash
terraform destroy
```

## Otros comandos útiles

- `terraform show`: Muestra el estado actual de la infraestructura gestionada por Terraform.
- `terraform validate`: Valida la sintaxis y la estructura de los archivos de configuración de Terraform.
- `terraform state`: Gestiona el estado de Terraform, incluyendo la importación y la eliminación de recursos del estado.
- `terraform fmt`: Formatea los archivos de configuración de Terraform.

## Uso del argumento `target` en plan o apply

El argumento `--target` se utiliza para establecer un subconjunto de recursos como objetivo para aplicar o destruir. Esto puede ser útil cuando se trabaja con configuraciones de Terraform que contienen múltiples recursos y se desea aplicar o destruir sólo un subconjunto de ellos en lugar de todos los recursos definidos en el archivo de configuración.

El formato básico del `target` es el siguiente:

```bash
terraform plan RESOURCE_TYPE.NAME
```

Donde `RESOURCE_TYPE` es el tipo de recurso (por ejemplo, `aws_instance` para una instancia de EC2 de AWS) y `NAME` es el nombre del recurso específico que deseas como objetivo (por ejemplo `main`).

## Manejo de variables en archivos `.tfvars`

En Terraform, las variables se utilizan para parametrizar la configuración de infraestructura y permitir la reutilización de configuraciones en diferentes entornos o escenarios. Los archivos `.tfvars` son archivos de texto plano que se utilizan para definir los valores de las variables en un formato clave-valor.

Para utilizar variables en Terraform, se definen en el archivo de configuración con la sintaxis `${}`. Por ejemplo:

```hcl
variable "region" {
  description = "Region a utilizar"
  type        = string
}

resource "aws_instance" "main" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  region        = var.region  # Usando la variable "region" en la configuración del recurso
}
```

Luego, en un archivo `.tfvars`, puedes definir los valores para las variables. Por ejemplo:

```hcl
region = "us-east-1"
```

Se puede usar varios archivos `.tfvars` para diferentes entornos o configuraciones y especificar cuál archivo usar al ejecutar los comandos de Terraform usando la opción -var-file. Por ejemplo:

```hcl
terraform apply --var-file="dev.tfvars"
```

Esto cargará las variables del archivo dev.tfvars y las utilizará en la configuración de Terraform durante la ejecución del comando.


Nota: si el file se llama `terraform.tfvars` Terraform lo detecta automaticamente y no es necesario especificarlo como argumento.