<script lang="ts">
	import { faqs } from '$lib/data';
	import FaqItem from './FaqItem.svelte';
	import { HelpCircle } from 'lucide-svelte';
</script>

<section id="faq" class="bg-white py-20 md:py-28">
	<div class="mx-auto max-w-3xl px-6">
		<!-- Section header -->
		<div class="mx-auto mb-12 max-w-2xl text-center">
			<div
				class="mb-4 inline-flex items-center gap-2 rounded-full bg-primary/10 px-4 py-1.5 text-xs font-semibold tracking-wide text-primary uppercase"
			>
				<HelpCircle size={14} />
				FAQ
			</div>
			<h2 class="font-heading text-3xl font-extrabold text-text md:text-4xl">
				Pertanyaan yang Sering Ditanyakan
			</h2>
			<p class="mt-4 text-text/60">
				Belum menemukan jawaban? Hubungi tim kami via WhatsApp untuk konsultasi gratis.
			</p>
		</div>

		<!-- FAQ list -->
		<div class="rounded-2xl bg-background p-6 md:p-8">
			{#each faqs as faq (faq.question)}
				<FaqItem question={faq.question} answer={faq.answer} />
			{/each}
		</div>
	</div>
</section>
