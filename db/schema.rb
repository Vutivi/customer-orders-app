# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Category", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "CategoryName", limit: 8000
    t.string "Description", limit: 8000
  end

  create_table "Customer", primary_key: "Id", id: :string, limit: 8000, force: :cascade do |t|
    t.string "CompanyName", limit: 8000
    t.string "ContactName", limit: 8000
    t.string "ContactTitle", limit: 8000
    t.string "Address", limit: 8000
    t.string "City", limit: 8000
    t.string "Region", limit: 8000
    t.string "PostalCode", limit: 8000
    t.string "Country", limit: 8000
    t.string "Phone", limit: 8000
    t.string "Fax", limit: 8000
  end

  create_table "CustomerCustomerDemo", primary_key: "Id", id: :string, limit: 8000, force: :cascade do |t|
    t.string "CustomerTypeId", limit: 8000
  end

  create_table "CustomerDemographic", primary_key: "Id", id: :string, limit: 8000, force: :cascade do |t|
    t.string "CustomerDesc", limit: 8000
  end

  create_table "Employee", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "LastName", limit: 8000
    t.string "FirstName", limit: 8000
    t.string "Title", limit: 8000
    t.string "TitleOfCourtesy", limit: 8000
    t.string "BirthDate", limit: 8000
    t.string "HireDate", limit: 8000
    t.string "Address", limit: 8000
    t.string "City", limit: 8000
    t.string "Region", limit: 8000
    t.string "PostalCode", limit: 8000
    t.string "Country", limit: 8000
    t.string "HomePhone", limit: 8000
    t.string "Extension", limit: 8000
    t.string "Photo", limit: 8000
    t.string "Notes", limit: 8000
    t.integer "ReportsTo"
    t.string "PhotoPath", limit: 8000
  end

  create_table "EmployeeTerritory", primary_key: "Id", id: :string, limit: 8000, force: :cascade do |t|
    t.integer "EmployeeId", null: false
    t.string "TerritoryId", limit: 8000
  end

  create_table "Order", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "CustomerId", limit: 8000
    t.integer "EmployeeId", null: false
    t.string "OrderDate", limit: 8000
    t.string "RequiredDate", limit: 8000
    t.string "ShippedDate", limit: 8000
    t.integer "ShipVia"
    t.decimal "Freight", null: false
    t.string "ShipName", limit: 8000
    t.string "ShipAddress", limit: 8000
    t.string "ShipCity", limit: 8000
    t.string "ShipRegion", limit: 8000
    t.string "ShipPostalCode", limit: 8000
    t.string "ShipCountry", limit: 8000
  end

  create_table "OrderDetail", primary_key: "Id", id: :string, limit: 8000, force: :cascade do |t|
    t.integer "OrderId", null: false
    t.integer "ProductId", null: false
    t.decimal "UnitPrice", null: false
    t.integer "Quantity", null: false
    t.decimal "Discount", null: false
  end

  create_table "Product", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "ProductName", limit: 8000
    t.integer "SupplierId", null: false
    t.integer "CategoryId", null: false
    t.string "QuantityPerUnit", limit: 8000
    t.decimal "UnitPrice", null: false
    t.integer "UnitsInStock", null: false
    t.integer "UnitsOnOrder", null: false
    t.integer "ReorderLevel", null: false
    t.integer "Discontinued", null: false
  end

  create_table "Region", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "RegionDescription", limit: 8000
  end

  create_table "Shipper", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "CompanyName", limit: 8000
    t.string "Phone", limit: 8000
  end

  create_table "Supplier", primary_key: "Id", id: :integer, default: nil, force: :cascade do |t|
    t.string "CompanyName", limit: 8000
    t.string "ContactName", limit: 8000
    t.string "ContactTitle", limit: 8000
    t.string "Address", limit: 8000
    t.string "City", limit: 8000
    t.string "Region", limit: 8000
    t.string "PostalCode", limit: 8000
    t.string "Country", limit: 8000
    t.string "Phone", limit: 8000
    t.string "Fax", limit: 8000
    t.string "HomePage", limit: 8000
  end

  create_table "Territory", primary_key: "Id", id: :string, limit: 8000, force: :cascade do |t|
    t.string "TerritoryDescription", limit: 8000
    t.integer "RegionId", null: false
  end

  add_foreign_key "CustomerCustomerDemo", "\"Customer\"", column: "Id", primary_key: "Id", name: "CustomerCustomerDemo_Id_fkey"
  add_foreign_key "CustomerDemographic", "\"CustomerCustomerDemo\"", column: "Id", primary_key: "Id", name: "CustomerDemographic_Id_fkey"
  add_foreign_key "EmployeeTerritory", "\"Employee\"", column: "EmployeeId", primary_key: "Id", name: "EmployeeTerritory_EmployeeId_fkey"
  add_foreign_key "EmployeeTerritory", "\"Territory\"", column: "TerritoryId", primary_key: "Id", name: "EmployeeTerritory_TerritoryId_fkey"
  add_foreign_key "Order", "\"Customer\"", column: "CustomerId", primary_key: "Id", name: "Order_CustomerId_fkey"
  add_foreign_key "Order", "\"Employee\"", column: "EmployeeId", primary_key: "Id", name: "Order_EmployeeId_fkey"
  add_foreign_key "OrderDetail", "\"Order\"", column: "OrderId", primary_key: "Id", name: "OrderDetail_OrderId_fkey"
  add_foreign_key "OrderDetail", "\"Product\"", column: "ProductId", primary_key: "Id", name: "OrderDetail_ProductId_fkey"
  add_foreign_key "Product", "\"Category\"", column: "CategoryId", primary_key: "Id", name: "Product_CategoryId_fkey"
  add_foreign_key "Product", "\"Supplier\"", column: "SupplierId", primary_key: "Id", name: "Product_SupplierId_fkey"
  add_foreign_key "Territory", "\"Region\"", column: "RegionId", primary_key: "Id", name: "Territory_RegionId_fkey"
end
