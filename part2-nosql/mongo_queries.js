// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    product_id: "ELEC-001",
    category: "Electronics",
    name: "Samsung 55-inch 4K Smart TV",
    brand: "Samsung",
    price: 52999,
    stock: 30,
    specifications: {
      display: "55 inch QLED",
      voltage: "220V",
      warranty_years: 2
    },
    features: ["HDR10+", "Dolby Atmos", "Voice Control"],
    in_stock: true
  },
  {
    product_id: "CLTH-001",
    category: "Clothing",
    name: "Mens Slim Fit Shirt",
    brand: "Arrow",
    price: 1499,
    stock: 200,
    specifications: {
      material: "Cotton",
      fit: "Slim Fit"
    },
    available_sizes: ["S", "M", "L", "XL"],
    in_stock: true
  },
  {
    product_id: "GROC-001",
    category: "Groceries",
    name: "Whole Wheat Flour",
    brand: "Aashirvaad",
    price: 299,
    stock: 500,
    specifications: {
      weight_kg: 5,
      expiry_date: new Date("2024-11-30")
    },
    in_stock: true
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ category: "Electronics", price: { $gt: 20000 } });


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  "specifications.expiry_date": { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "ELEC-001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field
// Indexing category helps MongoDB search faster instead of scanning all documents
db.products.createIndex({ category: 1 });