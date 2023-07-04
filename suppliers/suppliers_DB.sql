CREATE TABLE IF NOT EXISTS "taxes" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "sat_code" varchar(8) NOT NULL,
  "base" decimal(12,6) NOT NULL,
  "retention" bool DEFAULT false,
  "quota" bool DEFAULT false,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "sat_classes" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "clave" varchar(94) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "product_status" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "description" varchar(64) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "provider_status" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "description" varchar(64) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "variant_status" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "description" varchar(64) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "order_status" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "description" varchar(64) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "client_status" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "description" varchar(64) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "measurement_units" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "_id" varchar(24),
  "name" varchar(94) NOT NULL,
  "description" varchar(128) NOT NULL,
  "code" varchar(64) NOT NULL,
  "sat_code" varchar(64),
  "magnitude" varchar(24) NOT NULL,
  "value" decimal(15,7) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "countries" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(100) NOT NULL,
  "code" varchar(2) NOT NULL,
  "icon" varchar(64),
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "fiscal_regimes" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "sat_id" varchar(8) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "variant_tags" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(94) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "departments" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "_id" varchar(24),
  "name" varchar(94) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false
);

CREATE TABLE IF NOT EXISTS "sections" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "_id" varchar(24),
  "name" varchar(94) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "department_id" UUID
);

CREATE TABLE IF NOT EXISTS "products" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "_id" varchar(24),
  "name" varchar(94) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "section_id" UUID,
  "status_id" UUID,
  "class_id" UUID
);

CREATE TABLE IF NOT EXISTS "products_averages" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "price" varchar(94) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "unit_id" UUID,
  "product_id" UUID
);

CREATE TABLE IF NOT EXISTS "variant_taxes" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "is_deleted" bool DEFAULT false,
  "product_id" UUID,
  "tax_id" UUID
);

CREATE TABLE IF NOT EXISTS "provider_tax_information" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(255) NOT NULL,
  "tax_id" varchar(13) NOT NULL,
  "private_key_pass" varchar(255) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "fiscal_regime_id" UUID,
  "provider_id" UUID
);

CREATE TABLE IF NOT EXISTS "providers" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "_id" varchar(24),
  "name" varchar(128) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "status_id" UUID
);

CREATE TABLE IF NOT EXISTS "variants" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "_id" varchar(24),
  "external_id" varchar(24),
  "name" varchar(128) NOT NULL,
  "display_name" varchar(128) NOT NULL,
  "description" varchar(255) NOT NULL,
  "brand" varchar(128) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "status_id" UUID,
  "provider_id" UUID,
  "country_id" UUID
);

CREATE TABLE IF NOT EXISTS "product_variants" (
  "product_id" UUID,
  "variant_id" UUID
);

CREATE TABLE IF NOT EXISTS "variant_presentations" (
  "content" decimal(12,6) NOT NULL,
  "variant_id" UUID,
  "display_unit_id" UUID,
  "content_unit_id" UUID
);

CREATE TABLE IF NOT EXISTS "variant_prices" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "price" decimal(12,6) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "variant_id" UUID
);

CREATE TABLE IF NOT EXISTS "orders" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "identifier" varchar(8) NOT NULL,
  "commission" decimal(12,9) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "client_id" UUID,
  "provider_id" UUID,
  "delivery_adress_id" UUID,
  "uuid_index" varchar(8) UNIQUE
);

CREATE TABLE IF NOT EXISTS "order_items" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "quantity" decimal(12,6) NOT NULL,
  "price" decimal(12,6) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "order_id" UUID,
  "variant_id" UUID
);

CREATE TABLE IF NOT EXISTS "order_status_history" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "order_id" UUID,
  "status_id" UUID
);

CREATE TABLE IF NOT EXISTS "client_tax_information" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(255) NOT NULL,
  "rfc" varchar(13) NOT NULL,
  "adress" varchar(512) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "client_id" UUID,
  "fiscal_regime_id" UUID
);

CREATE TABLE IF NOT EXISTS "clients" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "name" varchar(128) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "status_id" UUID
);

CREATE TABLE IF NOT EXISTS "client_delivery_addresses" (
  "id" UUID PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "street" varchar(128) NOT NULL,
  "exterior" varchar(64) NOT NULL,
  "interior" varchar(64) NOT NULL,
  "neighborhood" varchar(128) NOT NULL,
  "city" varchar(128) NOT NULL,
  "state" varchar(128) NOT NULL,
  "zip" varchar(32) NOT NULL,
  "comments" varchar(512) NOT NULL,
  "schedule" varchar(64) NOT NULL,
  "created_at" timetz DEFAULT (now()),
  "updated_at" timetz DEFAULT (now()),
  "deleted_at" timetz,
  "is_deleted" bool DEFAULT false,
  "client_id" UUID,
  "country_id" UUID
);

CREATE UNIQUE INDEX ON "measurement_units" ("_id");

CREATE UNIQUE INDEX ON "departments" ("_id");

CREATE UNIQUE INDEX ON "sections" ("_id");

CREATE UNIQUE INDEX ON "products" ("_id");

CREATE UNIQUE INDEX ON "providers" ("_id");

CREATE UNIQUE INDEX ON "variants" ("_id");

COMMENT ON TABLE "taxes" IS 'Providers taxes';

COMMENT ON COLUMN "taxes"."base" IS 'Amount to apply the tax, if quota is true, this is the quota amount, if false, this is the percentage to be calculated';

COMMENT ON TABLE "sat_classes" IS 'SAT products and services classification codes';

COMMENT ON COLUMN "measurement_units"."_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "measurement_units"."sat_code" IS 'SAT meassurment unit code';

COMMENT ON COLUMN "countries"."code" IS 'ISO 3166-1 alpha-2 code';

COMMENT ON COLUMN "countries"."icon" IS 'Country flag icon';

COMMENT ON COLUMN "fiscal_regimes"."sat_id" IS 'SAT fiscal regime code';

COMMENT ON COLUMN "departments"."_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "sections"."_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "products"."_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "provider_tax_information"."tax_id" IS 'RFC';

COMMENT ON COLUMN "providers"."_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "variants"."_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "variants"."external_id" IS 'Queda como legacy, sedeberá elimnar cuando ya no se use mongoDB';

COMMENT ON COLUMN "orders"."identifier" IS 'Template: YYMMXXXX';

COMMENT ON TABLE "client_tax_information" IS 'Client tax information';

COMMENT ON COLUMN "client_tax_information"."rfc" IS 'RFC';

ALTER TABLE "sections" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("section_id") REFERENCES "sections" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("status_id") REFERENCES "product_status" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("class_id") REFERENCES "sat_classes" ("id");

ALTER TABLE "products_averages" ADD FOREIGN KEY ("unit_id") REFERENCES "measurement_units" ("id");

ALTER TABLE "products_averages" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "variant_taxes" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "variant_taxes" ADD FOREIGN KEY ("tax_id") REFERENCES "taxes" ("id");

ALTER TABLE "provider_tax_information" ADD FOREIGN KEY ("fiscal_regime_id") REFERENCES "fiscal_regimes" ("id");

ALTER TABLE "provider_tax_information" ADD FOREIGN KEY ("provider_id") REFERENCES "providers" ("id");

ALTER TABLE "providers" ADD FOREIGN KEY ("status_id") REFERENCES "provider_status" ("id");

ALTER TABLE "variants" ADD FOREIGN KEY ("status_id") REFERENCES "variant_status" ("id");

ALTER TABLE "variants" ADD FOREIGN KEY ("provider_id") REFERENCES "providers" ("id");

ALTER TABLE "variants" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

CREATE TABLE IF NOT EXISTS "variants_variant_tags" (
  "variants_id" UUID,
  "variant_tags_id" UUID,
  PRIMARY KEY ("variants_id", "variant_tags_id")
);

ALTER TABLE "variants_variant_tags" ADD FOREIGN KEY ("variants_id") REFERENCES "variants" ("id");

ALTER TABLE "variants_variant_tags" ADD FOREIGN KEY ("variant_tags_id") REFERENCES "variant_tags" ("id");


ALTER TABLE "product_variants" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "product_variants" ADD FOREIGN KEY ("variant_id") REFERENCES "variants" ("id");

ALTER TABLE "variant_presentations" ADD FOREIGN KEY ("variant_id") REFERENCES "variants" ("id");

ALTER TABLE "variant_presentations" ADD FOREIGN KEY ("display_unit_id") REFERENCES "measurement_units" ("id");

ALTER TABLE "variant_presentations" ADD FOREIGN KEY ("content_unit_id") REFERENCES "measurement_units" ("id");

ALTER TABLE "variant_prices" ADD FOREIGN KEY ("variant_id") REFERENCES "variants" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("provider_id") REFERENCES "providers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("delivery_adress_id") REFERENCES "client_delivery_addresses" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("variant_id") REFERENCES "variants" ("id");

ALTER TABLE "order_status_history" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_status_history" ADD FOREIGN KEY ("status_id") REFERENCES "order_status" ("id");

ALTER TABLE "client_tax_information" ADD FOREIGN KEY ("client_id") REFERENCES "providers" ("id");

ALTER TABLE "client_tax_information" ADD FOREIGN KEY ("fiscal_regime_id") REFERENCES "fiscal_regimes" ("id");

ALTER TABLE "clients" ADD FOREIGN KEY ("status_id") REFERENCES "client_status" ("id");

ALTER TABLE "client_delivery_addresses" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "client_delivery_addresses" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");
