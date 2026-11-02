-- Emotional Intelligence
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('educational', 'learning-study-skills', 'psychological')
WHERE b.title = 'Emotional Intelligence'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Freud ve Psikanaliz
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('psychological', 'educational')
WHERE b.title = 'Freud ve Psikanaliz'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Man"s Search For Meaning
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('educational', 'drama', 'psychological')
WHERE b.title = 'Man"s Search For Meaning'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Thinking, Fast and Slow
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('psychological', 'educational')
WHERE b.title = 'Thinking, Fast and Slow'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Selfish Gene
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('science-fiction', 'educational')
WHERE b.title = 'The Selfish Gene'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Elegant Universe
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('learning-study-skills', 'educational')
WHERE b.title = 'The Elegant Universe'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Cosmos
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('learning-study-skills', 'science-fiction', 'educational', 'adventure')
WHERE b.title = 'Cosmos'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- A Brief History Of Time
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('science-fiction', 'adventure')
WHERE b.title = 'A Brief History Of Time'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Structure of Scientific Revolutions
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('science-fiction', 'educational')
WHERE b.title = 'The Structure of Scientific Revolutions'
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Social Conquest
INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM public.books AS b
JOIN public.genres AS g
  ON g.slug IN ('science-fiction', 'educational', 'drama')
WHERE b.title = 'The Social Conquest'
ON CONFLICT (book_id, genre_id) DO NOTHING;