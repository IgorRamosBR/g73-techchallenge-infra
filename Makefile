AWS_ACCESS_KEY_ID=DUMMYIDEXAMPLE
AWS_SECRET_ACCESS_KEY=DUMMYEXAMPLEKEY
DYNAMODB_LOCAL_URL=http://localhost:8000
REGION=us-east-1

.PHONY: create-payment-table create-kitchen-table

create-payment-table: 
	AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
	AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
	aws dynamodb create-table \
		--table-name Payment \
		--attribute-definitions AttributeName=OrderId,AttributeType=N \
		--key-schema AttributeName=OrderId,KeyType=HASH \
		--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
		--table-class STANDARD \
		--endpoint-url $(DYNAMODB_LOCAL_URL) \
		--region $(REGION)

create-kitchen-table: 
	AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
	AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
	aws dynamodb create-table \
		--table-name Kitchen \
		--attribute-definitions \
			AttributeName=PK,AttributeType=S \
			AttributeName=GSI1PK,AttributeType=S \
		--key-schema \
			AttributeName=PK,KeyType=HASH \
		--global-secondary-indexes \
			'IndexName=SecondaryIndex,KeySchema=[{AttributeName=GSI1PK,KeyType=HASH}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=5}' \
		--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
		--table-class STANDARD \
		--endpoint-url $(DYNAMODB_LOCAL_URL) \
		--region $(REGION)
