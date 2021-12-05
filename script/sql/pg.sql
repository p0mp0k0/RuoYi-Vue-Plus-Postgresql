create function find_in_set(bigint, character varying) returns boolean
    language plpgsql
as
$$
DECLARE
    STR ALIAS FOR $1;
    STRS ALIAS FOR $2;
    POS INTEGER;
    STATUS BOOLEAN;
BEGIN
    SELECT POSITION( ','||STR||',' IN ','||STRS||',') INTO POS;
    IF POS > 0 THEN
        STATUS = TRUE;
    ELSE
        STATUS = FALSE;
    END IF;
    RETURN STATUS;
END;
$$;

create view list_column
        (table_name, column_name, column_comment, is_required, is_pk, sort, is_increment, column_type) as
SELECT c.relname                   AS table_name,
       a.attname                   AS column_name,
       d.description               AS column_comment,
       CASE
           WHEN a.attnotnull AND con.conname IS NULL THEN 1
           ELSE 0
           END                     AS is_required,
       CASE
           WHEN con.conname IS NOT NULL THEN 1
           ELSE 0
           END                     AS is_pk,
       a.attnum                    AS sort,
       CASE
           WHEN "position"(pg_get_expr(ad.adbin, ad.adrelid),
                           ((c.relname::text || '_'::text) || a.attname::text) || '_seq'::text) > 0 THEN 1
           ELSE 0
           END                     AS is_increment,
       btrim(
               CASE
                   WHEN t.typelem <> 0::oid AND t.typlen = '-1'::integer THEN 'ARRAY'::text
                   ELSE
                       CASE
                           WHEN t.typtype = 'd'::"char" THEN format_type(t.typbasetype, NULL::integer)
                           ELSE format_type(a.atttypid, NULL::integer)
                           END
                   END, '"'::text) AS column_type
FROM pg_attribute a
         JOIN (pg_class c
    JOIN pg_namespace n ON c.relnamespace = n.oid) ON a.attrelid = c.oid
         LEFT JOIN pg_description d ON d.objoid = c.oid AND a.attnum = d.objsubid
         LEFT JOIN pg_constraint con ON con.conrelid = c.oid AND (a.attnum = ANY (con.conkey))
         LEFT JOIN pg_attrdef ad ON a.attrelid = ad.adrelid AND a.attnum = ad.adnum
         LEFT JOIN pg_type t ON a.atttypid = t.oid
WHERE (c.relkind = ANY (ARRAY ['r'::"char", 'p'::"char"]))
  AND a.attnum > 0
  AND n.nspname = 'public'::name
ORDER BY c.relname, a.attnum;

create view list_table(table_name, table_comment, create_time, update_time) as
SELECT c.relname              AS table_name,
       obj_description(c.oid) AS table_comment,
       CURRENT_TIMESTAMP      AS create_time,
       CURRENT_TIMESTAMP      AS update_time
FROM pg_class c
         LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE (c.relkind = ANY (ARRAY ['r'::"char", 'p'::"char"]))
  AND c.relname !~~ 'spatial_%'::text
  AND n.nspname = 'public'::name
  AND n.nspname <> ''::name;

create or replace function bool_to_int2(boolean) returns smallint as $$
select cast(cast($1 as int4) as int2);
$$ language sql strict;

create cast
(pg_catalog.bool as pg_catalog.int2)
with function bool_to_int2(boolean);

update pg_cast set castcontext='a' where castsource ='boolean'::regtype and casttarget='smallint'::regtype;

create cast
(pg_catalog.varchar as pg_catalog.int4)
with inout
    as implicit;



