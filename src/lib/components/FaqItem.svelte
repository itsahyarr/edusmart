<script lang="ts">
	type Props = {
		question: string;
		answer: string;
	};

	let { question, answer }: Props = $props();
	import { ChevronDown } from 'lucide-svelte';

	let isOpen = $state(false);
</script>

<div class="border-b border-text/5">
	<button
		onclick={() => (isOpen = !isOpen)}
		class="flex w-full cursor-pointer items-center justify-between gap-4 py-5 text-left"
	>
		<span class="font-heading text-sm font-semibold text-text md:text-base">{question}</span>
		<ChevronDown
			size={18}
			class="shrink-0 text-text/30 transition-transform duration-200 {isOpen ? 'rotate-180' : ''}"
		/>
	</button>

	<div
		class="overflow-hidden transition-all duration-200 {isOpen
			? 'max-h-96 pb-5 opacity-100'
			: 'max-h-0 opacity-0'}"
	>
		<p class="text-sm leading-relaxed text-text/60">{answer}</p>
	</div>
</div>
