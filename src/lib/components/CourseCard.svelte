<script lang="ts">
	type Props = {
		course: {
			id: number;
			category: string;
			title: string;
			mentor: string;
			originalPrice: number;
			discountPrice: number;
			rating: number;
			students: number;
			image: string;
		};
	};

	let { course }: Props = $props();

	import { formatPrice, formatDiscount, trackClick } from '$lib/utils';
	import { Star, Users } from 'lucide-svelte';

	const discount = $derived(formatDiscount(course.originalPrice, course.discountPrice));
</script>

<div class="card group overflow-hidden bg-white p-0">
	<!-- Image -->
	<div class="relative overflow-hidden">
		<img
			src={course.image}
			alt={course.title}
			class="h-48 w-full object-cover transition-transform duration-300 group-hover:scale-105"
			loading="lazy"
		/>
		<!-- Discount badge -->
		<div
			class="absolute top-3 left-3 rounded-full bg-cta px-3 py-1 text-xs font-bold text-white shadow-lg"
		>
			-{discount}%
		</div>
		<!-- Category -->
		<div
			class="absolute right-3 bottom-3 rounded-full bg-white/90 px-3 py-1 text-xs font-semibold text-text backdrop-blur-sm"
		>
			{course.category}
		</div>
	</div>

	<!-- Content -->
	<div class="p-6">
		<h3 class="font-heading text-base leading-snug font-bold text-text">{course.title}</h3>

		<!-- Mentor -->
		<div class="mt-2 flex items-center gap-2 text-sm text-text/50">
			<Users size={14} />
			<span>{course.mentor}</span>
		</div>

		<!-- Rating & Students -->
		<div class="mt-3 flex items-center gap-4 text-sm">
			<div class="flex items-center gap-1">
				<Star size={14} class="fill-cta text-cta" />
				<span class="font-semibold text-text">{course.rating}</span>
			</div>
			<span class="text-text/30">•</span>
			<span class="text-text/50">{course.students.toLocaleString('id-ID')} siswa</span>
		</div>

		<!-- Pricing -->
		<div class="mt-4 flex items-end gap-3">
			<span class="font-heading text-xl font-extrabold text-cta"
				>{formatPrice(course.discountPrice)}</span
			>
			<span class="text-sm text-text/40 line-through">{formatPrice(course.originalPrice)}</span>
		</div>

		<!-- CTA -->
		<button
			onclick={() => trackClick('course_card_cta', { course_id: course.id })}
			class="btn-primary mt-5 w-full rounded-xl py-3 text-sm"
		>
			Daftar Sekarang
		</button>
	</div>
</div>
