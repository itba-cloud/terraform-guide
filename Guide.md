1.1-Levantar una VPC (cidr tanto, parametro tanto) 
Agregar un output con el cidr de la vpc creada
Convertir el output en un objeto y agregar el id de la vpc creada a dicho output
1.2-Definir dos subnets en distintas az (ambas publicas, aclarar el cidr tambien, bien tonto)
1.3-Generar los componentes necesarios para que puedan ser accedidas a traves de internet (item por item)

2.1-Levantar una instancia ec2 en cada subnet creada previamente
2.2-Montar un ebs
2.3-Ponerle los tags tanto a las instancias como al ebs

(opcional)
2.2-Ahora, modificar el punto anterior y levantar un auto scaling group que genere las instancias a demanda
2.3-Definir un alb que maneje el trafico del auto scaling group

3.1-Levantar un bucket s3
3.2-Ahora, levantar un bucket s3 pero utilizando un modulo externo. Por ejemplo: "terraform-aws-modules/s3-bucket/aws"
3.3-Realizar el upload de dos archivos de texto, text-1.txt y text-2.txt al bucket

4.1-Crear un parameter para la instancia
4.2-Crear un secret para la instancia

5- lambda

6-cloudfront

7-api gateway



