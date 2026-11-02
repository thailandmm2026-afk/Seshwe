SHWE + Admin PHP (Railway)
==========================
User:  index.php
Admin: admin.php
API:   api.php
CSS:   style.css
JS:    app.js
Data:  data/access.json

Admin Key: kiki20251-admin

Flow:
1. User login → password OK but ID not approved → dialog with ID
2. Admin opens /admin.php → approve / reject
3. Approved user can play; rejected sees reject message
4. Remove approved → user must request again

Railway: deploy Dockerfile, open:
  https://xxx.up.railway.app/index.php
  https://xxx.up.railway.app/admin.php
