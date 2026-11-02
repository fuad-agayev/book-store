--  First appear 'digital' book type hoy many
SELECT id, title, cover_path, pdf_path
FROM public.books
WHERE book_type = 'digital'
ORDER BY id;

-- cover photo path
UPDATE public.books
SET cover_path = regexp_replace(cover_path, '^digital_covers/', '')
WHERE book_type = 'digital'
  AND cover_path LIKE 'digital_covers/%';

-- pdf file path 
UPDATE public.books
SET pdf_path = regexp_replace(pdf_path, '^digital-pdf/', '')
WHERE book_type = 'digital'
  AND pdf_path LIKE 'digital-pdf/%';

