#!/bin/bash

# Django MVP プロジェクト初期設定スクリプト
# 「知的な伴走者」学習支援アプリケーション MVP版

echo "🧠 Django MVP プロジェクト「知的な伴走者」初期設定を開始します..."

# 1. プロジェクト作成
echo "📁 プロジェクト作成中..."
django-admin startproject config .

# 2. MVP用アプリケーション作成
echo "🔧 MVP用アプリケーション作成中..."
python manage.py startapp accounts
python manage.py startapp tickets
python manage.py startapp emotions
python manage.py startapp journal
python manage.py startapp core

echo "✅ 作成されたアプリケーション:"
echo "  - accounts: 基本認証・ユーザー管理"
echo "  - tickets: チケット・タスク管理"
echo "  - emotions: 感情記録・集中度管理"
echo "  - journal: 振り返りジャーナル"
echo "  - core: 共通ユーティリティ"

# 3. MVP用環境変数ファイル作成
echo "🔐 MVP用環境変数設定ファイル作成中..."
cat > .env << 'EOF'
# Django MVP設定
DEBUG=True
SECRET_KEY=mvp-secret-key-change-in-production-123456789
DJANGO_SETTINGS_MODULE=config.settings

# データベース設定
DB_NAME=learning_companion_mvp
DB_USER=postgres
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432

# Redis設定（セッション用）
REDIS_URL=redis://localhost:6379/0

# メール設定（開発環境 - コンソール出力）
EMAIL_BACKEND=django.core.mail.backends.console.EmailBackend

# 日本語設定
LANGUAGE_CODE=ja
TIME_ZONE=Asia/Tokyo

# フロントエンド設定
FRONTEND_URL=http://localhost:3000
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://127.0.0.1:3000

# JWT設定（開発用）
JWT_SECRET_KEY=jwt-secret-key-for-mvp-change-in-production
EOF

# 4. MVP用 .gitignore作成
echo "📝 .gitignore作成中..."
cat > .gitignore << 'EOF'
# Django
*.log
*.pot
*.pyc
__pycache__/
local_settings.py
db.sqlite3
db.sqlite3-journal
media/
staticfiles/

# Environment variables
.env
.env.local
.env.production

# Virtual environment
venv/
env/
ENV/

# IDEs
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Coverage
htmlcov/
.coverage
.coverage.*
coverage.xml

# Pytest
.pytest_cache/

# Distribution / packaging
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# mypy
.mypy_cache/
.dmyp.json
dmypy.json

# Backup files
*.bak
*.orig

# MVP開発用一時ファイル
*.tmp
test_data/
EOF

# 5. README.md作成
echo "📚 README.md作成中..."
cat > README.md << 'EOF'
# 🧠 知的な伴走者 MVP

学習支援アプリケーションのMVP（Minimum Viable Product）版です。

## 🎯 MVP機能

- ✅ チケット管理（作成・時間記録・完了）
- ✅ 感情記録（気分・集中度・環境）
- ✅ 振り返り（シンプルな日報）
- ✅ 基本的なデータ可視化

## 🛠️ 技術スタック

- **バックエンド**: Django 5.1.4 + Django Ninja
- **データベース**: PostgreSQL
- **キャッシュ**: Redis
- **フロントエンド**: Next.js (別リポジトリ)

## 🚀 セットアップ

### 1. 依存関係インストール
```bash
pip install -r requirements.txt
```

### 2. データベース作成
```bash
createdb learning_companion_mvp
```

### 3. マイグレーション実行
```bash
python manage.py makemigrations
python manage.py migrate
```

### 4. スーパーユーザー作成
```bash
python manage.py createsuperuser
```

### 5. 開発サーバー起動
```bash
python manage.py runserver
```

## 📋 開発タスク

### Phase 1（2週間）
- [ ] 基本認証システム
- [ ] チケットCRUD API
- [ ] ストップウォッチ機能
- [ ] 基本ダッシュボード

### Phase 2（1週間）
- [ ] 感情記録API
- [ ] データ可視化エンドポイント
- [ ] フロントエンド連携

### Phase 3（1週間）
- [ ] 振り返り機能
- [ ] 分析画面
- [ ] UI/UX改善

### Phase 4（1週間）
- [ ] テスト・バグ修正
- [ ] ユーザーフィードバック収集

## 🧪 検証項目

- 感情記録継続率: 目標80%（7日以上）
- チケット完了率: 目標60%以上
- 振り返り記入率: 目標50%以上

## 📱 API エンドポイント

- `/api/auth/` - 認証関連
- `/api/tickets/` - チケット管理
- `/api/emotions/` - 感情記録
- `/api/journal/` - 振り返り
- `/api/analytics/` - 分析データ

EOF

# 6. 開発用ディレクトリ構造作成
echo "📂 開発用ディレクトリ作成中..."
mkdir -p static/css
mkdir -p static/js
mkdir -p static/images
mkdir -p media/uploads
mkdir -p templates
mkdir -p docs
mkdir -p tests/fixtures

# 7. 開発用スクリプト作成
echo "🔧 開発用スクリプト作成中..."
cat > run_tests.sh << 'EOF'
#!/bin/bash
echo "🧪 テスト実行中..."
python -m pytest -v --tb=short
EOF

cat > run_server.sh << 'EOF'
#!/bin/bash
echo "🚀 開発サーバー起動中..."
python manage.py runserver 8000
EOF

chmod +x run_tests.sh run_server.sh

# 8. pre-commit設定（オプション）
echo "📋 pre-commit設定作成中..."
cat > .pre-commit-config.yaml << 'EOF'
repos:
  - repo: https://github.com/psf/black
    rev: 24.10.0
    hooks:
      - id: black
        language_version: python3
  - repo: https://github.com/pycqa/isort
    rev: 5.13.2
    hooks:
      - id: isort
  - repo: https://github.com/pycqa/flake8
    rev: 7.1.1
    hooks:
      - id: flake8
EOF

# 9. 初期migration実行準備メッセージ
echo ""
echo "🎉 MVP初期設定完了！"
echo ""
echo "📋 次のステップ:"
echo "1. PostgreSQLデータベースを作成:"
echo "   createdb learning_companion_mvp"
echo ""
echo "2. マイグレーション実行:"
echo "   python manage.py makemigrations"
echo "   python manage.py migrate"
echo ""
echo "3. スーパーユーザー作成:"
echo "   python manage.py createsuperuser"
echo ""
echo "4. 開発サーバー起動:"
echo "   python manage.py runserver"
echo "   または ./run_server.sh"
echo ""
echo "5. テスト実行:"
echo "   ./run_tests.sh"
echo ""
echo "✅ 設定ファイルの確認・編集を忘れずに！"
echo "   - config/settings.py"
echo "   - .env"