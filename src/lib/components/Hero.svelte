<script lang="ts">
	import { trackClick } from '$lib/utils';
	import { ArrowRight, Sparkles, Play } from 'lucide-svelte';
</script>

<section class="bg-background pt-28 pb-20 md:pt-36 md:pb-28 relative overflow-hidden">
	<!-- Subtle background decoration -->
	<div class="inset-0 pointer-events-none absolute">
		<div class="-top-24 -right-24 h-96 w-96 bg-primary/5 blur-3xl absolute rounded-full"></div>
		<div
			class="-bottom-32 -left-32 bg-cta/5 blur-3xl absolute h-[500px] w-[500px] rounded-full"
		></div>
	</div>

	<div class="max-w-6xl gap-12 px-6 md:grid-cols-2 md:gap-16 relative mx-auto grid items-center">
		<!-- Left: Copy -->
		<div>
			<!-- Promo ribbon -->
			<div
				class="mb-6 gap-2 border-cta/20 bg-cta/5 px-4 py-2 text-sm font-semibold text-cta inline-flex items-center rounded-full border"
			>
				<Sparkles size={16} />
				<span>Promo Launching — Diskon Hingga 75%</span>
			</div>

			<h1
				class="font-heading text-4xl font-extrabold leading-tight text-text md:text-5xl lg:text-6xl"
			>
				Wujudkan
				<span
					class="text-primary after:-bottom-1 after:left-0 after:h-3 after:bg-cta/20 relative inline-block after:absolute after:w-full after:content-['']"
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
			<div class="mt-8 gap-4 sm:flex-row sm:items-center flex flex-col">
				<a
					href="#courses"
					onclick={() => trackClick('hero_cta')}
					class="btn-primary gap-2 px-8 py-4 text-base font-semibold shadow-lg shadow-cta/25 inline-flex cursor-pointer items-center justify-center rounded-full no-underline"
				>
					Mulai Belajar
					<ArrowRight size={18} />
				</a>
				<a
					href="#testimonials"
					class="gap-2 text-sm font-medium text-text/60 hover:text-primary inline-flex cursor-pointer items-center transition-colors"
				>
					<div
						class="h-10 w-10 border-primary/20 bg-primary/5 flex items-center justify-center rounded-full border"
					>
						<Play size={14} class="ml-0.5 text-primary" />
					</div>
					Lihat Cerita Alumni
				</a>
			</div>

			<!-- Quick stats -->
			<div class="mt-10 gap-8 border-text/10 pt-6 flex border-t">
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
		<div class="md:block relative hidden">
			<!-- Main card -->
			<div
				class="rounded-3xl from-primary to-secondary p-1 shadow-2xl shadow-primary/20 relative z-10 overflow-hidden bg-gradient-to-br"
			>
				<div class="bg-white p-8 rounded-[22px]">
					<div class="mb-4 gap-3 flex items-center">
						<img
							src="https://i.pravatar.cc/48?u=sarah-hero"
							alt="Mentor"
							class="h-12 w-12 ring-primary/20 rounded-full object-cover ring-2"
						/>
						<div>
							<div class="font-heading text-sm font-bold text-text">Sarah Wijaya</div>
							<div class="text-xs text-text/50">Social Media Marketing</div>
						</div>
						<div
							class="bg-green-50 px-3 py-1 text-xs font-semibold text-green-600 ml-auto rounded-full"
						>
							LIVE
						</div>
					</div>
					<div
						class="mb-3 h-40 rounded-xl from-primary/10 to-cta/10 flex items-center justify-center bg-gradient-to-br"
					>
						<Play size={32} class="text-primary/40" />
					</div>
					<div class="font-heading text-sm font-semibold text-text">
						Social Media Marketing Mastery 2024
					</div>
					<div class="mt-2 gap-2 text-xs text-text/50 flex items-center">
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
				class="-bottom-4 -left-4 rounded-2xl bg-white px-5 py-3 shadow-xl shadow-text/5 absolute z-20"
			>
				<div class="gap-3 flex items-center">
					<div class="h-10 w-10 bg-cta/10 flex items-center justify-center rounded-full">
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
				class="-top-2 -right-2 rounded-2xl bg-white px-4 py-2.5 shadow-xl shadow-text/5 absolute z-20"
			>
				<div class="gap-2 flex items-center">
					<div class="-space-x-2 flex">
						<img
							src="https://i.pravatar.cc/28?u=a1"
							alt=""
							class="h-6 w-6 border-white rounded-full border-2"
						/>
						<img
							src="https://i.pravatar.cc/28?u=a2"
							alt=""
							class="h-6 w-6 border-white rounded-full border-2"
						/>
						<img
							src="https://i.pravatar.cc/28?u=a3"
							alt=""
							class="h-6 w-6 border-white rounded-full border-2"
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
