<p align="center"> Administración de Servidores Linux (By Platzi) </p>

----
#### Comandos Basicos 
- **pwd:** Nos muestra nuestra ubicación actual en el árbol de directorios (Print Working Directory).
- **ls:** Nos muestra el contenido de las carpetas de nuestro sistema operativo. 
- **cd:** Cambiar nuestra ubicación en el árbol de directorios (Change Directory). Usamos dos puntos (..) para referirnos al directorio padre y solo uno (.) para referirnos a nuestro directorio actual.
- **touch:** Nos ayuda a crear archivos desde la terminal.
- **mkdir:** Nos ayuda a crear carpetas desde la terminal.
- **cp:** Nos permite duplicar archivos y carpetas.
- **mv:** Cambiar el nombre de nuestros archivos y carpetas.
----
#### Lectura de archivos
- **cat:** Nos permite leer archivos en su totalidad.
- **less:** Nos ayuda a leer el contenido de nuestros archivos por páginas. Nos movemos con las flechas del teclado o la tecla de espacio. Salimos de la lectura del archivo con la letra q. Buscamos palabras específicas escribiendo /palabra.
- **tail:** Nos muestra las últimas 10 líneas de nuestros archivos.
- **head:** Nos muestra las primeras 10 líneas de nuestros archivos.
----
#### Archivos y permisos

``` -rwxrw-r--. ```

- El primer carácter nos indica si tenemos un archivo (-), enlace simbólico (l) o directorio (d).

**Los siguientes caracteres significan**

- Lectura (r)
- Escritura (w)
- Ejecución (x).

**Se agrupan en 3 e implicam:** 
- El primer grupo son los permisos del usuario que creó ese archivo, 
- El segundo para el grupo al que pertenece este usuario. 
- El tercero para cualquier otro usuario de tu sistema operativo.

Si en vez de estas letras encuentras un guion significa que ese usuario o grupo de usuarios no tiene permiso para esa acción en particular.

Podemos encontrar estos permisos como 3 números del 1 al 7. Estos números son la suma de los 3 caracteres de permisos para cada usuario o grupo.
``` 
- = 0
x = 1
w = 2
r = 4
```

Por lo tanto, los permisos de nuestro archivo de ejemplo serían: 7 (1+2+4) | 6 (0+2+4) | 4 (0+0+4).

Para cambiar los permisos de un archivo o directorio usamos:

``` chmod + a quién queremos añadir o quitar los permisos  ```

El usuario propietario: u.
El grupo: g.
El resto de usuarios: o.
Para todos: a.

**Por ejemplo** , para añadir permisos de ejecución a nuestro usuario propietario usamos:

``` chmod u+x nombre-del-archivo ```

Para cambiar al usuario propietario del archivo con el comando ```chown  ```.

``` sudo chown nuevo-usuario:grupo-usuarios nombre-del-archivo ```

----
#### Manejo y monitoreo de procesos y recursos del sistema

- ps.
- grep nos ayuda a filtrar el resultado de un comando o archivo dependiendo de las palabras de cada línea. Para esto también vamos a usar el pipe (|), un símbolo que nos ayuda a enviar el resultado de un comando a un segundo comando.

 ```  ps aux | grep User ```
 
 ----
####  Monitoreo de recursos del sistema
 
El comando  ``` top  ``` nos permite interactuar con una interfaz gráfica que nos muestra información específica del sistema operativo: cantidad de usuarios, tareas corriendo o “durmiendo”, identificadores de los procesos, entre otras.

Para ver la información de la CPU podemos usar el comando:

``` cat /proc/cpuinfo | grep -i "processor" ```

``` ps auxf | sort -nr -k 3 | head 5 ```


Para ver la información de la memoria podemos usar el comando ```free o free -h  ```

Para ver el uso del disco duro está el comando ``` du o du -hsc ```

Proceso que consumem mas cpu

```  sudo ps auxf | sort -nr - k 3 | head -5 ```

Proceso que consumem mas RAM

``` sudo ps auxf | sort -nr - k 4 | head -5 ```

----
####  Análisis de los parámetros de red

``` ip addr show```
``` hostname ```
``` route -n ```
``` nslookup ```

----
####  Manejo de paquetes en sistemas basados en Debian
```sudo apt update ```
```sudo apt upgrade ```

----
####  Nagios

``` wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.4.tar.gz -O nagioscore.tar.gz  ```

```  tar xvzf nagioscore.tar.gz``` 

``` 
sudo ./configure --with-https-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install-groups-users
sudo make install
sudo make install-init
sudo make install-commandmode
sudo make install-config
sudo make install-webconf
``` 

Para administrar el servicio de nagios podemos usar el comando 
``` 
sudo systemctl (status, start, restart, reload, stop, enable, disable, list-dependencies) nagios.
``` 
#### Installing the Nagios Plugins
``` 
cd ~
curl -L -O https://nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
``` 
``` 
tar zxf nagios-plugins-2.2.1.tar.gz
cd nagios-plugins-2.2.1
``` 
``` 
./configure
make
sudo make install
``` 
----
#### Usuarios
- **id**: Nos muestra el identificador único (uid) de cada usuario en nuestro sistema operativo. El ID 0 está reservado para el usuario root.

- **whoami**: Podemos ver con qué usuario estamos trabajando en este momento. 

Podemos ver todos los usuarios del sistema leyendo el archivo ``` /etc/passwd ``` 

Las contraseñas de los usuarios están almacenadas en el archivo ``` etc/shadow ``` 

- **passwd**: Para cambiar la contraseña de nuestros usuarios.

#### Creando y manejando cuentas de usuario

```sudo useradd nombre-usuario```: Crea un usuario sin asignarle inmediatamente alguna contraseña ni consultar más información. 
```sudo adduser nombre-usuario```: Crea un nuevo usuario con contraseña y algo más de información. También creará una nueva carpeta en la carpeta /home/.
```userdel nombre-usuario```: Eliminar cuentas de usuarios.
```usermod```: Modificar la información de alguna cuenta.

#### Grupos

```su - nombre-usuario``` o ```sudo su - nombre-usuario``` : Cambia de usuario sin necesidad de reiniciar.
```groups nombre-usuario```: Para ver a qué grupos pertenecen nuestros usuarios.

Para agregar usuarios a un nuevo grupo usamos el comando ```sudo gpasswd -a nombre-usuario nombre-grupo```. Los eliminamos de la misma forma con ```gpasswd -d```.

Para esto también podemos usar el comando ```sudo usermod -aG nombre-grupo nombre-usuario```. Recuerda que en este caso el orden en que escribimos el grupo y el ususario se invierte.

Para listar los permisos de nuestros usuarios ejecutamos el comando sudo -l.

#### Autenticación de clientes y servidores sobre SSH

SSH es un protocolo que nos ayuda a conectarnos a nuestros servidores desde nuestras máquinas para administrarlos de forma remota. 

Con el comando ```ssh-keygen``` podemos generar llaves públicas y privadas en nuestros sistemas.

Para conectarnos desde nuestra máquina a un servidor remoto debemos:

Ejecutar el comando ```ssh-copy-id -i ubicación-llave-pública nombre-usuario@dirección-IP-servidor-remoto``` y escribir nuestra contraseña para enviar nuestra llave pública al servidor.

Usar el comando ```ssh nombre-usuario@dirección-IP-servidor-remoto``` para conectarnos al servidor sin necesidad de escribir contraseñas.

También podemos usar el comando ```ssh -v o ssh -vvvv```... para ver la información o los errores de nuestra conexión con el servidor. 

Las configuraciones de SSH se encuentran en el archivo ```/etc/ssh/sshd_config```.
