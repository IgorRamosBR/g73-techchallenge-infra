# G73-TECHACHALLENGE-INFRA

## Como executar

### Sobe dependencias
``` bash
 docker compose up -d
```

### Cria tabelas
``` bash
 make create-payment-table
 make create-kitchen-table
```

## Padrão SAGA - Coreografia

- A ausência de um ponto central de controle (como um orquestrador) permite que cada serviço seja escalado independentemente, melhorando a capacidade de resposta do sistema como um todo.
- Se um serviço falhar, ele pode ser recuperado e os outros serviços podem continuar a funcionar. Isso aumenta a resiliência do sistema e diminui o risco de um único ponto de falha. Além disso, novos serviços podem ser introduzidos para ouvir e reagir a eventos sem modificar os serviços existentes.
- Em muitos casos, a comunicação direta entre serviços através de eventos pode resultar em menor latência, uma vez que não há necessidade de consulta a um orquestrador para determinar o próximo passo.
- Microsserviços menores e independentes são mais fáceis de testar e manter. Como cada serviço é responsável apenas por uma pequena parte do processo, a complexidade geral do sistema é reduzida.
