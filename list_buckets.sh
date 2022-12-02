aws s3 ls | awk '$3 ~ /projectbucket/ {print $3}' > projectlog.txt
# change log.txt to inlcude date in filename

 aws s3api list-objects-v2 --bucket $project --query 'Contents[?LastModified>`2022-10-10`].Key';
done
