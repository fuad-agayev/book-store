CREATE POLICY "Anyone can read books"
ON public.books
FOR SELECT
TO anon
USING (true);