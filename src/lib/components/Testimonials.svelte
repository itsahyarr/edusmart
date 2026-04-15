<script lang="ts">
	import { testimonials } from '$lib/data';
	import TestimonialCard from './TestimonialCard.svelte';
</script>

<section id="testimonials" class="bg-background py-20 md:py-28">
	<div class="max-w-6xl px-6 mx-auto">
		<!-- Section header -->
		<div class="mb-16 max-w-2xl mx-auto text-center">
			<div
				class="mb-4 bg-primary/10 px-4 py-1.5 text-xs font-semibold tracking-wide text-primary inline-block rounded-full uppercase"
			>
				Testimoni
			</div>
			<h2 class="font-heading text-3xl font-extrabold text-text md:text-4xl">
				Cerita Sukses Alumni Kami
			</h2>
			<p class="mt-4 text-text/60">
				Dengarkan langsung dari mereka yang sudah membuktikan hasilnya. Karir mereka berubah setelah
				belajar di EduSmart.
			</p>
		</div>

		<!-- Testimonials grid -->
		<div class="gap-6 sm:grid-cols-2 lg:grid-cols-2 grid">
			{#each testimonials as testimonial (testimonial.name)}
				<TestimonialCard {testimonial} />
			{/each}
		</div>
	</div>
</section>
