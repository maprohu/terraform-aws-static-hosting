#!/bin/env zx

cd(__dirname);

await $`terraform init`;
await $`terraform apply --var-file=local.tfvars -auto-approve`;
const { stdout: s3 } = await $`terraform output -raw content_s3`.quiet();
await $`aws s3 sync content s3://${s3} --delete`;