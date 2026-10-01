CREATE TYPE public.book_type AS ENUM (
    'physical',
    'ebook'
);

ALTER TABLE public.books 
ADD COLUMN book_type public.book_type;
