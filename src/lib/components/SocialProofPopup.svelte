<script lang="ts">
	import { socialProofMessages } from '$lib/data';
	import { UserPlus } from 'lucide-svelte';

	let visible = $state(false);
	let currentMessage = $state('');
	let messageIndex = $state(0);

	$effect(() => {
		// Show first notification after 5 seconds
		const initialTimeout = setTimeout(() => {
			currentMessage = socialProofMessages[0];
			visible = true;

			// Hide after 3 seconds
			setTimeout(() => {
				visible = false;
			}, 3000);
		}, 5000);

		// Then cycle every 15 seconds
		const interval = setInterval(() => {
			messageIndex = (messageIndex + 1) % socialProofMessages.length;
			currentMessage = socialProofMessages[messageIndex];
			visible = true;

			setTimeout(() => {
				visible = false;
			}, 3000);
		}, 15000);

		return () => {
			clearTimeout(initialTimeout);
			clearInterval(interval);
		};
	});
</script>

{#if currentMessage}
	<div
		class="bottom-6 left-6 max-w-sm fixed z-40 transition-all duration-300 {visible
			? 'translate-y-0 opacity-100'
			: 'translate-y-4 opacity-0'}"
	>
		<div
			class="gap-3 rounded-2xl border-text/5 bg-white px-5 py-3.5 shadow-xl shadow-text/10 flex items-center border"
		>
			<div class="h-9 w-9 bg-green-500/10 flex shrink-0 items-center justify-center rounded-full">
				<UserPlus size={16} class="text-green-600" />
			</div>
			<p class="text-xs text-text/70">{currentMessage}</p>
		</div>
	</div>
{/if}
