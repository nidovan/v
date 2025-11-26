





src/
 ├─ app/
 │   ├─ store.ts
 │   ├─ rootReducer.ts
 │   └─ routes.tsx
 │
 ├─ features/
 │   ├─ Wf/
 │   │    ├─ api/
 │   │    ├─ thunks/
 │   │    ├─ redux/
 │   │    ├─ components/
 │   │    ├─ utils/
 │   │    └─ pages/
 │   │    
 │   │
 │   ├─ adminDash/
 │   │    ├─ api/
 │   │    │     └─ dashboardApi.ts
 │   │    ├─ thunks/
 │   │    │     └─ loadDashboardStats.ts
 │   │    ├─ redux/
 │   │    │     ├─ dashboardSlice.ts
 │   │    │     └─ selectors.ts
 │   │    ├─ components/
 │   │    │     ├─ StatsCard.tsx
 │   │    │     └─ RecentActivity.tsx
 │   │    ├─ utils/
 │   │    └─ pages/
 │   │         └─ AdminDashboardPage.tsx
 │   │
 │   │
 │   └─ layout/
 │        ├─ api/
 │        ├─ thunks/
 │        ├─ redux/
 │        ├─ components/
 │        └─ pages/
 │
 ├─ ui/               (shared UI components: Modal, Button, Table)
 ├─ utils/            (global helpers)
 ├─ assets/           (icons, images)
 └─ services/         (shared network, auth, logger)



Code Convention for New Developers
1. General Principles

Clean, readable, self-documenting code → prioritize clarity over cleverness.

Small components, small functions → single responsibility.

Consistent naming across React + .NET.

Avoid duplication (DRY) → create reusable utilities and hooks.

Errors must never be swallowed (React: handle in thunks; .NET: centralized exception middleware).

🎨 2. Naming Conventions
React / JavaScript
Item	Convention	Example
Component	PascalCase	UserProfileCard.jsx
Hooks	camelCase and start with use	useFetchUser.js
Files	kebab-case	user-profile-card.jsx
Variables & functions	camelCase	userName, fetchUserData()
Redux slices	camelCase + "Slice"	userSlice.js
Thunks	camelCase + async verb	fetchUserProfileThunk
.NET 8 (C#)
Item	Convention	Example
Classes	PascalCase	UserService
Methods	PascalCase	GetUserDetails()
Private fields	_camelCase	_userRepository
Interfaces	Start with I	IUserRepository
Enums	PascalCase	UserStatus.Active
📁 3. Folder Structure Convention
React (Feature-based architecture)
/src
  /features
    /user-profile
      api/
      components/
      hooks/
      services/
      store/
      userProfileSlice.js
      index.js
  /layout
    /navigation
    /footer
    /user-profile-menu
  /shared
    components/
    utils/
    hooks/

Thunks & API

Each feature has its own API and thunks folder.

Do NOT mix API between features.

Example:

features/
  user/
    api/userApi.js
    thunks/userThunks.js
    userSlice.js

🧪 4. Coding Style
React

Use async/await, never .then().

Use Functional Components only.

Use PropTypes or TypeScript (if TS is added later).

Always handle loading, success, and error states.

Redux

One slice per feature.

Create thunks for all async calls.

Never call API directly inside components.

.NET

Use Minimal API or Clean Architecture style.

Controllers/services must be thin: business logic goes in services.

Use async everywhere.

Validate input using FluentValidation or minimal validation attributes.

🧱 5. API Rules
Request & Response Format

Always return:

{
  "data": {},
  "success": true,
  "error": null
}

Version your APIs
/api/v1/users
/api/v1/tools

Logging & Exception

Central exception middleware.

No try/catch inside controllers unless necessary.

🔒 6. Security & Quality

Do not expose secrets; use environment variables.

Validate all inputs (frontend + backend).

Document any decision affecting architecture in /docs.

✍️ 7. Git / Branching Convention

main → production

develop → integration

feature/<name> → each feature

Squash merge into develop

PR requires:

Description

Screenshots (if UI)

Checklist

📚 8. Commenting & Documentation
Comments

Only if needed.

Prefer clear variable/method names over comments.

README per Feature

Each feature folder must include a README.md:

API used

Slice structure

Component diagram (optional)

🧼 9. Formatting

Use Prettier for formatting.

Use ESLint for code quality.

Use .editorconfig for consistency.

🚀 10. What Developers Must Do on Every PR

Run npm run lint and fix issues.

Run all existing tests.

Ensure no unused imports.

Ensure no console.log in production code.

If you want, I can also:

✅ generate a document you can share with developers
✅ create a README.md version
✅ adapt it to your multi-tool dashboard architecture
✅ add your preferred folder structure for React + .NET 8

Just tell me!








