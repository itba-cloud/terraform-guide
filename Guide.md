Tarea de Terraform
==================

Parte 1
-------

### 1.1

-   Levantar una VPC con CIDR `10.0.0.0/16` en la región `us-east-1`.
-   Agregar un output con el CIDR de la VPC creada.
-   Convertir el output en un objeto y agregar el ID de la VPC creada a dicho output.

### 1.2

-   Definir dos recursos `subnet`, una en `us-east-1a` y otra en `us-east-1b` con los CIDR `10.0.1.0/24` y `10.0.2.0/24`.
-   Utilizar tags para poder identificar ambas subnets.
-   Nombrarlas `pub-1` y `pub-2`.

### 1.3

-   Modificar el punto anterior para solo definir un recurso que genere ambas subnets.

### 1.4

-   Crear un Internet Gateway.

### 1.5

-   Definir una tabla de ruteo que habilite el tráfico hacia las subnets.

### 1.6

-   Definir todos los campos estáticos como variables locales.
-   Definir los CIDR utilizando la función `cidrsubnet`.

Parte 2
-------

### 2.1

-   Levantar una instancia EC2 en cada subnet creada previamente a partir de la AMI `ami-0022f774911c1d690`.

### 2.2

-   Ahora modificar la `user data` para levantar un `index.html` en el puerto `80`.

### 2.3

-   Utilizar tags para nombrarlas: `pub-ec2-1` y `pub-ec2-2`.

### 2.4

-   Definir un security group que permita el tráfico TCP al puerto `80`.

Parte 3
-------

### 3.1

-   Crear un bucket S3 usando el prefijo `tf-guide`.

### 3.2

-   Ahora, levantar un bucket S3 pero utilizando un módulo externo. Por ejemplo: `terraform-aws-modules/s3-bucket/aws`.

### 3.3

-   Realizar el upload de un archivo `index.html` y un archivo `error.html`.

Parte 4
-------

### 4.1

-   Crear una CDN.

### 4.2

-   Definir una política de cacheo `managed optimized`.

### 4.3

-   Definir un `origin` para el bucket recién creado.
-   Marcar el archivo `index.html` como el objeto default.

### 4.4

-   Definir el default cache behaviour para que redirija a HTTPS.
-   Para ello, utilizar un certificado de CloudFront.

5- lambda

6-cloudfront

7-api gateway

(opcional)
2.2-Ahora, modificar el punto anterior y levantar un auto scaling group que genere las instancias a demanda
2.3-Definir un alb que maneje el trafico del auto scaling group

