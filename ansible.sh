#!/bin/bash

aws ssm send-command \
 --document-name "AWS-ApplyAnsiblePlaybooks" \
 --document-version "1" \
 --targets '[{"Key":"InstanceIds","Values":["INSTANCE_ID"]}]' \
 --parameters '{"SourceType":["GitHub"],"SourceInfo":["{ \"owner\": \"t-sakurai816\", \"repository\": \"REPO_NAME\",  \"getOptions\": \"branch:main\", \"path\": \"ansible.zip\" }"], "InstallDependencies":["True"],"PlaybookFile":["ansible/site.yml"],"ExtraVariables":["SSM=True"],"Check":["False"],"Verbose":["-v"],"TimeoutSeconds":["3600"]}' \
 --timeout-seconds 600 \
 --max-concurrency "50" \
 --max-errors "0" \
 --region ap-northeast-1