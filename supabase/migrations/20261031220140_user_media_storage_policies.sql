-- SELECT: Select policy
CREATE POLICY "Users can view own avatars"
ON storage.objects
FOR SELECT
TO authenticated
USING (
    bucket_id = 'user_media'
    AND (storage.foldername(name))[2] = (SELECT auth.uid())::text
);

-- INSERT: Upload Policy
CREATE POLICY "Users can upload own avatars"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'user_media'
    AND (storage.foldername(name))[2] = (SELECT auth.uid())::text
);

-- UPDATE: Update Policy
CREATE POLICY "Users can update own avatar"
ON storage.objects
FOR UPDATE
TO authenticated
USING (
    bucket_id = 'user_media'
    AND (storage.foldername(name))[2] = (SELECT auth.uid())::text
)
WITH CHECK (
    bucket_id = 'user_media'
    AND (storage.foldername(name))[2] = (SELECT auth.uid())::text
);

-- DELETE: Delete Policy
CREATE POLICY "Users can delete own avatar"
ON storage.objects
FOR DELETE
TO authenticated
USING (
    bucket_id = 'user_media'
    AND (storage.foldername(name))[2] = (SELECT auth.uid())::text
);

