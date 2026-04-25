# Quick Reference Guide - Authentication System

## 🚀 Getting Started

### Run the App

```bash
flutter run
```

### First Time

1. App starts → Sign In page (if not authenticated)
2. Click "Don't have an account? Sign Up"
3. Enter Name, Email, Password (must meet requirements)
4. Click "Sign Up" → redirects to Sign In
5. Enter Email & Password → redirects to Home

---

## 📱 Page Navigation

```
App Start
    ↓
Supabase Session Check
    ├─ Yes → Home Page
    └─ No → Sign In Page

Sign In Page
    ├─ Valid Login → Home Page
    ├─ "Sign Up" Link → Sign Up Page
    └─ Error → Shows SnackBar

Sign Up Page
    ├─ Valid Data → Success → Sign In Page
    ├─ "Sign In" Link → Sign In Page
    └─ Error → Shows SnackBar

Home Page
    ├─ Displays user info
    ├─ "Logout" Button → Sign In Page
    └─ Shows success message
```

---

## 🔐 Password Requirements

Must have ALL of these:

- ✅ At least 6 characters
- ✅ At least 1 UPPERCASE letter (A-Z)
- ✅ At least 1 lowercase letter (a-z)
- ✅ At least 1 number (0-9)

Example Valid: `SecurePass123`, `MyP@ssw0rd`, `Flutter123`  
Example Invalid: `password` (no uppercase/numbers), `ABC123` (no lowercase)

---

## 📧 Email Format

Must be valid email format:

- ✅ `user@example.com`
- ✅ `john.doe@company.co.uk`
- ✅ `test+tag@domain.org`

Invalid examples:

- ❌ `userexample.com` (missing @)
- ❌ `user@.com` (missing domain)
- ❌ `@example.com` (missing username)

---

## 👤 Name Requirements

- ✅ 2-50 characters
- ✅ Any letters, spaces, symbols allowed
- ✅ Examples: "John Doe", "María García", "李明"

---

## 🚨 Error Messages You Might See

### Sign In/Sign Up Errors

| Message                                                 | Solution                              |
| ------------------------------------------------------- | ------------------------------------- |
| Invalid email format                                    | Check email format (user@example.com) |
| Password must be at least 6 characters                  | Use longer password                   |
| Password must contain uppercase, lowercase, and numbers | Add uppercase + number                |
| This email is already registered                        | Use different email or Sign In        |
| Invalid email or password                               | Wrong email/password combination      |
| Please verify your email before signing in              | Check email for verification link     |
| Too many attempts. Please try again later               | Wait and retry later                  |
| Network error                                           | Check internet connection             |

### Validation Errors

| Field    | Error                                    | Fix                          |
| -------- | ---------------------------------------- | ---------------------------- |
| Name     | "Name is required"                       | Enter your name              |
| Name     | "Name must be at least 2 characters"     | Use longer name              |
| Email    | "Email is required"                      | Enter your email             |
| Email    | "Invalid email format"                   | Use format: user@example.com |
| Password | "Password is required"                   | Enter password               |
| Password | "Password must be at least 6 characters" | Use 6+ characters            |

---

## 🔧 File Structure Reference

**Where to Find Things:**

```
Authentication Logic:
└─ lib/features/auth/domain/usecases/
   ├─ user_sign_in.dart (Sign in logic)
   └─ user_sign_up.dart (Sign up logic)

API Integration:
└─ lib/features/auth/data/data sources/
   └─ auth_remote_data_source.dart (Supabase calls)

Error Handling:
└─ lib/core/error/
   ├─ exceptions.dart (Exception types)
   └─ failures.dart (Error models)

Validation:
└─ lib/core/utils/
   └─ input_validator.dart (Validation logic)

UI Pages:
└─ lib/features/auth/presentation/pages/
   ├─ sign_in.dart (Sign In UI)
   ├─ sign_up.dart (Sign Up UI)
   └─ home.dart (Home/Dashboard)

State Management:
└─ lib/features/auth/presentation/bloc/
   ├─ auth_bloc.dart (Business Logic)
   ├─ auth_event.dart (User Actions)
   └─ auth_state.dart (State Models)
```

---

## 🧪 Quick Testing

### Test Sign Up

1. Open app
2. Go to Sign Up
3. Enter: Name="John", Email="john@test.com", Password="Test123"
4. Should succeed and redirect to Sign In

### Test Sign In

1. Enter: Email="john@test.com", Password="Test123"
2. Should succeed and show Home page

### Test Validation

1. Go to Sign In
2. Click Sign In without entering anything
3. Should show validation errors

### Test Invalid Password

1. Go to Sign Up
2. Enter Password="123456" (no uppercase/lowercase)
3. Should show error: "Must contain uppercase, lowercase, and numbers"

---

## 📋 Supabase Setup (Already Done)

Your app uses:

- **Supabase Project**: tptuzbtmagjlzjikmhnl
- **Authentication**: Email/Password (enabled)
- **API Key**: Available in app_secrets.dart

Make sure in Supabase:

- ✅ Authentication enabled for email/password
- ✅ User metadata storing 'name' field

---

## 🐛 Troubleshooting

### App Won't Start

```bash
flutter pub get
flutter clean
flutter pub get
flutter run
```

### Still Getting Errors

```bash
# Full rebuild
flutter clean
flutter pub get
flutter pub upgrade
flutter run
```

### Supabase Connection Issues

- Check internet connection
- Verify Supabase URL in `app_secrets.dart`
- Verify Anon Key is correct
- Check Supabase project is active

---

## 💡 Tips & Tricks

### Remember Me / Auto-Login

The app checks for existing session on startup:

- ✅ If user logged in before → Auto goes to Home
- ✅ If user logged out → Shows Sign In
- ✅ If new user → Shows Sign In

### Password Storage

- Passwords are NOT stored locally
- Each login verifies with Supabase
- Sessions are managed by Supabase

### Testing Multiple Users

1. Create Account 1: user1@test.com / Test123
2. Create Account 2: user2@test.com / Test456
3. Sign In/Out to switch between users

---

## 📞 Support

All error messages are built-in:

- Red SnackBar for errors (3 seconds)
- Green SnackBar for success (2 seconds)
- Form validation feedback on fields
- Helper text below password fields

If you get unexpected error:

- Check internet connection
- Check Supabase status
- Check email/password is correct
- Try again after a few seconds

---

## ✅ Verification Checklist

Before deploying:

- [ ] Run `flutter analyze` - should show 0 errors
- [ ] Run `flutter run` - app starts without crashing
- [ ] Test Sign Up with valid data - works
- [ ] Test Sign In with valid data - works
- [ ] Test invalid inputs - shows error messages
- [ ] Test network error - handles gracefully
- [ ] Test Sign Out - returns to Sign In

---

**Everything is ready! 🎉**

Start with: `flutter run`
