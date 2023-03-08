1.1-Levantar una VPC
1.2-Definir dos subnets en distintas az
1.3-Generar los componentes necesarios para que puedan ser accedidas a traves de internet

2.1-Levantar una instancia ec2 en cada subnet creada previamente
2.2-Ahora, modificar el punto anterior y levantar un auto scaling group que genere las instancias a demanda
2.3-Definir un alb que maneje el trafico del auto scaling group

3.1-Levantar un bucket s3
3.2-Ahora, levantar un bucket s3 pero utilizando un modulo externo. Por ejemplo: "terraform-aws-modules/s3-bucket/aws"
3.3-Realizar el upload de dos archivos de texto, text-1.txt y text-2.txt al bucket

