DUMP_FILE_NAME="backupOn`date +%Y-%m-%d-%H-%M`.dump"
echo "Creating dump: $DUMP_FILE_NAME"

mkdir pg_backup 
cd pg_backup

pg_dump -C -w --format=c --blobs > $DUMP_FILE_NAME

if [ $? -ne 0 ]; then
  echo "File not created, check db connection settings"
  exit 1
fi

echo 'Successfully Backedup'
exit 0