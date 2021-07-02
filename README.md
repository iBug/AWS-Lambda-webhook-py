# AWS Lambda API application template

Create a serverless API application on AWS Lambda quickly. Push your code to GitHub, and deploy automatically using GitHub Actions.

You need to configure two repository secrets: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. You may also need to edit [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml) to configure additional settings, like your AWS region and your Lambda function name.
