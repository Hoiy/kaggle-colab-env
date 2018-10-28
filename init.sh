kaggle competitions list
echo
echo --------
echo
echo Enter kaggle competition id:
read COMPETITION_ID
echo

gcloud projects list
echo
echo --------
echo
echo Enter a project id:
read PROJECT_ID
echo

BUCKET_NAME=$(echo "$PROJECT_ID-$COMPETITION_ID" | awk '{print tolower($0)}')

cat prepare_env.ipynb | sed "s/<<PROJECT_ID>>/$PROJECT_ID/g" | sed "s/<<BUCKET_NAME>>/$BUCKET_NAME/g" > .prepare_env.ipynb
cat kaggle.json | sed "s/<<COMPETITION_ID>>/$COMPETITION_ID/g" > .kaggle.json

echo Uploading kaggle-$COMPETITION_ID/prepare_env.ipynb...
skicka mkdir kaggle-$COMPETITION_ID
skicka upload .prepare_env.ipynb kaggle-$COMPETITION_ID/prepare_env.ipynb
skicka upload tmplate.ipynb kaggle-$COMPETITION_ID/tmplate.ipynb

echo Uploading kaggle.json to gs://$PROJECT_ID-$COMPETITION_ID/kaggle.json
gcloud config set project $PROJECT_ID
gsutil mb "gs://$BUCKET_NAME"
gsutil cp .kaggle.json "gs://$BUCKET_NAME/kaggle.json"
