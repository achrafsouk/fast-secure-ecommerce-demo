#!/bin/bash

# Exit on error
set -e

# Configuration
FUNCTION_NAME="nextjs-store-app"
AWS_REGION="us-east-1"
ZIP_FILE="nextjs-lambda.zip"
S3_BUCKET="store-app-nextjs-static"
AWS_PROFILE="2account"

rm -f $ZIP_FILE

# npm install
npm run build

cd .next
cd standalone

echo "#!/bin/bash" > run.sh
echo "exec node server.js" >> run.sh

zip -r ../../$ZIP_FILE . -x "*.git*" "node_modules/.cache/*"

cd ..
cd ..

aws lambda update-function-code \
    --function-name $FUNCTION_NAME \
    --zip-file fileb://$ZIP_FILE \
    --region $AWS_REGION \
     --profile $AWS_PROFILE


aws s3 cp .next/static s3://$S3_BUCKET/_next/static \
        --region $AWS_REGION \
        --cache-control "public,max-age=31536000,immutable" \
        --profile $AWS_PROFILE \
        --recursive

aws s3 cp public s3://$S3_BUCKET \
        --region $AWS_REGION \
        --cache-control "public,max-age=31536000,immutable" \
        --profile $AWS_PROFILE \
        --recursive


rm -f $ZIP_FILE
