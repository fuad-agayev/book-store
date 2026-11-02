-- Chip War
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (165, 1),
  (165, 7),
  (165, 10),
  (165, 17),
  (165, 18)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Supply Chain Technologies
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (157, 17),
  (157, 18)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Coming Wave
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (179, 10),
  (179, 17),
  (179, 18)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Soul Of A New Machine
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (169, 17),
  (169, 18)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Wierd Storm
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (206, 1),
  (206, 10),
  (206, 17),
  (206, 18)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Confidential Side of the Moon
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (205, 1),
  (205, 7),
  (205, 10)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Sunset"s Whisper
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (204, 7),
  (204, 10)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Martian Dawn:Red Frontiers
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (203, 1),
  (203, 7),
  (203, 10)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Lunatic Universe
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (202, 1)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- The Devil"s Greed
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (201, 1),
  (201, 2),
  (201, 4),
  (201, 6),
  (201, 7),
  (201, 8)
ON CONFLICT (book_id, genre_id) DO NOTHING;

-- Osmanli Devleti Devri
INSERT INTO public.book_genres (book_id, genre_id)
VALUES
  (200, 1),
  (200, 17),
  (200, 18)
ON CONFLICT (book_id, genre_id) DO NOTHING;
