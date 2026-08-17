[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/VaG5hsLF)
# Ejercitación: Manipulación del DOM – Atributos Dinámicos

## 📋 Objetivo

En esta ejercitación vas a practicar la **manipulación de atributos HTML desde JavaScript**, utilizando los métodos del DOM que vimos en clase. Partirás de una página que se ve incompleta y "rota", y tu tarea será escribir el código necesario en `js/script.js` para que la tarjeta de YouTube luzca correctamente.

---

## 🖥️ Estado actual (antes de resolver)

Al abrir `index.html` en el navegador, la página se ve así:

![Estado actual de la página](assets/estadoActual.png)

**¿Qué problemas tiene?**

- La imagen no se muestra (falta el atributo `src`).
- La tarjeta no tiene estilos de tarjeta (falta la clase `card` en el contenedor).
- El título "YouTube" tiene un formato feo (fondo amarillo, color rojo, tipografía serif).

---

## ✅ Resultado esperado (después de resolver)

Luego de completar los ejercicios, la página debe verse así:

![Resultado esperado](assets/resultadoEsperado.png)

---

## 📌 Tabla: issues y qué entrega cierra cada uno

En tu repositorio de corrección tendrás **issues de GitHub** generados automáticamente. Cada bloque de esta guía termina con el **mensaje de commit exacto** que debes usar para cerrar el issue correspondiente al subir a la rama `main`.

| Issue (típico) | Qué debe quedar hecho |
|----------------|------------------------|
| **#1** | Vincular `css/style.css` con `<link>` y `js/script.js` con `<script>` en `index.html`. |
| **#2** | Ejercicio 1: agregar la clase `card` al `div#tarjeta` con `setAttribute`. |
| **#3** | Ejercicio 2: asignar el `src` de la imagen de YouTube al `img#logo`. |
| **#4** | Ejercicio 3: quitar la clase `titulo-feo` del `<h1>`. |
| **#5** | Ejercicio 4: verificar con `hasAttribute` si el link YouTube tiene `href` y mostrarlo por consola. |
| **#6** | Ejercicio 5: obtener con `getAttribute` el `href` del link Wikipedia y mostrarlo por consola. |
| **#7** | Revisión docente: resultado visual correcto y salida de consola. |

---

## 🚀 Guía por issue (orden sugerido de trabajo)

Sigue este orden: resuelve cada parte, haz **un commit** con el mensaje indicado (título + cuerpo tal cual) y sube a `main`. Así cerrarás el issue automáticamente si usas `Closes #n` como en los ejemplos.

### Vincular CSS y JS al HTML (issue **#1**)

Antes de escribir JavaScript, necesitás **vincular la hoja de estilos y el script** al archivo `index.html`:

1. **CSS**: Dentro de la etiqueta `<head>`, agregá un `<link>` que vincule el archivo `css/style.css`.
2. **JavaScript**: Antes del cierre de `</body>`, agregá un `<script>` que vincule el archivo `js/script.js`.

> 💡 **Recordá**: el script debe ir al final del `<body>` para que el DOM ya esté cargado cuando se ejecute.

**Commit exacto para cerrar el issue:**
```text
feat(html): vincular css y script js al html

Closes #1
```

### Agregar clase card a la tarjeta (issue **#2**)

El `<div>` con `id="tarjeta"` no tiene la clase `card`, por lo que no se aplican los estilos de tarjeta definidos en `style.css`.

**Tu tarea:** Seleccioná el elemento por su id y agregale el atributo `class` con el valor `"card"`.

> 🔍 **Pista**: Investigá el método `setAttribute()`.

**Commit exacto para cerrar el issue:**
```text
feat(js): agregar clase card a la tarjeta con setAttribute

Closes #2
```

### Asignar imagen de YouTube (issue **#3**)

La etiqueta `<img>` con `id="logo"` no tiene `src`, por eso el navegador no puede mostrar ninguna imagen.

**Tu tarea:** Seleccioná la imagen por su id y agregale el atributo `src` con el valor:
```
https://www.youtube.com/img/desktop/yt_1200.png
```

> 🔍 **Pista**: Podés usar `setAttribute()` o la propiedad `.src` directamente.

**Commit exacto para cerrar el issue:**
```text
feat(js): asignar imagen de youtube al logo

Closes #3
```

### Quitar el formato feo del título (issue **#4**)

El `<h1>` tiene la clase `titulo-feo`, que le aplica fondo amarillo, color rojo y tipografía serif (revisá `css/style.css` para comprobarlo).

**Tu tarea:** Seleccioná el título y **removele** la clase `titulo-feo` para que vuelva al formato normal.

> 🔍 **Pista**: Investigá el método `removeAttribute()` o la propiedad `classList.remove()`.

**Commit exacto para cerrar el issue:**
```text
feat(js): quitar clase titulo-feo del h1

Closes #4
```

### Verificar atributo href del link YouTube (issue **#5**)

El `<a>` con `id="link_youtube"` tiene un `href` definido en el HTML.

**Tu tarea:** Seleccioná el elemento y **chequeá** si posee o no el atributo `href`. Mostrá el resultado por consola con `console.log()`.

> 🔍 **Pista**: Investigá el método `hasAttribute()`. Debería devolver `true`.

**Commit exacto para cerrar el issue:**
```text
feat(js): verificar href del link youtube con hasAttribute

Closes #5
```

### Obtener href del link Wikipedia (issue **#6**)

El `<a>` con `id="link_wikipedia"` apunta a la página de YouTube en Wikipedia.

**Tu tarea:** Seleccioná el elemento, **obtené** el valor de su atributo `href` y mostralo por consola con `console.log()`.

> 🔍 **Pista**: Investigá el método `getAttribute()`.

**Commit exacto para cerrar el issue:**
```text
feat(js): obtener href del link wikipedia con getAttribute

Closes #6
```

### Revisión docente (issue **#7**)

Este issue comprueba criterios visuales y de consola que los tests automáticos no cubren. Cerralo cuando la entrega esté lista para la corrección humana final.

**Commit exacto para cerrar el issue:**
```text
chore: entrega lista para revision docente

Closes #7
```

---

## 📚 Métodos del DOM que vas a necesitar

| Método | Descripción |
|---|---|
| `document.getElementById(id)` | Selecciona un elemento por su `id` |
| `elemento.setAttribute(atributo, valor)` | Agrega o modifica un atributo |
| `elemento.getAttribute(atributo)` | Obtiene el valor de un atributo |
| `elemento.hasAttribute(atributo)` | Verifica si el elemento tiene un atributo (`true`/`false`) |
| `elemento.removeAttribute(atributo)` | Elimina un atributo del elemento |
| `elemento.classList.remove(clase)` | Remueve una clase específica del elemento |

---

## ⚠️ Requisitos Obligatorios para la Aprobación

Para que tu ejercicio sea considerado completo y pueda ser aprobado, **DEBES** cumplir con los siguientes requisitos:

1. ✅ **Vincular archivos**: `css/style.css` enlazado con `<link>` y `js/script.js` enlazado con `<script>`.
2. ✅ **Ejercicio 1**: Agregar la clase `card` al contenedor `div#tarjeta` usando `setAttribute`.
3. ✅ **Ejercicio 2**: Asignar el `src` de la imagen de YouTube al `img#logo`.
4. ✅ **Ejercicio 3**: Remover la clase `titulo-feo` del `<h1>`.
5. ✅ **Ejercicio 4**: Usar `hasAttribute` para verificar el `href` del link YouTube y mostrarlo con `console.log`.
6. ✅ **Ejercicio 5**: Usar `getAttribute` para obtener el `href` del link Wikipedia y mostrarlo con `console.log`.
7. ✅ **Resultado visual**: La tarjeta debe verse como el **resultado esperado**.
8. ✅ **Consola**: Debe mostrar `true` y `https://es.wikipedia.org/wiki/YouTube`.

---

## 📌 Commits convencionales y palabras clave (resumen)

- Formato: `tipo(alcance): descripcion breve` — tipos habituales: `feat`, `fix`, `style`, `refactor`, `chore`, `docs`.
- Para cerrar un issue: en el **cuerpo** del commit escribe `Closes #n`, `Fixes #n` o `Resolves #n` con el número real.
**Importante:** el cierre automático ocurre al empujar (`push`) a `main`.

---

## 🧪 ¿Cómo sé si lo hice bien?

1. Abrí `index.html` en el navegador (idealmente con **Live Server** en VS Code).
2. La tarjeta debe verse como en el **resultado esperado** (con imagen, estilos de tarjeta y título sin formato feo).
3. Abrí la **consola del navegador** (`F12` → pestaña "Consola") y verificá que:
   - Aparezca `true` (ejercicio 4).
   - Aparezca `https://es.wikipedia.org/wiki/YouTube` (ejercicio 5).
4. Revisá la pestaña **Actions** en tu repositorio de GitHub para ver los resultados del autograding.

---

## 🛠️ Herramientas de editor (ESLint / Prettier / VS Code)

Este proyecto incluye configuración de calidad de código:

- **ESLint** (Airbnb base): valida tu JavaScript.
- **Stylelint**: valida tu CSS.
- **Prettier**: formatea automáticamente tu código al guardar.

### Scripts disponibles

```bash
npm install          # Instalar dependencias (solo la primera vez)
npm run lint         # Revisar JavaScript y CSS
npm run lint:fix     # Corregir errores automáticamente
npm run format       # Formatear todo el código
npm run format:check # Verificar el formato sin cambiar archivos
```

---

## 📚 Recursos Adicionales

### MDN Web Docs
- [getElementById - MDN](https://developer.mozilla.org/es/docs/Web/API/Document/getElementById)
- [setAttribute - MDN](https://developer.mozilla.org/es/docs/Web/API/Element/setAttribute)
- [getAttribute - MDN](https://developer.mozilla.org/es/docs/Web/API/Element/getAttribute)
- [hasAttribute - MDN](https://developer.mozilla.org/es/docs/Web/API/Element/hasAttribute)
- [removeAttribute - MDN](https://developer.mozilla.org/es/docs/Web/API/Element/removeAttribute)
- [classList - MDN](https://developer.mozilla.org/es/docs/Web/API/Element/classList)

### LenguajeJS.com
- [Manipulación del DOM - LenguajeJS](https://lenguajejs.com/javascript/dom/que-es/)

---

## 💡 Consejos

1. **Usá Live Server**: Instalá la extensión "Live Server" en VS Code para ver los cambios en tiempo real.
2. **Consola DevTools**: Mantené la consola abierta (`F12`) mientras trabajás para ver los resultados de `console.log`.
3. **Un commit por ejercicio**: Seguí el orden de la guía y hacé un commit por cada feature para practicar el flujo de trabajo profesional.

---
**¡Éxito con tu ejercicio!** 🚀
