###Step 1.
docker build -t rinormaloku/pg-back-up .


###Step 2.
docker run -v /d/volume:/pg_backup rinormaloku/pg-back-up