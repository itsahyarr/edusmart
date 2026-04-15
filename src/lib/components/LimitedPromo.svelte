<script lang="ts">
	import { trackClick } from '$lib/utils';
	import { Timer, Flame, ShoppingCart } from 'lucide-svelte';

	let days = $state(2);
	let hours = $state(14);
	let minutes = $state(59);
	let seconds = $state(59);

	$effect(() => {
		const interval = setInterval(() => {
			seconds--;
			if (seconds < 0) {
				seconds = 59;
				minutes--;
				if (minutes < 0) {
					minutes = 59;
					hours--;
					if (hours < 0) {
						hours = 23;
						days--;
						if (days < 0) {
							days = 0;
							hours = 0;
							minutes = 0;
							seconds = 0;
							clearInterval(interval);
						}
					}
				}
			}
		}, 1000);
		return () => clearInterval(interval);
	});

	function pad(n: number): string {
		return n.toString().padStart(2, '0');
	}
</script>

<section
	class="relative overflow-hidden bg-gradient-to-br from-primary via-primary to-secondary py-16 md:py-20"
>
	<!-- Background pattern -->
	<div class="pointer-events-none absolute inset-0 opacity-10">
		<div
			class="absolute inset-0"
			style="background-image: radial-gradient(circle at 20% 50%, white 1px, transparent 1px), radial-gradient(circle at 80% 20%, white 1px, transparent 1px); background-size: 60px 60px;"
		></div>
	</div>

	<div class="relative mx-auto max-w-4xl px-6 text-center">
		<!-- Badge -->
		<div
			class="mb-6 inline-flex items-center gap-2 rounded-full bg-white/15 px-5 py-2 backdrop-blur-sm"
		>
			<Flame size={16} class="text-cta" />
			<span class="text-sm font-semibold text-white">Penawaran Terbatas</span>
		</div>

		<h2 class="font-heading text-3xl font-extrabold text-white md:text-4xl">
			Promo Launching — Diskon Hingga 75%!
		</h2>
		<p class="mx-auto mt-4 max-w-xl text-white/70">
			Jangan sampai kehabisan! Kuota promo terbatas untuk 100 pendaftar pertama. Harga normal
			berlaku setelah promo berakhir.
		</p>

		<!-- Countdown -->
		<div class="mt-10 flex items-center justify-center gap-3 md:gap-5">
			<div class="flex flex-col items-center">
				<div
					class="flex h-16 w-16 items-center justify-center rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl"
				>
					{pad(days)}
				</div>
				<span class="mt-2 text-xs text-white/50">Hari</span>
			</div>
			<span class="font-heading text-2xl font-bold text-white/30">:</span>
			<div class="flex flex-col items-center">
				<div
					class="flex h-16 w-16 items-center justify-center rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl"
				>
					{pad(hours)}
				</div>
				<span class="mt-2 text-xs text-white/50">Jam</span>
			</div>
			<span class="font-heading text-2xl font-bold text-white/30">:</span>
			<div class="flex flex-col items-center">
				<div
					class="flex h-16 w-16 items-center justify-center rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl"
				>
					{pad(minutes)}
				</div>
				<span class="mt-2 text-xs text-white/50">Menit</span>
			</div>
			<span class="font-heading text-2xl font-bold text-white/30">:</span>
			<div class="flex flex-col items-center">
				<div
					class="flex h-16 w-16 items-center justify-center rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl"
				>
					{pad(seconds)}
				</div>
				<span class="mt-2 text-xs text-white/50">Detik</span>
			</div>
		</div>

		<!-- Quota warning -->
		<div class="mt-8 inline-flex items-center gap-2 rounded-full bg-cta/20 px-5 py-2.5">
			<Timer size={16} class="text-cta" />
			<span class="text-sm font-semibold text-white"
				>Kuota tersisa: <span class="text-cta">23/100</span></span
			>
		</div>

		<!-- CTA -->
		<div class="mt-8">
			<a
				href="#courses"
				onclick={() => trackClick('promo_cta')}
				class="btn-primary inline-flex cursor-pointer items-center gap-2 rounded-full bg-cta px-10 py-4 text-base font-bold no-underline shadow-2xl shadow-cta/30"
			>
				<ShoppingCart size={18} />
				Ambil Promo Sekarang
			</a>
		</div>
	</div>
</section>
