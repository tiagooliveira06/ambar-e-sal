# Âmbar e Sal — Simulador de crescimento (Supabase + GitHub + Vercel)

Aplicação estática (HTML/JS puro, sem build) com:
- Landing page com o nome da empresa
- Login real (email + palavra-passe) via Supabase Auth
- Base de dados partilhada na nuvem (Supabase), com importar/exportar
- Hospedagem gratuita e pública na internet (Vercel)

Todos os serviços usados têm plano gratuito.

## Passo 1 — Criar o projeto no Supabase

1. Vá a https://supabase.com → **Start your project** → crie conta (pode usar o GitHub).
2. **New project** → escolha um nome (ex. `ambar-e-sal`), uma palavra-passe para a base de dados (guarde-a) e a região mais próxima (ex. `eu-west`). Aguarde 1-2 minutos.
3. No menu lateral, vá a **SQL Editor** → **New query**, cole o conteúdo do ficheiro `database.sql` deste projeto e clique **Run**. Isto cria a tabela `dados_empresa` e as regras de acesso.
4. Vá a **Authentication → Users → Add user** e crie uma conta para cada pessoa da equipa (email + palavra-passe). Nesta secção `Authentication → Providers`, confirme que **Email** está ativo; pode desligar "Confirm email" em `Authentication → Settings` para não obrigar a confirmar por email (útil para contas internas).
5. Vá a **Project Settings → API**. Copie o **Project URL** e a chave **anon public**.

## Passo 2 — Preencher `config.js`

Abra o ficheiro `config.js` e substitua os dois valores:

```js
window.SUPABASE_URL = "https://xxxxxxxx.supabase.co";
window.SUPABASE_ANON_KEY = "eyJhbGciOि...";
```

Estes valores não são secretos — ficam protegidos pelas regras de segurança (RLS) da base de dados, por isso podem ficar num repositório público.

## Passo 3 — Colocar no GitHub

**Opção simples (sem instalar nada), pelo browser:**
1. Vá a https://github.com → crie conta gratuita, se ainda não tiver.
2. **New repository** → nome (ex. `ambar-e-sal-simulador`) → **Create repository**.
3. Clique **uploading an existing file** e arraste os 4 ficheiros: `index.html`, `config.js`, `database.sql`, `README.md`.
4. **Commit changes**.

**Opção com Git na linha de comandos**, se preferir:
```bash
cd pasta-com-os-ficheiros
git init
git add .
git commit -m "Simulador Âmbar e Sal"
git branch -M main
git remote add origin https://github.com/SEU-UTILIZADOR/ambar-e-sal-simulador.git
git push -u origin main
```

## Passo 4 — Publicar no Vercel

1. Vá a https://vercel.com → **Sign Up** → escolha **Continue with GitHub** (autoriza o acesso ao repositório).
2. **Add New… → Project** → selecione o repositório `ambar-e-sal-simulador`.
3. Não é preciso alterar nada (é um site estático — "Framework preset: Other" é suficiente) → **Deploy**.
4. Ao fim de ~30 segundos recebe um URL público, por exemplo `https://ambar-e-sal-simulador.vercel.app` — esse é o link a partilhar com a equipa.

A partir daqui, sempre que alterar ficheiros no GitHub (ex. editar `config.js` ou atualizar `index.html`), o Vercel volta a publicar automaticamente.

## Como usar depois de publicado

- **Login**: cada pessoa entra com o email e palavra-passe criados no passo 1.4.
- **Guardar na nuvem**: no separador "Configurar empresa", grava a configuração atual (parâmetros, histórico, alavancas) na base de dados partilhada — todos os que fizerem login veem os mesmos dados.
- **Carregar da nuvem**: traz de volta os últimos dados guardados (útil ao abrir a app noutro dispositivo).
- **Exportar/Importar base de dados (.json)**: cópia de segurança local, independente da nuvem.
- **Importar Excel atualizado**: continua a funcionar como antes, para recarregar a partir de uma nova extração da base de dados de encomendas.
- **Gerir utilizadores**: feito diretamente no painel do Supabase (`Authentication → Users`), não dentro da aplicação — isto é o que garante que as palavras-passe ficam encriptadas em vez de visíveis no código.

## Custos

- Supabase: plano gratuito (500 MB de base de dados, 50 000 utilizadores autenticados/mês) — mais do que suficiente para esta aplicação.
- GitHub: gratuito para repositórios públicos ou privados de uso pessoal/pequenas equipas.
- Vercel: plano gratuito (Hobby) para sites estáticos como este.

Se mais tarde quiser um domínio próprio (ex. `simulador.ambaresal.pt`), pode associá-lo em **Vercel → Project → Settings → Domains** — a ligação ao Vercel é gratuita, o custo é apenas o do domínio em si (comprado num registador à parte).
