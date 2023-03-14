1.1-Levantar una VPC con CIDR: 10.0.0.0/16 en la az: us-east-1
Agregar un output con el cidr de la vpc creada
<!-- Convertir el output en un objeto y agregar el id de la vpc creada a dicho output -->
1.2-Definir dos subnets publicas, una en us-east-1a y otra en us-east-1b con los cidr 10.0.1.0/24 y 10.0.2.0/24
1.3-Utilizar tags para poder identificar ambas subnets. Nombrarlas pub-1 y pub-2
1.4-Crear un internet gateway
1.5-Definir una tabla de ruteo que habilite el trafico hacia las subnets

2.1-Levantar una instancia ec2 en cada subnet creada previamente a partir de la ami: "ami-0022f774911c1d690"
2.2-Ahora modificar la user data para levantar un index.html en el puerto 80
2.3-Utilizar tags para nombrarlas: pub-ec2-1 y pub-ec2-2
2.4-Definir un security group que permita el tráfico tcp al puerto 80

3.1-Crear una hosted zone en route 53

3.1-Levantar un bucket s3
3.2-Ahora, levantar un bucket s3 pero utilizando un modulo externo. Por ejemplo: "terraform-aws-modules/s3-bucket/aws"
3.3-Realizar el upload de un archivo index.html y un archivo error.html



5- lambda

6-cloudfront

7-api gateway

(opcional)
2.2-Ahora, modificar el punto anterior y levantar un auto scaling group que genere las instancias a demanda
2.3-Definir un alb que maneje el trafico del auto scaling group

