<script lang="ts">
	import { trackClick } from '$lib/utils';

	let scrolled = $state(false);

	$effect(() => {
		const onScroll = () => {
			scrolled = window.scrollY > 60;
		};
		window.addEventListener('scroll', onScroll, { passive: true });
		return () => window.removeEventListener('scroll', onScroll);
	});
</script>

<header
	class="top-0 left-0 right-0 fixed z-50 transition-all duration-300 {scrolled
		? 'bg-white/90 shadow-md backdrop-blur-lg'
		: 'bg-transparent'}"
>
	<nav class="max-w-6xl px-6 py-4 mx-auto flex items-center justify-between">
		<a href="/" class="gap-2 flex items-center">
			<div
				class="h-9 w-9 rounded-lg bg-primary font-heading text-sm font-bold text-white flex items-center justify-center"
			>
				E
			</div>
			<span class="font-heading text-xl font-bold text-text">EduSmart</span>
		</a>

		<div class="gap-6 flex items-center">
			<a
				href="#courses"
				class="text-sm font-medium text-text/70 hover:text-primary md:block hidden transition-colors"
			>
				Kursus
			</a>
			<a
				href="#testimonials"
				class="text-sm font-medium text-text/70 hover:text-primary md:block hidden transition-colors"
			>
				Testimoni
			</a>
			<a
				href="#faq"
				class="text-sm font-medium text-text/70 hover:text-primary md:block hidden transition-colors"
			>
				FAQ
			</a>
			<a
				href="#courses"
				onclick={() => trackClick('header_cta')}
				class="btn-primary px-6 py-2.5 text-sm cursor-pointer rounded-full no-underline"
			>
				Daftar Sekarang
			</a>
		</div>
	</nav>
</header>
