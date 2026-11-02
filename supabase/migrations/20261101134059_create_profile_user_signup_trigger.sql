-- Function: automatically create a profile for a new Auth user
CREATE OR REPLACE FUNCTION public.new_user_fc()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
BEGIN
    INSERT INTO public.profiles (id)
    VALUES (NEW.id);

    RETURN NEW;
END;
$$;

-- Trigger: execute the function after a new Auth user is created
CREATE TRIGGER auth_new_user_created
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION public.new_user_fc();