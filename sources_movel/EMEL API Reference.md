# API de Mobilidade EMEL

## Estações Gira

### Obter informações sobre uma estação Gira específica

```
GET /gira/station/{id}
```

Obtém informações sobre uma estação Gira específica.

#### Parâmetros

| Nome | Tipo    | Localização | Descrição                |
| ---- | ------- | ----------- | ------------------------ |
| id   | integer | path        | Identificador da estação |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "id_expl": "123",
  "id_planeamento": "303",
  "descricao": "teste description",
  "ocupacao": "teste occupation",
  "estado": "state",
  "desig_comercial": "commercial designation",
  "tipo_servico_niveis": "n service type",
  "num_bicicletas": "457",
  "num_docas": "234",
  "racio": "34",
  "implantacao_em": "implementation on",
  "tipo_implantacao": "implementation type",
  "descont_docas": "docs descont",
  "observacoes": "",
  "latitude": "38.769083",
  "longitude": "-9.180755"
}
```

### Obter lista de estações Gira

```
GET /gira/station/list
```

Obtém a lista de estações Gira no formato GeoJSON.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

### Obter mapa de todas as estações Gira

```
GET /gira/station/map
```

Obtém o mapa de todas as estações Gira em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

---

## Tráfego

### Obter lista de fechamentos de tráfego

```
GET /traffic/closures/list
```

Obtém a lista de todos os fechamentos de tráfego no formato GeoJSON.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "properties": {
    "morada": "Rua Jacinto Nunes",
    "local_referencia": "",
    "restricao_circulacao": "Estacionamento",
    "motivo": "AUTOGRUA",
    "estado": "APROVADO",
    "impacto": "Relevante",
    "periodos_condicionamentos": {
      "date_min": "2017-11-02",
      "date_max": "2017-11-02",
      "hour_min": "10:00:00",
      "hour_max": "16:30:00"
    },
    "creation_date": "2017-10-23T13:20:26Z",
    "lastmod_date": "2017-10-25T13:53:49Z",
    "pedido": "COND-2017-2926",
    "versao": 1,
    "closure_id": "COND-2017-2926-1"
  }
}
```

### Obter mapa de fechamentos de tráfego

```
GET /traffic/closures/map
```

Obtém o mapa de todos os fechamentos de tráfego em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Proibido                                   |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

### Obter lista de congestionamentos Waze

```
GET /traffic/waze/jams/list
```

Obtém a lista de todos os congestionamentos de tráfego Waze no formato GeoJSON.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "properties": {
    "country": "PO",
    "city": "Lisboa (Bairro Alto)",
    "level": 5,
    "length": 32,
    "turn_type": "NONE",
    "type": "NONE",
    "uuid": "1680099745",
    "end_node": "R. Luz Soriano",
    "speed": 0,
    "road_type": 1,
    "delay": -1,
    "street": "Tv. das Mercês",
    "pub_millis": 1511952919763
  }
}
```

### Obter mapa de congestionamentos Waze

```
GET /traffic/waze/jams/map
```

Obtém o mapa de todos os congestionamentos de tráfego Waze em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Proibido                                   |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

### Obter lista de irregularidades de tráfego Waze

```
GET /traffic/waze/irregularities/list
```

Obtém a lista de todas as irregularidades de tráfego Waze no formato GeoJSON.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "properties": {
    "country": "PO",
    "n_thumbs_up": 0,
    "update_date": "2017-11-29T14:28:18Z",
    "trend": -1,
    "city": "Lisboa",
    "detection_date_millis": 1511963055132,
    "type": "Medium",
    "end_node": "Campo Grande, Lisboa",
    "speed": 11.36,
    "seconds": 695,
    "start_node": "Carnide",
    "street": "2.ª Circular / Av. Gen. Norton de Matos",
    "jam_level": 4,
    "waze_id": 135282228,
    "n_comments": 0,
    "highway": 1,
    "delay_seconds": 590,
    "severity": 2,
    "drivers_count": "Unknown Type: numeric",
    "alerts_count": 9,
    "length": 2196,
    "update_date_millis": 1511965698048,
    "n_images": 0,
    "detection_date": "2017-11-29T13:44:15Z",
    "regular_speed": 56.94
  }
}
```

### Obter mapa de irregularidades de tráfego Waze

```
GET /traffic/waze/irregularities/map
```

Obtém o mapa de todas as irregularidades de tráfego Waze em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Proibido                                   |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

## Zonas de Estacionamento

### Obter informações sobre uma zona de estacionamento

```
GET /parking/zone/{id}
```

Obtém informações sobre uma zona de estacionamento específica.

#### Parâmetros

| Nome | Tipo    | Localização | Descrição                        |
|------|---------|-------------|---------------------------------|
| id   | integer | path        | Identificador da zona de estacionamento |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "produto": "BairrosRotação",
  "cod_tarifa": "YD",
  "tarifa": "BAIRROS",
  "cod_horario": "H5",
  "horario": "24 HORAS",
  "id_tipo_estacionamento": "3",
  "tipo_estacionamento": "Rotativo",
  "data_inicio": "2015-06-22",
  "data_fim": "null",
  "observacoes": "Obs"
}
```

### Obter informações sobre zona de estacionamento por coordenadas

```
GET /parking/zone/
```

Obtém informações sobre a zona de estacionamento para um par de latitude e longitude fornecido.

#### Parâmetros

| Nome      | Tipo   | Localização | Descrição |
|-----------|--------|-------------|-----------|
| latitude  | number | query       | Latitude  |
| longitude | number | query       | Longitude |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "id": 41289,
  "produto": "BairrosRotação",
  "cod_tarifa": "YD",
  "tarifa": "BAIRROS",
  "cod_horario": "H5",
  "horario": "24 HORAS",
  "id_tipo_estacionamento": "3",
  "tipo_estacionamento": "Rotativo",
  "observacoes": "Obs"
}
```

### Obter lista de zonas de estacionamento

```
GET /parking/zone/list
```

Obtém informações sobre zonas de estacionamento no formato GeoJSON.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "properties": {
    "id": 5,
    "produto": "AmarelaExclusiva para residentes",
    "cod_tarifa": "YB",
    "tarifa": "AMARELA",
    "cod_horario": "H5",
    "horario": "24 HORAS",
    "id_tipo_estacionamento": "2",
    "tipo_estacionamento": "Bolsa de Residentes",
    "data_inicio": "2015-06-21Z",
    "data_fim": "string",
    "observacoes": "string"
  }
}
```

### Obter mapa de zonas de estacionamento

```
GET /parking/zone/map
```

Obtém informações sobre zonas de estacionamento em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

## Lugares de Estacionamento

### Obter informações sobre um lugar de estacionamento

```
GET /parking/places/{id}
```

Obtém informações sobre um lugar de estacionamento específico.

#### Parâmetros

| Nome | Tipo    | Localização | Descrição                          |
|------|---------|-------------|-------------------------------------|
| id   | integer | path        | Identificador do lugar de estacionamento |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor---|---------|-------------|-------------------------------------|
| id   | integer | path        | Identificador do lugar de estacionamento |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de suc                           |

Exemplo de resposta de sucesso:

```json
{
  "estado": "OUTROS",
  "horarioespecifico": "2ª A 6ª 9-19H",
  "areaexploracao": "Com Concessão Em Exploração",
  "tipoestacionamento": "Rotativo",
  "horario": "2ª A 6ª 9-19H",
  "tarifa": "YA",
  "esso:

```json
{
  "estado": "OUTROS",
  "horarioespecifico": "2ª A 6ª 9-19H",
  "areaexploracao": "Com Concessão Em Exploração",
  "tipoestacionamento": "Rotativo",
  "horario": "2ª A 6ª 9-19H",
  "tarifa": "YA",
  "produto": "VerdeRotação",
  "tipologia": "T",
  "horarioespecificocod": "Hproduto": "VerdeRotação",
  "tipologia": "T",
  "horarioespecificocod": "H1"
}
```

### Obter informações sobre lugares de estacionamento por coordenadas

```
GET /parking/places/
```

Obtém informações sobre lugares de estacionamento para um par de latitude e longitude fornecido.

#### Parâmetros

| Nome      | Tipo   | Localização | Descrição |
|-----------|--------|-------------|-----------|
| latitude  | number | query       | Latitude  |
| longitude | number |1"
}

### Obter informações sobre lugares de estacionamento por coordenadas

```
GET /parking/places/
```

Obtém informações sobre lugares de estacionamento para um par de latitude e longitude fornecido.

#### Parâmetros

| Nome      | Tipo   | Localização | Descrição |
|-----------|--------|-------------|-----------|
| latitude  | number | query       | Latitude  |
| longitude | number | query       | Longitude |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "id": 67560,
  "estado": "OUTROS",
  "horarioespecifico": query       | Longitude |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "id": 67560,
  "estado": "OUTROS",
  "horarioespecifico": "2ª A 6ª 9-19H",
  "areaexploracao": "Com Concessão Em Exploração",
  "tipoestacionamento": "Rotativo",
  "horario": "2ª A 6ª 9-19H",
  "tarifa": "VERDE",
  "codtarifa": "YA",
  "produto": "VerdeRotação",
  "tipologia": "T",
  "horarioespecificocod": "H1",
  "distancia": "8.87"
}
```

### Obter mapa de lugares de estacionamento

```
GET /parking/places/map
```

Obtém informações sobre lugares de estacionamento em formato de imagem "2ª A 6ª 9-19H",
  "areaexploracao": "Com Concessão Em Exploração",
  "tipoestacionamento": "Rotativo",
  "horario": "2ª A 6ª 9-19H",
  "tarifa": "VERDE",
  "codtarifa": "YA",
  "produto": "VerdeRotação",
  "tipologia": "T",
  "horarioespecificocod": "H1",
  "distancia": "8.87"
}
### Obter mapa de lugares de estacionamento

```
GET /parking/places/map
```

Obtém informações sobre lugares de estacionamento em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                .

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

## Parques de Estacionamento

### Obter lista de parques de estacionamento

```
GET /parking/lots
```

Obtém a lista de parques de estacionamento.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "id_parque": "P019",
  "nome": "El Corte Inglés",
  "activo": 1,
  "id_entidade": 4,
  "capacidade_max": 2000,
  "ocupacao": 961,
  "data_ocupacao": "2018-11-05 18:06:30",
  "latitude                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

## Parques de Estacionamento

### Obter lista de parques de estacionamento

```
GET /parking/lots
```

Obtém a lista de parques de estacionamento.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "id_parque": "P019",
  "nome": "El Corte Inglés",
  "activo": 1,
  "id_entidade": 4,
  "capacidade_max": 2000,
  "ocupacao": 961,
  "data_ocupacao": "2018-11-05 18:06:30",
  "latitude": "38.7352591",
  "longitude": "-9.15528429",
  "tipo": "Estrutura"
}
```

## Dados de Ciclismo

### Obter lista de detecções

```
GET /cycledata/detections
```

Obtém a lista de detecções em toda a rede.

#### Parâmetros

| Nome     | Tipo   | Localização | Descrição    |
|----------|--------|-------------|--------------|
| dateFrom | string | query       | Data inicial |
| dateTo   | string | query       | Data final   |": "38.7352591",
  "longitude": "-9.15528429",
  "tipo": "Estrutura"
}
```

## Dados de Ciclismo

### Obter lista de detecções

```
GET /cycledata/detections
```

Obtém a lista de detecções em toda a rede.

#### Parâmetros

| Nome     | Tipo   | Localização | Descrição    |
|----------|--------|-------------|--------------|
| dateFrom | string | query       | Data inicial |
| dateTo   | string | query       | Data final   |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
[
  {
    "detectionId": "1",
    "tenantIdentifier": "lisboa.pt.mycycletraffic",
    "locationId": 13,
    "detected": "2021-08-19 13:45:08",
    "direction": 1,
    "count": 1
  }
]
```

### Obter lista de detecções para uma localização específica

```
GET /cycledata/detections/{locationId}
```

Obtém a lista de detecções para uma localização específica.

#### Parâmetros

| Nome       | Tipo    | Localização | Descrição              |
|------------|---------|-------------|------------------------|
| dateFrom   | string  | query       | Data inicial           |
| dateTo     | string  | query       | Data final             |
| locationId | integer | path        | Identificador do local |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
[
  {
    "detectionId": "1",
    "tenantIdentifier": "lisboa.pt.mycycletraffic",
    "locationId": 13,
    "detected": "2021-08-19 13:45:08",
    "direction": 1,
    "count": 1
  }
]
```

### Obter lista de detecções para uma localização específica

```
GET /cycledata/detections/{locationId}
```

Obtém a lista de detecções para uma localização específica.

#### Parâmetros

| Nome       | Tipo    | Localização | Descrição         |
|------------|---------|-------------|-------------------|
| dateFrom   | string  | query       | Data inicial      |
| dateTo     | string  | query       | Data final        |
| locationId | integer | path        | ID da localização |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
[
  {
    "tenantIdentifier": "lisboa.pt.mycycletraffic",
    "locationId": 13,
    "detected": "2021-08-19 13:45:08",
    "direction": 1,
    "count": 1
  }
]
```

### Obter lista de localizações (detectores) na rede

```
GET /cycledata/locations
```

Obtém a lista de localizações (detectores) na rede.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
[
  {
    "locationId": 13,
    "tenantIdentifier": "lisboa.pt.mycycletraffic",
    "name": "#18 - Avenida do Colégio Militar",
    "directionPositive": "",
    "directionNegative": "",
    "latitude": 38.749622968,
    "longitude": -9.191152508
  }
]
```

## Ciclismo

### Obter lista da rede ciclável disponível

```
GET /cycling/network/available/list
```

Obtém a lista da rede ciclável disponível no formato GeoJSON.

#### Res Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
[
  {
    "tenantIdentifier": "lisboa.pt.mycycletraffic",
    "locationId": 13,
    "detected": "2021-08-19 13:45:08",
    "direction": 1,
    "count": 1
  }
]
```

### Obter lista de localizações (detectores) na rede

```
GET /cycledata/locations
```

Obtém a lista de localizações (detectores) na rede.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
[
  {
    "locationId": 13,
    "tenantIdentifier": "lisboa.pt.mycycletraffic",
    "name": "#18 - Avenida do Colégio Militar",
    "directionPositive": "",
    "directionNegative": "",
    "latitude": 38.749622968,
    "longitude": -9.191152508
  }
]
```

## Ciclismo

### Obter lista da rede ciclável disponível

```
GET /cycling/network/available/list
```

Obtém a lista da rede ciclável disponível no formato GeoJSON.

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "properties": {
    "objectid": 76,
    "cod_sig_tr": "159068",
    "cod_via": "102185",
    "designacao": "Rotunda da Porta Sul",
    "hierarquia": "Principal",
    "eixo": "Circular Exterior",
    "tipologia": "Pista Ciclável Bidirecional",
    "situacao_descricao": "Executado",
    "dupl_troc": "N",
    "zona": "",
    "compriment": 58.74,
    "idtipo": "9196",
    "freguesia": "Lumiar",
    "zonamento": "",
    "shape_leng": 58.7372408169,
    "situacao": "Existente"
  }
}
```

### Obter mapa da rede ciclável disponível

```
GET /cycling/network/available/map
```

Obtém o mapa da rede ciclável disponível em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Proibido                                   |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |postas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Não autorizado                             |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |

Exemplo de resposta de sucesso:

```json
{
  "properties": {
    "objectid": 76,
    "cod_sig_tr": "159068",
    "cod_via": "102185",
    "designacao": "Rotunda da Porta Sul",
    "hierarquia": "Principal",
    "eixo": "Circular Exterior",
    "tipologia": "Pista Ciclável Bidirecional",
    "situacao_descricao": "Executado",
    "dupl_troc": "N",
    "zona": "",
    "compriment": 58.74,
    "idtipo": "9196",
    "freguesia": "Lumiar",
    "zonamento": "",
    "shape_leng": 58.7372408169,
    "situacao": "Existente"
  }
}
```

### Obter mapa da rede ciclável disponível

```
GET /cycling/network/available/map
```

Obtém o mapa da rede ciclável disponível em formato de imagem.

#### Parâmetros

| Nome   | Tipo    | Localização | Descrição               |
|--------|---------|-------------|-------------------------|
| width  | integer | query       | Largura da imagem       |
| height | integer | query       | Altura da imagem        |
| bbox   | string  | query       | Bounding box da imagem  |
| format | string  | query       | Formato da imagem       |
| style  | string  | query       | Nome da simbologia      |

#### Respostas

| Código | Descrição                                  |
|--------|--------------------------------------------|
| 200    | Sucesso                                    |
| 400    | Requisição inválida                        |
| 401    | Proibido                                   |
| 404    | Não encontrado                             |
| 500    | Erro do servidor                           |
