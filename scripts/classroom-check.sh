#!/usr/bin/env bash
# Verificaciones automáticas — Manipulación del DOM (Atributos Dinámicos).
# Cada subcomando valida un criterio del ejercicio sobre el código fuente.
set -u

HTML="index.html"
JS="js/script.js"
CSS="css/style.css"

fail() {
  echo "$1" >&2
  exit 1
}

ok() {
  echo CORRECTO
}

# Devuelve el JS sin líneas que son solo comentarios (evita falsos positivos
# con los comentarios-stub que ya trae la plantilla).
clean_js() {
  grep -v '^\s*//' "$JS"
}

case "${1:-}" in
  link-css-js)
    [[ -f "$HTML" ]] || fail "No se encontró index.html en la raíz del proyecto."
    [[ -f "$CSS" ]]  || fail "No se encontró el archivo css/style.css."
    [[ -f "$JS" ]]   || fail "No se encontró el archivo js/script.js."
    # Verificar <link> al CSS
    grep -qiE '<link[^>]*href=["'"'"'].*css/style\.css["'"'"']' "$HTML" \
      || fail "Falta vincular el archivo css/style.css con una etiqueta <link> en el <head> del HTML."
    # Verificar <script> al JS
    grep -qiE '<script[^>]*src=["'"'"'].*js/script\.js["'"'"']' "$HTML" \
      || fail "Falta vincular el archivo js/script.js con una etiqueta <script> en el HTML."
    ok
    ;;
  set-class-card)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar que se usa getElementById para seleccionar 'tarjeta'
    echo "$js_code" | grep -qiE 'getElementById\s*\(\s*["'"'"']tarjeta["'"'"']\s*\)' \
      || fail "No se encontró una selección del elemento con id 'tarjeta' usando getElementById."
    # Verificar que se usa setAttribute con 'class' y 'card'
    echo "$js_code" | grep -qiE 'setAttribute\s*\(\s*["'"'"']class["'"'"']\s*,\s*["'"'"']card["'"'"']\s*\)' \
      || fail "No se encontró el uso de setAttribute para agregar la clase 'card' al elemento tarjeta."
    ok
    ;;
  set-img-src)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar que se selecciona el elemento 'logo'
    echo "$js_code" | grep -qiE 'getElementById\s*\(\s*["'"'"']logo["'"'"']\s*\)' \
      || fail "No se encontró una selección del elemento con id 'logo' usando getElementById."
    # Verificar que se asigna el src (con setAttribute o .src =)
    if echo "$js_code" | grep -qiE 'setAttribute\s*\(\s*["'"'"']src["'"'"']'; then
      : # ok, usa setAttribute
    elif echo "$js_code" | grep -qiE '\.src\s*='; then
      : # ok, usa propiedad directa
    else
      fail "No se encontró la asignación del atributo src a la imagen (usa setAttribute('src', ...) o .src = ...)."
    fi
    ok
    ;;
  remove-titulo-feo)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar que se quita la clase titulo-feo (removeAttribute o classList.remove)
    if echo "$js_code" | grep -qiE 'removeAttribute\s*\(\s*["'"'"']class["'"'"']\s*\)'; then
      : # ok, usa removeAttribute
    elif echo "$js_code" | grep -qiE 'classList\.remove\s*\(\s*["'"'"']titulo-feo["'"'"']\s*\)'; then
      : # ok, usa classList.remove
    else
      fail "No se encontró la remoción de la clase 'titulo-feo' del título (usa removeAttribute('class') o classList.remove('titulo-feo'))."
    fi
    ok
    ;;
  has-attribute-href)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar que se selecciona link_youtube
    echo "$js_code" | grep -qiE 'getElementById\s*\(\s*["'"'"']link_youtube["'"'"']\s*\)' \
      || fail "No se encontró una selección del elemento con id 'link_youtube' usando getElementById."
    # Verificar uso de hasAttribute
    echo "$js_code" | grep -qiE 'hasAttribute\s*\(\s*["'"'"']href["'"'"']\s*\)' \
      || fail "No se encontró el uso de hasAttribute('href') para verificar el atributo."
    # Verificar console.log
    echo "$js_code" | grep -qiE 'console\.log' \
      || fail "No se encontró el uso de console.log() para mostrar el resultado."
    ok
    ;;
  get-attribute-href)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar que se selecciona link_wikipedia
    echo "$js_code" | grep -qiE 'getElementById\s*\(\s*["'"'"']link_wikipedia["'"'"']\s*\)' \
      || fail "No se encontró una selección del elemento con id 'link_wikipedia' usando getElementById."
    # Verificar uso de getAttribute
    echo "$js_code" | grep -qiE 'getAttribute\s*\(\s*["'"'"']href["'"'"']\s*\)' \
      || fail "No se encontró el uso de getAttribute('href') para obtener el valor del atributo."
    # Verificar console.log
    echo "$js_code" | grep -qiE 'console\.log' \
      || fail "No se encontró el uso de console.log() para mostrar el resultado."
    ok
    ;;
  *)
    echo "Prueba automática no reconocida. Avisale al docente." >&2
    exit 2
    ;;
esac
