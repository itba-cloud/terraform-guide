# Tarea de Terraform

**Importante!** La siguiente guía esta pensada para ser un primer acercamiento al trabajo con Terraform. Realizar la misma no es obligatorio pero simplificará considerablemente el trabajo a realizar en el TP3. Cabe destacar que la misma, quizás con un pequeño esfuerzo extra, puede realizarse de manera tal que el código generado sea totalmente reutilizable para dicho trabajo, ahorrando tiempo total de trabajo. Por último, la misma no busca ser dificil, pero espera que investiguen por su propia cuenta y lean la documentación. Esto mismo será lo que deberán hacer en el TP3.

## Networking

### 1.1

- Levantar una VPC con CIDR `10.0.0.0/16` en la región `us-east-1`.
- Agregar un output con el CIDR de la VPC creada.
- Convertir el output en un objeto y agregar el ID de la VPC creada a dicho output.

### 1.2

- Definir dos recursos `subnet`, una en `us-east-1a` y otra en `us-east-1b` con los CIDR `10.0.1.0/24` y `10.0.2.0/24`.
- Utilizar tags para poder identificar ambas subnets.
- Nombrarlas `pub-1` y `pub-2`.
- Generar un output que sea el id de cada una de las subnets.

### 1.3

- Modificar el punto anterior para solo definir un recurso que genere ambas subnets.
- Definir los CIDR utilizando la función `cidrsubnet`.

### 1.4

- Crear un Internet Gateway.

### 1.5

- Definir una tabla de ruteo que habilite el tráfico hacia las subnets.

## Compute

### 2.1

- Levantar una instancia EC2 en cada subnet creada previamente a partir de la AMI `ami-0022f774911c1d690`.

### 2.2

- Ahora modificar la `user data` para levantar un `index.html` en el puerto `80`.

### 2.3

- Utilizar tags para nombrarlas: `pub-ec2-1` y `pub-ec2-2`.

### 2.4

- Definir un security group que permita el tráfico TCP al puerto `80`.

### 3.1

- Crear una lambda que se encuentre dentro de una subred privada. El contenido de la función está en `./resources/lambda.zip` y usar como runtime `python3.9`

### 3.2

- Levantar un Api Gateway Rest API para la lambda.

#### 3.2.a

- Crear la Rest API y recurso para acceder a la lambda usando: `aws_api_gateway_rest_api`, `aws_api_gateway_resource`, `aws_api_gateway_method`

#### 3.2.b

- Conectar la función lambda creada en el 3.1 a la Rest API usando `aws_api_gateway_integration`

#### 3.2.c

- Crear un deployment de la API para poder mandarle requests usando `aws_api_gateway_deployment`

#### 3.2.d

- Dar permiso al Api Gateway de poder acceder a la lambda usando `aws_lambda_permission`

## Storage

### 4.1

- Crear un bucket S3 usando el prefijo `tf-guide`.

### 4.2

- Ahora, levantar un bucket S3 pero utilizando un módulo externo. Por ejemplo: `terraform-aws-modules/s3-bucket/aws`.

### 4.3

- Realizar el upload de un archivo `index.html` y un archivo `error.html`.

### 4.4 (adicional)

-   Definir el default cache behaviour para que redirija a HTTPS.
-   Para ello, utilizar un certificado default de CloudFront.

## Content Delivery Network

### 5.1

- Crear una instancia de Cloudfront.

### 5.2

- Definir una política de cacheo `managed optimized`.

### 5.3

- Definir un `origin` para el bucket recién creado.
- Marcar el archivo `index.html` como el objeto default.

### 5.4

- Definir el default cache behaviour para que redirija a HTTPS.
- Para ello, utilizar un certificado de CloudFront.

## ADICIONAL

### A.1
Vamos a modificar el ejercicio de computo para en lugar de generar dos recursos EC2 usar un `Autoscaling Group`.

- Redefinir el codigo de las instancias previamente creadas y generar un `aws_launch_template`.
- Definir el recurso `autoscaling_group` utilizando esta instancia.
- Recibir la cantidad de instancias minima y maxima como variables.

### A.2

Vamos a generar un `Application Load Balancer` para redistribuir los pedidos a las distintas instancias del `Autoscaling Group` definido en el ejercicio anterior.

- Definir un recurso `aws_lb` configurando los security groups correspondientes.
- Crear un `aws_lb_target_group` que soporte el protocolo `HTTP`.
- Establecer un `health check` hacia las instancias ec2 que vamos a estar sirviendo.
- Definir un `aws_lb_listener` que soporte `HTTP` y su reenvie los pedidos al `autoscaling group` previamente definido.

### A.3

Vamos a agregar un nuevo origin a nuestra `Content Delivery Network` para servir el contenido del `Application Load Balancer`.

- Generar un nuevo origin correspondiente con el `application_load_balancer`.
- Definir un behaviour que rediriga los requests recibidos en el path: `/api/*` a la url del alb.

### A.4

Ahora agregar un nuevo origin a nuestra `Content Delivery Network` para servir el contenido del `API Gateway`.
