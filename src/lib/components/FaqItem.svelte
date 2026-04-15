<script lang="ts">
	type Props = {
		question: string;
		answer: string;
	};

	let { question, answer }: Props = $props();
	import { ChevronDown } from 'lucide-svelte';

	let isOpen = $state(false);
</script>

<div class="border-text/5 border-b">
	<button
		onclick={() => (isOpen = !isOpen)}
		class="gap-4 py-5 flex w-full cursor-pointer items-center justify-between text-left"
	>
		<span class="font-heading text-sm font-semibold text-text md:text-base">{question}</span>
		<ChevronDown
			size={18}
			class="text-text/30 shrink-0 transition-transform duration-200 {isOpen ? 'rotate-180' : ''}"
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
