INSERT INTO public.book_genres (book_id, genre_id)
SELECT b.id, g.id
FROM (
  VALUES
    ('1000001', 'educational'),
    ('1000001', 'learning-study-skills'),

    ('1000002', 'educational'),
    ('1000002', 'learning-study-skills'),

    ('1000003', 'educational'),
    ('1000003', 'learning-study-skills'),

    ('1000004', 'educational'),
    ('1000004', 'learning-study-skills'),

    ('1000005', 'educational'),
    ('1000005', 'learning-study-skills'),

    ('1000006', 'educational'),
    ('1000006', 'learning-study-skills'),

    ('1000007', 'educational'),
    ('1000007', 'learning-study-skills'),
    ('1000007', 'graphic-design'),

    ('1000008', 'educational'),
    ('1000008', 'learning-study-skills'),

    ('1000009', 'art-creativity'),
    ('1000009', 'architecture'),
    ('1000009', 'educational'),

    ('1000010', 'art-creativity'),
    ('1000010', 'architecture'),
    ('1000010', 'educational'),

    ('1000011', 'art-creativity'),
    ('1000011', 'architecture'),
    ('1000011', 'educational'),

    ('1000012', 'educational'),
    ('1000012', 'learning-study-skills'),

    ('1000013', 'educational'),
    ('1000013', 'learning-study-skills'),
    ('1000013', 'historical-fiction'),

    ('1000014', 'educational'),
    ('1000014', 'learning-study-skills'),
    ('1000014', 'historical-fiction'),

    ('1000015', 'educational'),
    ('1000015', 'learning-study-skills'),
    ('1000015', 'historical-fiction'),

    ('1000016', 'educational'),
    ('1000016', 'learning-study-skills'),

    ('1000017', 'educational'),
    ('1000017', 'learning-study-skills'),

    ('1000018', 'educational'),
    ('1000018', 'learning-study-skills'),
    ('1000018', 'historical-fiction'),

    ('1000019', 'educational'),
    ('1000019', 'historical-fiction'),

    ('1000020', 'learning-study-skills'),
    ('1000020', 'historical-fiction'),
    ('1000020', 'adventure'),

    ('1000021', 'educational'),
    ('1000021', 'learning-study-skills'),
    ('1000021', 'psychological'),

    ('1000022', 'educational'),
    ('1000022', 'learning-study-skills'),
    ('1000022', 'psychological'),
    ('1000022', 'architecture'),

    ('1000023', 'educational'),
    ('1000023', 'learning-study-skills'),
    ('1000023', 'psychological'),

    ('1000024', 'educational'),
    ('1000024', 'learning-study-skills'),
    ('1000024', 'psychological'),

    ('1000025', 'childrens-fiction'),
    ('1000025', 'educational'),
    ('1000025', 'adventure'),

    ('1000026', 'childrens-fiction'),
    ('1000026', 'educational'),
    ('1000026', 'adventure'),

    ('1000027', 'childrens-fiction'),
    ('1000027', 'educational'),
    ('1000027', 'adventure'),

    ('1000028', 'childrens-fiction'),
    ('1000028', 'educational'),
    ('1000028', 'adventure'),

    ('1000029', 'childrens-fiction'),
    ('1000029', 'educational'),
    ('1000029', 'adventure'),

    ('1000030', 'childrens-fiction'),
    ('1000030', 'educational'),
    ('1000030', 'adventure'),

    ('1000031', 'childrens-fiction'),
    ('1000031', 'educational'),
    ('1000031', 'adventure'),

    ('1000032', 'childrens-fiction'),
    ('1000032', 'educational'),
    ('1000032', 'adventure'),

    ('1000033', 'childrens-fiction'),
    ('1000033', 'educational'),
    ('1000033', 'adventure'),

    ('1000034', 'childrens-fiction'),
    ('1000034', 'educational'),
    ('1000034', 'adventure'),

    ('1000035', 'childrens-fiction'),
    ('1000035', 'educational'),
    ('1000035', 'adventure'),

    ('1000036', 'drama'),
    ('1000036', 'psychological'),

    ('1000037', 'historical-fiction'),
    ('1000037', 'adventure'),

    ('1000038', 'drama'),
    ('1000038', 'adventure'),

    ('1000039', 'psychological'),
    ('1000039', 'drama'),

    ('1000040', 'historical-fiction'),
    ('1000040', 'romance'),
    ('1000040', 'drama'),

    ('1000041', 'crime'),
    ('1000041', 'drama'),

    ('1000042', 'psychological'),
    ('1000042', 'drama'),

    ('1000043', 'romance'),
    ('1000043', 'drama'),

    ('1000044', 'psychological'),
    ('1000044', 'drama'),

    ('1000045', 'educational'),
    ('1000045', 'drama'),

    ('1000046', 'psychological'),
    ('1000046', 'drama'),

    ('1000047', 'historical-fiction'),
    ('1000047', 'adventure'),

    ('1000048', 'historical-fiction'),
    ('1000048', 'drama'),
    
    ('1000049', 'romance'),
    ('1000049', 'drama'),

    ('1000050', 'adventure'),
    ('1000050', 'drama'),
    ('1000050', 'romance'),

    ('1000051', 'drama'),
    ('1000051', 'psychological'),
    ('1000051', 'historical-fiction'),

    ('1000052', 'historical-fiction'),
    ('1000052', 'adventure'),

    ('1000053', 'historical-fiction'),
    ('1000053', 'drama'),
    ('1000053', 'adventure'),

    ('1000054', 'educational'),
    ('1000054', 'learning-study-skills'),
    ('1000054', 'architecture'),

    ('1000055', 'educational'),
    ('1000055', 'learning-study-skills'),

    ('1000056', 'educational'),
    ('1000056', 'architecture'),

    ('1000057', 'educational'),
    ('1000057', 'learning-study-skills'),
    ('1000057', 'architecture'),

    ('1000058', 'educational'),
    ('1000058', 'learning-study-skills'),
    ('1000058', 'architecture'),

    ('1000059', 'educational'),
    ('1000059', 'learning-study-skills'),
    ('1000059', 'architecture'),

    ('1000060', 'educational'),
    ('1000060', 'learning-study-skills'),
    ('1000060', 'architecture'),

    ('1000061', 'educational'),
    ('1000061', 'architecture'),

    ('1000062', 'educational'),
    ('1000062', 'learning-study-skills'),

    ('1000063', 'educational'),
    ('1000063', 'learning-study-skills'),
    ('1000063', 'architecture'),

    ('1000064', 'educational'),
    ('1000064', 'learning-study-skills'),

    ('1000065', 'educational'),
    ('1000065', 'learning-study-skills'),

    ('1000066', 'educational'),
    ('1000066', 'learning-study-skills'),

    ('1000067', 'educational'),
    ('1000067', 'learning-study-skills'),

    ('1000068', 'educational'),
    ('1000068', 'learning-study-skills'),
    
    ('1000069', 'educational'),
    ('1000069', 'learning-study-skills'),
    
    ('1000070', 'educational'),
    ('1000070', 'learning-study-skills'),
    
    ('1000071', 'educational'),
    ('1000071', 'learning-study-skills'),
    
    ('1000072', 'educational'),
    ('1000072', 'learning-study-skills'),
    
    ('1000073', 'educational'),
    ('1000073', 'learning-study-skills'),
    
    ('1000074', 'educational'),
    ('1000074', 'learning-study-skills'),
    
    ('1000075', 'educational'),
    ('1000075', 'learning-study-skills'),
    
    ('1000076', 'educational'),
    ('1000076', 'learning-study-skills'),
    
    ('1000077', 'educational'),
    ('1000077', 'learning-study-skills'),
    
    ('1000078', 'educational'),
    ('1000078', 'learning-study-skills'),
    
    ('1000079', 'educational'),
    ('1000079', 'learning-study-skills'),
    
    ('1000080', 'educational'),
    ('1000080', 'learning-study-skills'),

    ('1000081', 'educational'),
    ('1000081', 'learning-study-skills'),

    ('1000082', 'detective'),
    ('1000082', 'crime'),
    ('1000082', 'psychological'),

    ('1000083', 'detective'),
    ('1000083', 'thriller'),

    ('1000084', 'detective'),
    ('1000084', 'crime'),
    ('1000084', 'psychological'),

    ('1000085', 'adventure'),
    ('1000085', 'drama'),

    ('1000086', 'thriller'),
    ('1000086', 'mystery'),
    ('1000086', 'drama'),

    ('1000087', 'fantasy'),
    ('1000087', 'drama'),
    ('1000087', 'psychological'),

    ('1000088', 'mystery'),
    ('1000088', 'thriller'),

    ('1000089', 'detective'),
    ('1000089', 'mystery'),

    ('1000090', 'drama'),

    ('1000091', 'drama'),
    ('1000091', 'psychological'),
    ('1000091', 'mystery'),

    ('1000092', 'romance'),
    ('1000092', 'drama'),

    ('1000093', 'thriller'),

    ('1000094', 'thriller'),
    ('1000094', 'crime'),

    ('1000095', 'thriller'),
    ('1000095', 'psychological'),

    ('1000096', 'drama'),

    ('1000097', 'thriller'),
    ('1000097', 'mystery'),

    ('1000098', 'thriller'),
    ('1000098', 'mystery'),

    ('1000099', 'thriller'),
    ('1000099', 'crime'),

    ('1000100', 'fantasy'),
    ('1000100', 'drama'),

    ('1000101', 'mystery'),
    ('1000101', 'psychological'),

    ('1000102', 'detective'),

    ('1000103', 'detective'),
    ('1000103', 'thriller'),

    ('1000104', 'mystery'),
    ('1000104', 'crime'),

    ('1000105', 'drama'),
    ('1000105', 'romance'),

    ('1000106', 'detective'),
    ('1000106', 'psychological'),
    ('1000106', 'drama'),

    ('1000107', 'thriller'),
    ('1000107', 'crime'),
    ('1000107', 'drama'),

    ('1000108', 'detective'),
    ('1000108', 'crime'),

    ('1000109', 'thriller'),
    ('1000109', 'crime'),
    ('1000109', 'mystery'),
    ('1000109', 'psychological'),

    ('1000110', 'detective'),  
    ('1000110', 'psychological'),
    ('1000110', 'crime'),
    ('1000110', 'drama'),
    ('1000110', 'mystery'),
    ('1000110', 'romance'),
    ('1000110', 'thriller'),

    ('1000111', 'psychological'),
    ('1000111', 'drama'),

    ('1000112', 'thriller'),
    ('1000112', 'crime'),
    ('1000112', 'drama'),

    ('1000113', 'detective'),
    ('1000113', 'crime'),

    ('1000114', 'drama'),
    ('1000114', 'mystery'),
    ('1000114', 'psychological'),

    ('1000115', 'educational'),
    ('1000115', 'learning-study-skills'),

   ('1000116', 'psychological'),
   ('1000116', 'educational'),
   ('1000116', 'learning-study-skills'),

   ('1000117', 'educational'),
   ('1000117', 'learning-study-skills'),

   ('1000118', 'educational'),
   ('1000118', 'health-wellness'),

   ('1000119', 'health-wellness'),
   ('1000119', 'fitness'),

   ('1000120', 'educational'),
   ('1000120', 'health-wellness'),

   ('1000121', 'health-wellness'),
   ('1000121', 'fitness'),
   ('1000121', 'mental-health'),

   ('1000122', 'educational'),
   ('1000122', 'mental-health'),

   ('1000123', 'educational'),
   ('1000123', 'health-wellness'),

   ('1000124', 'health-wellness'),
   ('1000124', 'mental-health'),

   ('1000125', 'health-wellness'),

   ('1000126', 'educational'),
   ('1000126', 'health-wellness'),

   ('1000127', 'educational'),
   ('1000127', 'historical-fiction'),
   ('1000127', 'adventure'),

   ('1000128', 'educational'),
   ('1000128', 'historical-fiction'),
   ('1000128', 'learning-study-skills'),

   ('1000129', 'historical-fiction'),
   
   ('1000130', 'educational'),
   ('1000130', 'learning-study-skills'),

   ('1000131', 'educational'),
   ('1000131', 'historical-fiction'),
   ('1000131', 'learning-study-skills'),
   ('1000131', 'drama'),
   ('1000131', 'adventure'),

   ('1000132', 'educational'),
   ('1000132', 'historical-fiction'),
   ('1000132', 'drama'),

   ('1000133', 'educational'),
   ('1000133', 'historical-fiction'),
   ('1000133', 'drama'),
   ('1000133', 'adventure'),

   ('1000134', 'educational'),
   ('1000134', 'historical-fiction'),
   ('1000134', 'drama'),

   ('1000135', 'educational'),
   ('1000135', 'historical-fiction'),

   ('1000136', 'educational'),
   ('1000136', 'learning-study-skills'),

   ('1000137', 'educational'),
   ('1000137', 'psychological'),

   ('1000138', 'psychological'),

   ('1000139', 'educational'),
   ('1000139', 'drama'),

   ('1000140', 'educational'),
   ('1000140', 'learning-study-skills'),

   ('1000141', 'educational'),
   ('1000141', 'learning-study-skills'),

   ('1000142', 'educational'),
   ('1000142', 'learning-study-skills'),

   ('1000143', 'educational'),
   ('1000143', 'learning-study-skills'),

   ('1000144', 'educational'),
   ('1000144', 'learning-study-skills'),

   ('1000145', 'educational'),
   ('1000145', 'learning-study-skills'),

   ('1000146', 'educational'),
   ('1000146', 'learning-study-skills'),

   ('1000147', 'educational'),
   ('1000147', 'learning-study-skills'),

   ('1000148', 'educational'),
   ('1000148', 'learning-study-skills')
   
) AS v(isbn, genre_slug)
JOIN public.books AS b
  ON b.isbn = v.isbn
JOIN public.genres AS g
  ON g.slug = v.genre_slug
ON CONFLICT (book_id, genre_id) DO NOTHING;