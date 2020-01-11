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
