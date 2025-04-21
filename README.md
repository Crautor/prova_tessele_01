# Filmes Assistidos

Este é um aplicativo Flutter chamado **Filmes Assistidos**, que permite aos usuários gerenciar uma lista de filmes assistidos. O aplicativo possui as seguintes funcionalidades:

- **Página Inicial**: Exibe a lista de filmes com a opção de marcar como assistido ou não assistido. A data de visualização é automaticamente atribuída ao marcar como assistido.
- **Cadastro de Filmes**: Permite adicionar novos filmes à lista. O usuário pode indicar se o filme já foi assistido e, nesse caso, selecionar a data de visualização.
- **Créditos**: Exibe informações sobre os desenvolvedores ou colaboradores do projeto.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **`lib/main.dart`**: Arquivo principal que configura o tema do aplicativo e define as rotas.
- **Páginas**:
  - `FilmesListPage`: Página inicial que exibe a lista de filmes e permite gerenciar o status de assistido.
  - `CadastroFilmePage`: Página para cadastrar novos filmes, com a opção de indicar se já foram assistidos.
  - `CreditosPage`: Página de créditos.

## Como Criar um APK

Siga os passos abaixo para gerar um APK do aplicativo:

### Pré-requisitos

1. Certifique-se de que o Flutter está instalado em sua máquina. Caso não esteja, siga as instruções de instalação no site oficial: [Flutter Installation](https://docs.flutter.dev/get-started/install).
2. Configure o ambiente Android (instale o Android Studio e configure o SDK).

### Passos para Gerar o APK

1. **Abra o terminal na raiz do projeto**:

   ```bash
   cd prova_tessele_01
   ```

2. **Certifique-se de que todas as dependências estão instaladas**:

   ```bash
   flutter pub get
   ```

3. **Compile o aplicativo para Android**:
   Execute o comando abaixo para gerar o APK:

   ```bash
   flutter build apk --release
   ```

4. **Localize o APK gerado**:
   O APK será gerado no diretório:

   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

5. **Teste o APK**:
   Transfira o arquivo APK para um dispositivo Android e instale-o para testar.

## Capturas de tela
![CapturaDeTelaTessele1](https://github.com/user-attachments/assets/caa24aca-3fea-4613-b619-d13c4b46a712)
<br>
![CapturaDeTelaTessele2](https://github.com/user-attachments/assets/fd423ed8-dfac-46e3-98cf-50f210fe9ad9)
![CapturaDeTelaTessele3](https://github.com/user-attachments/assets/1b8a174c-7e19-49bf-8bc3-20718085eb31)
![CapturaDeTelaTessele4](https://github.com/user-attachments/assets/696632c2-85d1-4b07-b5e9-0691e1212bfc)
![CapturaDeTelaTessele5](https://github.com/user-attachments/assets/c373a02b-fc95-4ea4-9d20-afa90d9f5311)
![CapturaDeTelaTessele6](https://github.com/user-attachments/assets/65aaf344-d9d7-45bd-8115-45f6cba2881c)
![CapturaDeTelaTessele7](https://github.com/user-attachments/assets/d9b456d4-6359-47f2-9e2c-bc6f32e23561)
![CapturaDeTelaTessele8](https://github.com/user-attachments/assets/d954d3f4-5bdd-4100-aa8f-a1e18c0dedc9)
