ARG TERRAFORM=latest
FROM hashicorp/terraform:${TERRAFORM}
WORKDIR /var/task/
COPY . .
ARG AWS_ACCESS_KEY_ID
ARG AWS_DEFAULT_REGION=us-east-1
ARG AWS_SECRET_ACCESS_KEY
RUN terraform fmt -check
RUN terraform init
RUN terraform plan -out terraform.zip
CMD ["apply", "terraform.zip"]
