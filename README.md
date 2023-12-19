## Composite-S3-CloudFront

- Compite Action For S3-CloudFront Distribution (w/OAC)

### Example Usage

```yaml
name: "test-deploy"

on:
  push:
    branches:
      - test

jobs:
  test:
    name: "Test Deploy"
    runs-on: "ubuntu-latest"

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Deploy AWS
        uses: "Geun-Oh/Composite-S3-CloudFront@latest"
        with:
          filepath: "/my/file/path"
          aws_access_key: ${{ secrets.AWS_ACCESS_KEY }}
          aws_secret_key: ${{ secrets.AWS_SECRET_KEY }}
```
