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
	class="from-primary via-primary to-secondary py-16 md:py-20 relative overflow-hidden bg-gradient-to-br"
>
	<!-- Background pattern -->
	<div class="inset-0 pointer-events-none absolute opacity-10">
		<div
			class="inset-0 absolute"
			style="background-image: radial-gradient(circle at 20% 50%, white 1px, transparent 1px), radial-gradient(circle at 80% 20%, white 1px, transparent 1px); background-size: 60px 60px;"
		></div>
	</div>

	<div class="max-w-4xl px-6 relative mx-auto text-center">
		<!-- Badge -->
		<div
			class="mb-6 gap-2 bg-white/15 px-5 py-2 backdrop-blur-sm inline-flex items-center rounded-full"
		>
			<Flame size={16} class="text-cta" />
			<span class="text-sm font-semibold text-white">Penawaran Terbatas</span>
		</div>

		<h2 class="font-heading text-3xl font-extrabold text-white md:text-4xl">
			Promo Launching — Diskon Hingga 75%!
		</h2>
		<p class="mt-4 max-w-xl text-white/70 mx-auto">
			Jangan sampai kehabisan! Kuota promo terbatas untuk 100 pendaftar pertama. Harga normal
			berlaku setelah promo berakhir.
		</p>

		<!-- Countdown -->
		<div class="mt-10 gap-3 md:gap-5 flex items-center justify-center">
			<div class="flex flex-col items-center">
				<div
					class="h-16 w-16 rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl flex items-center justify-center"
				>
					{pad(days)}
				</div>
				<span class="mt-2 text-xs text-white/50">Hari</span>
			</div>
			<span class="font-heading text-2xl font-bold text-white/30">:</span>
			<div class="flex flex-col items-center">
				<div
					class="h-16 w-16 rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl flex items-center justify-center"
				>
					{pad(hours)}
				</div>
				<span class="mt-2 text-xs text-white/50">Jam</span>
			</div>
			<span class="font-heading text-2xl font-bold text-white/30">:</span>
			<div class="flex flex-col items-center">
				<div
					class="h-16 w-16 rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl flex items-center justify-center"
				>
					{pad(minutes)}
				</div>
				<span class="mt-2 text-xs text-white/50">Menit</span>
			</div>
			<span class="font-heading text-2xl font-bold text-white/30">:</span>
			<div class="flex flex-col items-center">
				<div
					class="h-16 w-16 rounded-2xl bg-white/10 font-heading text-2xl font-bold text-white backdrop-blur-sm md:h-20 md:w-20 md:text-3xl flex items-center justify-center"
				>
					{pad(seconds)}
				</div>
				<span class="mt-2 text-xs text-white/50">Detik</span>
			</div>
		</div>

		<!-- Quota warning -->
		<div class="mt-8 gap-2 bg-cta/20 px-5 py-2.5 inline-flex items-center rounded-full">
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
				class="btn-primary gap-2 bg-cta px-10 py-4 text-base font-bold shadow-2xl shadow-cta/30 inline-flex cursor-pointer items-center rounded-full no-underline"
			>
				<ShoppingCart size={18} />
				Ambil Promo Sekarang
			</a>
		</div>
	</div>
</section>
