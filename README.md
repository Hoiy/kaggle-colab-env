# kaggle-colab-env

Setup Google Colab environment for Kaggle Competition. Running this scripts require access to Google Drive and a GCP Project of your choice.

## Prerequisite
1. Setup Google's [skicka](https://github.com/google/skicka) cli for Google Drive.
2. Setup `gcloud` and `gsutil` cli and authorize.
3. Setup `kaggle` cli and authorize.

## Usage
1. Clone this repo and execute `init.sh`.
2. Use prepare_env.ipynb to setup environment in Google Colab. This setup kaggle cli, download competitions files.
3. Use template.ipynb to start development and submit.
