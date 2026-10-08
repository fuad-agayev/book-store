
INSERT INTO public.books (
    title,
    isbn,
    description,
    price,
    stock,
    category_id,
    cover_url,
    cover_path,
    pdf_path,
    book_type,
    author_id,
    status,
    language,
    publisher_year,
    featured,
    sale_price,
    genre
)
VALUES
(
    'The Last Cipher',
    '9780000000001',
    'A technology thriller about a mysterious encrypted message hidden for centuries.',
    29.99,
    15,
    1,
    'https://example.com/covers/last-cipher.jpg',
    'covers/last-cipher.jpg',
    'books/last-cipher.pdf',
    'digital',
    1,
    'active',
    'English',
    2026,
    true,
    19.99,
    'Thriller'
),
(
    'The Silent Code',
    '9780000000002',
    'A detective discovers a hidden code connecting several unsolved cases.',
    24.99,
    8,
    1,
    'https://example.com/covers/silent-code.jpg',
    'covers/silent-code.jpg',
    NULL,
    'physical',
    2,
    'active',
    'English',
    2025,
    false,
    NULL,
    'Mystery'
);

-- book-store>psql "postgresql://postgres.jwoomryzaezwuhfqtpka:MY_PASWORD@aws-0-eu-central-1.pooler.supabase.com:5432/postgres" 
-- -f supabase\seed.sql