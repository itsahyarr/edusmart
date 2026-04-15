# PRD: EduSmart Landing Page MVP (Conversion Optimized)

## 1. Project Overview

**EduSmart** adalah platform pendidikan online yang berfokus pada pengembangan diri dan keterampilan digital. Landing page ini dirancang khusus untuk kebutuhan digital marketing (Google Ads & Facebook Ads) dengan tujuan utama memaksimalkan konversi pendaftaran siswa baru melalui penawaran yang kredibel dan mendesak (urgency).

---

## 2. Tujuan Utama (Goals)

- **High Conversion Rate:** Mengonversi trafik dari iklan menjadi pendaftar (Lead Generation).
- **Brand Authority:** Menonjolkan 3 pilar (Materi, Mentor, Sertifikat) untuk membangun kepercayaan instan.
- **Launch Momentum:** Menggunakan promo peluncuran sebagai pemicu keputusan cepat pengunjung.

---

## 3. Target Audiens

- **Job Seekers:** Individu yang ingin meningkatkan skill digital untuk melamar kerja.
- **Career Switchers:** Profesional yang ingin berpindah jalur karir.
- **Self-Learners:** Orang yang mencari kursus online dengan mentor berkualitas.

---

## 4. Struktur Konten (AIDA Framework)

| Section                      | Elemen Kunci                                                            | Fokus Marketing                                          |
| :--------------------------- | :---------------------------------------------------------------------- | :------------------------------------------------------- |
| **Hero Section (Attention)** | Headline hasil-sentris, Sub-headline benefit, CTA primer, Promo Ribbon. | Menarik perhatian dalam 3 detik pertama.                 |
| **Trust Bar (Interest)**     | Logo partner, rating rata-rata, jumlah alumni.                          | Memvalidasi kredibilitas platform.                       |
| **Core Values (Interest)**   | High Quality Content, Expert Mentors, Recognized Certificates.          | Membangun minat melalui keunggulan kompetitif.           |
| **Course Catalog (Desire)**  | Card kursus dengan label diskon, rating, dan nama mentor.               | Membangun keinginan untuk memiliki kursus tersebut.      |
| **Limited Promo (Urgency)**  | Countdown timer, info kuota terbatas, perbandingan harga coret.         | Memicu FOMO (Fear of Missing Out).                       |
| **Testimonials (Desire)**    | Testimoni hasil nyata (misal: "Dapat kerja setelah 2 bulan").           | Memberikan bukti nyata keberhasilan alumni.              |
| **FAQ (Action)**             | Pertanyaan umum seputar teknis dan sertifikat.                          | Menghilangkan hambatan psikologis terakhir sebelum klik. |

---

## 5. Spesifikasi Teknis (Svelte Stack)

- **Framework:** Svelte / SvelteKit.
- **CSS:** Tailwind CSS (untuk layout responsif dan mobile-first).
- **Icons:** Feather Icons.
- **Architecture:** Component-based (Header, Hero, FeatureCard, CourseCard, Footer).
- **Tracking:** \* Event tracking pada setiap klik tombol "Daftar".
  - Integrasi Meta Pixel & Google Analytics (Placeholder).

---

## 6. Data Dummy (Marketing-Driven)

### Kursus (Courses)

```json
[
	{
		"id": 1,
		"category": "Digital Marketing",
		"title": "Social Media Marketing Mastery 2024",
		"mentor": "Sarah Wijaya",
		"originalPrice": 599000,
		"discountPrice": 149000,
		"rating": 4.9,
		"students": 1250,
		"image": "[https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=500](https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=500)"
	},
	{
		"id": 2,
		"category": "Technology",
		"title": "Full-Stack Web Development with Svelte & Go",
		"mentor": "Budi Santoso",
		"originalPrice": 899000,
		"discountPrice": 299000,
		"rating": 4.8,
		"students": 850,
		"image": "[https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=500](https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=500)"
	}
]
```

### Mentor

```json
[
	{
		"name": "Sarah Wijaya",
		"role": "Head of Growth at Unicorn Startup",
		"bio": "Expert in scaling brands from 0 to 1M users.",
		"photo": "[https://i.pravatar.cc/150?u=sarah](https://i.pravatar.cc/150?u=sarah)"
	},
	{
		"name": "Budi Santoso",
		"role": "Senior Software Architect",
		"bio": "10+ years experience in distributed systems.",
		"photo": "[https://i.pravatar.cc/150?u=budi](https://i.pravatar.cc/150?u=budi)"
	}
]
```

---

## 7. Strategi Digital Marketing (Implementation)

1. **Sticky CTA:** Tombol "Daftar Sekarang" akan muncul di mobile navigation saat user melakukan scroll melewati Hero section.
2. **Personalized Copy:** Gunakan sapaan yang akrab dan fokus pada "Kamu" (misal: "Wujudkan karir impianmu").
3. **Social Proof Pop-up (Optional):** Notifikasi kecil dummy "Ahmad baru saja mendaftar Kursus UI/UX" untuk meningkatkan kepercayaan.
4. **Anchor Links:** Pastikan tombol di iklan Google langsung mengarah ke section kursus yang relevan menggunakan ID (misal: `/courses#uiux`).

---

## 8. Desain & Branding

- **Palette:** Trust Blue (#1A56DB) & Energy Orange (#F97316).
- **Typography:** Poppins (Headings), Inter (Body).
- **Spacing:** Long sections dengan whitespace yang cukup agar tidak terasa berat saat dibaca di mobile.

---

## 9. KPI (Key Performance Indicators)

- **Conversion Rate (CR):** Minimal 10% klik ke tombol pendaftaran.
- **Page Load Speed:** < 2 detik (Lighthouse score 90+).
- **Average Time on Page:** > 45 detik.
