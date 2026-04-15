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
	<div class="mb-4 h-10 w-10 rounded-xl bg-primary/10 flex items-center justify-center">
		<Quote size={18} class="text-primary" />
	</div>

	<!-- Stars -->
	<div class="mb-4 gap-1 flex">
		{#each { length: testimonial.rating } as _, i (i)}
			<Star size={14} class="fill-cta text-cta" />
		{/each}
	</div>

	<!-- Text -->
	<p class="text-sm text-text/70 leading-relaxed md:text-base">"{testimonial.text}"</p>

	<!-- Author -->
	<div class="mt-6 gap-3 border-text/5 pt-5 flex items-center border-t">
		<img
			src={testimonial.photo}
			alt={testimonial.name}
			class="h-10 w-10 ring-primary/10 rounded-full object-cover ring-2"
		/>
		<div>
			<div class="font-heading text-sm font-bold text-text">{testimonial.name}</div>
			<div class="text-xs text-text/50">{testimonial.role}</div>
		</div>
	</div>
</div>
