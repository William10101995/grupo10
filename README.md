# ARCHIVOS DE CONFIGURACION DE TERRAFORM

Tomando como base los archivos de ejemplo que nos proveyo la catedra, realizamos las modificaciones necesarias para poder cumplir con lo solicitado en el enunciado del desafio.

# Estructura de archivos y carpetas

Como podemos apreciar la estructura principal cuenta con una carpeta **.github/workflows** donde se encuentra nuestro archivo **terraform.yml** el cual atumatizara el trabajo una vez los cambios sean subidos al repositorio. Luego podemos apreciar una carpeta **images** la cual es insignificante para lo realizado ya que solo contiene imagenes del proyecto. Y por ultimo en la raiz podemos observar los archivos **.tf** que son los archivos de configuracion correspodientes de Terraform.

![Estructura del Proyecto](/images/Estructura.png)

# Archivo **provider**

![Provider](/images/Provider.png)

En este archivo lo que hacemos es configurar los proveedores necesarios para Terraform Cloud, luego lo que hacemos es setearle la region a **AWS**, esta region la tomamos de las variables que se nos proveyo desde la catedra, veremos todas las necesarias el archivo **variables**.

# Archivo **variables**

![Variables](/images/Variables.png)

En el archivo de **variables** lo que se hacemos es definir todas las variables necesarias para trabajar, estas se mencionaban en el desafio y fueron provistos por la catedra ya que se encuentran seteadas directamente en aws como variables de entorno.

# Archivo **networking**

![Networking](/images/Networking.png)

En este archivo lo que hacemos es crear la **subnet** en **AWS** le setemos el **vpc_id** el cual tomamos de las variables ya mencionadas y creamos el **cidr** de esa **subnet**, luego se crea una tabla de ruteo para dar salida a internet y por ultimo se asocia la tabla de ruteo con la subnet que creamos.

# Archivo **instance**

![Instance](/images/Instance.png)

En este archivo creamos el recurso del servidor, y le setemos todos los valores necesarios para acceder al mismo. Cabe destacar que en el campo **private_id** debemos crear una **ip** privada que debe estar en el rango establecido.

# Archivo **security_groups**

![Security](/images/security.png)

En este archivo definimos los protocolos de ingreso, **HTTP** y **SSH** en nuestro caso, asi como tambien los puerto a traves de los cuales se tendra acceso, **22** en caso de **SSH** y **80** en caso de **HTTP** y luego definiremos que ips tendran acceso, como solo es un caso de prueba daremos acceso a cualquiera aunque esto no se recomienda.

# CREANDO REPOSITORIO Y AGREGANDO SECRETS KEY

Para poder realizar este entorno de integracion y despliegue continuo es necesesario tener todo conectado a un repositorio de **GITHUB**, a continuacion veremos como conformar el mismo para que el despliegue se realice de manera correcta.

1. En primer lugar creamos un repositorio, puede ser privador o publico, en este caso privado porque asi se indicaba. Seguidamente agregamos los secrets key necesarios (estos fueron provistos por la catedra). En principio, en la rama **main** debe pushearse la carpeta **.github/workflows/terraform.yml**, es necesario seguir esta nomenclatura para que el despliegue se realice de manera correcta cuando al nivel de la raiz se agreguen los archivos **.tf**.
   ![Secrets](/images/SecretsRepo.png)
   ![Main](/images/PrincipalRepo.png)

2. Luego, a partir de la rama **main** creamos otra rama, en este caso **ramaDeploy**, en esta rama pusheamos los archivos **.tf** con todas las modificaciones que antes vimos. Esto lo hacemos asi para que no se relice el despliegue automaticamente, ya que este solo se efectua cuando los cambios son enviados a la rama **main**.

![Rama](/images/RamaDeployRepo.png)

3. Seguidamente, relizamos un Pull Request de la rama **ramaDeploy** a la rama **main** esperando que otro integrante del grupo lo apruebe (el profe en nuestro caso) y asi, esta rama se fucionara con **main** el se procedera al despliegue completo.

![PR](/images/RamasPRRepo.png)
![PRListo](/images/PRListoRepo.png)
