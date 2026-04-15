<script lang="ts">
	import { trackClick } from '$lib/utils';
	import { ArrowRight, Sparkles, Play } from 'lucide-svelte';
</script>

<section class="relative overflow-hidden bg-background pt-28 pb-20 md:pt-36 md:pb-28">
	<!-- Subtle background decoration -->
	<div class="pointer-events-none absolute inset-0">
		<div class="absolute -top-24 -right-24 h-96 w-96 rounded-full bg-primary/5 blur-3xl"></div>
		<div
			class="absolute -bottom-32 -left-32 h-[500px] w-[500px] rounded-full bg-cta/5 blur-3xl"
		></div>
	</div>

	<div class="relative mx-auto grid max-w-6xl items-center gap-12 px-6 md:grid-cols-2 md:gap-16">
		<!-- Left: Copy -->
		<div>
			<!-- Promo ribbon -->
			<div
				class="mb-6 inline-flex items-center gap-2 rounded-full border border-cta/20 bg-cta/5 px-4 py-2 text-sm font-semibold text-cta"
			>
				<Sparkles size={16} />
				<span>Promo Launching — Diskon Hingga 75%</span>
			</div>

			<h1
				class="font-heading text-4xl leading-tight font-extrabold text-text md:text-5xl lg:text-6xl"
			>
				Wujudkan
				<span
					class="relative inline-block text-primary after:absolute after:-bottom-1 after:left-0 after:h-3 after:w-full after:bg-cta/20 after:content-['']"
					>Karir Impianmu</span
				>
				Sekarang
			</h1>

			<p class="mt-6 max-w-lg text-lg leading-relaxed text-text/70">
				Platform pendidikan online #1 untuk skill digital masa kini. Belajar langsung dari praktisi
				industri, dapatkan sertifikat, dan
				<strong class="text-text">tingkatkan karirmu</strong>.
			</p>

			<!-- CTA group -->
			<div class="mt-8 flex flex-col gap-4 sm:flex-row sm:items-center">
				<a
					href="#courses"
					onclick={() => trackClick('hero_cta')}
					class="btn-primary inline-flex cursor-pointer items-center justify-center gap-2 rounded-full px-8 py-4 text-base font-semibold no-underline shadow-lg shadow-cta/25"
				>
					Mulai Belajar
					<ArrowRight size={18} />
				</a>
				<a
					href="#testimonials"
					class="inline-flex cursor-pointer items-center gap-2 text-sm font-medium text-text/60 transition-colors hover:text-primary"
				>
					<div
						class="flex h-10 w-10 items-center justify-center rounded-full border border-primary/20 bg-primary/5"
					>
						<Play size={14} class="ml-0.5 text-primary" />
					</div>
					Lihat Cerita Alumni
				</a>
			</div>

			<!-- Quick stats -->
			<div class="mt-10 flex gap-8 border-t border-text/10 pt-6">
				<div>
					<div class="font-heading text-2xl font-bold text-text">15K+</div>
					<div class="text-sm text-text/50">Alumni Aktif</div>
				</div>
				<div>
					<div class="font-heading text-2xl font-bold text-text">4.9</div>
					<div class="text-sm text-text/50">Rating Rata-rata</div>
				</div>
				<div>
					<div class="font-heading text-2xl font-bold text-text">50+</div>
					<div class="text-sm text-text/50">Kursus Tersedia</div>
				</div>
			</div>
		</div>

		<!-- Right: Visual -->
		<div class="relative hidden md:block">
			<!-- Main card -->
			<div
				class="relative z-10 overflow-hidden rounded-3xl bg-gradient-to-br from-primary to-secondary p-1 shadow-2xl shadow-primary/20"
			>
				<div class="rounded-[22px] bg-white p-8">
					<div class="mb-4 flex items-center gap-3">
						<img
							src="https://i.pravatar.cc/48?u=sarah-hero"
							alt="Mentor"
							class="h-12 w-12 rounded-full object-cover ring-2 ring-primary/20"
						/>
						<div>
							<div class="font-heading text-sm font-bold text-text">Sarah Wijaya</div>
							<div class="text-xs text-text/50">Social Media Marketing</div>
						</div>
						<div
							class="ml-auto rounded-full bg-green-50 px-3 py-1 text-xs font-semibold text-green-600"
						>
							LIVE
						</div>
					</div>
					<div
						class="mb-3 flex h-40 items-center justify-center rounded-xl bg-gradient-to-br from-primary/10 to-cta/10"
					>
						<Play size={32} class="text-primary/40" />
					</div>
					<div class="font-heading text-sm font-semibold text-text">
						Social Media Marketing Mastery 2026
					</div>
					<div class="mt-2 flex items-center gap-2 text-xs text-text/50">
						<span>1.250 siswa</span>
						<span>•</span>
						<span>24 modul</span>
						<span>•</span>
						<span>⭐ 4.9</span>
					</div>
				</div>
			</div>

			<!-- Floating badge -->
			<div
				class="absolute -bottom-4 -left-4 z-20 rounded-2xl bg-white px-5 py-3 shadow-xl shadow-text/5"
			>
				<div class="flex items-center gap-3">
					<div class="flex h-10 w-10 items-center justify-center rounded-full bg-cta/10">
						<span class="text-lg">🎓</span>
					</div>
					<div>
						<div class="font-heading text-sm font-bold text-text">Sertifikat Resmi</div>
						<div class="text-xs text-text/50">Diakui industri</div>
					</div>
				</div>
			</div>

			<!-- Floating notification -->
			<div
				class="absolute -top-2 -right-2 z-20 rounded-2xl bg-white px-4 py-2.5 shadow-xl shadow-text/5"
			>
				<div class="flex items-center gap-2">
					<div class="flex -space-x-2">
						<img
							src="https://i.pravatar.cc/28?u=a1"
							alt=""
							class="h-6 w-6 rounded-full border-2 border-white"
						/>
						<img
							src="https://i.pravatar.cc/28?u=a2"
							alt=""
							class="h-6 w-6 rounded-full border-2 border-white"
						/>
						<img
							src="https://i.pravatar.cc/28?u=a3"
							alt=""
							class="h-6 w-6 rounded-full border-2 border-white"
						/>
					</div>
					<div class="text-xs">
						<span class="font-semibold text-text">+42</span>
						<span class="text-text/50"> mendaftar hari ini</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
