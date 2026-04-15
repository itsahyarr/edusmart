<script lang="ts">
	import { trackClick } from '$lib/utils';
	import { Mail, Phone, MapPin } from 'lucide-svelte';
</script>

<footer class="border-t border-text/5 bg-text py-16 text-white/70">
	<div class="mx-auto max-w-6xl px-6">
		<div class="grid gap-12 md:grid-cols-4">
			<!-- Brand -->
			<div class="md:col-span-2">
				<div class="flex items-center gap-2.5">
					<img src="/edusmart.webp" alt="EduSmart" class="h-9 w-9 rounded-lg object-cover" />
					<span class="font-heading text-xl font-bold text-white">EduSmart</span>
				</div>
				<p class="mt-4 max-w-sm text-sm leading-relaxed text-white/50">
					Platform pendidikan online #1 di Indonesia untuk pengembangan skill digital. Belajar dari
					praktisi, dapatkan sertifikat, dan tingkatkan karirmu.
				</p>
			</div>

			<!-- Quick links -->
			<div>
				<h4 class="font-heading text-sm font-bold text-white">Navigasi</h4>
				<div class="mt-4 flex flex-col gap-3">
					<a href="#courses" class="text-sm text-white/50 transition-colors hover:text-white"
						>Kursus</a
					>
					<a href="#testimonials" class="text-sm text-white/50 transition-colors hover:text-white"
						>Testimoni</a
					>
					<a href="#faq" class="text-sm text-white/50 transition-colors hover:text-white">FAQ</a>
				</div>
			</div>

			<!-- Contact -->
			<div>
				<h4 class="font-heading text-sm font-bold text-white">Hubungi Kami</h4>
				<div class="mt-4 flex flex-col gap-3">
					<div class="flex items-center gap-2 text-sm text-white/50">
						<Mail size={14} />
						<span>hello@edusmart.id</span>
					</div>
					<div class="flex items-center gap-2 text-sm text-white/50">
						<Phone size={14} />
						<span>+62 812 3456 7890</span>
					</div>
					<div class="flex items-center gap-2 text-sm text-white/50">
						<MapPin size={14} />
						<span>Jakarta, Indonesia</span>
					</div>
				</div>
			</div>
		</div>

		<!-- Bottom bar -->
		<div
			class="mt-12 flex flex-col items-center justify-between gap-4 border-t border-white/10 pt-8 md:flex-row"
		>
			<p class="text-xs text-white/30">&copy; 2024 EduSmart. All rights reserved.</p>
			<a
				href="#courses"
				onclick={() => trackClick('footer_cta')}
				class="btn-primary rounded-full px-6 py-2.5 text-sm no-underline"
			>
				Daftar Sekarang
			</a>
		</div>
	</div>
</footer>
