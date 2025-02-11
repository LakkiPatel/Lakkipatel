{% macro convert_to_uppercase(column_name) %}
    upper(concat('Mr ', {{ column_name }}))
{% endmacro %}