#language: es
@barcode

Característica: Lista códigos de barras
  Para llevar la gestión de los códigos de barras de las marcas que gestiono sus productos
  Como administrador de la aplicación
  Quiero poder gestionar el catálogo de compañías
  Quiero poder gestionar el catálogo de marcas
  Quiero poder gestionar el catálogo de códigos de barras

  Antecedentes:
  Dado existen los siguientes usuarios:
  | nombre    | clave     | email                 | activado  | rol         |
  | admin     | adminpw   | admin@latejedora.com  | 1         | ROLE_ADMIN  |
  Y estoy conectado como usuario "admin" y contraseña "adminpw"
  Y existen las siguientes compañías:
  | nombre      | nif        |
  | Compañía A  | A00000001  |
  | Compañía B  | A00000002  |
  | Compañía C  | A00000003  |
  Y existen las siguientes marcas:
  | nombre    | prefijo | prefijoUPC  | compañía    |
  | marca_1   | 1234567 |             | Compañía A  |
  | marca_11  | 1134567 |             | Compañía A  |
  | marca_2   | 2123456 | 012345      | Compañía C  |
  | marca_22  | 2212345 |             | Compañía C  |
  Y existen los siguientes códigos de barras:
  | tipo              | codigo        | marca     |
  | TYPECODE_GS1_12   | 123456789123  | marca_11  |
  | TYPECODE_GS1_12   | 123456789124  | marca_11  |
  | TYPECODE_GS1_12   | 123456789125  | marca_2   |
  | TYPECODE_GS1_128  | 123456789126  | marca_2   |
  | TYPECODE_GS1_128  | 123456789127  | marca_2   |

  Escenario: Listar códigos de barras
    Dado estoy en la página del escritorio
    Cuando presiono "Listar" cerca de "Barcode"
    Entonces debo estar en la página de listado de códigos de barras
    Y debo ver "5 resultados"

  Esquema del escenario: Buscar códigos de barras
    Dado estoy en la página de listado de códigos de barras
    Cuando relleno "Code" con "<codigo>"
    Y presiono "Filtrar"
    Entonces debo estar en la página de listado de códigos de barras
    Y debo ver "<resultados>"

    Ejemplos:
    | codigo        | resultados        |
    | 1234567       | 5 resultados      |
    | 123456789126  | 1 resultado       |
    | 123456789129  | No hay resultados |

  Esquema del escenario: Buscar códigos de barras asociados a una marca
    Dado estoy en la página de listado de códigos de barras
    Cuando selecciono "<marca>" de "Trademark"
    Y presiono "Filtrar"
    Entonces debo estar en la página de listado de códigos de barras
    Y debo ver "<resultados>"

    Ejemplos:
    | marca     | resultados        |
    | marca_11  | 2 resultados      |
    | marca_2   | 3 resultado       |
    | marca_1   | No hay resultados |

  Escenario: Crear nuevo código de barras
    Dado estoy en la página de creación códigos de barras
    Cuando relleno lo siguiente:
    | Tipo                              | TYPECODE_GTIN_8 |
    | Código                            | 123321456654    |
    Y selecciono "marca_22" de "Marca que corresponde este código"
    Y presiono "Crear y regresar al listado"
    Entonces debo estar en la página de listado de códigos de barras
    Y debo ver "Elemento creado satisfactoriamente"
    Y debo ver "123321456654"

  Escenario: Acceder al formulario de edición de códigos de barras desde el listado de códigos de barras
    Dado estoy en la página de listado de códigos de barras
    Cuando presiono "Editar" cerca de "123456789126"
    Entonces debería estar en la página edición de códigos de barras con "code" denominado "123456789126"

  Escenario: Actualizar código de barras
    Dado estoy en la página de listado de códigos de barras
    Y presiono "Editar" cerca de "123456789125"
    Y debería estar en la página edición de códigos de barras con "code" denominado "123456789125"
    Cuando relleno "Código" con "222212222112"
    Y presiono "Actualizar"
    Entonces debería estar en la página edición de códigos de barras con "code" denominado "222212222112"
    Y debo ver "Elemento actualizado satisfactoriamente."
    Y el campo "Código" debe contener "222212222112"

  Escenario: Borrar código de barras desde la página de edición
    Dado estoy en la página de listado de códigos de barras
    Y presiono "Editar" cerca de "123456789124"
    Y debería estar en la página edición de códigos de barras con "code" denominado "123456789124"
    Cuando sigo "Borrar"
    Entonces debo ver "¿Está seguro de que quiere borrar el elemento seleccionado?"
    Cuando presiono "Sí, borrar"
    Entonces debo estar en la página de listado de códigos de barras
    Y debo ver "Elemento eliminado satisfactoriamente."

  Escenario: Borrar código de barras desde el listado
    Dado estoy en la página de listado de códigos de barras
    Cuando presiono "Borrar" cerca de "123456789127"
    Entonces debo ver "¿Está seguro de que quiere borrar el elemento seleccionado?"
    Cuando presiono "Sí, borrar"
    Entonces debo estar en la página de listado de códigos de barras
    Y debo ver "Elemento eliminado satisfactoriamente."
    Pero no debo ver "123456789127"