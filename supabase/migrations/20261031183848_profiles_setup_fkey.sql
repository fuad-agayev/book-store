-- Foreign Key
ALTER TABLE public.profiles
ADD CONSTRAINT profiles_id_foreignkey
FOREIGN KEY (id)
REFERENCES auth.users(id)
ON DELETE CASCADE;

-- RLS profiles ENABLES
ALTER TABLE public.profiles
ENABLE ROW LEVEL SECURITY;

-- Select Policy
CREATE POLICY "Users can view own profile"
ON public.profiles
FOR SELECT 
TO authenticated
USING (id = (SELECT auth.uid()));

-- Update Policy
CREATE POLICY "Users can update own profile"
ON public.profiles
FOR UPDATE 
TO authenticated
USING (id = (SELECT auth.uid()))
WITH CHECK (id = (SELECT auth.uid()));


