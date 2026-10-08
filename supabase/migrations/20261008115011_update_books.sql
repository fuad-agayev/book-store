-- 1. DELETE created_at column
ALTER TABLE public.books
DROP COLUMN created_at;


-- 2. Delete previoous column author
ALTER TABLE public.books
DROP COLUMN author;


-- 3. author_id column add
ALTER TABLE public.books
ADD COLUMN author_id bigint;


-- 4. status column add
ALTER TABLE public.books
ADD COLUMN status text
    NOT NULL
    DEFAULT 'active'
    CHECK (status IN ('active', 'inactive'));


-- 5. language and publisher_year add column
ALTER TABLE public.books
ADD COLUMN language text,
ADD COLUMN publisher_year integer;


-- 6. featured add column 
ALTER TABLE public.books
ADD COLUMN featured boolean
    NOT NULL
    DEFAULT false;


-- 7. sale_price add column 
ALTER TABLE public.books
ADD COLUMN sale_price numeric(10,2);


-- 8. genre add column
ALTER TABLE public.books
ADD COLUMN genre text;


-- 9. book_type enum change name-- 'ebook'    to  'digital'
ALTER TYPE public.book_type
RENAME VALUE 'ebook' TO 'digital';


-- 10. book_type  default = digital
ALTER TABLE public.books
ALTER COLUMN book_type SET DEFAULT 'digital';


-- 11. book_type NULL not can be null
ALTER TABLE public.books
ALTER COLUMN book_type SET NOT NULL;


-- 12. created_at add at the end of the table
ALTER TABLE public.books
ADD COLUMN created_at timestamptz
    NOT NULL
    DEFAULT now();