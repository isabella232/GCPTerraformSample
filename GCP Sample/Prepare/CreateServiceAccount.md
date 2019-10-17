### Creating and managing service account keys

 (  for more information https://cloud.google.com/iam/docs/creating-managing-service-account-keys )

1. Open the IAM & Admin page in the GCP Console.
2. Open IAM & ADMIN page
3. Select your project and click Continue.
4. In the left navigation column , click Service accounts.
5. Look for the service account for which you wish to create a key, click the More more_vert button in that row, and then click Create key.
   (here you can also create a new service account)
6. Select JSON as a Key type and click Create.
7. Save the created file in a safe location. 

In the examples TF files we reffer to the JSON file when creating the provider data.

We can instead export the conetnt of the JSON file to the GOOGLE_CREDENTIALS environment variable.

```
export GOOGLE_CREDENTIALS=$(cat ~/Cred/gce-terraform-key.json)
```

