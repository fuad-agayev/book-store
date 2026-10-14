-- supabase  seed.sql
-- Demo data for the e-book store.
-- Run migrations first.
-- This file does NOT create tables or Auth users.
-- No explicit BEGIN/COMMIT and no DO $$ block.
-- Each statement runs in its own implicit transaction.
--
-- Create demo.reader@example.com through Supabase Auth
-- before running this file if you want user-specific demo rows.
-- Do not use a real customer's account.


-- 1) CATEGORIES

INSERT INTO public.categories (name, slug)
VALUES
  ('Programming', 'programming'),
  ('Web Development', 'web-development'),
  ('Database', 'database'),
  ('Software Design', 'software-design')
ON CONFLICT (slug) DO NOTHING;


-- 2) AUTHORS

INSERT INTO public.authors (name, bio)
SELECT v.name, v.bio
FROM (VALUES
  ('Robert C. Martin',
   'Author known for books about clean code and software craftsmanship.'),
  ('Martin Fowler',
   'Author and software developer known for refactoring and software architecture.'),
  ('Jon Duckett',
   'Author of books about web design and web development.'),
  ('Brett McLaughlin',
   'Technical author who writes about web technologies and programming.')
) AS v(name, bio)
WHERE NOT EXISTS (
  SELECT 1
  FROM public.authors a
  WHERE lower(a.name) = lower(v.name)
);


-- 3) BOOKS

INSERT INTO public.books
  (
    title,
    author_id,
    category_id,
    isbn,
    description,
    price,
    stock,
    cover_url,
    cover_path,
    pdf_path,
    status,
    language,
    publisher_year,
    featured,
    sale_price,
    genre,
    book_type
  )
SELECT
  v.title,
  a.id,
  c.id,
  v.isbn,
  v.description,
  v.price,
  v.stock,
  NULL,
  NULL,
  NULL,
  'active',
  'English',
  v.publisher_year,
  v.featured,
  v.sale_price,
  v.genre,
  v.book_type::public.book_type
FROM (VALUES
  (
    'Clean Code',
    '9780132350884',
    'Robert C. Martin',
    'Programming',
    'A practical introduction to writing readable and maintainable code.',
    34.99::numeric, 12, 2008, true, 29.99::numeric,
    'Software Engineering', 'digital'
  ),
  (
    'Refactoring',
    '9780134757599',
    'Martin Fowler',
    'Software Design',
    'Techniques for improving the design of existing code.',
    39.99::numeric, 8, 2018, true, NULL::numeric,
    'Software Engineering', 'digital'
  ),
  (
    'HTML and CSS: Design and Build Websites',
    '9781118008188',
    'Jon Duckett',
    'Web Development',
    'A visual introduction to HTML and CSS for building websites.',
    24.99::numeric, 15, 2011, true, 19.99::numeric,
    'Web Development', 'digital'
  ),
  (
    'JavaScript and JQuery',
    '9781118531648',
    'Jon Duckett',
    'Web Development',
    'An introduction to JavaScript and jQuery for interactive websites.',
    27.99::numeric, 10, 2014, false, NULL::numeric,
    'Web Development', 'digital'
  ),
  (
    'Database Design Basics',
    '9780000000005',
    'Brett McLaughlin',
    'Database',
    'A demo title for practicing relational database concepts.',
    18.99::numeric, 20, 2023, false, NULL::numeric,
    'Database', 'digital'
  )
) AS v(
  title,
  isbn,
  author_name,
  category_name,
  description,
  price,
  stock,
  publisher_year,
  featured,
  sale_price,
  genre,
  book_type
)
JOIN public.authors a
  ON lower(a.name) = lower(v.author_name)
JOIN public.categories c
  ON c.name = v.category_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.books b
  WHERE b.isbn = v.isbn
);


-- 4) PROFILE
-- Profile ID is the same UUID as auth.users.id.
-- If the demo Auth account does not exist, zero rows are inserted.

INSERT INTO public.profiles
  (id, full_name, avatar_url, role, status)
SELECT
  u.id,
  'Demo Reader',
  NULL,
  'user',
  'active'
FROM auth.users u
WHERE lower(u.email) = 'demo.reader@example.com'
ON CONFLICT (id) DO NOTHING;


-- 5) CART ITEMS

INSERT INTO public.cart_items
  (user_id, book_id, quantity)
SELECT
  u.id,
  b.id,
  v.quantity
FROM auth.users u
CROSS JOIN (VALUES
  ('9780132350884', 1),
  ('9781118008188', 1),
  ('9781118531648', 2)
) AS v(isbn, quantity)
JOIN public.books b
  ON b.isbn = v.isbn
WHERE lower(u.email) = 'demo.reader@example.com'
ON CONFLICT (user_id, book_id)
DO UPDATE SET quantity = EXCLUDED.quantity;


-- 6) ORDERS
-- Fixed timestamps identify the demo orders on reruns.

INSERT INTO public.orders
  (user_id, total_amount, status, created_at, updated_at)
SELECT
  u.id,
  v.total_amount,
  v.status,
  v.created_at,
  v.created_at
FROM auth.users u
CROSS JOIN (VALUES
  (
    34.99::numeric,
    'pending',
    '2026-01-10 10:00:00+00'::timestamptz
  ),
  (
    24.99::numeric,
    'processing',
    '2026-01-11 11:00:00+00'::timestamptz
  ),
  (
    39.99::numeric,
    'completed',
    '2026-01-12 12:00:00+00'::timestamptz
  )
) AS v(total_amount, status, created_at)
WHERE lower(u.email) = 'demo.reader@example.com'
  AND NOT EXISTS (
    SELECT 1
    FROM public.orders o
    WHERE o.user_id = u.id
      AND o.created_at = v.created_at
  );


-- 7) ORDER ITEMS
-- Link each demo order to its book using the order timestamp and ISBN.

INSERT INTO public.order_items
  (order_id, book_id, quantity, unit_price)
SELECT
  o.id,
  b.id,
  1,
  v.unit_price
FROM auth.users u
CROSS JOIN (VALUES
  (
    '2026-01-10 10:00:00+00'::timestamptz,
    '9780132350884',
    34.99::numeric
  ),
  (
    '2026-01-11 11:00:00+00'::timestamptz,
    '9781118008188',
    24.99::numeric
  ),
  (
    '2026-01-12 12:00:00+00'::timestamptz,
    '9780134757599',
    39.99::numeric
  )
) AS v(order_created_at, isbn, unit_price)
JOIN public.orders o
  ON o.user_id = u.id
 AND o.created_at = v.order_created_at
JOIN public.books b
  ON b.isbn = v.isbn
WHERE lower(u.email) = 'demo.reader@example.com'
  AND NOT EXISTS (
    SELECT 1
    FROM public.order_items oi
    WHERE oi.order_id = o.id
      AND oi.book_id = b.id
  );


-- 8) PAYMENTS
-- These are demo identifiers, NOT real Stripe payments.

INSERT INTO public.payments
  (order_id, stripe_payment_id, amount, status)
SELECT
  o.id,
  v.stripe_payment_id,
  v.amount,
  v.payment_status
FROM auth.users u
CROSS JOIN (VALUES
  (
    '2026-01-10 10:00:00+00'::timestamptz,
    'demo_pi_seed_pending_001',
    34.99::numeric,
    'pending'
  ),
  (
    '2026-01-11 11:00:00+00'::timestamptz,
    'demo_pi_seed_paid_002',
    24.99::numeric,
    'paid'
  ),
  (
    '2026-01-12 12:00:00+00'::timestamptz,
    'demo_pi_seed_paid_003',
    39.99::numeric,
    'paid'
  )
) AS v(
  order_created_at,
  stripe_payment_id,
  amount,
  payment_status
)
JOIN public.orders o
  ON o.user_id = u.id
 AND o.created_at = v.order_created_at
WHERE lower(u.email) = 'demo.reader@example.com'
ON CONFLICT (stripe_payment_id) DO NOTHING;


-- 9) REVIEWS

INSERT INTO public.reviews
  (user_id, book_id, rating, comment)
SELECT
  u.id,
  b.id,
  v.rating,
  v.comment
FROM auth.users u
CROSS JOIN (VALUES
  (
    '9780132350884',
    5,
    'Clear explanations and useful examples.'
  ),
  (
    '9780134757599',
    5,
    'A helpful reference for improving code.'
  ),
  (
    '9781118008188',
    4,
    'A friendly introduction to web development.'
  ),
  (
    '9781118531648',
    4,
    'Useful examples for interactive websites.'
  )
) AS v(isbn, rating, comment)
JOIN public.books b
  ON b.isbn = v.isbn
WHERE lower(u.email) = 'demo.reader@example.com'
ON CONFLICT (user_id, book_id) DO NOTHING;


-- 10) WISHLIST

INSERT INTO public.wishlist
  (user_id, book_id)
SELECT
  u.id,
  b.id
FROM auth.users u
CROSS JOIN (VALUES
  ('9780134757599'),
  ('9781118008188'),
  ('9781118531648')
) AS v(isbn)
JOIN public.books b
  ON b.isbn = v.isbn
WHERE lower(u.email) = 'demo.reader@example.com'
ON CONFLICT (user_id, book_id) DO NOTHING;

-- book-store>psql "postgresql://postgres.jwoomryzaezwuhfqtpka:MY_PASWORD@aws-0-eu-central-1.pooler.supabase.com:5432/postgres" 
-- -f supabase\seed.sql