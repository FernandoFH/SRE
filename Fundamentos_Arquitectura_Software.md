<p align="center">Fundamentos de Arquitectura Software</p>
<hr/>

### El proceso de desarrollo de software

#### Etapas del proceso de desarrollo de software

El proceso de desarrollo tradicional tiene etapas muy marcadas, que tienen entradas, procesos y salidas que funcionan como entradas de la siguiente etapa.

- Análisis de requerimientos: Todo nace de un disparador que nos crea la necesidad de crear un artefacto o un sistema. Necesitamos entender cuál es el problema que queremos resolver. Hay requerimientos de negocio, requerimientos funcionales, requerimientos no funcionales.

- Diseño de la solución: Análisis profundo de los problemas para trabajar en conjunto y plantear posibles soluciones. El resultado de esto debe ser el detalle de la solución, a través de requerimientos, modelado, etc.

- Desarrollo y evolución: Implementación de la solución, para garantizar que lo que se esta construyendo es lo que se espera. Al finalizar esta etapa tendremos un artefacto de software.

- Despliegue: Aquí vamos a necesitar de infraestructura y de roles de operación para poder poner el artefacto a disponibilidad.

- Mantenimiento y evolución: Desarrollo + despliegue + mantenimiento, en esta etapa estamos atentos a posible mejoras que se hacen al sistema. En esta etapa el software se mantiene hasta que el software ya deja de ser necesario.

#### Dificultades en el desarrollo de software

**Esenciales:** Se dividen en 4 tipos de problemas:

- Complejidad: cuando un dominio de un problema es complejo en sí mismo. En el caso de adiciones y todas las acciones que conlleven al sistema a ser más complejo. _Manejo del problema de complejidad:_ No desarrollar: Comprar - OSS

- Conformidad: en qué contexto se usa el software y cómo debe adecuarse al mismo. Se incluyen todo lo que le compete. Ej: Ambiente, conectividad, impuestos, etc. _Manejo del problema:_ Prototipado rápido, feedback y ciclos rápidos para soluciones pequeñas.

- Tolerancia al Cambio: Posibilidad del cambio en el mismo y que sea responsivo a diferentes contextos._Manejo del problema:_ Desarrollo Evolutivo, desarrollos pequeños. Paso a paso pero de manera firme e ir haciendo crecer el software.

- Invisibilidad: Problemas de tangibilidad nula. _Manejo del problema:_ Grandes diseñadores, Arquitectos que saben abtraer el problema y que realiza soluciones elegantes, de manera simple, con la mejor calidad posible en los componentes que lo necesitan.

**Accidentales:** Está relacionado con la plataforma que vamos a implementar, tecnología, lenguajes, frameworks, integraciones, entre otros, que tienen 3 Entornos:

- Lenguajes de alto nivel
- Multi-procesamiento
- Entornos de programación

#### Roles

Es importante que diferenciemos el ROL del puesto de trabajo, hay roles que pueden ser desarrollados por la misma persona.

- Experto del dominio: En una metodologia tradicional, es la persona a la que acudimos para entender las necesidades del negocio. En metodologias Agiles --> stakeholders.

- Analista: funcional/de negocio: la persona responsable de definir los requerimientos que van a llevar al software a u buen puerto. En el caso de Agiles el dueño del producto es quien arma las historias y que nos acompaña en el proceso de construcción del software.

- Administrador de sistemas / DevOps: Es el rol de operaciones y desarrollo, son las personas responsables de la infraestructura que alojara nuestra aplicación.

- Equipo de desarrollo: QA / Testing se encargan de la evaluación de nuestro software, comprobar que lo que se esta haciendo es lo que se espera que se haga. Desarrolladores involucrados en la construcción del software. Arquitecto, diseña la solución y analisis de los requerimientos, es un papel mas estrategico. La arquitectura emerja del trabajo de un equipo bien gestionado.

- Gestor del proyecto / facilitador: Llevan al equipo a través del proceso iterativo e incremental, entender lo que pasa con el equipo y motivar el avance en el desarrollo del producto.

### Introducción a la arquitectura de software

0. :star: to the project. :metal:
2. Fork the project [Indigo](https://github.com/sergiokopplin/indigo/fork)
3. Edit `_config.yml` with your data (check <a href="README.md#settings">settings</a> section)
4. Write some posts :bowtie:

If you want to test locally on your machine, do the following steps also:

### Análisis de requerimientos

You must fill some informations on `_config.yml` to customize your site.

```
name: John Doe
bio: 'A Man who travels the world eating noodles'
picture: 'assets/images/profile.jpg'
...

and lot of other options, like width, projects, pages, read-time, tags, related posts, animations, multiple-authors, etc.
```

### Estilos de arquitectura

### Desarrollo del proyecto
