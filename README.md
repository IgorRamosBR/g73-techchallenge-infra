# G73-TECHACHALLENGE-INFRA

## Padrão SAGA - Coreografia

- A ausência de um ponto central de controle (como um orquestrador) permite que cada serviço seja escalado independentemente, melhorando a capacidade de resposta do sistema como um todo.
- Se um serviço falhar, ele pode ser recuperado e os outros serviços podem continuar a funcionar. Isso aumenta a resiliência do sistema e diminui o risco de um único ponto de falha. Além disso, novos serviços podem ser introduzidos para ouvir e reagir a eventos sem modificar os serviços existentes.
- Em muitos casos, a comunicação direta entre serviços através de eventos pode resultar em menor latência, uma vez que não há necessidade de consulta a um orquestrador para determinar o próximo passo.
- Microsserviços menores e independentes são mais fáceis de testar e manter. Como cada serviço é responsável apenas por uma pequena parte do processo, a complexidade geral do sistema é reduzida.

## Como executar com docker compose

### Sobe dependencias
``` bash
 docker compose up -d
```

### Cria tabelas
``` bash
 aws dynamodb create-table --table-name Payment --attribute-definitions AttributeName=OrderId,AttributeType=N --key-schema AttributeName=OrderId,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --table-class STANDARD --endpoint-url http://localhost:8000 --region us-east-1 

 aws dynamodb create-table -table-name Kitchen --attribute-definitions AttributeName=PK,AttributeType=S AttributeName=GSI1PK,AttributeType=S  --key-schema AttributeName=PK,KeyType=HASH --global-secondary-indexes 'IndexName=SecondaryIndex,KeySchema=[{AttributeName=GSI1PK,KeyType=HASH}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=5}' --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --table-class STANDARD --endpoint-url http://localhost:8000/ --region us-east-1
```

## Como executar com K8S
``` bash
 kubectl apply -f k8s/
```