SANGAM BAG SHOP — CA2 READY
============================

NO FLASK • NO NODE • NO NPM
Frontend: HTML5 + CSS3 + JavaScript
Backend: Python standard-library HTTP server
Database: MySQL
DSA: Hash Table + Linear Search + Bubble Sort

WHAT IS INCLUDED
-----------------
✓ 94 catalogue products (LUG-001 to LUG-094)
✓ Exact Safari catalogue images included locally
✓ Automatic 20% customer discount
✓ MRP + discounted price display
✓ Immersive full-screen opening page
✓ Smooth reveal / hover / modal / navigation transitions
✓ Live product catalogue from MySQL
✓ Search + category filter + sorting
✓ Inventory control table
✓ EDIT button opens one professional editor for ALL fields:
  Product Number, Product Name, Category, MRP, Stock Quantity, Image URL/Path
✓ Add Product
✓ Sell Product and automatically reduce stock
✓ Delete Product
✓ Sales History
✓ Dashboard statistics
✓ DSA demo endpoint

SETUP — FRESH INSTALL
---------------------
1. Open MySQL Workbench.
2. Run database.sql completely.
3. Open database.py.
4. Replace YOUR_MYSQL_PASSWORD with your MySQL root password.
5. Open PowerShell in this folder and run:
       py -m pip install -r requirements.txt
6. Start:
       py server.py
7. Open:
       http://127.0.0.1:8000

IF YOU ALREADY HAVE THE OLD DATABASE
------------------------------------
Do NOT blindly run database.sql because the old sales table may reference old products.
Use migration.sql first to add product_number, then update the existing products as needed.

If your old products table already has a column named `number` instead of `product_number`,
rename it to product_number or change the matching SQL/API field names consistently.

IMPORTANT PRICE NOTE
--------------------
The website treats `price` as MRP and calculates the customer price as:
    discounted_price = MRP × 0.80

The supplied catalogue has four rows where MRP was not clearly available:
LUG-027, LUG-034, LUG-037, LUG-046.
They are left at ₹0 so no price is invented. You can edit them from Inventory.

PROJECT STRUCTURE
-----------------
Sangam_Bag_Shop_CA2_Ready/
├── server.py
├── database.py
├── dsa.py
├── database.sql
├── migration.sql
├── requirements.txt
├── start.bat
├── README.txt
├── web/index.html
└── static/
    ├── app.js
    ├── style.css
    └── products/*.jpg


EDIT BUTTON FIX
----------------
The Edit API uses a numeric product ID:
    GET /api/product/1
The backend now correctly matches numeric product IDs. If the browser shows
"Not Found" when clicking Edit, make sure you are running this corrected
project folder/ZIP and restart `py server.py`.

DATABASE SETUP NOTE
-------------------
For a completely fresh database, database.sql creates the tables and clears
old sales/products before importing the 94 catalogue records. Run it
completely in MySQL Workbench, then start the Python server.
