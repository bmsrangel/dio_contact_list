# DIO Contacts

## Descrição do Projeto

Este projeto consiste em uma agenda de contatos desenvolvido para o Bootcamp Santander 2023: Desenvolvimento Mobile com Flutter, oferecido pela DIO.
Com este aplicativo é possível registrar novos contatos com informações de telefone, e-mail e foto de perfil. A partir dos dados cadastrados pode-se abrir automaticamente o telefone para efetuar ligações ou o aplicativo padrão de e-mail para enviar e-mails.
O aplicativo também permite a alteração de dados e exclusão de contatos previamente cadastrados. E, também conta com recursos de múltiplos idiomas, suportando os idiomas Inglês e Português do Brasil.

<img src=".github/demonstration.gif" width="250px" />

## Padrões e Tecnologias Utilizadas

### Inversão de Controle e Injeção de Dependências

- [injectable](https://pub.dev/packages/injectable): ^2.3.0
- [injectable_generator](https://pub.dev/packages/injectable_generator): ^2.4.0
- [get_it](https://pub.dev/packages/get_it): ^7.6.4

### Armazenamento Local

- [path_provider](https://pub.dev/packages/path_provider): ^2.1.1
- [sqflite](https://pub.dev/packages/sqflite): ^2.3.0
- [path](https://pub.dev/packages/path): ^1.8.3

### Serialização/Deserialização de Classes

- [json_annotation](https://pub.dev/packages/json_annotation): ^4.8.1
- [json_serializable](https://pub.dev/packages/json_serializable): ^6.7.1

### Imagens e Câmera

- [image_picker](https://pub.dev/packages/image_picker): ^1.0.4
- [image_cropper](https://pub.dev/packages/image_cropper): ^5.0.0

### Padrões de Gerência de Estados

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): ^8.1.3

### Internacionalização

- [intl](https://pub.dev/packages/intl): ^0.18.1

### Validação de Dados de Formulários

- [validatorless](https://pub.dev/packages/validatorless): ^1.2.3

### Ferramentas Diversas

- [build_runner](https://pub.dev/packages/build_runner): ^2.4.6
- [url_launcher](https://pub.dev/packages/url_launcher): ^6.1.14

## Executando o projeto

Em um dispositivo com o Flutter corretamente configurado e com um emulador ou dispositivo físico conectado, basta executar os seguintes comandos:

```bash
git clone https://github.com/bmsrangel/dio_contact_list.git
cd dio_contact_list
flutter pub get
dart run build_runner build --delete-conflicting-output
flutter run
```

Para mais informações sobre o processo de configuração, visite a [documentação oficial](https://docs.flutter.dev/get-started/install).

### Aviso de limitação

Este aplicativo lida especificamente com números de telefone e e-mail. Como os iOS Simulators não possuem aplicativos para envio de e-mail e ligações, os recursos de abrir tais aplicativos estão indisponíveis para este tipo de plataforma.
No entanto, estes recursos funcionam normalmente nos dispositivos iOS físicos.
