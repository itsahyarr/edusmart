<script lang="ts">
	import { trackClick } from '$lib/utils';
	import { Mail, Phone, MapPin } from 'lucide-svelte';
</script>

<footer class="border-text/5 bg-text py-16 text-white/70 border-t">
	<div class="max-w-6xl px-6 mx-auto">
		<div class="gap-12 md:grid-cols-4 grid">
			<!-- Brand -->
			<div class="md:col-span-2">
				<div class="gap-2 flex items-center">
					<div
						class="h-9 w-9 rounded-lg bg-primary font-heading text-sm font-bold text-white flex items-center justify-center"
					>
						E
					</div>
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
				<div class="mt-4 gap-3 flex flex-col">
					<a href="#courses" class="text-sm text-white/50 hover:text-white transition-colors"
						>Kursus</a
					>
					<a href="#testimonials" class="text-sm text-white/50 hover:text-white transition-colors"
						>Testimoni</a
					>
					<a href="#faq" class="text-sm text-white/50 hover:text-white transition-colors">FAQ</a>
				</div>
			</div>

			<!-- Contact -->
			<div>
				<h4 class="font-heading text-sm font-bold text-white">Hubungi Kami</h4>
				<div class="mt-4 gap-3 flex flex-col">
					<div class="gap-2 text-sm text-white/50 flex items-center">
						<Mail size={14} />
						<span>hello@edusmart.id</span>
					</div>
					<div class="gap-2 text-sm text-white/50 flex items-center">
						<Phone size={14} />
						<span>+62 812 3456 7890</span>
					</div>
					<div class="gap-2 text-sm text-white/50 flex items-center">
						<MapPin size={14} />
						<span>Jakarta, Indonesia</span>
					</div>
				</div>
			</div>
		</div>

		<!-- Bottom bar -->
		<div
			class="mt-12 gap-4 border-white/10 pt-8 md:flex-row flex flex-col items-center justify-between border-t"
		>
			<p class="text-xs text-white/30">&copy; 2024 EduSmart. All rights reserved.</p>
			<a
				href="#courses"
				onclick={() => trackClick('footer_cta')}
				class="btn-primary px-6 py-2.5 text-sm rounded-full no-underline"
			>
				Daftar Sekarang
			</a>
		</div>
	</div>
</footer>
