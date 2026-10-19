

-- seed.sql
-- Demo data for the e-book store
-- Run migrations first.
-- This file does NOT create tables or Auth users.


-- 1) CATEGORIES

INSERT INTO public.categories (name, slug)
VALUES
  ('Programming', 'programming'),
  ('Web Development', 'web-development'),
  ('Database', 'database'),
  ('Software Design', 'software-design')
ON CONFLICT (slug) DO NOTHING;



-- 2) GENRES

INSERT INTO public.genres (name, slug)
VALUES
  ('Programming', 'programming'),
  ('Software Engineering', 'software-engineering'),
  ('Software Design', 'software-design'),
  ('Web Development', 'web-development'),
  ('JavaScript', 'javascript'),
  ('Database', 'database'),
  ('Technology', 'technology'),
  ('Design', 'design'),
  ('Education', 'education'),
  ('Computer Science', 'computer-science')
ON CONFLICT (slug) DO NOTHING;


-- 3) AUTHORS

INSERT INTO public.authors (name, bio)
SELECT v.name, v.bio
FROM (VALUES
  (
    'Robert C. Martin',
    'Author known for books about clean code and software craftsmanship.'
  ),
  (
    'Martin Fowler',
    'Author and software developer known for refactoring and software architecture.'
  ),
  (
    'Jon Duckett',
    'Author of books about web design and web development.'
  ),
  (
    'Brett McLaughlin',
    'Technical author who writes about web technologies and programming.'
  )
) AS v(name, bio)
WHERE NOT EXISTS (
  SELECT 1
  FROM public.authors a
  WHERE lower(a.name) = lower(v.name)
);



-- 2. LANGUAGES
INSERT INTO public.languages (name, slug)
VALUES
  ('English', 'english'),
  ('Azerbaijani', 'azerbaijani'),
  ('Turkish', 'turkish'),
  ('Russian', 'russian'),
  ('Albanian', 'albanian'),
  ('Arabic', 'arabic'),
  ('Chinese', 'chinese'),
  ('Danish', 'danish'),
  ('Dutch', 'dutch'),
  ('Finnish', 'finnish'),
  ('French', 'french'),
  ('German', 'german'),
  ('Greek', 'greek'),
  ('Hebrew', 'hebrew'),
  ('Hindi', 'hindi'),
  ('Hungarian', 'hungarian'),
  ('Italian', 'italian'),
  ('Japanese', 'japanese'),
  ('Korean', 'korean'),
  ('Norwegian', 'norwegian'),
  ('Persian', 'persian'),
  ('Portuguese', 'portuguese'),
  ('Brazilian Portuguese', 'brazilian-portuguese'),
  ('Romanian', 'romanian'),
  ('Spanish', 'spanish'),
  ('Swedish', 'swedish'),
  ('Thai', 'thai')
ON CONFLICT (slug) DO NOTHING;

-- 4) BOOKS

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
    book_type,
    classification
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
  v.book_type::public.book_type,
  v.classification
FROM (VALUES
  (
    'Clean Code',
    '9780132350884',
    'Robert C. Martin',
    'Programming',
    'A practical introduction to writing readable and maintainable code.',
    34.99::numeric,
    12,
    2008,
    true,
    29.99::numeric,
    'digital',
    'classic'
  ),
  (
    'Refactoring',
    '9780134757599',
    'Martin Fowler',
    'Software Design',
    'Techniques for improving the design of existing code.',
    39.99::numeric,
    8,
    2018,
    true,
    NULL::numeric,
    'digital',
    'contemporary'
  ),
  (
    'HTML and CSS: Design and Build Websites',
    '9781118008188',
    'Jon Duckett',
    'Web Development',
    'A visual introduction to HTML and CSS for building websites.',
    24.99::numeric,
    15,
    2011,
    true,
    19.99::numeric,
    'digital',
    'contemporary'
  ),
  (
    'JavaScript and JQuery',
    '9781118531648',
    'Jon Duckett',
    'Web Development',
    'An introduction to JavaScript and jQuery for interactive websites.',
    27.99::numeric,
    10,
    2014,
    false,
    NULL::numeric,
    'digital',
    'contemporary'
  ),
  (
    'Database Design Basics',
    '9780000000005',
    'Brett McLaughlin',
    'Database',
    'A demo title for practicing relational database concepts.',
    18.99::numeric,
    20,
    2023,
    false,
    NULL::numeric,
    'digital',
    'contemporary'
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
  book_type,
  classification
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


-- 5) BOOK_GENRES
-- Connect books to their genres.

INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM (
  VALUES
    (
      '9780132350884',
      'Programming'
    ),
    (
      '9780132350884',
      'Software Engineering'
    ),
    (
      '9780134757599',
      'Software Engineering'
    ),
    (
      '9780134757599',
      'Software Design'
    ),
    (
      '9781118008188',
      'Web Development'
    ),
    (
      '9781118008188',
      'Design'
    ),
    (
      '9781118531648',
      'Web Development'
    ),
    (
      '9781118531648',
      'JavaScript'
    ),
    (
      '9780000000005',
      'Database'
    ),
    (
      '9780000000005',
      'Software Design'
    )
) AS v(isbn, genre_name)
JOIN public.books b
  ON b.isbn = v.isbn
JOIN public.genres g
  ON g.name = v.genre_name
ON CONFLICT (book_id, genre_id) DO NOTHING;


-- 6) PROFILE
-- Create this row only if the demo Auth user exists.
-- The profile ID matches auth.users.id.

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


-- 7) CART ITEMS

INSERT INTO public.cart_items
  (user_id, book_id, quantity)
SELECT
  u.id,
  b.id,
  v.quantity
FROM auth.users u
CROSS JOIN (
  VALUES
    ('9780132350884', 1),
    ('9781118008188', 1),
    ('9781118531648', 2)
) AS v(isbn, quantity)
JOIN public.books b
  ON b.isbn = v.isbn
WHERE lower(u.email) = 'demo.reader@example.com'
ON CONFLICT (user_id, book_id)
DO UPDATE SET quantity = EXCLUDED.quantity;


-- 8) ORDERS
-- Fixed timestamps identify demo orders on reruns.

INSERT INTO public.orders
  (user_id, total_amount, status, created_at, updated_at)
SELECT
  u.id,
  v.total_amount,
  v.status,
  v.created_at,
  v.created_at
FROM auth.users u
CROSS JOIN (
  VALUES
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


-- 9) ORDER ITEMS
-- Link each demo order to a book using timestamp and ISBN.

INSERT INTO public.order_items
  (order_id, book_id, quantity, unit_price)
SELECT
  o.id,
  b.id,
  1,
  v.unit_price
FROM auth.users u
CROSS JOIN (
  VALUES
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


-- 10) PAYMENTS
-- Demo identifiers only; these are NOT real Stripe payments.

INSERT INTO public.payments
  (order_id, stripe_payment_id, amount, status)
SELECT
  o.id,
  v.stripe_payment_id,
  v.amount,
  v.payment_status
FROM auth.users u
CROSS JOIN (
  VALUES
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


-- 11) REVIEWS

INSERT INTO public.reviews
  (user_id, book_id, rating, comment)
SELECT
  u.id,
  b.id,
  v.rating,
  v.comment
FROM auth.users u
CROSS JOIN (
  VALUES
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


-- 12) WISHLIST

INSERT INTO public.wishlist
  (user_id, book_id)
SELECT
  u.id,
  b.id
FROM auth.users u
CROSS JOIN (
  VALUES
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