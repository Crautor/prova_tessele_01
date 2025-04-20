# Filmes Assistidos

Este é um aplicativo Flutter chamado **Filmes Assistidos**, que permite aos usuários gerenciar uma lista de filmes assistidos. O aplicativo possui as seguintes funcionalidades:

- **Página Inicial**: Exibe a lista de filmes assistidos.
- **Cadastro de Filmes**: Permite adicionar novos filmes à lista.
- **Créditos**: Exibe informações sobre os desenvolvedores ou colaboradores do projeto.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **`lib/main.dart`**: Arquivo principal que configura o tema do aplicativo e define as rotas.
- **Páginas**:
  - `FilmesListPage`: Página inicial que exibe a lista de filmes.
  - `CadastroFilmePage`: Página para cadastrar novos filmes.
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

