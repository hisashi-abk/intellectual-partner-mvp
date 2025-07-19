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

