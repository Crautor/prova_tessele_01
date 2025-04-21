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
