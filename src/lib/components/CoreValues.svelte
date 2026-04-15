<script lang="ts">
	import { BookOpen, Users, Award } from 'lucide-svelte';

	const values = [
		{
			icon: BookOpen,
			title: 'Materi Berkualitas Tinggi',
			description:
				'Konten kursus dirancang oleh praktisi industri dengan pendekatan project-based learning. Update berkala sesuai kebutuhan pasar.',
			color: 'primary',
			bgClass: 'bg-primary/10',
			iconClass: 'text-primary'
		},
		{
			icon: Users,
			title: 'Mentor Berpengalaman',
			description:
				'Belajar langsung dari para ahli di bidangnya. Setiap mentor memiliki pengalaman nyata di perusahaan top Indonesia.',
			color: 'cta',
			bgClass: 'bg-cta/10',
			iconClass: 'text-cta'
		},
		{
			icon: Award,
			title: 'Sertifikat Diakui Industri',
			description:
				'Dapatkan sertifikat resmi yang bisa kamu tambahkan ke LinkedIn dan CV. Diakui oleh ratusan perusahaan mitra kami.',
			color: 'green',
			bgClass: 'bg-green-500/10',
			iconClass: 'text-green-600'
		}
	];
</script>

<section class="bg-background py-20 md:py-28">
	<div class="max-w-6xl px-6 mx-auto">
		<!-- Section header -->
		<div class="mb-16 max-w-2xl mx-auto text-center">
			<div
				class="mb-4 bg-primary/10 px-4 py-1.5 text-xs font-semibold tracking-wide text-primary inline-block rounded-full uppercase"
			>
				Mengapa EduSmart?
			</div>
			<h2 class="font-heading text-3xl font-extrabold text-text md:text-4xl">
				3 Pilar Keunggulan Kami
			</h2>
			<p class="mt-4 text-text/60">
				Kami membangun pengalaman belajar yang dirancang khusus untuk memaksimalkan potensi karirmu.
			</p>
		</div>

		<!-- Values grid -->
		<div class="gap-8 md:grid-cols-3 grid">
			{#each values as item (item.title)}
				<div class="card group rounded-2xl bg-white p-8">
					<div class="mb-5 h-14 w-14 rounded-2xl flex items-center justify-center {item.bgClass}">
						<item.icon size={24} class={item.iconClass} />
					</div>
					<h3 class="font-heading text-lg font-bold text-text">{item.title}</h3>
					<p class="mt-3 text-sm leading-relaxed text-text/60">{item.description}</p>
				</div>
			{/each}
		</div>
	</div>
</section>
