#!/bin/bash

STACK_NAME=$1
REGION=$2

echo "====================="
echo STACK_NAME = $STACK_NAME REGION = $REGION
echo validate stack status ...
STACK_STATUS=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --region $REGION | jq -r '.Stacks[] .StackStatus')

# if [[ "$STACK_STATUS" =~ ^(UPDATE_COMPLETE|CREATE_COMPLETE|IMPORT_COMPLETE)$ ]]; then
#     echo "$STACK_STATUS: stack status is healthy"
# else
#     echo "$STACK_STATUS: stack status is NOT healthy";
#     exit 1;
# fi


if [[ $STACK_STATUS =~ ^(UPDATE_COMPLETE|CREATE_COMPLETE|IMPORT_COMPLETE)$ ]]; then echo $STACK_STATUS: stack status is healthy; else echo $STACK_STATUS: stack status is NOT healthy; exit 1; fi