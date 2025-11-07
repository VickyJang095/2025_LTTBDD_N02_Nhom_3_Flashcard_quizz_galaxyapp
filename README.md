# Galaxy Flashcard & Quiz App

Ứng dụng học từ vựng tiếng Anh theo chủ đề bằng **Flashcard + Quiz**, thiết kế phong cách vũ trụ (Galaxy Space UI).  
Hỗ trợ đa ngôn ngữ, hệ thống XP & Level, hiệu ứng hành tinh và tàu vũ trụ tạo trải nghiệm học thú vị & sinh động.

---

## Mục tiêu

- Ghi nhớ từ vựng nhanh bằng Flashcard + Quiz
- Hệ thống **XP / Level** tạo động lực học
- Hỗ trợ **Tiếng Việt 🇻🇳 & English 🇺🇸**
- Hiệu ứng hành tinh & tên lửa 🚀

---

## Tính năng chính

| Tính năng | Mô tả |
|---|---|
| Flashcard 2 mặt | Lật thẻ English ⇄ Vietnamese |
| Quiz trắc nghiệm | Tính điểm, lưu tiến độ |
| XP System | +5 XP mỗi thẻ, +50 XP hoàn thành chủ đề |
| Đa ngôn ngữ | VN / EN |
| Responsive UI | Tự co dãn cho mọi màn hình |

---

## Công nghệ & thư viện

| Công nghệ | Mô tả |
|---|---|
| Flutter | Cross-platform UI |
| Provider | State management (XP, locale) |
| flip_card | Hiệu ứng lật flashcard |
| SharedPreferences | Lưu trạng thái splash & ngôn ngữ |

---

## Cấu trúc thư mục

```bash
lib/
 ┣ screens/        # Flashcards, Quiz, Home, Splash
 ┣ widgets/        # UI widgets
 ┣ providers/      # Locale provider, XP provider
 ┣ l10n/           # File ngôn ngữ
 ┣ models/         # Model từ vựng
 ┗ main.dart
assets/
 ┣ icons/
 ┣ lottie/         # Rocket, planet animation
 ┗ images/
```
## Demo
