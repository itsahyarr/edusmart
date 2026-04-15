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
	class="fixed top-0 right-0 left-0 z-50 transition-all duration-300 {scrolled
		? 'bg-white/90 shadow-md backdrop-blur-lg'
		: 'bg-transparent'}"
>
	<nav class="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
		<a href="/" class="flex items-center gap-2">
			<div
				class="flex h-9 w-9 items-center justify-center rounded-lg bg-primary font-heading text-sm font-bold text-white"
			>
				E
			</div>
			<span class="font-heading text-xl font-bold text-text">EduSmart</span>
		</a>

		<div class="flex items-center gap-6">
			<a
				href="#courses"
				class="hidden text-sm font-medium text-text/70 transition-colors hover:text-primary md:block"
			>
				Kursus
			</a>
			<a
				href="#testimonials"
				class="hidden text-sm font-medium text-text/70 transition-colors hover:text-primary md:block"
			>
				Testimoni
			</a>
			<a
				href="#faq"
				class="hidden text-sm font-medium text-text/70 transition-colors hover:text-primary md:block"
			>
				FAQ
			</a>
			<a
				href="#courses"
				onclick={() => trackClick('header_cta')}
				class="btn-primary cursor-pointer rounded-full px-6 py-2.5 text-sm no-underline"
			>
				Daftar Sekarang
			</a>
		</div>
	</nav>
</header>
