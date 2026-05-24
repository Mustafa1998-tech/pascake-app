// ==================== DATA ====================
const WHATSAPP_NUMBER = '966560514370';

const products = [
  { id: '1', name: 'ميني بيتزا', price: 10, image: 'images/ميني بيتزا.jpeg', category: 'فطائر', rating: 4.5, reviews: 45, desc: 'بيتزا صغيرة بحجم مثالي، مقرمشة ولذيذة، مثالية للوجبات الخفيفة.' },
  { id: '2', name: 'بسبوسة بالقشطة', price: 25, image: 'images/بسبوسة بالقشطة.jpeg', category: 'حلويات', rating: 4.8, reviews: 92, desc: 'بسبوسة ناعمة محشوة بالقشطة الطازجة، مغطاة بالشيرة الذهبية.' },
  { id: '3', name: 'بسكويت منين', price: 20, image: 'images/بسكويت منين.jpeg', category: 'بسكويت', rating: 4.6, reviews: 78, desc: 'بسكويت منين الهش، بنكهة الزبدة الطازجة، مقرمش ولذيذ.' },
  { id: '4', name: 'بسكويت نشادر', price: 18, image: 'images/بسكويت نشادر.jpeg', category: 'بسكويت', rating: 4.4, reviews: 63, desc: 'بسكويت النشادر التقليدي، هش وخفيف، مثالي مع الشاي.' },
  { id: '5', name: 'بسكويت يانسون', price: 18, image: 'images/بسكويت يانسون.jpeg', category: 'بسكويت', rating: 4.3, reviews: 55, desc: 'بسكويت اليانسون العطري، مقرمش وبنكهة اليانسون المميزة.' },
  { id: '6', name: 'بيتيفور', price: 30, image: 'images/بيتيفور.jpeg', category: 'بسكويت', rating: 4.7, reviews: 88, desc: 'بيتيفور الزبدة الفاخر، مزين بالمربى والشوكولاتة، يذوب في الفم.' },
  { id: '7', name: 'خلية نحل', price: 22, image: 'images/خلية نحل.jpeg', category: 'خبز', rating: 4.6, reviews: 71, desc: 'خبز خلية النحل الطري، محشو بالجبن أو الزعتر، مخبوز طازجاً.' },
  { id: '8', name: 'سينامون رولز', price: 28, image: 'images/سينامون رولز.jpeg', category: 'حلويات', rating: 4.9, reviews: 134, desc: 'لفائف القرفة الناعمة مع طبقة كريمة الجبن، مغطاة بصوص الفانيليا.' },
  { id: '9', name: 'غُريبة', price: 20, image: 'images/غُريبة.jpeg', category: 'بسكويت', rating: 4.5, reviews: 66, desc: 'الغريبة التقليدية الهشة، مصنوعة من السميد والزبدة، تتفتت في الفم.' },
  { id: '10', name: 'فطاير مشكلة', price: 35, image: 'images/فطاير مشكلة.jpeg', category: 'فطائر', rating: 4.7, reviews: 103, desc: 'تشكيلة من الفطائر الطازجة بالجبن والزعتر واللحم، مخبوزة يومياً.' },
  { id: '11', name: 'كعك بالعجوة', price: 25, image: 'images/كعك بالعجوة.jpeg', category: 'بسكويت', rating: 4.6, reviews: 85, desc: 'كعك العجوة التقليدي، محشو بالتمر الطازج، مغطى بالسكر الناعم.' },
  { id: '12', name: 'كعك سادة', price: 15, image: 'images/كعك سادة.jpeg', category: 'بسكويت', rating: 4.4, reviews: 59, desc: 'كعك سادة هش، بنكهة اليانسون والسمسم، مثالي للإفطار.' },
  { id: '13', name: 'كنافة بالقشطة', price: 35, image: 'images/كنافة بالقشطة.jpeg', category: 'حلويات', rating: 4.9, reviews: 156, desc: 'كنافة ناعمة بالقشطة الفاخرة، مغطاة بالفستق الحلبي والشيرة.' },
  { id: '14', name: 'كوكيز', price: 15, image: 'images/كوكيز.jpeg', category: 'بسكويت', rating: 4.5, reviews: 112, desc: 'كوكيز الشوكولاتة المقرمش من الخارج والطري من الداخل.' },
  { id: '15', name: 'كوكيز مع الأسماء', price: 20, image: 'images/كوكيز مع الاسماء.jpeg', category: 'بسكويت', rating: 4.7, reviews: 95, desc: 'كوكيز مخصص بأسماء، هدية مثالية لمن تحب، طعم رائع.' },
  { id: '16', name: 'كيك شوكلاتة', price: 120, image: 'images/كيك شوكلاتة.jpeg', category: 'كيك', rating: 4.8, reviews: 143, desc: 'كيك الشوكولاتة الفاخر، غني بالكاكاو وطبقات الكريمة البلجيكية.' },
  { id: '17', name: 'لانكشير', price: 12, image: 'images/لانكشير.jpeg', category: 'خبز', rating: 4.3, reviews: 48, desc: 'خبز اللانكشير الطري والمخبوز طازجاً، مثالي للسندويشات.' },
];

// ==================== STATE ====================
let cart = JSON.parse(localStorage.getItem('pascake_cart') || '[]');
let favorites = JSON.parse(localStorage.getItem('pascake_favorites') || '[]');
let isDarkMode = JSON.parse(localStorage.getItem('pascake_dark') || 'false');
let currentPage = 'home';

// ==================== INIT ====================
document.addEventListener('DOMContentLoaded', () => {
  // Set default date to 3 days from now
  const dateInput = document.getElementById('cakeDate');
  if (dateInput) {
    const d = new Date();
    d.setDate(d.getDate() + 3);
    dateInput.value = d.toISOString().split('T')[0];
  }

  // Init dark mode
  if (isDarkMode) {
    document.body.classList.add('dark-mode');
    const toggle = document.getElementById('darkModeToggle');
    if (toggle) toggle.checked = true;
  }

  // Render products
  renderProducts('homeProductsGrid', products);
  renderProducts('shopProductsGrid', products);
  renderCart();
  renderFavorites();

  // Splash screen
  setTimeout(() => {
    document.getElementById('splash').classList.add('hidden');
    showOnboarding();
  }, 2000);
});

// ==================== ONBOARDING ====================
const onboardingSlides = [
  {
    image: 'images/onboarding.jpeg',
    title: 'أهلاً بك في Pascake',
    subtitle: 'أشهى الحلويات والمعجنات\nالمخبوزة يومياً بأجود المكونات',
  },
  {
    image: 'images/كنافة بالقشطة.jpeg',
    title: 'اطلب ما تريد',
    subtitle: 'تصفح قائمتنا المتنوعة\nواطلب عبر واتساب بنقرة واحدة',
  },
  {
    image: 'images/كيك شوكلاتة.jpeg',
    title: 'صمم كعكتك المخصصة',
    subtitle: 'اختر النكهة والحجم والزخرفة\nونصنعها خصيصاً لك',
  },
];

let onboardingPage = 0;

function showOnboarding() {
  const seen = localStorage.getItem('pascake_onboarding');
  if (seen) {
    document.getElementById('app').style.display = 'block';
    return;
  }
  onboardingPage = 0;
  renderOnboardingSlide();
  document.getElementById('onboarding').classList.add('open');
}

function renderOnboardingSlide() {
  const slide = onboardingSlides[onboardingPage];
  const el = document.getElementById('onboardingContent');
  el.innerHTML = `
    <div class="onboarding-slide">
      <div class="onboarding-image">
        <img src="${slide.image}" alt="" onerror="this.outerHTML='<div style=\'width:100%;height:100%;background:var(--surface);display:flex;align-items:center;justify-content:center\'><i class=\'fas fa-birthday-cake\' style=\'font-size:80px;color:var(--medium-brown);opacity:0.3\'></i></div>'">
      </div>
      <h2 class="onboarding-title">${slide.title}</h2>
      <p class="onboarding-subtitle">${slide.subtitle}</p>
      <div class="onboarding-dots">
        ${onboardingSlides.map((_, i) => `<div class="onboarding-dot ${i === onboardingPage ? 'active' : ''}"></div>`).join('')}
      </div>
      <button class="btn btn-primary btn-full" onclick="nextOnboarding()">
        ${onboardingPage < onboardingSlides.length - 1 ? 'التالي' : 'ابدأ الآن'}
      </button>
      ${onboardingPage < onboardingSlides.length - 1 ? '<button class="btn btn-outline btn-full" onclick="finishOnboarding()" style="margin-top:8px">تخطي</button>' : ''}
    </div>
  `;
}

function nextOnboarding() {
  if (onboardingPage < onboardingSlides.length - 1) {
    onboardingPage++;
    renderOnboardingSlide();
  } else {
    finishOnboarding();
  }
}

function finishOnboarding() {
  localStorage.setItem('pascake_onboarding', 'true');
  document.getElementById('onboarding').classList.remove('open');
  document.getElementById('app').style.display = 'block';
  window.scrollTo({ top: 0 });
}

// ==================== PAGES ====================
function showPage(page) {
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.getElementById('page-' + page).classList.add('active');
  document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
  document.querySelector(`.nav-link[data-page="${page}"]`)?.classList.add('active');
  currentPage = page;
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// ==================== PRODUCTS ====================
function renderProducts(gridId, items) {
  const grid = document.getElementById(gridId);
  grid.innerHTML = items.map(p => `
    <div class="product-card" onclick="openProductModal('${p.id}')">
      <div class="product-card-image">
        <img src="${p.image}" alt="${p.name}" onerror="this.parentElement.innerHTML='<div style=\'width:100%;height:100%;background:var(--cream);display:flex;align-items:center;justify-content:center\'><i class=\'fas fa-birthday-cake\' style=\'font-size:48px;color:var(--medium-brown);opacity:0.3\'></i></div>'">
        <button class="product-card-fav ${favorites.includes(p.id) ? 'active' : ''}" onclick="event.stopPropagation();toggleFav('${p.id}')">
          <i class="fas fa-heart"></i>
        </button>
      </div>
      <div class="product-card-body">
        <div class="product-card-name">${p.name}</div>
        <div class="product-card-rating">
          <i class="fas fa-star"></i> ${p.rating} (${p.reviews} تقييم)
        </div>

        <button class="btn btn-whatsapp btn-sm" onclick="event.stopPropagation();orderProduct('${p.id}')">
          <i class="fab fa-whatsapp"></i> اطلب عبر واتساب
        </button>
      </div>
    </div>
  `).join('');
}

function filterProducts(category, btn) {
  document.querySelectorAll('#page-home .category-chip').forEach(c => c.classList.remove('active'));
  btn.classList.add('active');
  const filtered = category === 'الكل' ? products : products.filter(p => p.category === category);
  renderProducts('homeProductsGrid', filtered);
}

function filterProductsShop(category, btn) {
  document.querySelectorAll('#page-shop .category-chip').forEach(c => c.classList.remove('active'));
  btn.classList.add('active');
  const filtered = category === 'الكل' ? products : products.filter(p => p.category === category);
  renderProducts('shopProductsGrid', filtered);
}

// ==================== PRODUCT MODAL ====================
function openProductModal(productId) {
  const p = products.find(x => x.id === productId);
  if (!p) return;
  const body = document.getElementById('productModalBody');
  body.innerHTML = `
    <div class="product-modal-layout">
      <div class="product-modal-image">
        <img src="${p.image}" alt="${p.name}" onerror="this.outerHTML='<div style=\'width:100%;height:100%;background:var(--cream);display:flex;align-items:center;justify-content:center\'><i class=\'fas fa-birthday-cake\' style=\'font-size:80px;color:var(--medium-brown);opacity:0.3\'></i></div>'">
      </div>
      <div class="product-modal-info">
        <h2>${p.name}</h2>
        <div class="product-modal-rating">
          ${'<i class="fas fa-star"></i>'.repeat(Math.floor(p.rating))}
          <span>${p.rating} (${p.reviews} تقييم)</span>
        </div>

        <p class="product-modal-desc">${p.desc}</p>
        <div class="quantity-selector">
          <span>الكمية:</span>
          <button class="qty-btn" onclick="changeQty(-1)"><i class="fas fa-minus"></i></button>
          <span class="qty-value" id="modalQty">1</span>
          <button class="qty-btn primary" onclick="changeQty(1)"><i class="fas fa-plus"></i></button>
        </div>
        <div class="product-modal-actions">
          <button class="btn btn-primary btn-full" onclick="addToCartFromModal('${p.id}')">
            <i class="fas fa-shopping-cart"></i> أضف إلى السلة
          </button>
          <button class="btn btn-whatsapp btn-full" onclick="orderProduct('${p.id}')">
            <i class="fab fa-whatsapp"></i> اطلب عبر واتساب
          </button>
        </div>
      </div>
    </div>
  `;
  document.getElementById('productModal').dataset.productId = productId;
  document.getElementById('productModal').classList.add('open');
}

let modalQty = 1;
function changeQty(delta) {
  modalQty = Math.max(1, modalQty + delta);
  document.getElementById('modalQty').textContent = modalQty;
}

function addToCartFromModal(productId) {
  for (let i = 0; i < modalQty; i++) addToCart(productId);
  showToast('تمت الإضافة إلى السلة');
  closeProductModal();
}

function closeProductModal() {
  document.getElementById('productModal').classList.remove('open');
  modalQty = 1;
}

// ==================== CART ====================
function addToCart(productId) {
  const existing = cart.find(item => item.id === productId);
  if (existing) {
    existing.qty += 1;
  } else {
    cart.push({ id: productId, qty: 1 });
  }
  saveCart();
  renderCart();
}

function removeFromCart(productId) {
  cart = cart.filter(item => item.id !== productId);
  saveCart();
  renderCart();
}

function updateCartQty(productId, delta) {
  const item = cart.find(i => i.id === productId);
  if (!item) return;
  item.qty += delta;
  if (item.qty <= 0) {
    cart = cart.filter(i => i.id !== productId);
  }
  saveCart();
  renderCart();
}

function clearCart() {
  if (!confirm('هل أنت متأكد من تفريغ السلة؟')) return;
  cart = [];
  saveCart();
  renderCart();
}

function saveCart() {
  localStorage.setItem('pascake_cart', JSON.stringify(cart));
  const count = cart.reduce((sum, item) => sum + item.qty, 0);
  document.getElementById('cartBadge').textContent = count;
  document.getElementById('cartBadgeDesktop').textContent = count;
  document.getElementById('cartBadge').style.display = count > 0 ? 'flex' : 'none';
  document.getElementById('cartBadgeDesktop').style.display = count > 0 ? 'flex' : 'none';
}

function renderCart() {
  const itemsEl = document.getElementById('cartItems');
  const summaryEl = document.getElementById('cartSummary');
  const emptyEl = document.getElementById('cartEmpty');
  const totalEl = document.getElementById('cartTotal');

  if (cart.length === 0) {
    itemsEl.innerHTML = '';
    summaryEl.style.display = 'none';
    emptyEl.style.display = 'flex';
    saveCart();
    return;
  }

  emptyEl.style.display = 'none';
  summaryEl.style.display = 'block';

  itemsEl.innerHTML = cart.map(item => {
    const p = products.find(x => x.id === item.id);
    if (!p) return '';
    return `
      <div class="cart-item">
        <div class="cart-item-image">
          <img src="${p.image}" alt="${p.name}" onerror="this.outerHTML='<i class=\'fas fa-birthday-cake\' style=\'font-size:24px;color:var(--medium-brown);opacity:0.3;margin:20px\'></i>'">
        </div>
        <div class="cart-item-info">
          <div class="cart-item-name">${p.name}</div>

          <div class="cart-item-qty">
            <button onclick="updateCartQty('${item.id}', -1)"><i class="fas fa-minus"></i></button>
            <span>${item.qty}</span>
            <button class="primary" onclick="updateCartQty('${item.id}', 1)"><i class="fas fa-plus"></i></button>
            <button onclick="removeFromCart('${item.id}')" style="margin-right:8px;color:var(--red);"><i class="fas fa-trash"></i></button>
          </div>
        </div>
      </div>
    `;
  }).join('');

  totalEl.textContent = '';
  saveCart();
}

function orderCartViaWhatsApp() {
  if (cart.length === 0) { showToast('السلة فارغة'); return; }
  let itemsList = cart.map(item => {
    const p = products.find(x => x.id === item.id);
    return `• ${p.name} x${item.qty}`;
  }).join('\n');
  const message = encodeURIComponent(
    `مرحباً Pascake! 👋\nأود طلب:\n${itemsList}\nشكراً! 🍰`
  );
  window.open(`https://wa.me/${WHATSAPP_NUMBER}?text=${message}`, '_blank');
}

function toggleCart() {
  document.getElementById('cartSidebar').classList.toggle('open');
  document.getElementById('cartOverlay').classList.toggle('open');
}

// ==================== FAVORITES ====================
function toggleFav(productId) {
  const idx = favorites.indexOf(productId);
  if (idx > -1) {
    favorites.splice(idx, 1);
  } else {
    favorites.push(productId);
  }
  localStorage.setItem('pascake_favorites', JSON.stringify(favorites));
  renderProducts('homeProductsGrid', getFilteredHomeProducts());
  renderProducts('shopProductsGrid', getFilteredShopProducts());
  renderFavorites();
}

function getFilteredHomeProducts() {
  const activeChip = document.querySelector('#page-home .category-chip.active');
  const cat = activeChip ? activeChip.textContent : 'الكل';
  return cat === 'الكل' ? products : products.filter(p => p.category === cat);
}

function getFilteredShopProducts() {
  const activeChip = document.querySelector('#page-shop .category-chip.active');
  const cat = activeChip ? activeChip.textContent : 'الكل';
  return cat === 'الكل' ? products : products.filter(p => p.category === cat);
}

function renderFavorites() {
  const el = document.getElementById('favoritesList');
  const favProducts = products.filter(p => favorites.includes(p.id));
  if (favProducts.length === 0) {
    el.innerHTML = '<div class="fav-empty"><i class="fas fa-heart"></i><p>لا توجد مفضلات</p></div>';
    return;
  }
  el.innerHTML = favProducts.map(p => `
    <div class="fav-item" onclick="closeSidebars();openProductModal('${p.id}')">
      <img src="${p.image}" alt="${p.name}" onerror="this.outerHTML='<i class=\'fas fa-birthday-cake\' style=\'font-size:24px;color:var(--medium-brown);opacity:0.3\'></i>'">
      <span>${p.name}</span>
    </div>
  `).join('');
}

// ==================== WHATSAPP ====================
function orderProduct(productId) {
  const p = products.find(x => x.id === productId);
  if (!p) return;
  const message = encodeURIComponent(
    `مرحباً Pascake! 👋\nأود طلب: ${p.name}\nشكراً! 🍰`
  );
  window.open(`https://wa.me/${WHATSAPP_NUMBER}?text=${message}`, '_blank');
}

function sendCustomCakeOrder(e) {
  e.preventDefault();
  const name = document.getElementById('cakeName').value;
  const size = document.getElementById('cakeSize').value;
  const flavor = document.getElementById('cakeFlavor').value;
  const decoration = document.getElementById('cakeDecoration').value;
  const date = document.getElementById('cakeDate').value;
  const notes = document.getElementById('cakeNotes').value;

  const message = encodeURIComponent(
    `طلب كعكة مخصصة:\nالاسم: ${name}\nالحجم: ${size}\nالنكهة: ${flavor}\nالزخرفة: ${decoration}\nتاريخ التسليم: ${date}\nملاحظات: ${notes}\nشكراً! 🎂`
  );
  window.open(`https://wa.me/${WHATSAPP_NUMBER}?text=${message}`, '_blank');
}

// ==================== SEARCH ====================
function toggleSearch() {
  const el = document.getElementById('searchOverlay');
  el.classList.toggle('open');
  if (el.classList.contains('open')) {
    document.getElementById('searchInput').focus();
  }
}

function handleSearch(query) {
  const el = document.getElementById('searchResults');
  if (!query.trim()) { el.innerHTML = ''; return; }
  const results = products.filter(p =>
    p.name.includes(query) || p.category.includes(query)
  );
  if (results.length === 0) {
    el.innerHTML = '<div class="search-result-empty"><i class="fas fa-search"></i><p>لا توجد نتائج</p></div>';
    return;
  }
  el.innerHTML = results.map(p => `
    <div class="product-card" onclick="closeSearch();openProductModal('${p.id}')">
      <div class="product-card-image" style="aspect-ratio:1">
        <img src="${p.image}" alt="${p.name}" onerror="this.parentElement.innerHTML='<div style=\'width:100%;height:100%;background:var(--cream);display:flex;align-items:center;justify-content:center\'><i class=\'fas fa-birthday-cake\' style=\'font-size:36px;color:var(--medium-brown);opacity:0.3\'></i></div>'">
      </div>
      <div class="product-card-body">
        <div class="product-card-name">${p.name}</div>

      </div>
    </div>
  `).join('');
}

function closeSearch() {
  document.getElementById('searchOverlay').classList.remove('open');
  document.getElementById('searchInput').value = '';
  document.getElementById('searchResults').innerHTML = '';
}

// ==================== DARK MODE ====================
function toggleDarkMode() {
  isDarkMode = !isDarkMode;
  document.body.classList.toggle('dark-mode', isDarkMode);
  const toggle = document.getElementById('darkModeToggle');
  if (toggle) toggle.checked = isDarkMode;
  localStorage.setItem('pascake_dark', JSON.stringify(isDarkMode));
}

// ==================== PROFILE ====================
function toggleProfile() {
  document.getElementById('profileSidebar').classList.toggle('open');
  document.getElementById('profileOverlay').classList.toggle('open');
}

// ==================== MOBILE MENU ====================
function toggleMobileMenu() {
  document.getElementById('mobileMenu').classList.toggle('open');
}

// ==================== HELPERS ====================
function showToast(message) {
  const toast = document.getElementById('toast');
  toast.textContent = message;
  toast.classList.add('show');
  setTimeout(() => toast.classList.remove('show'), 2500);
}

function closeSidebars() {
  document.getElementById('cartSidebar').classList.remove('open');
  document.getElementById('cartOverlay').classList.remove('open');
  document.getElementById('profileSidebar').classList.remove('open');
  document.getElementById('profileOverlay').classList.remove('open');
}

// Close modals on overlay click
document.addEventListener('click', (e) => {
  if (e.target.closest('.modal.open') && !e.target.closest('.modal-content')) {
    closeProductModal();
  }
});

// Keyboard shortcuts
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    closeProductModal();
    document.getElementById('searchOverlay').classList.remove('open');
    document.getElementById('cartSidebar').classList.remove('open');
    document.getElementById('cartOverlay').classList.remove('open');
    document.getElementById('profileSidebar').classList.remove('open');
    document.getElementById('profileOverlay').classList.remove('open');
    document.getElementById('mobileMenu').classList.remove('open');
  }
});
