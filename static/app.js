const $=s=>document.querySelector(s), $$=s=>document.querySelectorAll(s);
const state={products:[],categories:[],route:'home'};
const money=n=>'₹'+Number(n||0).toLocaleString('en-IN',{maximumFractionDigits:2});
const esc=v=>String(v??'').replace(/[&<>"']/g,m=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m]));
const salePrice=p=>Number(p.price||0)*.8;
const cfg=window.SUPABASE_CONFIG||{};
const API=(cfg.url||'').replace(/\/$/,'')+'/rest/v1';
const HEADERS={apikey:cfg.anonKey,Authorization:`Bearer ${cfg.anonKey}`,'Content-Type':'application/json'};

function toast(msg){const t=$('#toast');t.textContent=msg;t.classList.add('show');clearTimeout(window.__toast);window.__toast=setTimeout(()=>t.classList.remove('show'),2600)}
function route(name){state.route=name;document.querySelectorAll('.screen').forEach(s=>s.style.display=s.id===name?'block':'none');$$('[data-route]').forEach(b=>b.classList.toggle('active',b.dataset.route===name));window.scrollTo({top:0,behavior:'smooth'});if(name==='collection')loadStore();if(name==='inventory')loadInventory();if(name==='sales')loadSales();setTimeout(observeReveals,80)}
$$('[data-route]').forEach(b=>b.addEventListener('click',e=>{e.preventDefault();route(b.dataset.route)}));
$('#jumpInventory').onclick=()=>route('inventory');
function productImage(p){return p.image_url||'/static/products/ETERNA.jpg'}
function shortName(name){return String(name||'').replace(/^Safari Select /,'').replace(/^Safari /,'').replace(/^Timus /,'').split(' | ')[0]}
function storeCard(p){const sale=salePrice(p);return `<article class="product-card"><div class="photo"><img loading="lazy" src="${esc(productImage(p))}" onerror="this.onerror=null;this.src='/static/products/ETERNA.jpg'" alt="${esc(p.name)}"><span class="discount">20% OFF</span></div><div class="info"><span class="product-number">${esc(p.product_number||'NO NUMBER')}</span><h3>${esc(shortName(p.name))}</h3><div class="category">${esc(p.category)} • Stock ${Number(p.quantity||0)}</div><div class="price-line"><strong class="sale-price">${money(sale)}</strong><span class="mrp">${money(p.price)}</span><span class="save">SAVE 20%</span></div></div></article>`}

async function supabase(path,options={}){
  const r=await fetch(API+path,{...options,headers:{...HEADERS,...(options.headers||{})}});
  const text=await r.text();
  let data={}; try{data=text?JSON.parse(text):{}}catch{data={message:text}};
  if(!r.ok){const msg=data.message||data.error_description||data.hint||data.error||`Request failed (${r.status})`;throw Error(msg)}
  return data;
}
async function getProducts(params=''){
  const data=await supabase(`/products?select=*&order=product_id.asc${params}`);
  return Array.isArray(data)?data:[];
}
async function loadCategories(){try{const rows=await getProducts();state.categories=[...new Set(rows.map(p=>p.category).filter(Boolean))].sort();$('#categoryChips').innerHTML='<button class="chip active" data-cat="all">All</button>'+state.categories.map(c=>`<button class="chip" data-cat="${esc(c)}">${esc(c)}</button>`).join('');$$('.chip').forEach(b=>b.onclick=()=>{$$('.chip').forEach(x=>x.classList.remove('active'));b.classList.add('active');loadStore(b.dataset.cat)})}catch(e){toast(e.message)}}
async function loadStore(cat='all'){try{const search=($('#storeSearch').value||'').trim().toLowerCase();let rows=await getProducts();if(search)rows=rows.filter(p=>[p.name,p.category,p.product_number].some(v=>String(v||'').toLowerCase().includes(search)));if(cat&&cat!=='all')rows=rows.filter(p=>String(p.category||'').toLowerCase()===cat.toLowerCase());state.products=rows;$('#productGrid').innerHTML=rows.map(storeCard).join('')||'<div class="empty">No products found.</div>';animateCards()}catch(e){toast(e.message)}}
$('#storeSearch').addEventListener('input',()=>{const active=$('.chip.active');loadStore(active?.dataset.cat||'all')});

// DSA: linear search, hash table, and bubble sort are kept in the browser for the CA2 requirement.
function buildHashTable(rows){const table=new Map();rows.forEach(p=>table.set(Number(p.product_id),p));return table}
function linearSearch(rows,term){const q=String(term||'').toLowerCase();for(const p of rows){if(String(p.name||'').toLowerCase().includes(q)||String(p.category||'').toLowerCase().includes(q)||String(p.product_number||'').toLowerCase().includes(q))return p}return null}
function bubbleSort(rows,key,desc=false){const a=[...rows];for(let i=0;i<a.length-1;i++){let swapped=false;for(let j=0;j<a.length-i-1;j++){const x=Number(a[j][key]||0),y=Number(a[j+1][key]||0);if(desc?x<y:x>y){[a[j],a[j+1]]=[a[j+1],a[j]];swapped=true}}if(!swapped)break}return a}
function tableRow(p){const low=Number(p.quantity)<=5;return `<tr><td><b>${esc(p.product_number||'—')}</b></td><td><div class="table-product"><img src="${esc(productImage(p))}" onerror="this.onerror=null;this.src='/static/products/ETERNA.jpg'"><div><b>${esc(p.name)}</b><small>ID ${p.product_id}</small></div></div></td><td>${esc(p.category)}</td><td>${money(p.price)}</td><td>${Number(p.quantity)}</td><td><span class="status ${low?'low':'good'}">${low?'Low stock':'In stock'}</span></td><td><div class="row-actions"><button class="act" onclick="editProduct(${p.product_id})">Edit</button><button class="act" onclick="sell(${p.product_id})">Sell</button><button class="del" onclick="removeProduct(${p.product_id})">Delete</button></div></td></tr>`}
async function loadInventory(){try{let rows=await getProducts();const q=($('#adminSearch').value||'').trim().toLowerCase();if(q)rows=rows.filter(p=>[p.name,p.category,p.product_number].some(v=>String(v||'').toLowerCase().includes(q)));const s=$('#sort').value;if(s==='price_asc')rows=bubbleSort(rows,'price');else if(s==='price_desc')rows=bubbleSort(rows,'price',true);else if(s==='stock_asc')rows=bubbleSort(rows,'quantity');else if(s==='stock_desc')rows=bubbleSort(rows,'quantity',true);$('#productRows').innerHTML=rows.map(tableRow).join('')||'<tr><td colspan="7">No products found.</td></tr>';await loadDashboard()}catch(e){toast(e.message)}}
async function loadDashboard(){try{const rows=await getProducts();const sales=await supabase('/sales?select=total_price');const totalSales=(sales||[]).reduce((sum,s)=>sum+Number(s.total_price||0),0);$('#totalProducts').textContent=rows.length;$('#totalStock').textContent=rows.reduce((sum,p)=>sum+Number(p.quantity||0),0);$('#lowStock').textContent=rows.filter(p=>Number(p.quantity)<=5).length;$('#totalSales').textContent=money(totalSales);$('#heroCount').textContent=rows.length}catch(e){toast(e.message)}}
async function loadSales(){try{const [sales,products]=await Promise.all([supabase('/sales?select=*&order=sale_date.desc'),getProducts()]);const byId=buildHashTable(products);$('#salesRows').innerHTML=(sales||[]).map(s=>{const p=byId.get(Number(s.product_id))||{};return `<tr><td>#${s.sale_id}</td><td>${esc(p.name||'Deleted product')}</td><td>${esc(p.product_number||'—')}</td><td>${s.quantity}</td><td>${money(s.total_price)}</td><td>${esc(new Date(s.sale_date).toLocaleString('en-IN'))}</td></tr>`}).join('')||'<tr><td colspan="6">No sales yet.</td></tr>'}catch(e){toast(e.message)}}
$('#adminSearch').addEventListener('input',loadInventory);$('#sort').addEventListener('change',loadInventory);$('#refreshInventory').onclick=()=>{loadInventory();toast('Inventory refreshed')};

const modal=$('#modal');
function openModal(p=null){modal.classList.remove('hidden');$('#modalTitle').textContent=p?'Edit Product':'Add Product';$('#saveBtn').textContent=p?'Update Product':'Save Product';$('#editId').value=p?.product_id||'';$('#product_number').value=p?.product_number||'';$('#name').value=p?.name||'';$('#category').value=p?.category||'';$('#price').value=p?.price??'';$('#quantity').value=p?.quantity??'';$('#image_url').value=p?.image_url||'';setTimeout(()=>$('#product_number').focus(),80)}
function closeModal(){modal.classList.add('hidden');$('#productForm').reset();$('#editId').value=''}
$('#openAdd').onclick=()=>openModal();$('#closeModal').onclick=closeModal;$('#cancelModal').onclick=closeModal;$('.modal-backdrop').onclick=closeModal;
$('#productForm').onsubmit=async e=>{e.preventDefault();const id=$('#editId').value;const data={product_number:$('#product_number').value.trim(),name:$('#name').value.trim(),category:$('#category').value.trim(),price:Number($('#price').value),quantity:Number($('#quantity').value),image_url:$('#image_url').value.trim()};try{if(id){await supabase(`/products?product_id=eq.${id}`,{method:'PATCH',headers:{Prefer:'return=minimal'},body:JSON.stringify(data)})}else{await supabase('/products',{method:'POST',headers:{Prefer:'return=minimal'},body:JSON.stringify(data)})}closeModal();toast(id?'Product updated successfully':'Product added successfully');await Promise.all([loadInventory(),loadStore(),loadCategories()])}catch(err){toast(err.message)}};
async function editProduct(id){try{const rows=await supabase(`/products?product_id=eq.${id}&select=*`);if(!rows.length)throw Error('Product not found');openModal(rows[0])}catch(e){toast(e.message)}}
async function sell(id){const p=(await supabase(`/products?product_id=eq.${id}&select=*`))[0];if(!p)return toast('Product not found');const qty=prompt(`Quantity to sell for ${shortName(p.name)}:`);if(qty===null)return;if(!Number.isInteger(Number(qty))||Number(qty)<=0)return toast('Enter a valid whole quantity');const q=Number(qty);if(q>Number(p.quantity))return toast('Insufficient stock');try{const total=Number(p.price)*q;await supabase('/sales',{method:'POST',headers:{Prefer:'return=minimal'},body:JSON.stringify({product_id:id,quantity:q,total_price:total})});await supabase(`/products?product_id=eq.${id}`,{method:'PATCH',headers:{Prefer:'return=minimal'},body:JSON.stringify({quantity:Number(p.quantity)-q})});toast(`Sale recorded successfully • ${money(total)}`);await Promise.all([loadInventory(),loadStore()])}catch(e){toast(e.message)}}
async function removeProduct(id){if(!confirm('Delete this product permanently?'))return;try{await supabase(`/products?product_id=eq.${id}`,{method:'DELETE',headers:{Prefer:'return=minimal'}});toast('Product deleted successfully');await Promise.all([loadInventory(),loadStore(),loadCategories()])}catch(e){toast(e.message)}}
window.editProduct=editProduct;window.sell=sell;window.removeProduct=removeProduct;
function animateCards(){document.querySelectorAll('.product-card').forEach((c,i)=>setTimeout(()=>c.classList.add('visible'),Math.min(i*25,500)))}
function observeReveals(){document.querySelectorAll('.reveal').forEach(el=>el.classList.add('in'))}
route('home');loadDashboard();loadCategories();setTimeout(observeReveals,100);
