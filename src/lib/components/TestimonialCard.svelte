<script lang="ts">
	type Props = {
		testimonial: {
			name: string;
			photo: string;
			role: string;
			text: string;
			rating: number;
		};
	};

	let { testimonial }: Props = $props();
	import { Star, Quote } from 'lucide-svelte';
</script>

<div class="card bg-white p-6 md:p-8">
	<!-- Quote icon -->
	<div class="mb-4 flex h-10 w-10 items-center justify-center rounded-xl bg-primary/10">
		<Quote size={18} class="text-primary" />
	</div>

	<!-- Stars -->
	<div class="mb-4 flex gap-1">
		{#each { length: testimonial.rating } as _, i (i)}
			<Star size={14} class="fill-cta text-cta" />
		{/each}
	</div>

	<!-- Text -->
	<p class="text-sm leading-relaxed text-text/70 md:text-base">"{testimonial.text}"</p>

	<!-- Author -->
	<div class="mt-6 flex items-center gap-3 border-t border-text/5 pt-5">
		<img
			src={testimonial.photo}
			alt={testimonial.name}
			class="h-10 w-10 rounded-full object-cover ring-2 ring-primary/10"
		/>
		<div>
			<div class="font-heading text-sm font-bold text-text">{testimonial.name}</div>
			<div class="text-xs text-text/50">{testimonial.role}</div>
		</div>
	</div>
</div>
