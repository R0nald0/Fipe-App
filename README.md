# FIPE APP

Projeto consome a api do - [FIPE API](https://deividfortuna.github.io/fipe/?ref=public_apis&utm_medium=website) ,carrega marcas e modelos do carro e exibe as informáções do veículo como valor,combustivel,códiggo fipe ano do modelo,mês de referecia.Este Aplicativo foi desenvolvido utilizando arquitetura MVVM,consumo da api com o pacote [DIO](https://pub.dev/packages/dio).

### Imagens do App
---
 <img src="https://github.com/user-attachments/assets/141b0c24-1f3d-4a2a-98cd-eec2df9c9b8b" height="400em">
<img src="https://github.com/user-attachments/assets/bd1d480c-da21-4f13-a518-1d4fde62ed29" height="400em">




## Para testar
   <p>
 Pra rodar e testar, basta ter o Flutter instalado,clonar ou fazer um fork deste repositório e executar com:
</p>

```
 flutter pub get
 flutter pub run
```
### Estrutura do Projeto
 *  **android**/: Arquivos específicos para plataforma Android:
 *  **lib/**/: Possui a pasta app com lógica do aplicativo,estrutura base, telas, widgets,controllers,data,etc.
 *  **lib/app/core**/: Possui classes de acesso global do aplicativo.
 *  **lib/app/presentation**/: Possui a classes de controllers e page.
 *  **lib/app/domain**/: Contém modelo de negócio do app.
 *  **lib/app/data**: Possui model,repositório e remote para acesso a externo

 ### Tecnologias utilizadas
 ---
 * [Riverpod](https://pub.dev/packages/riverpod) para injeção de Dependência e gerenciamento de estado.
 * Arquitetura MVVM
 * Consumo da [FIPE API](https://deividfortuna.github.io/fipe/?ref=public_apis&utm_medium=website) Com o package DIO   
   
![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)
![Badge em Kotlin](http://img.shields.io/static/v1?label=LENGUAGE&message=%20DART&color=BLUEN&style=for-the-badge)




