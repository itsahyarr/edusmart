export const courses = [
	{
		id: 1,
		category: 'Digital Marketing',
		title: 'Social Media Marketing Mastery 2024',
		mentor: 'Sarah Wijaya',
		originalPrice: 599000,
		discountPrice: 149000,
		rating: 4.9,
		students: 1250,
		image: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=500',
		description:
			'Kuasai strategi social media marketing dari nol hingga mahir. Pelajari Facebook Ads, Instagram Ads, dan content strategy yang terbukti meningkatkan konversi.'
	},
	{
		id: 2,
		category: 'Technology',
		title: 'Full-Stack Web Development with Svelte & Go',
		mentor: 'Budi Santoso',
		originalPrice: 899000,
		discountPrice: 299000,
		rating: 4.8,
		students: 850,
		image: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=500',
		description:
			'Bangun aplikasi web modern dari front-end sampai back-end. Teknologi terkini dengan SvelteKit dan Go yang siap dipakai di industri.'
	},
	{
		id: 3,
		category: 'UI/UX Design',
		title: 'Product Design: Dari Riset Sampai Prototype',
		mentor: 'Anisa Rahma',
		originalPrice: 499000,
		discountPrice: 129000,
		rating: 4.9,
		students: 980,
		image: 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=500',
		description:
			'Pelajari end-to-end product design process: user research, wireframing, UI design, sampai prototype interaktif dengan Figma.'
	},
	{
		id: 4,
		category: 'Data Science',
		title: 'Data Analytics & Visualization with Python',
		mentor: 'Reza Firmansyah',
		originalPrice: 749000,
		discountPrice: 199000,
		rating: 4.7,
		students: 620,
		image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=500',
		description:
			'Analisis data seperti pro dengan Python, Pandas, dan visualisasi interaktif. Cocok untuk kamu yang ingin berkarir di bidang data.'
	}
];

export const mentors = [
	{
		name: 'Sarah Wijaya',
		role: 'Head of Growth at Unicorn Startup',
		bio: 'Expert in scaling brands from 0 to 1M users. 8+ tahun pengalaman di digital marketing.',
		photo: 'https://i.pravatar.cc/150?u=sarah',
		course: 'Social Media Marketing Mastery 2024'
	},
	{
		name: 'Budi Santoso',
		role: 'Senior Software Architect',
		bio: '10+ years experience in distributed systems. Kontributor aktif di open-source community.',
		photo: 'https://i.pravatar.cc/150?u=budi',
		course: 'Full-Stack Web Development'
	},
	{
		name: 'Anisa Rahma',
		role: 'Lead Product Designer at Top Decacorn',
		bio: 'Mendesain produk yang digunakan jutaan pengguna. Passionate tentang human-centered design.',
		photo: 'https://i.pravatar.cc/150?u=anisa',
		course: 'Product Design'
	},
	{
		name: 'Reza Firmansyah',
		role: 'Data Science Manager',
		bio: 'Former data scientist di perusahaan multinasional. Spesialis machine learning & analytics.',
		photo: 'https://i.pravatar.cc/150?u=reza',
		course: 'Data Analytics & Visualization'
	}
];

export const testimonials = [
	{
		name: 'Ahmad Fadillah',
		photo: 'https://i.pravatar.cc/80?u=ahmad',
		role: 'Social Media Specialist',
		course: 'Social Media Marketing Mastery',
		text: 'Dalam 2 bulan setelah lulus kursus, langsung dapat kerja sebagai Social Media Specialist di startup ternama. Materinya sangat praktis!',
		rating: 5
	},
	{
		name: 'Dewi Lestari',
		photo: 'https://i.pravatar.cc/80?u=dewi',
		role: 'Full-Stack Developer',
		course: 'Full-Stack Web Development',
		text: 'Dari yang nggak bisa coding sama sekali, sekarang aku sudah bisa bikin aplikasi web sendiri. Mentornya sabar banget ngajarin!',
		rating: 5
	},
	{
		name: 'Rizky Pratama',
		photo: 'https://i.pravatar.cc/80?u=rizky',
		role: 'UI/UX Designer',
		course: 'Product Design',
		text: 'Portfolio yang kubuat dari kursus ini langsung dapet perhatian recruiter. Sekarang kerja di perusahaan impian!',
		rating: 5
	},
	{
		name: 'Siti Nurhaliza',
		photo: 'https://i.pravatar.cc/80?u=siti',
		role: 'Data Analyst',
		course: 'Data Analytics & Visualization',
		text: 'Gaji naik 40% setelah dapat sertifikat dari EduSmart. Investasi terbaik yang pernah aku lakukan untuk karirku.',
		rating: 5
	}
];

export const faqs = [
	{
		question: 'Apakah saya akan mendapat sertifikat setelah menyelesaikan kursus?',
		answer:
			'Ya! Setiap alumni yang menyelesaikan semua modul dan tugas akhir akan mendapat sertifikat digital yang bisa ditampilkan di LinkedIn dan CV kamu.'
	},
	{
		question: 'Berapa lama akses materi kursus saya?',
		answer:
			'Kamu mendapat akses selamanya (lifetime access). Materi juga di-update secara berkala sesuai perkembangan industri.'
	},
	{
		question: 'Apakah ada bimbingan langsung dari mentor?',
		answer:
			'Tentu! Setiap kursus menyediakan sesi live mentoring 2x seminggu via Zoom, plus akses ke grup Telegram eksklusif untuk Q&A.'
	},
	{
		question: 'Bagaimana jika saya tidak puas dengan kursusnya?',
		answer:
			'EduSmart memberikan jaminan uang kembali 100% dalam 7 hari pertama. Kalau kursusnya nggak sesuai ekspektasi, kamu bisa request refund tanpa syarat.'
	},
	{
		question: 'Apakah bisa dicicil pembayarannya?',
		answer:
			'Bisa! Kami menyediakan opsi cicilan 0% melalui berbagai metode pembayaran termasuk kartu kredit dan BNPL (Buy Now Pay Later).'
	},
	{
		question: 'Level apa saja yang tersedia?',
		answer:
			'Kursus kami tersedia untuk semua level: Beginner (pemula), Intermediate (menengah), dan Advanced (mahir). Setiap kursus dicatat levelnya di deskripsi.'
	}
];

export const partners = [
	{ name: 'Tokopedia', logo: 'tokopedia' },
	{ name: 'Gojek', logo: 'gojek' },
	{ name: 'Bukalapak', logo: 'bukalapak' },
	{ name: 'Traveloka', logo: 'traveloka' },
	{ name: 'Bank BCA', logo: 'bca' }
];

export const stats = {
	alumni: 15000,
	rating: 4.9,
	courses: 50,
	mentors: 25
};

export const socialProofMessages = [
	'Ahmad dari Jakarta baru saja mendaftar kursus UI/UX Design',
	'Dewi dari Bandung baru saja mendaftar kursus Digital Marketing',
	'Rizky dari Surabaya baru saja mendaftar kursus Web Development',
	'Siti dari Yogyakarta baru saja mendaftar kursus Data Science',
	'Andi dari Semarang baru saja mendaftar kursus Product Design',
	'Maya dari Medan baru saja mendaftar kursus Social Media Marketing'
];
