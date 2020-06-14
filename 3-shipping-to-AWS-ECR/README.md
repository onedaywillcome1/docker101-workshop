# Pushing Image to AWS ECR

### Create AWS ECR Repo
We are done with dockerizing application in previous steps. Now, we are ready to push image to AWS ECR.

We will use `aws cli` in this step. Before we create ECR repo with aws cli, you need to configure aws cli.
Run the following command, and type the AWS Access key, Secret key and default region.

```
$ aws configure
```


When we configure awscli, we can create AWS ECR repo.
```
$ aws ecr create-repository --repository-name flask-hello-world

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:XXXXXXXXX:repository/flask-hello-world",
        "registryId": "XXXXXXXXX",
        "repositoryName": "flask-hello-world",
        "repositoryUri": "XXXXXXXXX.dkr.ecr.us-east-1.amazonaws.com/flask-hello-world",
        "createdAt": "2020-06-14T16:08:45+03:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        }
    }
}
```
### Logging to AWS ECR, and Tagging, Pushing
In order to push Docker images to AWS ECR, we have to login first. Run the following commands to login to AWS ECR. You can write your own AWS_REGION in selected place(mine is us-east-1)
```
$ export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
$ export AWS_REGION="us-east-1"
$ aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

Login Succeeded
```

Now we can tag with AWS ECR endpoint, then push our tagged docker image to AWS ECR. You can use AWS_ACCOUNT_ID, and AWS_REGION which you exported as above. 
```
$ docker tag flask-hello-world:v1.0 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/flask-hello-world:v1.0
$ docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/flask-hello-world:v1.0
```


Cool! So now we orchestrated the  python application and mysql, and accessed from localhost..
